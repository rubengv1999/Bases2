use Padron;

GO
CREATE PROCEDURE insertXMLPeopleCanton @IDProvincia int,@IDCanton int
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
IF @IDProvincia = 1
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\SJ.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 2
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\AL.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 3
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CA.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 4
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\HE.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 5
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\GU.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 6
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\PU.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 7
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\LI.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 8
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CO.XML', SINGLE_BLOB) AS x)
END




EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
INSERT INTO dbo.Ciudadano SELECT Cedula, Nombre, Apellido1, Apellido2, Sexo, FechaCaducidad, 1, (SELECT IDDistrito FROM dbo.Distrito as D WHERE D.Codelec = Distelec)
FROM OPENXML(@hDoc, 'People/P')
WITH 
(
Apellido1 [varchar](50) '@LN1',
Apellido2 [varchar](50) '@LN2',
Cedula [varchar](50) '@C',
Distelec [varchar](50) '@D',
FechaCaducidad DateTime '@F',
Nombre [varchar](50) '@N',
Sexo int '@S'
)
WHERE SUBSTRING (Distelec,2,2) = (SELECT CodigoCanton FROM dbo.Canton WHERE IDCanton = @IDCanton AND IDProvincia =@IDProvincia)


EXEC sp_xml_removedocument @hDoc

END
GO



