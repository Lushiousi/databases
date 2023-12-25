/*1*/
select subject_name from subjects where total_hours != (lection_hours + practic_hours);
/*2*/
SELECT student_surname 
from students, academic_process
WHERE mark = 3 and mark = 4;
/*3*/
SELECT student_surname, gruppa.group_id 
FROM students 
JOIN gruppa 
ON students.group_id = gruppa.group_id 
GROUP BY student_surname, gruppa.group_id 
HAVING COUNT(student_id) > 30;
/*4*/
SELECT teacher_surname 
FROM teachers 
JOIN kafedra 
ON teachers.kafedra_id = kafedra.kafedra_id 
WHERE kafedra.kafedra_name = 'math';
/*5*/
SELECT teacher_surname, subjects.total_hours, subjects.subject_name, learning.group_id 
FROM teachers 
JOIN kafedra 
ON teachers.kafedra_id = kafedra.kafedra_id 
JOIN learning 
ON teachers.teacher_id = learning.teacher_id 
JOIN subjects 
ON learning.subject_id = subjects.subject_id 
WHERE kafedra.kafedra_name = 'info';
/*6*/
SELECT subject_name 
FROM subjects 
JOIN academic_process 
ON subjects.subject_id = academic_process.subject_id 
WHERE mark = 2;
/*7*/
SELECT mark, COUNT(mark) 
FROM academic_process 
GROUP BY mark;
/*8*/
SELECT students.group_id, gruppa.kolvo_students 
FROM students 
JOIN gruppa 
ON students.group_id = gruppa.group_id 
WHERE student_surname = 'birukov';
/*9*/
SELECT teacher_surname, learning.group_id 
FROM teachers 
JOIN learning 
ON teachers.teacher_id = learning.teacher_id 
JOIN subjects 
ON learning.subject_id = subjects.subject_id 
WHERE subjects.total_hours > 100;
/*10*/
SELECT subject_name 
FROM subjects 
JOIN learning 
ON subjects.subject_id = learning.subject_id 
JOIN teachers 
ON learning.teacher_id = teachers.teacher_id 
JOIN kafedra 
ON teachers.kafedra_id = kafedra.kafedra_id 
WHERE kafedra.kafedra_name = 'info';
/*11*/
SELECT teacher_surname 
FROM teachers 
JOIN learning 
ON teachers.teacher_id = learning.teacher_id 
WHERE learning.group_id = 102 
ORDER BY teacher_surname;
/*12*/
SELECT group_id, SUM(hourses) AS total_hours 
FROM learning 
GROUP BY group_id;
/*13*/
SELECT kafedra_id, COUNT(teacher_id) AS teacher_count 
FROM teachers 
GROUP BY kafedra_id;
/*14*/
SELECT student_id, MIN(mark) AS min_mark 
FROM academic_process 
GROUP BY student_id;
/*15*/
SELECT student_id, subject_id, MIN(mark) AS min_mark 
FROM academic_process 
GROUP BY student_id, subject_id;
/*16*/
SELECT * 
FROM students 
LEFT JOIN academic_process 
ON students.student_id = academic_process.student_id 
AND students.group_id = academic_process.group_id;
/*17 IDENTITY используется для автоматической генерации уникальных идентификаторов для новых строк в таблице. TOP используется для ограничения количества строк, возвращаемых из запроса.*/
