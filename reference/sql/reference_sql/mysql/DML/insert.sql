-- 新增單筆資料
INSERT INTO user_group (user_group_id, user_group_name)
VALUES (1, 'VIP');

-- 新增多筆資料
INSERT INTO user_master (user_group_id, username, password, gender)
VALUES (1, 'twxx', '123456', 'M'),
       (1, 'twxsdx', '12345678', 'F');