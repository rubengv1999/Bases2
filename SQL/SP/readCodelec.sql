use ProyectoBD2;
go
CREATE PROCEDURE readCodelec @Codelec
AS
BEGIN
	DECLARE @resultR int;
	BEGIN TRY
		DECLARE @result Table (Provincia varchar(50), Distrito varchar(50), Canton varchar(50));
		DECLARE @IDProvincia varchar(50) =  SUBSTRING (@Codelec,1,1);
		DECLARE @IDCanton varchar(50) =  SUBSTRING (@Codelec,2,3);
		DECLARE @IDDistrito varchar(50) =  SUBSTRING (@Codelec,4,3);

		DECLARE @Provincia varchar(50) = SELECT Nombre FROM dbo.Provincia WHERE IDProvincia = @IDProvincia;
		DECLARE @Canton varchar(50) = SELECT Nombre FROM dbo.Canton WHERE IDCanton = @IDCanton AND IDProvincia = @IDProvincia;
		DECLARE @Distrito varchar(50) = SELECT Nombre FROM dbo.Distrito WHERE IDCanton = @IDCanton AND IDProvincia = @IDProvincia AND IDDistrito = @IDDistrito;




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