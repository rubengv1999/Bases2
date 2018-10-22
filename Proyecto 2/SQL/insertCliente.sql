
GO
CREATE PROCEDURE [dbo].[insertCliente] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Cliente.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50), Apellido varchar(50), Correo varchar(50), IDIdioma int, Telefono varchar(50))
INSERT INTO @xmlTable SELECT Nombre, Apellido, Correo, IDIdioma, Telefono
FROM OPENXML(@hDoc, 'dataset/Cliente')
WITH 
(
Nombre [varchar](50) '@Nombre',
Apellido [varchar](50) '@Apellido',
Correo [varchar](50) '@Correo',
IDIdioma [int] '@IDIdioma',
Telefono [varchar](50) '@Telefono'
);

DECLARE @Nombre varchar(50), @Apellido varchar(50), @Correo varchar(50), @IDIdioma int, @Telefono varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre, Apellido, Correo, IDIdioma, Telefono FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre, @Apellido, @Correo, @IDIdioma, @Telefono 
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Cliente WHERE Nombre = @Nombre AND Apellido = @Apellido) 
    BEGIN
        INSERT INTO dbo.Cliente VALUES (@Correo, @Nombre, @Apellido, @IDIdioma, @Telefono)
    END
	
    FETCH cursorTabla INTO @Nombre, @Apellido, @Correo, @IDIdioma, @Telefono 
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

