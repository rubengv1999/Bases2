use Elecciones;

GO
CREATE PROCEDURE insertXML @PathXML varchar(50)
AS 
BEGIN
--'E:\Distelec.xml'
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)

SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn

FROM OPENROWSET(BULK 'C:\GU.xml', SINGLE_BLOB) AS x)

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


