# 崩坏：星穹铁道数据库设计

<p align="center">
<img src="ppt/img/Cover.png" width=100%>
<p>

> "在这列开往群星的列车上，我们记录着每一位开拓者的足迹。" —— 星穹列车数据库

## 项目简介
这是一个基于Microsoft SQL Server的数据库设计项目，用于管理和存储崩坏：星穹铁道游戏中的各类数据。作为虚拟的"星穹列车数据库"，该系统记录了开拓者们在铁道世界中遇到的角色、光锥、遗器等重要信息。

ppt采用latex beamer模板，ppt模板使用[清华大学模板](https://github.com/tuna/THU-Beamer)，感谢模板作者。

## 数据库结构

### 核心表（命途记录）
- **Paths**: 命途信息表 - 记录着七种命途的特性
- **Characters**: 角色信息表 - 开拓者们在旅途中邂逅的伙伴信息
- **Skills**: 技能信息表 - 角色们的战斗技能详情
- **LightCones**: 光锥信息表 - 来自过去文明的奇妙武器
- **RelicSets**: 遗器套装信息表 - 遗留在各个世界的神秘装备
- **Relics**: 遗器实例表 - 具体的遗器属性记录
- **Materials**: 材料信息表 - 开拓过程中收集的珍贵资源
- **Enemies**: 敌人信息表 - 星际和谐卫士的威胁记录

### 关联表（星轨联系）
- **EnemyDrops**: 敌人掉落关系表
- **CharacterLightConeRecommendations**: 角色-光锥契合度分析
- **CharacterRelicRecommendations**: 角色-遗器搭配推荐
- **CharacterMaterials**: 角色培养路径规划
- **LightConeMaterials**: 光锥强化材料需求

## 主要功能

### 存储过程（开拓指南）
1. **GetCharacterFullInfo**: 
   - 全方位了解角色信息
   - 包含基础属性、技能详情等
2. **GetCharacterBestBuild**: 
   - 获取角色最佳配装方案
   - 包含光锥和遗器套装推荐
3. **CalculateMaterialsNeeded**: 
   - 智能计算培养材料需求
   - 支持自定义目标等级

### 视图（数据分析）
1. **CharacterStatistics**: 
   - 各命途角色数量统计
   - 稀有度分布分析
2. **MaterialTracking**: 
   - 材料获取途径追踪
   - 掉落概率统计

### 触发器（自动化维护）
- **UpdateTimestamps**: 自动记录数据更新时间

## 数据库特性
- 采用外键约束确保数据完整性，如同列车轨道般严丝合缝
- 实现了自动更新时间戳功能，记录每一次数据变更
- 包含优化索引，提供如同星际穿梭般的查询速度
- 支持多表关联查询，展现数据间的紧密联系
- 内置数据验证机制，确保信息准确性

## 项目文件结构 

```
src/
├── 1_init_database.sql      # 数据库初始化脚本（开启星轨之旅）
├── 2_create_tables.sql      # 表结构创建脚本（构建数据星图）
├── 3_create_procedures.sql  # 存储过程和触发器（开拓助手）
├── 4_insert_data.sql        # 基础数据插入（星际档案）
└── 5_insert_additional_data.sql  # 额外数据（补充记录）

ppt/
└── 数据库设计.pptx          # 数据库设计答辩展示
```

## 使用指南

### 基础部署
1. 运行1_init_database.sql脚本，初始化星穹列车数据库
2. 执行2_create_tables.sql脚本，创建数据表结构
3. 执行3_create_procedures.sql脚本，部署存储过程和触发器
4. 执行4_insert_data.sql脚本，插入基础数据
5. 执行5_insert_additional_data.sql脚本，添加额外数据
6. 执行6_test.sql脚本，测试数据库功能
### 常用查询示例
```sql
-- 查看角色详细信息
EXEC GetCharacterFullInfo @character_name = '姬子'

-- 获取角色最佳配装
EXEC GetCharacterBestBuild @character_id = 1

-- 计算培养材料
EXEC CalculateMaterialsNeeded @character_id = 1, @target_level = 60
```

## 注意事项
- 部署前请确保已安装Microsoft SQL Server（推荐2019或更高版本）
- 建议按照文件编号顺序执行脚本，确保数据完整性
- 部分功能可能需要数据库管理员权限
- 定期备份数据库，保护你的开拓记录

## 技术支持
如果在使用过程中遇到问题，请参考以下方式：
- 检查执行日志
- 确认数据库版本兼容性
- 验证用户权限设置


## 致谢
感谢数据库课设给的机会，感谢所有为星穹铁道数据库建设做出贡献的开拓者们提供的数据信息。
感谢[DLA](https://github.com/00lostin00)帮我搜索整理数据。


<div align="center">
  <img src="ppt/img/1.0「通往群星的轨道」.png" width=100%>
  <p style="font-size: 1.5em; font-weight: bold; margin-top: 20px;">
    愿此行，终抵群星!
  </p>
</div>
