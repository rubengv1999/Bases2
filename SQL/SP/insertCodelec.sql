use ProyectoBD2;
go
CREATE PROCEDURE insertCodelec @Codelec varchar(50)
AS
BEGIN
	DECLARE @resultR int;
	BEGIN TRY
		DECLARE @result Table (CodigoProvincia varchar(50), CodigoDistrito varchar(50), CodigoCanton varchar(50));
		DECLARE @Provincia varchar(50) =  SUBSTRING (@Codelec,1,1);
		DECLARE @Canton varchar(50) =  SUBSTRING (@Codelec,2,3);
		DECLARE @Distrito varchar(50) =  SUBSTRING (@Codelec,4,3);

		INSERT INTO @result SELECT @Provincia, @Canton, @Distrito

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