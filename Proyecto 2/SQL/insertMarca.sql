
GO
CREATE PROCEDURE [dbo].[insertMarca] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Marca.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Marca')
WITH 
(
Nombre [varchar](50) '@Nombre'
);

DECLARE @Nombre varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Marca WHERE Marca = @Nombre) 
    BEGIN
        INSERT INTO dbo.Marca VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

