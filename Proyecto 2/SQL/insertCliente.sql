
GO
CREATE PROCEDURE [dbo].[insertCliente] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Cliente.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDNombre varchar(50), IDApellido int, IDCorreo int, IDIdioma int, IDTelefono int, IDTitulo int)
INSERT INTO @xmlTable SELECT IDNombre, IDApellido, IDCorreo, IDIdioma, IDTelefono, IDTitulo
FROM OPENXML(@hDoc, 'dataset/Cliente')
WITH 
(
IDNombre [int] '@IDNombre',
IDApellido [int] '@IDApellido',
IDCorreo [int] '@IDCorreo',
IDIdioma [int] '@IDIdioma',
IDTelefono [int] '@IDTelefono',
IDTitulo [int] '@IDTitulo'
);

DECLARE @IDNombre int, @IDApellido int, @IDCorreo int, @IDIdioma int, @IDTelefono int, @IDTitulo int
DECLARE cursorTabla cursor GLOBAL for SELECT IDNombre, IDApellido, IDCorreo, IDIdioma, IDTelefono, IDTitulo FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDNombre, @IDApellido, @IDCorreo, @IDIdioma, @IDTelefono, @IDTitulo
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Cliente WHERE IDNombre = @IDNombre AND IDApellido = @IDApellido AND IDCorreo = @IDCorreo AND IDTelefono = @IDTelefono AND IDTitulo = @IDTitulo) 
    BEGIN
        INSERT INTO dbo.Cliente VALUES (@IDCorreo, @IDNombre, @IDApellido, @IDIdioma, @IDTelefono, @IDTitulo)
    END
	
    FETCH cursorTabla INTO @IDNombre, @IDApellido, @IDCorreo, @IDIdioma, @IDTelefono , @IDTitulo
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

