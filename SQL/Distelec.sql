use Elecciones;

GO
CREATE PROCEDURE insertCodelec @PathXML varchar(50)
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)

SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn

FROM OPENROWSET(BULK 'E:\Distelec.xml', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (CodigoProvincia varchar(50), CodigoCanton varchar(50), CodigoDistrito varchar(50), Provincia varchar(50), Canton varchar(50), Distrito varchar(50))
INSERT INTO @xmlTable SELECT CodigoProvincia, CodigoCanton, CodigoDistrito, Provincia, Canton, Distrito
FROM OPENXML(@hDoc, 'codelecs/Codelec')
WITH 
(
CodigoProvincia [varchar](50) '@CodigoProvincia',
CodigoCanton [varchar](50) '@CodigoCanton',
CodigoDistrito [varchar](50) '@CodigoDistrito',
Provincia [varchar](50) '@Provincia',
Canton [varchar](50) '@Canton',
Distrito [varchar](50) '@Distrito'
);

DECLARE @CodigoProvincia varchar(50), @CodigoCanton varchar(50), @CodigoDistrito varchar(50), @Provincia varchar(50), @Canton varchar(50), @Distrito varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT CodigoProvincia, CodigoCanton, CodigoDistrito, Provincia, Canton, Distrito FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @CodigoProvincia, @CodigoCanton, @CodigoDistrito, @Provincia, @Canton, @Distrito
WHILE(@@fetch_status=0)
BEGIN
    DECLARE @IDProvincia int;
    IF EXISTS (SELECT * FROM dbo.Provincias WHERE Codigo = @CodigoProvincia) 
    BEGIN
        SELECT @IDProvincia = IDProvincia FROM dbo.Provincia WHERE Codigo = @CodigoProvincia
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Provincia VALUES (@CodigoProvincia, @Provincia)
    END
    FETCH cursorTabla INTO @CodigoProvincia, @CodigoCanton, @CodigoDistrito, @Provincia, @Canton, @Distrito
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



--INSERT INTO dbo.Estudiante SELECT name, lastName, email, carnet, phone, password FROM @xmlTable;

--EXEC sp_xml_removedocument @hDoc

END
GO


