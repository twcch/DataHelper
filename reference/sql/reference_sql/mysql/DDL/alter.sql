-- 變更表名
ALTER TABLE book RENAME TO books;

-- 新增欄位
ALTER TABLE book
    ADD COLUMN language VARCHAR(40);

-- 欄位更名
ALTER TABLE book
    RENAME COLUMN book_name TO name;

-- 修改欄位預設值
ALTER TABLE book
    ALTER COLUMN language SET DEFAULT 'chinese';

-- 設置表格的字元集和排序規則
ALTER TABLE book CONVERT TO CHARACTER SET
    charset_name COLLATE collation_name;

-- 刪除欄位預設值
ALTER TABLE book
    ALTER COLUMN language DROP DEFAULT;

-- 修改欄位類型
ALTER TABLE book
    MODIFY language VARCHAR(20);

-- 刪除欄位
ALTER TABLE book
    DROP COLUMN language;

-- 建立 FK
ALTER TABLE book
    ADD CONSTRAINT fk_book_publisher
        FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id);

-- 移除 FK
ALTER TABLE book
    DROP FOREIGN KEY fk_book_publisher;

-- 欄位改為不可為空值
ALTER TABLE book
    MODIFY book_name VARCHAR(255) NOT NULL;

-- 欄位改為可為空值
ALTER TABLE book
    MODIFY book_name VARCHAR(255) NULL;



