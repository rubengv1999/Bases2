USE [master]
GO
/****** Object:  Database [Padron]    Script Date: 29/09/2018 0:38:52 ******/
CREATE DATABASE [Padron]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Padron', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLRUBEN\MSSQL\DATA\Padron.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Padron_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLRUBEN\MSSQL\DATA\Padron_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Padron] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Padron].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Padron] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Padron] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Padron] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Padron] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Padron] SET ARITHABORT OFF 
GO
ALTER DATABASE [Padron] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Padron] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Padron] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Padron] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Padron] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Padron] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Padron] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Padron] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Padron] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Padron] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Padron] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Padron] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Padron] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Padron] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Padron] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Padron] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Padron] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Padron] SET RECOVERY FULL 
GO
ALTER DATABASE [Padron] SET  MULTI_USER 
GO
ALTER DATABASE [Padron] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Padron] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Padron] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Padron] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Padron] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Padron', N'ON'
GO
ALTER DATABASE [Padron] SET QUERY_STORE = OFF
GO
USE [Padron]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Padron]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 29/09/2018 0:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[IDCanton] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IDProvincia] [int] NOT NULL,
	[CodigoCanton] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[IDCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudadano]    Script Date: 29/09/2018 0:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudadano](
	[Cedula] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NOT NULL,
	[Sexo] [int] NOT NULL,
	[FechaCaducacion] [date] NOT NULL,
	[IDJunta] [int] NOT NULL,
	[IDDistrito] [int] NOT NULL,
 CONSTRAINT [PK_Ciudadano] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 29/09/2018 0:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[IDDistrito] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IDCanton] [int] NOT NULL,
	[CodigoDistrito] [varchar](50) NOT NULL,
	[Codelec] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED 
(
	[IDDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Junta]    Script Date: 29/09/2018 0:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Junta](
	[IDJunta] [int] NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Junta] PRIMARY KEY CLUSTERED 
