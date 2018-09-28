use Padron;

GO
CREATE PROCEDURE insertXMLCodelec 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\Distelec.XML', SINGLE_BLOB) AS x)

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
	DECLARE @IDMAX int; 
    IF NOT EXISTS (SELECT * FROM dbo.Provincia WHERE CodigoProvincia = @CodigoProvincia) 
    BEGIN
		SELECT @IDMAX = COUNT(*) FROM dbo.Provincia
        INSERT INTO dbo.Provincia VALUES (@IDMAX+1, @Provincia, @CodigoProvincia)
    END
	SELECT @IDProvincia = IDProvincia FROM dbo.Provincia WHERE CodigoProvincia = @CodigoProvincia
    IF EXISTS (SELECT * FROM dbo.Canton WHERE CodigoCanton = @CodigoCanton AND IDProvincia = @IDProvincia)
    BEGIN
        SELECT @IDcanton = IDCanton FROM dbo.Canton WHERE CodigoCanton = @CodigoCanton AND IDProvincia = @IDProvincia
    END
    ELSE
    BEGIN
		SELECT @IDMAX = COUNT(*) FROM dbo.Canton
        INSERT INTO dbo.Canton VALUES (@IDMAX+1, @Canton,@IDProvincia, @CodigoCanton)
		SELECT @IDcanton = IDCanton FROM dbo.Canton WHERE CodigoCanton = @CodigoCanton
    END
	SELECT @IDMAX = COUNT(*) FROM dbo.Distrito
    INSERT INTO dbo.Distrito VALUES (@IDMAX,@Distrito, @IDCanton, @CodigoDistrito,@CodigoProvincia+@CodigoCanton+@CodigoDistrito)
    FETCH cursorTabla INTO @CodigoProvincia, @CodigoCanton, @CodigoDistrito, @Provincia, @Canton, @Distrito
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 
GO
