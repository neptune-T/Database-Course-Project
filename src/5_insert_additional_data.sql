    -- 插入角色-光锥推荐数据
    INSERT INTO CharacterLightConeRecommendations 
    (character_id, lightcone_id, priority_score, recommendation_note) VALUES
    (1, 2, 5, '完美契合丹恒的能力'),
    (1, 3, 4, '性价比较高的选择'),
    (2, 1, 3, '可以提升三月七的生存能力'),
    (3, 1, 5, '姬子的最佳光锥选择'),
    (4, 1, 4, '提升布洛妮娅的输出能力');

    -- 插入角色-遗器推荐数据
    INSERT INTO CharacterRelicRecommendations
    (character_id, set_id, priority_score, recommendation_note) VALUES
    (1, 1, 5, '提供全面的输出属性加成'),
    (2, 2, 5, '增强三月七的防御能力'),
    (3, 1, 4, '提升姬子的输出能力'),
    (4, 3, 5, '完美适配布洛妮娅的辅助定位');

    -- 插入角色培养材料需求
    INSERT INTO CharacterMaterials
    (character_id, material_id, quantity, level_range) VALUES
    (1, 1, 5, '20-40'),
    (1, 2, 3, '40-60'),
    (1, 3, 1, '60-70'),
    (2, 1, 5, '20-40'),
    (2, 2, 3, '40-60'),
    (3, 2, 4, '40-60'),
    (3, 3, 2, '60-70'),
    (4, 2, 3, '40-60'),
    (4, 3, 2, '60-70');

    -- 插入光锥培养材料需求
    INSERT INTO LightConeMaterials
    (lightcone_id, material_id, quantity, level_range) VALUES
    (1, 4, 3, '20-40'),
    (1, 4, 5, '40-60'),
    (2, 4, 2, '20-40'),
    (3, 4, 1, '20-40');

    -- 插入遗器实例数据
    INSERT INTO Relics
    (set_id, relic_name, position, main_stat_id, main_stat_value, 
    sub_stat1_type, sub_stat1_value,
    sub_stat2_type, sub_stat2_value) VALUES
    (1, '猎人的羽饰', '手部', 1, 54.0, '暴击率', 3.2, '速度', 2.6),
    (1, '猎人的面具', '头部', 4, 32.2, '攻击力', 4.1, '生命值', 302),
    (2, '守护者的花', '躯干', 2, 2500, '防御力', 21, '生命值', 420),
    (3, '乐队的勋章', '脚部', 3, 25.0, '治疗加成', 4.5, '能量恢复', 3.2);
    GO 