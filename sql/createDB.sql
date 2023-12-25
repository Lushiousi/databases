CREATE TABLE gruppa(  
group_id INT PRIMARY KEY IDENTITY,  
kolvo_students INT NOT NULL,  
passing_ball DECIMAL(3, 2) NOT NULL,  
CHECK(kolvo_students > 0 AND kolvo_students <= 25));

CREATE TABLE students(  
student_id INT IDENTITY,  
group_id INT,  
student_name NVARCHAR(25) NOT NULL,  
student_surname NVARCHAR(25) NOT NULL,  
student_lastname NVARCHAR(25),  
passing_ball DECIMAL(3, 2),  
CHECK(passing_ball > 2 AND passing_ball <= 5),  
CONSTRAINT pk_students PRIMARY KEY (student_id, group_id),  
CONSTRAINT fk_group_to_student FOREIGN KEY (group_id) REFERENCES gruppa(group_id)); 

CREATE TABLE kafedra(  
kafedra_id INT PRIMARY KEY IDENTITY,  
kafedra_name VARCHAR(40) UNIQUE NOT NULL ); 

CREATE TABLE teachers(  
teacher_id INT PRIMARY KEY IDENTITY,  
teacher_name NVARCHAR(25) NOT NULL,  
teacher_surname NVARCHAR(25) NOT NULL,  
teacher_lastname NVARCHAR(25),  
kafedra_id INT,  
CONSTRAINT fk_kafedraID_to_teacher FOREIGN KEY (kafedra_id) REFERENCES kafedra(kafedra_id)); 

CREATE TABLE subjects(  
subject_id INT PRIMARY KEY IDENTITY,  
subject_name VARCHAR(30) NOT NULL,  
total_hours INT NOT NULL,  
lection_hours INT NOT NULL,  
practic_hours INT NOT NULL,  
CHECK(lection_hours + practic_hours <= total_hours)); 

CREATE TABLE learning(  
group_id INT,  
subject_id INT,  
teacher_id INT,
hourses INT,
average_mark DECIMAL(3, 2),    
CHECK(average_mark >= 2 and average_mark <= 5),  
CONSTRAINT pr_keys PRIMARY KEY(group_id, subject_id, teacher_id),  
CONSTRAINT fk_subjID_to_subject FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),  
CONSTRAINT fk_groupID_to_group FOREIGN KEY (group_id) REFERENCES gruppa(group_id),  
CONSTRAINT fk_tabNum_to_teachers FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)); 

CREATE TABLE academic_process(  
group_id INT,  
student_id INT,  
subject_id INT,  
teacher_id INT NOT NULL, 
mark INT NOT NULL,  
CHECK(mark >= 2 AND mark <= 5),    
CONSTRAINT fk_academicProcess PRIMARY KEY (group_id, student_id, subject_id, teacher_id),  
CONSTRAINT fk_studID_to_academic_process FOREIGN KEY (student_id, group_id) REFERENCES students(student_id, group_id),  
CONSTRAINT fk_acadProc_to_learn FOREIGN KEY (group_id, subject_id, teacher_id) REFERENCES learning(group_id, subject_id, teacher_id));