
GO
CREATE PROCEDURE [dbo].[insertApellido] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Apellido.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Apellido varchar(50))
INSERT INTO @xmlTable SELECT Apellido
FROM OPENXML(@hDoc, 'dataset/Apellido')
WITH 
(
Apellido [varchar](50) '@Apellido'
);

DECLARE @Apellido varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Apellido FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Apellido
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Apellido WHERE Apellido = @Apellido) 
    BEGIN
        INSERT INTO dbo.Apellido VALUES (@Apellido)
    END
	
    FETCH cursorTabla INTO @Apellido
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

