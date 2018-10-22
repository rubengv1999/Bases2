use Padron;
go
CREATE PROCEDURE getProvincias
AS
BEGIN
	DECLARE @resultR int;
	BEGIN TRY
		DECLARE @result Table (IDProvincia int, Nombre varchar(50));

		INSERT INTO @result SELECT IDProvincia, Nombre
		FROM dbo.Provincia

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