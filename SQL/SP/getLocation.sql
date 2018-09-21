use Elecciones;
go
CREATE PROCEDURE getLocation @Cedula varchar (50)
AS
BEGIN
	DECLARE @resultR int;
	BEGIN TRY
		DECLARE @result Table (IDProvincia int, Provincia varchar(50), IDCanton int, Canton varchar(50),IDDistrito int, Distrito varchar(50));

		DECLARE @IDDistrito int,  @Distrito varchar(50), @IDCanton int, @Canton varchar(50), @IDProvincia int, @Provincia varchar(50);
		
		SELECT @IDDistrito = IDDistrito FROM dbo.Ciudadano WHERE Cedula = @Cedula;
		SELECT @IDCanton = IDCanton, @Distrito = Nombre FROM dbo.Distrito WHERE IDDistrito = @IDDistrito;
		SELECT @IDProvincia = IDProvincia, @Canton = Nombre FROM dbo.Canton WHERE IDCanton = @IDCanton;
		SELECT @Provincia = Nombre FROM dbo.Provincia WHERE IDProvincia = @IDProvincia;

		INSERT INTO @result VALUES(@IDProvincia, @Provincia, @IDCanton, @Canton, @IDDistrito, @Distrito);

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