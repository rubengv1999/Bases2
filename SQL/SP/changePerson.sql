use Padron;
go
CREATE PROCEDURE changePerson @Cedula varchar(50),@Nombre varchar(50),@Apellido1 varchar(50),@Apellido2 varchar(50),@Sexo int,@FechaCaducacion DateTime,@CodigoJunta varchar(50),@IDDistrito int
AS
BEGIN
	DECLARE @IDJunta int;
	SELECT @IDJunta = MAX(IDJunta) FROM dbo.junta
	IF EXISTS (SELECT * FROM dbo.Junta WHERE Codigo = @CodigoJunta) 
    BEGIN
        SELECT @IDJunta = IDJunta FROM dbo.Junta WHERE Codigo = @CodigoJunta
    END
    ELSE
    BEGIN
        INSERT INTO dbo.Junta VALUES (@IDJunta+ 1, @CodigoJunta)
		SELECT @IDJunta = IDJunta FROM dbo.Junta WHERE Codigo = @CodigoJunta
    END
	Update dbo.Ciudadano
	SET Nombre = @Nombre, Apellido1 = @Apellido1, Apellido2 = @Apellido2, Sexo = @Sexo, FechaCaducacion= @FechaCaducacion, IDJunta = @IDJunta, IDDistrito = @IDDistrito WHERE Cedula = @Cedula
END
go