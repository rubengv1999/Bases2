use ProyectoBD2;
go
CREATE PROCEDURE writeCodelec @IDProvincia int, @IDCanton int,  @IDDistrito int
AS
BEGIN
	DECLARE @resultR int;
	BEGIN TRY
		DECLARE @result Table (Codelec varchar(50));

		INSERT INTO @result SELECT (@Provincia + @Canton + @Distrito )

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