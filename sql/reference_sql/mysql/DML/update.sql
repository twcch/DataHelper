-- 更新資料
UPDATE user_master
SET username = 'twcch',
    password = '987654321'
WHERE user_id = 3;

-- 更新資料，沒有條件，會被 ide 擋住
UPDATE user_master
SET username = 'twcch';