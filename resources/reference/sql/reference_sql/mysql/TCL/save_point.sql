SELECT *
FROM user_master;

-- 設定 ROLLBACK 儲存點，執行 ROLLBACK 時可以恢復到該節點
SAVEPOINT p1;
INSERT INTO user_master (user_group_id, username, password)
VALUES (1, 'a', '111');

SAVEPOINT p2;
INSERT INTO user_master (user_group_id, username, password)
VALUES (1, 'b', '222');

SAVEPOINT p3;
INSERT INTO user_master (user_group_id, username, password)
VALUES (1, 'c', '333');

SELECT *
FROM user_master;

ROLLBACK TO p2;

SELECT *
FROM user_master;

COMMIT;