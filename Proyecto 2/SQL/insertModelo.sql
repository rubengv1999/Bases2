
GO
CREATE PROCEDURE [dbo].[insertModelo] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Modelo.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDMarca  int, Anno  int, IDPais  int, Precio  int)
INSERT INTO @xmlTable SELECT IDMarca, Anno, IDPais, Precio
FROM OPENXML(@hDoc, 'dataset/Modelo')
WITH 
(
IDMarca [int] '@IDMarca',
Anno [int] '@Anno',
IDPais [int] '@IDPais',
Precio [int] '@Precio'
);

DECLARE @IDMarca  int, @Anno  int, @IDPais  int, @Precio  int
DECLARE cursorTabla cursor GLOBAL for SELECT IDMarca , Anno , IDPais , Precio  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDMarca , @Anno, @IDPais, @Precio 
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Modelo WHERE IDPais = @IDPais AND IDMarca = @IDMarca) 
    BEGIN
        INSERT INTO dbo.Modelo VALUES (@IDMarca, @Anno, @IDPais, @Precio)
    END
    FETCH cursorTabla INTO @IDMarca , @Anno, @IDPais, @Precio 
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