(
	[IDJunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 29/09/2018 0:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[IDProvincia] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CodigoProvincia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IDProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [FK_Canton_Provincia] FOREIGN KEY([IDProvincia])
REFERENCES [dbo].[Provincia] ([IDProvincia])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [FK_Canton_Provincia]
GO
ALTER TABLE [dbo].[Ciudadano]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadano_Distrito] FOREIGN KEY([IDDistrito])
REFERENCES [dbo].[Distrito] ([IDDistrito])
GO
ALTER TABLE [dbo].[Ciudadano] CHECK CONSTRAINT [FK_Ciudadano_Distrito]
GO
ALTER TABLE [dbo].[Ciudadano]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadano_Junta] FOREIGN KEY([IDJunta])
REFERENCES [dbo].[Junta] ([IDJunta])
GO
ALTER TABLE [dbo].[Ciudadano] CHECK CONSTRAINT [FK_Ciudadano_Junta]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [FK_Distrito_Canton] FOREIGN KEY([IDCanton])
REFERENCES [dbo].[Canton] ([IDCanton])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [FK_Distrito_Canton]
GO
/****** Object:  StoredProcedure [dbo].[changePerson]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changePerson] @Cedula varchar(50),@Nombre varchar(50),@Apellido1 varchar(50),@Apellido2 varchar(50),@Sexo int,@FechaCaducacion DateTime,@CodigoJunta varchar(50),@IDDistrito int
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
GO
/****** Object:  StoredProcedure [dbo].[getCantones]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCantones] @IDProvincia int
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
GO
/****** Object:  StoredProcedure [dbo].[getDistritos]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDistritos] @IDCanton int
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
GO
/****** Object:  StoredProcedure [dbo].[getLocation]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLocation] @Cedula varchar (50)
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
GO
/****** Object:  StoredProcedure [dbo].[getPerson]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPerson] @Cedula varchar(50)
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
GO
/****** Object:  StoredProcedure [dbo].[getProvincias]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getProvincias]
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
GO
/****** Object:  StoredProcedure [dbo].[insertXMLCodelec]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertXMLCodelec] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\Distelec.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (CodigoProvincia varchar(50), CodigoCanton varchar(50), CodigoDistrito varchar(50), Provincia varchar(50), Canton varchar(50), Distrito varchar(50))
INSERT INTO @xmlTable SELECT CodigoProvincia, CodigoCanton, CodigoDistrito, Provincia, Canton, Distrito
FROM OPENXML(@hDoc, 'codelecs/Codelec')
WITH 
(
CodigoProvincia [varchar](50) '@CodigoProvincia',
CodigoCanton [varchar](50) '@CodigoCanton',
CodigoDistrito [varchar](50) '@CodigoDistrito',
Provincia [varchar](50) '@Provincia',
Canton [varchar](50) '@Canton',
Distrito [varchar](50) '@Distrito'
);

DECLARE @CodigoProvincia varchar(50), @CodigoCanton varchar(50), @CodigoDistrito varchar(50), @Provincia varchar(50), @Canton varchar(50), @Distrito varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT CodigoProvincia, CodigoCanton, CodigoDistrito, Provincia, Canton, Distrito FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @CodigoProvincia, @CodigoCanton, @CodigoDistrito, @Provincia, @Canton, @Distrito
WHILE(@@fetch_status=0)
BEGIN
    DECLARE @IDProvincia int;
    DECLARE @IDCanton int;
	DECLARE @IDMAX int; 
    IF NOT EXISTS (SELECT * FROM dbo.Provincia WHERE CodigoProvincia = @CodigoProvincia) 
    BEGIN
		SELECT @IDMAX = COUNT(*) FROM dbo.Provincia
        INSERT INTO dbo.Provincia VALUES (@IDMAX+1, @Provincia, @CodigoProvincia)
    END
	SELECT @IDProvincia = IDProvincia FROM dbo.Provincia WHERE CodigoProvincia = @CodigoProvincia
    IF EXISTS (SELECT * FROM dbo.Canton WHERE CodigoCanton = @CodigoCanton AND IDProvincia = @IDProvincia)
    BEGIN
        SELECT @IDcanton = IDCanton FROM dbo.Canton WHERE CodigoCanton = @CodigoCanton AND IDProvincia = @IDProvincia
    END
    ELSE
    BEGIN
		SELECT @IDMAX = COUNT(*) FROM dbo.Canton
        INSERT INTO dbo.Canton VALUES (@IDMAX+1, @Canton,@IDProvincia, @CodigoCanton)
		SELECT @IDcanton = IDCanton FROM dbo.Canton WHERE CodigoCanton = @CodigoCanton
    END
	SELECT @IDMAX = COUNT(*) FROM dbo.Distrito
    INSERT INTO dbo.Distrito VALUES (@IDMAX,@Distrito, @IDCanton, @CodigoDistrito,@CodigoProvincia+@CodigoCanton+@CodigoDistrito)
    FETCH cursorTabla INTO @CodigoProvincia, @CodigoCanton, @CodigoDistrito, @Provincia, @Canton, @Distrito
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 
GO
/****** Object:  StoredProcedure [dbo].[insertXMLPeople]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertXMLPeople] @ID varchar(50)
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
IF @ID = '0'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\SJ.XML', SINGLE_BLOB) AS x)
END
IF @ID = '1'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\AL.XML', SINGLE_BLOB) AS x)
END
IF @ID = '2'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CA.XML', SINGLE_BLOB) AS x)
END
IF @ID = '3'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\HE.XML', SINGLE_BLOB) AS x)
END
IF @ID = '4'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\GU.XML', SINGLE_BLOB) AS x)
END
IF @ID = '5'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\PU.XML', SINGLE_BLOB) AS x)
END
IF @ID = '6'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\LI.XML', SINGLE_BLOB) AS x)
END
IF @ID = '7'
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CO.XML', SINGLE_BLOB) AS x)
END


EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
INSERT INTO dbo.Ciudadano SELECT Cedula,Nombre, Apellido1, Apellido2, Sexo, FechaCaducidad, 1, (SELECT IDDistrito FROM dbo.Distrito as D WHERE D.Codelec = Distelec)
FROM OPENXML(@hDoc, 'People/P')
WITH 
(
Apellido1 [varchar](50) '@LN1',
Apellido2 [varchar](50) '@LN2',
Cedula [varchar](50) '@C',
Distelec [varchar](50) '@D',
FechaCaducidad DateTime '@F',
Nombre [varchar](50) '@N',
Sexo int '@S'
);


EXEC sp_xml_removedocument @hDoc

END
GO
/****** Object:  StoredProcedure [dbo].[insertXMLPeopleCanton]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertXMLPeopleCanton] @IDProvincia int,@IDCanton int
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
IF @IDProvincia = 1
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\SJ.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 2
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\AL.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 3
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CA.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 4
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\HE.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 5
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\GU.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 6
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\PU.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 7
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\LI.XML', SINGLE_BLOB) AS x)
END
IF @IDProvincia = 8
BEGIN
	SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\Desktop\Provincias\CO.XML', SINGLE_BLOB) AS x)
END




EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
INSERT INTO dbo.Ciudadano SELECT Cedula, Nombre, Apellido1, Apellido2, Sexo, FechaCaducidad, 1, (SELECT IDDistrito FROM dbo.Distrito as D WHERE D.Codelec = Distelec)
FROM OPENXML(@hDoc, 'People/P')
WITH 
(
Apellido1 [varchar](50) '@LN1',
Apellido2 [varchar](50) '@LN2',
Cedula [varchar](50) '@C',
Distelec [varchar](50) '@D',
FechaCaducidad DateTime '@F',
Nombre [varchar](50) '@N',
Sexo int '@S'
)
WHERE SUBSTRING (Distelec,2,2) = (SELECT CodigoCanton FROM dbo.Canton WHERE IDCanton = @IDCanton AND IDProvincia =@IDProvincia)


EXEC sp_xml_removedocument @hDoc

END
GO
/****** Object:  StoredProcedure [dbo].[readCodelec]    Script Date: 29/09/2018 0:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[readCodelec] @Codelec varchar(50)
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
GO
USE [master]
GO
ALTER DATABASE [Padron] SET  READ_WRITE 
GO
