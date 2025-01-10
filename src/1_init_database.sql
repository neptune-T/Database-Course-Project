USE master
GO

-- 如果数据库存在则删除
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'StarRailDB')
BEGIN
    DROP DATABASE StarRailDB
END
GO

-- 创建新数据库
CREATE DATABASE StarRailDB
GO

USE StarRailDB
GO 