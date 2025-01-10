-- 插入命途数据
INSERT INTO Paths (path_name, path_description) VALUES
('毁灭', '增加攻击力和爆伤'),
('巡猎', '增加攻击力和速度'),
('智识', '增加能量恢复和效果命中'),
('同谐', '增加治疗量和效果抵抗'),
('虚无', '增加击破特攻和弱点击破'),
('存护', '增加防御力和生命值'),
('丰饶', '增加能量上限和治疗加成');

-- 插入角色数据
INSERT INTO Characters 
(character_name, path_id, rarity, character_description, base_hp, base_atk, base_def, base_speed, is_limited) VALUES
('丹恒', 2, 4, '担任着星穹列车的护卫，对自己的过往始终讳莫如深', 1005, 624, 396, 102, 0),
('三月七', 6, 4, '自从被星穹列车列车组从恒冰中救起后，便选择与星穹列车同行，并以自己获救的那一天的日期为自己命名。', 1048, 546, 462, 98, 0),
('姬子', 1, 5, '一位富有冒险精神的科学家，年轻时发现并修复了搁浅的星穹列车', 1200, 738, 396, 96, 0),
('布洛妮娅', 4, 5, '贝洛伯格「大守护者」继承人，年轻干练的银鬃铁卫统领', 1048, 582, 462, 99, 1);

-- 插入技能数据
INSERT INTO Skills 
(character_id, skill_name, skill_type, skill_description, skill_multiplier, energy_cost, cooldown) VALUES
(1, '普通攻击', '普攻', '对敌方单体造成伤害', 100, 0, 0),
(1, '战技', '战技', '对敌方单体造成冰属性伤害', 150, 30, 2),
(1, '终结技', '终结技', '对敌方全体造成冰属性伤害', 200, 120, 0),
(2, '普通攻击', '普攻', '对敌方单体造成伤害', 100, 0, 0);

-- 插入光锥数据
INSERT INTO LightCones 
(lightcone_name, rarity, path_id, base_hp, base_atk, base_def, effect_name, effect_description) VALUES
('但战斗还未结束', 5, 1, 952, 582, 396, '战意不灭', '攻击力提升20%，暴击伤害提升20%'),
('记忆的质料', 4, 2, 846, 476, 331, '猎手天赋', '速度提升10%，攻击力提升15%'),
('离弦之箭', 3, 2, 688, 397, 298, '精准瞄准', '暴击率提升8%，暴击伤害提升16%');

-- 插入遗器套装数据
INSERT INTO RelicSets 
(set_name, two_piece_effect, four_piece_effect) VALUES
('猎人的瞄准', '攻击力提升12%', '速度提升10%，暴击率提升8%'),
('守护者意志', '防御力提升15%', '生命值提升25%'),
('乐队的奏鸣', '治疗量提升10%', '释放终结技时，全队恢复生命值');

-- 插入主属性类型数据
INSERT INTO MainStatTypes 
(stat_name, stat_description, possible_positions) VALUES
('攻击力', '提升角色攻击力', '手部,躯干'),
('生命值', '提升角色生命值', '头部,躯干'),
('速度', '提升角色速度', '脚部'),
('暴击率', '提升角色暴击率', '头部');

-- 插入材料数据
INSERT INTO Materials 
(material_name, material_type, rarity, source_description, available_days) VALUES
('破碎的铁块', '角色升级材料', 2, '可在各个世界击败机械型敌人获得', '全天'),
('古老的部件', '角色升级材料', 3, '可在各个世界击败机械型精英敌人获得', '全天'),
('永恒机芯', '角色升级材料', 4, '可在各个世界击败机械型首领获得', '全天'),
('混沌的锚点', '光锥升级材料', 4, '可在忘却之庭获得', '周一,周四,周日');

-- 插入敌人数据
INSERT INTO Enemies 
(enemy_name, enemy_type, weakness, description) VALUES
('自动机兵', '机械', '物理,火', '常见的机械巡逻兵'),
('冰晶蝎', '异种', '火', '在雪地常见的危险生物'),
('遗迹守卫', '机械', '雷', '看守遗迹的古老机械');

-- 插入掉落关系
INSERT INTO EnemyDrops 
(enemy_id, material_id, drop_rate) VALUES
(1, 1, 0.8),
(1, 2, 0.3),
(2, 3, 0.2);
GO 