
GO
CREATE PROCEDURE [dbo].[insertTelefono] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Telefono.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Telefono varchar(50))
INSERT INTO @xmlTable SELECT Telefono
FROM OPENXML(@hDoc, 'dataset/Telefono')
WITH 
(
Telefono [varchar](50) '@Telefono'
);

DECLARE @Telefono varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Telefono FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Telefono
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Telefono WHERE Telefono = @Telefono) 
    BEGIN
        INSERT INTO dbo.Telefono VALUES (@Telefono)
    END
	
    FETCH cursorTabla INTO @Telefono
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

