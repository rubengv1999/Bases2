use Elecciones;

GO
CREATE PROCEDURE insertXMLPeople @ID varchar(50)
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
IF @ID = '0'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\SJ.XML', SINGLE_BLOB) AS x)
END
IF @ID = '1'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\AL.XML', SINGLE_BLOB) AS x)
END
IF @ID = '2'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CA.XML', SINGLE_BLOB) AS x)
END
IF @ID = '3'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\HE.XML', SINGLE_BLOB) AS x)
END
IF @ID = '4'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\GU.XML', SINGLE_BLOB) AS x)
END
IF @ID = '5'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\PU.XML', SINGLE_BLOB) AS x)
END
IF @ID = '6'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\LI.XML', SINGLE_BLOB) AS x)
END
IF @ID = '7'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CO.XML', SINGLE_BLOB) AS x)
END




EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Apellido1 varchar(50),Apellido2 varchar(50), Cedula varchar(50), Codelec varchar(50), FechaCaducidad DateTime, Nombre varchar(50), Sexo int)
INSERT INTO @xmlTable SELECT Apellido1, Apellido2, Cedula, Codelec, FechaCaducidad, Nombre, Sexo
FROM OPENXML(@hDoc, 'People/Person')
WITH 
(
Apellido1 [varchar](50) '@LastName1',
Apellido2 [varchar](50) '@LastName2',
Cedula [varchar](50) '@Doc',
Codelec [varchar](50) '@Codelec',
FechaCaducidad DateTime '@Date',
Nombre [varchar](50) '@Name',
Sexo int '@Sex'
);

INSERT INTO dbo.Ciudadano
SELECT Cedula, Nombre, Apellido1, Apellido2, Sexo, FechaCaducidad, 1,
(SELECT  IDDistrito FROM dbo.Distrito WHERE IDCanton = (SELECT  IDCanton FROM dbo.Canton WHERE IDProvincia = (SELECT  IDProvincia FROM dbo.Provincia WHERE CodigoProvincia = SUBSTRING (Codelec,1,1)) AND CodigoCanton = SUBSTRING (Codelec,2,2)) AND CodigoDistrito = SUBSTRING (Codelec,4,3))
FROM @xmlTable;
EXEC sp_xml_removedocument @hDoc

END
GO



