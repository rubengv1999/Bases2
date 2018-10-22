use Padron;

GO
CREATE PROCEDURE [dbo].[insertXMLPeople] @XMLText varchar(MAX)
AS 
BEGIN
DECLARE @XMLInput XML;
SET @XMLInput = @XMLText
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML,@XMLInput))

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
    DECLARE @IDCanton int;
    IF NOT EXISTS (SELECT * FROM dbo.Provincia WHERE CodigoProvincia = @CodigoProvincia) 
    BEGIN
        INSERT INTO dbo.Provincia VALUES (@Provincia, @CodigoProvincia)
    END
	SELECT @IDProvincia = Id FROM dbo.Provincia WHERE CodigoProvincia = @CodigoProvincia
    IF NOT EXISTS (SELECT * FROM dbo.Canton WHERE CodigoCanton = @CodigoCanton AND Provincia_Id = @IDProvincia)
    BEGIN
        INSERT INTO dbo.Canton VALUES (@Canton,@IDProvincia, @CodigoCanton)
    END
	SELECT @IDcanton = Id FROM dbo.Canton  WHERE CodigoCanton = @CodigoCanton AND Provincia_Id = @IDProvincia
    INSERT INTO dbo.Distrito VALUES (@Distrito, @IDCanton, @CodigoDistrito)
    FETCH cursorTabla INTO @CodigoProvincia, @CodigoCanton, @CodigoDistrito, @Provincia, @Canton, @Distrito
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

