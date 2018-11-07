
GO
CREATE PROCEDURE [dbo].[insertAnno] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Anno.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Anno int)
INSERT INTO @xmlTable SELECT Anno
FROM OPENXML(@hDoc, 'dataset/Anno')
WITH 
(
Anno int '@Anno'
);

DECLARE @Anno int
DECLARE cursorTabla cursor GLOBAL for SELECT Anno FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Anno
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Anno WHERE Anno = @Anno) 
    BEGIN
        INSERT INTO dbo.Anno VALUES (@Anno)
    END
	
    FETCH cursorTabla INTO @Anno
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

