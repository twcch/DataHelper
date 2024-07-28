-- 算術運算子
SELECT 3 + 5;
SELECT 3 - 5;
SELECT 3 * 5;
SELECT 3 / 5;
SELECT 5 % 2;

-- 比較運算子
SELECT 1 = 1;
SELECT 1 != 1;
SELECT 2 > 1;
SELECT 2 < 1;
SELECT 2 >= 1;
SELECT 2 <= 1;
SELECT 3 BETWEEN 1 AND 5;
SELECT 'abc' LIKE '%b%';
SELECT 3 IN (1, 2, 3);
SELECT 3 NOT IN (1, 2, 3);

-- null
SELECT 1 / 0 IS NULL;
SELECT 1 / 0 IS NOT NULL;
SELECT NULL IS NULL;
SELECT NULL IS NOT NULL;

/*
 * 等價操作：AND 優先度大於 OR，就像先乘除後加減!!!
 */
-- true
select true || true && false;
-- true
select true || (true && false);
