/*1*/
CREATE TRIGGER DeleteRelatedData
ON [schema].[table_name]
AFTER DELETE
AS
BEGIN
    -- ��������, ������� ������ ���� ��������� ����� �������� ������ �� �������
END;
/*2*/
CREATE TRIGGER UpdateRelatedData
ON [schema].[table_name]
AFTER UPDATE
AS
BEGIN
    -- ��������, ������� ������ ���� ��������� ����� ���������� ������ � �������
END;
/*3*/
CREATE TRIGGER InsertData
ON [schema].[table_name]
AFTER INSERT
AS
BEGIN
    -- ��������, ������� ������ ���� ��������� ����� ���������� ����� ������ � �������
END;
