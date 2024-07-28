-- 學生名單
SELECT name FROM student_info;

-- 教師名單
SELECT class_teacher_name AS name FROM class_info;

-- 謝師宴名單
SELECT name FROM student_info
UNION
SELECT class_teacher_name AS name FROM class_info;

-- all
SELECT name FROM student_info
UNION ALL
SELECT class_teacher_name AS name FROM class_info;

