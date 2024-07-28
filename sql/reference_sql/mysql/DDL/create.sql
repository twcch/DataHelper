-- 創建資料庫
CREATE DATABASE mysql_test;

-- 創建表結構
CREATE TABLE user_master
(
    user_id            INT PRIMARY KEY        NOT NULL AUTO_INCREMENT COMMENT '使用者 id',
    user_group_id      CHAR(5)                NOT NULL COMMENT '使用者群組代號',
    username           VARCHAR(50) UNIQUE KEY NOT NULL COMMENT '使用者帳號',
    password           VARCHAR(255)           NOT NULL COMMENT '使用者密碼',
    gender             ENUM ('M', 'F') DEFAULT 'M' COMMENT '使用者性別',
    created_date       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
    last_modified_date TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_master_and_group                                   -- 當違反時會秀出自訂的名字
        FOREIGN KEY (user_group_id) REFERENCES user_group (user_group_id) -- 設定 FK
) COMMENT '使用者資料表';

CREATE TABLE student_info
(
    student_id varchar(10) PRIMARY KEY COMMENT '學號',
    name       varchar(30) NOT NULL COMMENT '學生姓名',
    phone      varchar(20) COMMENT '手機',
    age        TINYINT UNSIGNED CONSTRAINT ck_student_info_age CHECK (age >= 18) COMMENT '年齡',
    email      varchar(255) DEFAULT (CONCAT(student_id, '@tbm.edu')) COMMENT '電子信箱',
    height     TINYINT UNSIGNED COMMENT '身高',
    weight     TINYINT UNSIGNED COMMENT '體重',
    class_id   varchar(10) COMMENT '班級編號',
    CONSTRAINT fk_student_info_class_id FOREIGN KEY (class_id)
        REFERENCES class_info (class_id)
) COMMENT '班級資訊';

-- 重新create table，並增加 FOREIGN KEY 、ON UPDATE CASCADE、ON DELETE CASCADE 的語法
CREATE TABLE student_info
(
    student_id varchar(10) PRIMARY KEY,
    name       varchar(30),
    phone      varchar(20),
    age        int,
    class_id   varchar(10),
    CONSTRAINT fk_student_info_class_id
        FOREIGN KEY (class_id) REFERENCES class_info (class_id)
            ON UPDATE CASCADE -- 預設 FK 無法修改，開啟更新 FK 修改時，有使用到關聯的欄位也會連動修改
            ON DELETE CASCADE -- FK 刪除後，有使用到關聯的資料也會被刪除
);

CREATE TABLE user_group
(
    user_group_id   CHAR(5)     NOT NULL COMMENT '使用者群組代號',
    user_group_name VARCHAR(50) NOT NULL COMMENT '使用者群組名稱',
    PRIMARY KEY (user_group_id) -- 可以用來設定複合 PK
) COMMENT '使用者身份組表';

/*
 * AUTO_INCREMENT 欄位限制一定要是整數
 * 如果希望 id 為自訂前綴字 + AUTO_INCREMENT
 * 可以再新增一個欄位存放前綴字，查詢時使用 CONCAT(前綴字, AUTO_INCREMENT)
 * DEFAULT: 如果 INSERT INTO 時，指定寫 null，DEFAULT 就不會生效
 */
CREATE TABLE product
(
    prefix       VARCHAR(2)   NOT NULL DEFAULT 'SN',
    id           INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    UNIQUE KEY (prefix, id)
);

-- 建立表格資料
CREATE TABLE student_info
(
    student_id varchar(10),
    name       varchar(30),
    phone      varchar(20),
    age        int         DEFAULT 20,
    email      varchar(50) DEFAULT (CONCAT(student_id, '@tbm.edu')) -- 預設值 = 學號 + @tbm.edu
);

CREATE TABLE book
(
    book_id      INT PRIMARY KEY NOT NULL,
    book_name    VARCHAR(255),
    price        DOUBLE,
    publisher_id INT
);

CREATE TABLE publisher
(
    publisher_id   INT PRIMARY KEY,
    publisher_name VARCHAR(255)
);

CREATE TABLE test_uuid
(
    id   char(36) PRIMARY KEY DEFAULT (UUID()),
    name varchar(30)
);

-- UNSIGNED 表示不會有負數
CREATE TABLE test_short_uuid
(
    id   BIGINT UNSIGNED PRIMARY KEY DEFAULT (UUID_SHORT()),
    name varchar(30)
);

-- 建立 view
CREATE VIEW user_m AS
    SELECT * FROM user_master WHERE user_id > 0;