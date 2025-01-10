-- 创建命途表
CREATE TABLE Paths (
    path_id INT PRIMARY KEY IDENTITY(1,1),
    path_name NVARCHAR(50) NOT NULL UNIQUE,
    path_description NVARCHAR(MAX),
    path_icon_url NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建角色表
CREATE TABLE Characters (
    character_id INT PRIMARY KEY IDENTITY(1,1),
    character_name NVARCHAR(100) NOT NULL UNIQUE,
    path_id INT FOREIGN KEY REFERENCES Paths(path_id),
    rarity INT CHECK (rarity BETWEEN 4 AND 5),
    character_description NVARCHAR(MAX),
    base_hp INT NOT NULL,
    base_atk INT NOT NULL,
    base_def INT NOT NULL,
    base_speed INT NOT NULL,
    character_icon_url NVARCHAR(255),
    release_date DATE,
    is_limited BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建技能表
CREATE TABLE Skills (
    skill_id INT PRIMARY KEY IDENTITY(1,1),
    character_id INT FOREIGN KEY REFERENCES Characters(character_id),
    skill_name NVARCHAR(100) NOT NULL,
    skill_type NVARCHAR(20) CHECK (skill_type IN ('普攻', '战技', '终结技', '天赋', '秘技')),
    skill_description NVARCHAR(MAX),
    skill_multiplier DECIMAL(10,2),
    energy_cost INT,
    cooldown INT,
    skill_icon_url NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建光锥表
CREATE TABLE LightCones (
    lightcone_id INT PRIMARY KEY IDENTITY(1,1),
    lightcone_name NVARCHAR(100) NOT NULL UNIQUE,
    rarity INT CHECK (rarity BETWEEN 3 AND 5),
    path_id INT FOREIGN KEY REFERENCES Paths(path_id),
    base_hp INT,
    base_atk INT,
    base_def INT,
    effect_name NVARCHAR(100),
    effect_description NVARCHAR(MAX),
    max_superimpose INT DEFAULT 5,
    lightcone_icon_url NVARCHAR(255),
    is_limited BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建遗器套装表
CREATE TABLE RelicSets (
    set_id INT PRIMARY KEY IDENTITY(1,1),
    set_name NVARCHAR(100) NOT NULL UNIQUE,
    two_piece_effect NVARCHAR(MAX),
    four_piece_effect NVARCHAR(MAX),
    set_icon_url NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建主属性类型表
CREATE TABLE MainStatTypes (
    main_stat_id INT PRIMARY KEY IDENTITY(1,1),
    stat_name NVARCHAR(50) NOT NULL UNIQUE,
    stat_description NVARCHAR(MAX),
    possible_positions NVARCHAR(100)
)

-- 创建遗器表
CREATE TABLE Relics (
    relic_id INT PRIMARY KEY IDENTITY(1,1),
    set_id INT FOREIGN KEY REFERENCES RelicSets(set_id),
    relic_name NVARCHAR(100) NOT NULL,
    position NVARCHAR(20) CHECK (position IN ('头部', '手部', '躯干', '脚部')),
    main_stat_id INT FOREIGN KEY REFERENCES MainStatTypes(main_stat_id),
    main_stat_value DECIMAL(10,2),
    sub_stat1_type NVARCHAR(50),
    sub_stat1_value DECIMAL(10,2),
    sub_stat2_type NVARCHAR(50),
    sub_stat2_value DECIMAL(10,2),
    sub_stat3_type NVARCHAR(50),
    sub_stat3_value DECIMAL(10,2),
    sub_stat4_type NVARCHAR(50),
    sub_stat4_value DECIMAL(10,2),
    relic_level INT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建材料表
CREATE TABLE Materials (
    material_id INT PRIMARY KEY IDENTITY(1,1),
    material_name NVARCHAR(100) NOT NULL UNIQUE,
    material_type NVARCHAR(50),
    rarity INT CHECK (rarity BETWEEN 1 AND 5),
    source_description NVARCHAR(MAX),
    material_icon_url NVARCHAR(255),
    available_days NVARCHAR(50),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建敌人表
CREATE TABLE Enemies (
    enemy_id INT PRIMARY KEY IDENTITY(1,1),
    enemy_name NVARCHAR(100) NOT NULL,
    enemy_type NVARCHAR(50),
    weakness NVARCHAR(100),
    description NVARCHAR(MAX),
    enemy_icon_url NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
)

-- 创建关联表
-- 创建掉落关系表
CREATE TABLE EnemyDrops (
    enemy_id INT FOREIGN KEY REFERENCES Enemies(enemy_id),
    material_id INT FOREIGN KEY REFERENCES Materials(material_id),
    drop_rate DECIMAL(5,2),
    PRIMARY KEY (enemy_id, material_id)
)

-- 创建角色-光锥推荐表
CREATE TABLE CharacterLightConeRecommendations (
    character_id INT FOREIGN KEY REFERENCES Characters(character_id),
    lightcone_id INT FOREIGN KEY REFERENCES LightCones(lightcone_id),
    priority_score INT CHECK (priority_score BETWEEN 1 AND 5),
    recommendation_note NVARCHAR(MAX),
    PRIMARY KEY (character_id, lightcone_id)
)

-- 创建角色-遗器推荐表
CREATE TABLE CharacterRelicRecommendations (
    character_id INT FOREIGN KEY REFERENCES Characters(character_id),
    set_id INT FOREIGN KEY REFERENCES RelicSets(set_id),
    priority_score INT CHECK (priority_score BETWEEN 1 AND 5),
    recommendation_note NVARCHAR(MAX),
    PRIMARY KEY (character_id, set_id)
)

-- 创建角色培养材料需求表
CREATE TABLE CharacterMaterials (
    character_id INT FOREIGN KEY REFERENCES Characters(character_id),
    material_id INT FOREIGN KEY REFERENCES Materials(material_id),
    quantity INT,
    level_range NVARCHAR(20),
    PRIMARY KEY (character_id, material_id, level_range)
)

-- 创建光锥培养材料需求表
CREATE TABLE LightConeMaterials (
    lightcone_id INT FOREIGN KEY REFERENCES LightCones(lightcone_id),
    material_id INT FOREIGN KEY REFERENCES Materials(material_id),
    quantity INT,
    level_range NVARCHAR(20),
    PRIMARY KEY (lightcone_id, material_id, level_range)
)

-- 创建索引
CREATE NONCLUSTERED INDEX IX_Characters_PathId 
ON Characters(path_id)

CREATE NONCLUSTERED INDEX IX_LightCones_PathId
ON LightCones(path_id)

CREATE NONCLUSTERED INDEX IX_Relics_SetId
ON Relics(set_id)
GO 