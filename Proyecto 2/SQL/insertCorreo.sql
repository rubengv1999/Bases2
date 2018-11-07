
GO
CREATE PROCEDURE [dbo].[insertCorreo] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Correo.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Correo varchar(50))
INSERT INTO @xmlTable SELECT Correo
FROM OPENXML(@hDoc, 'dataset/Correo')
WITH 
(
Correo [varchar](50) '@Correo'
);

DECLARE @Correo varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Correo FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Correo
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Correo WHERE Correo = @Correo) 
    BEGIN
        INSERT INTO dbo.Correo VALUES (@Correo)
    END
	
    FETCH cursorTabla INTO @Correo
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

