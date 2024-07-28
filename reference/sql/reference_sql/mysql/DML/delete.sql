-- 刪除資料
DELETE
FROM user_master
WHERE user_id = 4
   OR username = 'twxsdx';
ROLLBACK;

-- 刪除資料，沒有條件，會被 ide 擋住
DELETE
FROM user_master;