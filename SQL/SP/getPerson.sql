use Elecciones;
go
CREATE PROCEDURE getPerson @Cedula varchar(50)
AS
BEGIN
	DECLARE @result Table (Cedula varchar(50),Nombre varchar(50), Apellido1 varchar(50),  Apellido2 varchar(50), Sexo int, FechaCaducacion DateTime, CodigoJunta varchar(50), Provincia varchar(50), Canton varchar(50), Distrito varchar(50), IDDistrito int);

	DECLARE @IDDistrito int,  @Distrito varchar(50), @IDCanton int, @Canton varchar(50), @IDProvincia int, @Provincia varchar(50), @CodigoJunta varchar(50);
		
	SELECT @IDDistrito = IDDistrito FROM dbo.Ciudadano WHERE Cedula = @Cedula;
	SELECT @IDCanton = IDCanton, @Distrito = Nombre FROM dbo.Distrito WHERE IDDistrito = @IDDistrito;
	SELECT @IDProvincia = IDProvincia, @Canton = Nombre FROM dbo.Canton WHERE IDCanton = @IDCanton;
	SELECT @Provincia = Nombre FROM dbo.Provincia WHERE IDProvincia = @IDProvincia;
	SELECT @CodigoJunta = J.Codigo FROM dbo.Junta as J  INNER JOIN dbo.Ciudadano as C ON C.IDJunta = J.IDJunta WHERE C.Cedula = @Cedula;


	INSERT INTO @result SELECT Cedula, Nombre, Apellido1, Apellido2, Sexo, FechaCaducacion, @CodigoJunta, @Provincia, @Canton, @Distrito, @IDDistrito
	FROM dbo.Ciudadano as C WHERE C.Cedula = @Cedula 

	SELECT * FROM @result;

END
go