
GO
CREATE PROCEDURE [dbo].[insertCarro] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Carro.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDModelo  int, IDColor  int, IDMarca int,IDAnno int,  IDPais int, Precio money)
INSERT INTO @xmlTable SELECT IDModelo, IDColor,IDMarca, IDAnno,  IDPais, Precio
FROM OPENXML(@hDoc, 'dataset/Carro')
WITH 
(
IDModelo [int] '@IDModelo',
IDColor [int] '@IDColor',
IDAnno [int] '@IDAnno',
IDMarca [int] '@IDMarca',
IDPais [int] '@IDPais', 
Precio [money] '@Precio'
);

DECLARE @IDModelo  int, @IDColor int,  @IDMarca int,@IDAnno int, @IDPais int, @Precio money
DECLARE cursorTabla cursor GLOBAL for SELECT IDModelo, IDColor,  IDMarca,IDAnno, IDPais, Precio  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDModelo , @IDColor, @IDMarca ,@IDAnno, @IDPais, @Precio
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Carro WHERE IDModelo = @IDModelo AND IDColor = @IDColor AND IDAnno = @IDAnno AND IDMarca = @IDMarca AND IDPais = @IDPais) 
    BEGIN
        INSERT INTO dbo.Carro VALUES (@IDModelo, @IDColor, @IDMarca , @IDAnno, @IDPais, @Precio)
    END
    FETCH cursorTabla INTO @IDModelo , @IDColor, @IDMarca ,@IDAnno, @IDPais, @Precio
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

