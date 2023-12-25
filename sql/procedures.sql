/*1*/
-- Вызов процедуры GetPositiveMarksCount
DECLARE @positiveMarksCount INT;

EXEC GetPositiveMarksCount 
    @group_id = 1,
    @positive_mark_count = @positiveMarksCount OUTPUT;

SELECT @positiveMarksCount AS PositiveMarksCount;

CREATE PROCEDURE GetPositiveMarksCount
    @group_id INT,
    @positive_mark_count INT OUTPUT
AS
BEGIN
    SELECT @positive_mark_count = COUNT(mark)
    FROM academic_process
    WHERE group_id = @group_id AND mark > 2;
END;
/*2*/
-- Вызов процедуры GetMaxHoursSubject
DECLARE @maxHoursSubject NVARCHAR(30);

EXEC GetMaxHoursSubject
    @max_hours_subject = @maxHoursSubject OUTPUT;

SELECT @maxHoursSubject AS MaxHoursSubject;

CREATE PROCEDURE GetMaxHoursSubject
    @max_hours_subject NVARCHAR(30) OUTPUT
AS
BEGIN
    SELECT TOP 1 @max_hours_subject = subject_name
    FROM subjects
    ORDER BY total_hours DESC;
END;
/*3*/
-- Вызов процедуры GetGroupBySurname
DECLARE @groupID INT;

EXEC GetGroupBySurname
    @student_surname = 'Smith',
    @group_id = @groupID OUTPUT;

SELECT @groupID AS GroupID;

CREATE PROCEDURE GetGroupBySurname
    @student_surname NVARCHAR(25),
    @group_id INT OUTPUT
AS
BEGIN
    SELECT @group_id = group_id
    FROM students
    WHERE student_surname = @student_surname;
END;
/*4*/
-- Вызов процедуры GetStudentsCountByGroup
EXEC GetStudentsCountByGroup;

CREATE PROCEDURE GetStudentsCountByGroup
AS
BEGIN
    SELECT group_id, COUNT(*) AS students_count
    FROM students
    GROUP BY group_id;
END;
/*5*/
/*6*/

