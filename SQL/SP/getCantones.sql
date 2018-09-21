use Elecciones;
go
CREATE PROCEDURE getCantones @IDProvincia int
AS
BEGIN
	DECLARE @resultR int;
	BEGIN TRY
		DECLARE @result Table (IDCanton int, Nombre varchar(50));

		INSERT INTO @result SELECT IDCanton, Nombre
		FROM dbo.Canton WHERE IDProvincia = @IDProvincia;

		SELECT IDCanton, Nombre FROM @result;

		SET @resultR = 0;
		RETURN @resultR;
	END TRY
	BEGIN CATCH
		SET @resultR = -1;
		RETURN @resultR;
	END CATCH
END
go