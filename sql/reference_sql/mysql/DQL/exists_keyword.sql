-- 利用 "相關子查詢" 尋找不存在於 student_info 的 class_info
SELECT * FROM class_info ci
WHERE NOT EXISTS (
    SELECT * FROM student_info si
    WHERE si.class_id = ci.class_id
);

-- 利用 JOIN 尋找不存在於 student_info 的 class_info
SELECT ci.* FROM class_info ci
                     LEFT JOIN student_info si ON ci.class_id = si.class_id
WHERE si.class_id IS NULL;