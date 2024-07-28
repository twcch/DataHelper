INSERT INTO user_master (user_group_id, username, password, gender)
VALUES (1, 'alan', '456', 'M'),
       (1, 'amy', '789', 'F');

SELECT *
FROM user_master;

-- 在手動模式下，可以恢復前面的動作
ROLLBACK;

SELECT *
FROM user_master;

-- 表示確定該異動，無法在 ROLLBACK
COMMIT;

SELECT *
FROM user_master;