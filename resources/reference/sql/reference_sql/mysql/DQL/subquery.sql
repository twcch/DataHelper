-- 子查詢不支援使用 LIMIT

-- 動態 WHERE、HAVING 條件，例如平均薪資或是平均分數
-- SELECT * FROM student_info
-- WHERE student_info.height > 175;

SELECT * FROM student_info
WHERE height > (
    SELECT avg(height)
    FROM student_info
)
ORDER BY height;

-- 身高高於平均的學生

SELECT avg(height) FROM student_info;

-- SELECT * FROM student_info
-- WHERE student_info.height > 175;

SELECT * FROM student_info
WHERE height > (
    SELECT avg(height)
    FROM student_info
)
ORDER BY height;

-- 找出上課位置在 Taipei 的學生

-- 1. 上課位置在 Taipei 的學生
SELECT class_id  FROM class_info
WHERE class_city = 'Taipei';

-- 2. 用上述的結果寫死 WHERE 條件
SELECT * FROM student_info
WHERE class_id = 'JAVA101' OR class_id = 'JAVA103';

-- 3. 利用子查詢代替上面寫死的 WHERE 條件
SELECT * FROM student_info
WHERE class_id in (
    SELECT class_id  FROM class_info
    WHERE class_city = 'Taipei'
);

-- 4. 用 JOIN 取代子查詢
SELECT si.* FROM student_info si
                     JOIN class_info ci ON si.class_id = ci.class_id
WHERE ci.class_city = 'Taipei';

-- 找出跟 John 身高體重一樣的學生

-- 1. 找出跟 John 身高體重一樣的學生
SELECT height, weight FROM student_info
WHERE name = 'John'

-- 2. 用上述的結果寫死 WHERE 條件
SELECT * FROM student_info
WHERE height = 175
  AND weight = 70;

-- 3. 利用子查詢代替上面寫死的 WHERE 條件
SELECT * FROM student_info
WHERE height = (
    SELECT height FROM student_info
    WHERE name = 'John'
)
  AND weight = (
    SELECT weight FROM student_info
    WHERE name = 'John'
);

-- 4. 簡化上面的子查詢
SELECT * FROM student_info
WHERE (height, weight) = (
    SELECT height, weight FROM student_info
    WHERE name = 'John'
)

-- 找出同班級中同體重的學生

-- 1. 找出同班級中，重覆的體重
SELECT weight, class_id FROM student_info
GROUP BY weight, class_id
HAVING count(*) > 1;

-- 2. 透過上述的結果寫出 WHERE 條件
SELECT * FROM student_info
WHERE weight = 68 AND class_id = 'JAVA101'
   OR
    weight = 60 AND class_id = 'JAVA102';

-- 3. 利用子查詢代替上面寫死的 WHERE 條件
SELECT * FROM student_info
WHERE (weight, class_id) IN (
    SELECT weight, class_id FROM student_info
    GROUP BY weight, class_id
    HAVING count(*) > 1
);