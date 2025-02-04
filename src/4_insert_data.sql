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
('希儿', 2, 5, '星穹列车中唯一的「虚无」命途角色，拥有着神秘的身世背景', 1048, 582, 462, 99, 1);
('知更鸟',4,5,'出生于匹诺康尼，闻名银河的天环族歌者',1280,640,485,102,5);
('黄泉', 5, 5, '自称「巡海游侠」的旅人，本名不详。', 1948, 582, 492, 105, 1),
('砂金', 6, 5, '星际和平公司「战略投资部」的高级干部，「石心十人」之一，基石为「诡弈砂金」。', 1048, 582, 462, 99, 1),
('霍霍', 7, 5, '可怜又弱小的狐人小姑娘，也是怕鬼捉鬼的罗浮十王司见习判官。', 1298, 522, 162, 99, 1),
('灵砂', 7, 5, '仙舟「罗浮」丹鼎司新任司鼎，伶俐秀慧的持明医士。', 1548, 962, 212, 99, 1);
('波提欧', 2, 5, '浪迹银河的改造人牛仔，极度乐观、放荡不羁。', 1203, 620, 436, 115, 1);
-- 插入技能数据
INSERT INTO Skills 
(character_id, skill_name, skill_type, skill_description, skill_multiplier, energy_cost, cooldown) VALUES
(1, '普通攻击', '普攻', '对敌方单体造成伤害', 100, 0, 0),
(1, '战技', '战技', '对敌方单体造成冰属性伤害', 150, 30, 2),
(1, '终结技', '终结技', '对敌方全体造成冰属性伤害', 200, 120, 0),
(2, '普通攻击', '普攻', '对敌方单体造成伤害', 100, 0, 0);

-- 插入丹恒的技能数据
INSERT INTO Skills 
(character_id, skill_name, skill_type, skill_description, skill_multiplier, energy_cost, cooldown) VALUES
(1, '冰晶射击', '普攻', '对敌方单体造成冰属性伤害', 100, 0, 0),
(1, '寒霜枪', '战技', '对敌方单体造成冰属性伤害，并降低目标速度', 150, 30, 2),
(1, '冰封绝杀', '终结技', '对敌方全体造成冰属性伤害，并有几率冻结', 200, 120, 0),
(1, '冰霜之心', '天赋', '暴击率提升20%，对冻结目标造成额外伤害', NULL, 0, 0),
(1, '极寒之矢', '秘技', '立即对目标造成冰属性伤害', 120, 0, 0);

-- 插入三月七的技能数据
INSERT INTO Skills 
(character_id, skill_name, skill_type, skill_description, skill_multiplier, energy_cost, cooldown) VALUES
(2, '守护者', '普攻', '对敌方单体造成伤害并为自身提供护盾', 100, 0, 0),
(2, '寒冰屏障', '战技', '为全体队友提供护盾，并提升防御力', NULL, 20, 2),
(2, '完美防御', '终结技', '为全体队友提供强力护盾，并恢复生命值', NULL, 100, 0),
(2, '冰盾', '天赋', '受到伤害时，有30%几率为自身提供护盾', NULL, 0, 0),
(2, '冰霜庇护', '秘技', '立即为目标提供护盾', NULL, 0, 0);

-- 插入姬子的技能数据
INSERT INTO Skills 
(character_id, skill_name, skill_type, skill_description, skill_multiplier, energy_cost, cooldown) VALUES
(3, '炎刃斩击', '普攻', '对敌方单体造成火属性伤害', 110, 0, 0),
(3, '烈焰斩', '战技', '对敌方单体造成大量火属性伤害', 180, 30, 2),
(3, '炎狱绝杀', '终结技', '对敌方全体造成火属性伤害，并施加灼烧效果', 250, 140, 0),
(3, '战火意志', '天赋', '攻击力提升30%，对灼烧目标造成额外伤害', NULL, 0, 0),
(3, '烈焰之舞', '秘技', '立即对目标造成火属性伤害并施加灼烧', 150, 0, 0);

-- 插入布洛妮娅的技能数据
INSERT INTO Skills 
(character_id, skill_name, skill_type, skill_description, skill_multiplier, energy_cost, cooldown) VALUES
(4, '同谐射击', '普攻', '对敌方单体造成风属性伤害', 100, 0, 0),
(4, '战场指挥', '战技', '提升全队攻击力和速度', NULL, 25, 2),
(4, '统帅之势', '终结技', '对敌方全体造成风属性伤害，并大幅提升全队战斗能力', 200, 120, 0),
(4, '银鬃将令', '天赋', '战斗开始时，为全队提供速度提升效果', NULL, 0, 0),
(4, '战术部署', '秘技', '立即为全队提供攻击力提升', NULL, 0, 0);

-- 插入光锥数据
INSERT INTO LightCones 
(lightcone_name, rarity, path_id, base_hp, base_atk, base_def, effect_name, effect_description) VALUES
('但战斗还未结束', 5, 1, 952, 582, 396, '战意不灭', '攻击力提升20%，暴击伤害提升20%'),
('记忆的质料', 4, 2, 846, 476, 331, '猎手天赋', '速度提升10%，攻击力提升15%'),
('离弦之箭', 3, 2, 688, 397, 298, '精准瞄准', '暴击率提升8%，暴击伤害提升16%'),
('在蓝天下', 5, 4, 952, 582, 396, '同谐共鸣', '治疗量提升25%，全队速度提升10%'),
('时节不居', 5, 3, 846, 556, 331, '智识之心', '效果命中提升20%，能量恢复提升15%'),
('银河铁道之夜', 5, 7, 1052, 482, 396, '繁星闪耀', '治疗加成提升30%，能量上限提升20%'),
('无可取代的东西', 5, 6, 1246, 376, 531, '坚定守护', '生命值提升25%，防御力提升20%'),
('制胜的瞬间', 5, 5, 952, 582, 396, '虚无突破', '击破特攻提升30%，暴击率提升15%'),
('以世界之名', 5, 1, 1052, 632, 346, '毁灭之力', '攻击力提升25%，暴击伤害提升25%'),
('论剑', 4, 1, 846, 476, 331, '武者之道', '攻击力提升15%，暴击率提升10%');

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
('遗迹守卫', '机械', '雷', '看守遗迹的古老机械'),
('永冻构造', '机械', '火', '在雪地游荡的自主机械体'),
('混沌机兽', '机械', '物理', '失控的古代机械造物'),
('虚数之影', '异种', '量子', '来自虚数空间的神秘生物'),
('永冻冰蝎', '异种', '火', '在极寒环境中生存的变异生物'),
('巡猎机甲', '机械', '风', '巡逻任务的自动机械单位'),
('虚幻蝶群', '异种', '冰', '能够扰乱心智的奇异生物'),
('混沌使徒', '人型', '物理', '信奉混沌的狂热分子'),
('星际盗匪', '人型', '风', '在宇宙中流窜的危险分子'),
('遗迹守护者', '机械', '雷', '守护古代遗迹的自动防卫装置'),
('虚数巨兽', '异种', '量子', '虚数空间中的危险生物');

-- 插入掉落关系
INSERT INTO EnemyDrops 
(enemy_id, material_id, drop_rate) VALUES
(1, 1, 0.8),
(1, 2, 0.3),
(2, 3, 0.2),
(4, 1, 0.7),
(4, 2, 0.4),
(5, 2, 0.6),
(5, 3, 0.2),
(6, 1, 0.8),
(6, 3, 0.1),
(7, 2, 0.5),
(8, 1, 0.9),
(9, 3, 0.3),
(10, 2, 0.4);
GO 