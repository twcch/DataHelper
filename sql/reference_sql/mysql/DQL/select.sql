-- 查詢自動編號下一個號碼
SELECT AUTO_INCREMENT
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'mysql_test'
  AND TABLE_NAME = 'user_master';

-- INFORMATION_SCHEMA.TABLES 儲存許多暫存的統計資訊，暫存資訊不正確可以使用 information_schema_stats_expiry 設定失效時間
-- 設為 0 代表立即失效，就會重新取得最新統計資訊；建議先執行然後再取得自動編號資訊
SET @@SESSION.information_schema_stats_expiry = 0;

-- 顯示表格資訊也會呈現自動編號資訊（Auto-increment欄位）
SHOW TABLE STATUS FROM 'mysql_test'
    WHERE name LIKE 'user_master';