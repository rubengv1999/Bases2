
GO
CREATE PROCEDURE [dbo].[insertCarro] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Carro.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDModelo  int, IDColor  int)
INSERT INTO @xmlTable SELECT IDModelo, IDColor
FROM OPENXML(@hDoc, 'dataset/Carro')
WITH 
(
IDModelo [int] '@IDModelo',
IDColor [int] '@IDColor'
);

DECLARE @IDModelo  int, @IDColor int
DECLARE cursorTabla cursor GLOBAL for SELECT IDModelo, IDColor  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDModelo , @IDColor
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Carro WHERE IDModelo = @IDModelo AND IDColor = @IDColor) 
    BEGIN
        INSERT INTO dbo.Carro VALUES (@IDModelo, @IDColor)
    END
    FETCH cursorTabla INTO @IDModelo , @IDColor
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

