-- 列出所有資料庫
SHOW DATABASES;
SHOW SCHEMAS;

-- 顯示資料庫版本
SELECT VERSION();

-- 顯示現在日期
SELECT CURRENT_DATE;

-- 切換到指定資料庫
USE mysql_test;

-- 顯示目前資料庫的名稱
SELECT database();

-- 顯示目前資料庫的所有表
SHOW TABLES;

-- 顯示指定表的結構
DESCRIBE user_master;
DESC user_master;

-- 顯示創建 table 的 sql
SHOW CREATE TABLE user_master;