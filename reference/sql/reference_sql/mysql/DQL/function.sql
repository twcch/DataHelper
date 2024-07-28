-- 合併欄位
SELECT CONCAT('hello', ' ', 'world');

-- 向上取整
SELECT CEILING(1.23);

SELECT CEILING(-1.23);

-- 向下取整
SELECT FLOOR(1.23);

SELECT FLOOR(-1.23);

-- 四捨五入至小數點後 0 位
SELECT ROUND(1.58);

-- 四捨五入至小數點後 1 位
SELECT ROUND(1.298, 1);

-- 回傳次方結果
SELECT POW(2, 2);

SELECT POW(2, -2);

-- 回傳平方根
SELECT SQRT(4);

-- 字串串接但在每個字串之間會加入分割符(第一個參數)，若分割符號為 NULL 則回傳 NULL
-- 'First name,Second name,Last Name'
SELECT CONCAT_WS( ',', 'First name', 'Second name', 'Last Name' );
-- 'First name,Last Name'
SELECT CONCAT_WS( ',', 'First name', NULL, 'Last Name' );

-- 回傳小寫的字串
SELECT LOWER('QUADRATICALLY');

-- 回傳大寫的字串
SELECT UPPER('Hej');

-- 回傳字串所需的儲存空間(byte)
SELECT LENGTH('text');

SELECT LENGTH('文字');

-- 回傳字串的字元數
SELECT CHAR_LENGTH('text');

SELECT CHAR_LENGTH('文字');

-- 預設去除頭尾的半形空格，可以額外指定要去除的字元，也可以再額外指定要去除的頭尾
-- 'bar'
SELECT TRIM(' bar ');
-- '　bar　'
SELECT TRIM(' bar ');
-- 'bxaxrxxx'
SELECT TRIM( LEADING 'x' FROM 'xxxbxaxrxxx' );
-- 'bxaxr'
SELECT TRIM( BOTH 'x' FROM 'xxxbxaxrxxx' );
-- 'xxxbxaxr'
SELECT TRIM( TRAILING 'x' FROM 'xxxbxaxrxxx' );

-- 取得現在的時區的時間戳
-- '2007-12-15 23:50:26' (YYYY-MM-DD hh:mm:ss)
SELECT NOW();
-- 20071215235026 (YYYYMMDDhhmmss)
SELECT NOW() + 0;

-- 取得現在的時區的日期
-- '2008-06-13' (YYYY-MM-DD)
SELECT CURDATE();
-- 20080613 (YYYYMMDD)
SELECT CURDATE() + 0;

-- 取得現在的時區的時間
-- 19:25:37 (hh:mm:ss)
SELECT CURTIME();
-- 192537 (hhmmss)
SELECT CURTIME() + 0;
-- 19:25:37.842 (fractional seconds precision)
SELECT CURTIME(3);
-- 19:25:37.842123 (fractional seconds precision max 6)
SELECT CURTIME(6);

-- 日期格式轉換
-- 'Sunday October 2009'
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');
-- '22:23:00'
SELECT DATE_FORMAT('2007-10-04 22:23:00', '%H:%i:%s');
-- '4th 00 Thu 04 10 Oct 277'
SELECT DATE_FORMAT('1900-10-04 22:23:00', '%D %y %a %d %m %b %j');
-- '22 22 10 10:23:00 PM 22:23:00 00 6'
SELECT DATE_FORMAT('1997-10-04 22:23:00', '%H %k %I %r %T %S %w');
-- '1998 52'
SELECT DATE_FORMAT('1999-01-01', '%X %V');
-- '00'
SELECT DATE_FORMAT('2006-06-00', '%d');

-- 日期相減回傳相差的天數，若傳入的參數包含時間會自動忽略時間，僅計算日期的部分。
-- 1
SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30');
-- -31
SELECT DATEDIFF('2010-11-30 23:59:59','2010-12-31');

-- 日期時間的加減，如果日期為 null 則回傳 null
-- '2018-05-02'
SELECT DATE_ADD('2018-05-01',INTERVAL 1 DAY);
-- '2017-05-01'
SELECT DATE_SUB('2018-05-01',INTERVAL 1 YEAR);
-- '2021-01-01 00:00:00'
SELECT DATE_ADD('2020-12-31 23:59:59', INTERVAL 1 SECOND);
-- '2019-01-01 23:59:59'
SELECT DATE_ADD('2018-12-31 23:59:59', INTERVAL 1 DAY);
-- '2101-01-01 00:01:00'
SELECT DATE_ADD('2100-12-31 23:59:59', INTERVAL '1:1' MINUTE_SECOND);
-- '2024-12-30 22:58:59'
SELECT DATE_SUB('2025-01-01 00:00:00', INTERVAL '1 1:1:1' DAY_SECOND);
-- '1899-12-30 14:00:00'
SELECT DATE_ADD('1900-01-01 00:00:00', INTERVAL '-1 10' DAY_HOUR);
-- '1997-12-02'
SELECT DATE_SUB('1998-01-02', INTERVAL 31 DAY);
-- '1993-01-01 00:00:01.000001'
SELECT DATE_ADD('1992-12-31 23:59:59.000002', INTERVAL '1.999999' SECOND_MICROSECOND);

-- 流程控制
SELECT
    CASE 1
        WHEN 1 THEN 'one'
        WHEN 2 THEN 'two'
        WHEN 3 THEN 'three'
        ELSE 'zero'
    END AS num;

-- IFNULL(expr1, expr2)
-- 如果第一個參數為 NULL 則回傳第二個參數的值
SELECT IFNULL(1,0);
SELECT IFNULL(NULL,10);
-- 10
SELECT IFNULL(1/0,10);
-- 'yes'
SELECT IFNULL(1/0,'yes');