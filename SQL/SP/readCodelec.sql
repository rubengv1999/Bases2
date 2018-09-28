use Padron;
go
CREATE PROCEDURE readCodelec @Codelec varchar(50)
AS
BEGIN
	DECLARE @CodigoProvincia varchar(50) =  SUBSTRING (@Codelec,1,1);
	DECLARE @CodigoCanton varchar(50) =  SUBSTRING (@Codelec,2,2);
	DECLARE @CodigoDistrito varchar(50) =  SUBSTRING (@Codelec,4,3);

	DECLARE @IDProvincia int, @IDCanton int, @IDDistrito int;
	SELECT  @IDProvincia = IDProvincia FROM dbo.Provincia WHERE CodigoProvincia = @CodigoProvincia;
	SELECT  @IDCanton = IDCanton FROM dbo.Canton WHERE IDProvincia = @IDProvincia AND CodigoCanton = @CodigoCanton;
	SELECT  @IDDistrito = IDDistrito FROM dbo.Distrito WHERE IDCanton = @IDCanton AND CodigoDistrito = @CodigoDistrito;

	return @IDDistrito

END
go