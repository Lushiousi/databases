/*1*/
CREATE TRIGGER DeleteRelatedData
ON [schema].[table_name]
AFTER DELETE
AS
BEGIN
    -- Действия, которые должны быть выполнены после удаления записи из таблицы
END;
/*2*/
CREATE TRIGGER UpdateRelatedData
ON [schema].[table_name]
AFTER UPDATE
AS
BEGIN
    -- Действия, которые должны быть выполнены после обновления записи в таблице
END;
/*3*/
CREATE TRIGGER InsertData
ON [schema].[table_name]
AFTER INSERT
AS
BEGIN
    -- Действия, которые должны быть выполнены после добавления новой записи в таблицу
END;
