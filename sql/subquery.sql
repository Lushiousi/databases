/*1*/
SELECT teacher_surname 
FROM teachers 
WHERE kafedra_id = (SELECT kafedra_id FROM kafedra WHERE kafedra_name = 'eng');
/*2*/
SELECT teacher_name, teacher_surname, teacher_lastname 
FROM teachers 
WHERE teacher_id = ANY (SELECT teacher_id FROM learning WHERE group_id = 102 AND total_hours > 150);
/*3*/
SELECT teacher_surname 
FROM teachers 
WHERE teacher_id = ANY (SELECT teacher_id FROM learning WHERE subject_id = (SELECT subject_id FROM subjects WHERE vidz = 'пр'));
/*4*/
SELECT subject_id 
FROM learning 
WHERE total_hours > ALL (70);
/*5*/
SELECT teacher_name, teacher_surname, teacher_lastname 
FROM teachers 
WHERE teacher_id = (SELECT teacher_id FROM learning 
                    WHERE group_id = 101 
                    AND subject_id = (SELECT subject_id FROM subjects WHERE subject_name = 'history'));
/*6*/
SELECT group_id, kolvo_students 
FROM gruppa 
WHERE group_id = (SELECT group_id FROM learning WHERE teacher_id = 103);
/*7*/
SELECT teacher_name, teacher_surname, teacher_lastname 
FROM teachers 
WHERE EXISTS (SELECT * FROM learning WHERE learning.teacher_id = teachers.teacher_id);
/*8*/
SELECT student_name, student_surname, student_lastname 
FROM students 
WHERE student_id = ANY (SELECT student_id FROM academic_process WHERE mark = '2') 
OR student_id = ANY (SELECT student_id FROM academic_process WHERE mark = '3');
/*9*/
SELECT student_name, student_surname, student_lastname 
FROM students 
WHERE passing_ball = (SELECT MAX(passing_ball) FROM students);
/*10*/
SELECT student_name, student_surname, student_lastname 
FROM students 
WHERE passing_ball = (SELECT MIN(passing_ball) FROM students) 
GROUP BY group_id;
/*11*/
SELECT student_name, student_surname, student_lastname 
FROM students 
WHERE passing_ball > (SELECT MAX(passing_ball) FROM students WHERE students.group_id = group_id);
/*12*/
SELECT student_name, student_surname, student_lastname 
FROM students 
WHERE student_id = (SELECT student_id FROM academic_process 
                    WHERE subject_id = (SELECT subject_id FROM subjects WHERE subject_name = 'Информатика') 
                    GROUP BY student_id 
                    HAVING COUNT(mark));
/*13*/
SELECT teacher_name, teacher_surname, teacher_lastname 
FROM teachers 
WHERE teacher_id = (SELECT teacher_id 
                    FROM learning 
                    GROUP BY teacher_id 
                    HAVING COUNT(subject_id) = (SELECT MIN(cnt) FROM (SELECT teacher_id, COUNT(subject_id) as cnt FROM learning GROUP BY teacher_id) as t));