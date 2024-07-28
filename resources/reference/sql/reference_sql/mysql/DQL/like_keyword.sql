-- 搜尋 foo 開頭的文字，不區分大小寫
SELECT *
FROM mysql_test.user_master
WHERE username LIKE 'foo%';

-- 搜尋 foo 結尾的文字，不區分大小寫
SELECT *
FROM mysql_test.user_master
WHERE username LIKE '%foo';

-- 搜尋 Foo 開頭的文字，區分大小寫
SELECT *
FROM mysql_test.user_master
WHERE username LIKE CAST('Foo%' AS BINARY);

-- 搜尋第二個字是 a 的文字，不限制文字長度，不區分大小寫
SELECT *
FROM mysql_test.user_master
WHERE username LIKE CONCAT('_', 'a', '%');

SELECT *
FROM mysql_test.user_master
WHERE username LIKE '_a%';

-- 搜尋第三個字是 a 的文字，不限制文字長度，不區分大小寫
SELECT *
FROM mysql_test.user_master
WHERE username LIKE CONCAT('_', '_', 'a', '%');

SELECT *
FROM mysql_test.user_master
WHERE username LIKE '__a%';

-- 使用\(跳脫字元)搜尋 % 開頭的文字
SELECT *
FROM mysql_test.user_master
WHERE username LIKE CONCAT('\%', '%');

SELECT *
FROM mysql_test.user_master
WHERE username LIKE '\%%';

-- 組合 ESCAPE 搜尋 % 開頭的文字
-- 自訂義跳脫字元
SELECT *
FROM mysql_test.user_master
WHERE username LIKE CONCAT('e%', '%') ESCAPE 'e';

SELECT *
FROM mysql_test.user_master
WHERE username LIKE 'e%%' ESCAPE 'e';