-- 测试GetCharacterFullInfo存储过程
PRINT '测试1: 通过角色ID获取角色信息'
EXEC GetCharacterFullInfo @character_id = 1
GO

PRINT '测试2: 通过角色名称获取角色信息'
EXEC GetCharacterFullInfo @character_name = '丹恒'
GO

PRINT '测试3: 模糊查询角色信息'
EXEC GetCharacterFullInfo @character_name = '三月'
GO

-- 测试GetCharacterBestBuild存储过程
PRINT '测试4: 获取丹恒的最佳配装'
EXEC GetCharacterBestBuild @character_id = 1
GO

PRINT '测试5: 获取姬子的最佳配装'
EXEC GetCharacterBestBuild @character_id = 3
GO

-- 测试CalculateMaterialsNeeded存储过程
PRINT '测试6: 计算丹恒升级到60级所需材料'
EXEC CalculateMaterialsNeeded @character_id = 1, @target_level = 60
GO

PRINT '测试7: 计算三月七升级到40级所需材料'
EXEC CalculateMaterialsNeeded @character_id = 2, @target_level = 40
GO

-- 测试CharacterStatistics视图
PRINT '测试8: 查看角色统计信息'
SELECT * FROM CharacterStatistics
GO

-- 测试MaterialTracking视图
PRINT '测试9: 查看材料追踪信息'
SELECT * FROM MaterialTracking
GO

-- 测试更新触发器
PRINT '测试10: 测试更新时间戳触发器'
UPDATE Characters 
SET character_description = '担任着星穹列车的护卫，对自己的过往始终讳莫如深'
WHERE character_id = 1

SELECT character_name, character_description, updated_at 
FROM Characters 
WHERE character_id = 1
GO

-- 综合测试查询
PRINT '测试11: 查看所有5星角色的配装推荐'
SELECT 
    c.character_name,
    p.path_name,
    lc.lightcone_name,
    rs.set_name
FROM Characters c
JOIN Paths p ON c.path_id = p.path_id
LEFT JOIN CharacterLightConeRecommendations clr ON c.character_id = clr.character_id
LEFT JOIN LightCones lc ON clr.lightcone_id = lc.lightcone_id
LEFT JOIN CharacterRelicRecommendations crr ON c.character_id = crr.character_id
LEFT JOIN RelicSets rs ON crr.set_id = rs.set_id
WHERE c.rarity = 5
GO

PRINT '测试12: 查看材料掉落率最高的敌人'
SELECT 
    e.enemy_name,
    m.material_name,
    ed.drop_rate
FROM EnemyDrops ed
JOIN Enemies e ON ed.enemy_id = e.enemy_id
JOIN Materials m ON ed.material_id = m.material_id
ORDER BY ed.drop_rate DESC
GO 

-- 查询1：统计每个命途的角色数量和平均攻击力
SELECT 
    p.path_name AS '命途',
    COUNT(*) AS '角色数量',
    AVG(c.base_atk) AS '平均攻击力'
FROM Characters c
JOIN Paths p ON c.path_id = p.path_id
GROUP BY p.path_name
ORDER BY COUNT(*) DESC;

-- 查询2：统计不同稀有度的材料数量
SELECT 
    rarity AS '稀有度',
    COUNT(*) AS '材料数量',
    material_type AS '材料类型'
FROM Materials
GROUP BY rarity, material_type
ORDER BY rarity DESC;

-- 嵌套查询1：查询拥有比平均速度更快的角色及其命途
PRINT '测试13: 查询高速度角色'
SELECT 
    c.character_name AS '角色名称',
    c.base_speed AS '速度',
    p.path_name AS '命途'
FROM Characters c
JOIN Paths p ON c.path_id = p.path_id
WHERE c.base_speed > (
    SELECT AVG(base_speed)
    FROM Characters
)
ORDER BY c.base_speed DESC;

-- 嵌套查询2：查询拥有最高掉落率材料的敌人信息
PRINT '测试14: 查询最佳掉落敌人'
SELECT 
    e.enemy_name AS '敌人名称',
    e.enemy_type AS '敌人类型',
    m.material_name AS '掉落材料'
FROM Enemies e
JOIN EnemyDrops ed ON e.enemy_id = ed.enemy_id
JOIN Materials m ON ed.material_id = m.material_id
WHERE ed.drop_rate = (
    SELECT MAX(drop_rate)
    FROM EnemyDrops
);

-- 统计查询1：按命途和稀有度统计角色分布
PRINT '测试15: 角色分布统计'
SELECT 
    p.path_name AS '命途',
    c.rarity AS '稀有度',
    COUNT(*) AS '角色数量',
    AVG(c.base_hp) AS '平均生命值',
    AVG(c.base_atk) AS '平均攻击力',
    AVG(c.base_def) AS '平均防御力'
FROM Characters c
JOIN Paths p ON c.path_id = p.path_id
GROUP BY p.path_name, c.rarity
HAVING COUNT(*) > 0
ORDER BY c.rarity DESC, COUNT(*) DESC;

-- 统计查询2：统计各类型敌人的材料掉落情况
PRINT '测试16: 敌人掉落统计'
SELECT 
    e.enemy_type AS '敌人类型',
    COUNT(DISTINCT e.enemy_id) AS '敌人数量',
    COUNT(ed.material_id) AS '掉落材料种类',
    AVG(ed.drop_rate) AS '平均掉落率',
    MAX(ed.drop_rate) AS '最高掉落率'
FROM Enemies e
LEFT JOIN EnemyDrops ed ON e.enemy_id = ed.enemy_id
GROUP BY e.enemy_type
ORDER BY COUNT(DISTINCT e.enemy_id) DESC;
GO

