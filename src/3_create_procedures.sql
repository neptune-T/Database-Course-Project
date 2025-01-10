-- 更新时间戳触发器
CREATE TRIGGER UpdateTimestamps
ON Characters
AFTER UPDATE
AS
BEGIN
    UPDATE Characters
    SET updated_at = GETDATE()
    FROM Characters c
    INNER JOIN inserted i ON c.character_id = i.character_id
END
GO

-- 获取角色完整信息的存储过程
CREATE PROCEDURE GetCharacterFullInfo
    @character_id INT = NULL,
    @character_name NVARCHAR(100) = NULL
AS
BEGIN
    IF @character_id IS NULL AND @character_name IS NULL
        RAISERROR ('必须提供角色ID或角色名称', 16, 1)
    
    SELECT 
        c.character_id,
        c.character_name,
        c.rarity,
        p.path_name,
        c.character_description,
        c.base_hp,
        c.base_atk,
        c.base_def,
        c.base_speed,
        c.is_limited,
        c.release_date,
        s.skill_name,
        s.skill_type,
        s.skill_description,
        s.skill_multiplier,
        s.energy_cost,
        s.cooldown
    FROM Characters c
    JOIN Paths p ON c.path_id = p.path_id
    LEFT JOIN Skills s ON c.character_id = s.character_id
    WHERE (@character_id IS NULL OR c.character_id = @character_id)
    AND (@character_name IS NULL OR c.character_name LIKE '%' + @character_name + '%')
END
GO

-- 获取角色最佳配装推荐
CREATE PROCEDURE GetCharacterBestBuild
    @character_id INT
AS
BEGIN
    -- 获取推荐光锥
    SELECT TOP 3
        lc.lightcone_name,
        lc.rarity,
        clr.priority_score,
        clr.recommendation_note
    FROM CharacterLightConeRecommendations clr
    JOIN LightCones lc ON clr.lightcone_id = lc.lightcone_id
    WHERE clr.character_id = @character_id
    ORDER BY clr.priority_score DESC;

    -- 获取推荐遗器
    SELECT TOP 3
        rs.set_name,
        crr.priority_score,
        crr.recommendation_note
    FROM CharacterRelicRecommendations crr
    JOIN RelicSets rs ON crr.set_id = rs.set_id
    WHERE crr.character_id = @character_id
    ORDER BY crr.priority_score DESC;
END
GO

-- 材料计算器存储过程（修正版）
CREATE PROCEDURE CalculateMaterialsNeeded
    @character_id INT,
    @target_level INT
AS
BEGIN
    WITH LevelRanges AS (
        SELECT 
            material_id,
            quantity,
            CAST(SUBSTRING(level_range, 1, CHARINDEX('-', level_range) - 1) AS INT) as min_level,
            CAST(SUBSTRING(level_range, CHARINDEX('-', level_range) + 1, LEN(level_range)) AS INT) as max_level
        FROM CharacterMaterials
        WHERE character_id = @character_id
    )
    SELECT 
        m.material_name,
        m.material_type,
        m.rarity,
        SUM(lr.quantity) as total_needed,
        m.available_days,
        m.source_description
    FROM LevelRanges lr
    JOIN Materials m ON lr.material_id = m.material_id
    WHERE lr.min_level <= @target_level 
    AND lr.max_level >= @target_level  -- 添加上限判断
    GROUP BY m.material_name, m.material_type, m.rarity, m.available_days, m.source_description
    ORDER BY m.rarity DESC, total_needed DESC
END
GO

-- 创建角色统计视图
CREATE VIEW CharacterStatistics AS
SELECT 
    p.path_name,
    COUNT(*) as character_count,
    AVG(CAST(c.rarity as FLOAT)) as avg_rarity,
    SUM(CASE WHEN c.is_limited = 1 THEN 1 ELSE 0 END) as limited_count
FROM Characters c
JOIN Paths p ON c.path_id = p.path_id
GROUP BY p.path_name
GO

-- 创建材料追踪视图
CREATE VIEW MaterialTracking AS
SELECT 
    m.material_name,
    m.rarity,
    m.material_type,
    e.enemy_name,
    ed.drop_rate,
    m.available_days
FROM Materials m
LEFT JOIN EnemyDrops ed ON m.material_id = ed.material_id
LEFT JOIN Enemies e ON ed.enemy_id = e.enemy_id
GO 