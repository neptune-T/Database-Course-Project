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
SET character_description = '星核猎手中的佼佼者，擅长冰属性攻击'
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