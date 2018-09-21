use Elecciones;
go
CREATE PROCEDURE verDistritos @IDCanton int
AS
BEGIN
	DECLARE @resultR int;
	BEGIN TRY
		DECLARE @result Table (IDDistrito int, Nombre varchar(50));

		INSERT INTO @result SELECT IDDistrito, Nombre
		FROM dbo.Distrito WHERE IDCanton = @IDCanton;

		SELECT * FROM @result;

		SET @resultR = 0;
		RETURN @resultR;
	END TRY
	BEGIN CATCH
		SET @resultR = -1;
		RETURN @resultR;
	END CATCH
END
go