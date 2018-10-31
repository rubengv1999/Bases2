USE [master]
GO
/****** Object:  Database [Plan]    Script Date: 30/10/2018 16:47:43 ******/
CREATE DATABASE [Plan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Plan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLRUBEN\MSSQL\DATA\Plan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Plan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLRUBEN\MSSQL\DATA\Plan_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Plan] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Plan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Plan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Plan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Plan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Plan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Plan] SET ARITHABORT OFF 
GO
ALTER DATABASE [Plan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Plan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Plan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Plan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Plan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Plan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Plan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Plan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Plan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Plan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Plan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Plan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Plan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Plan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Plan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Plan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Plan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Plan] SET RECOVERY FULL 
GO
ALTER DATABASE [Plan] SET  MULTI_USER 
GO
ALTER DATABASE [Plan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Plan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Plan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Plan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Plan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Plan', N'ON'
GO
ALTER DATABASE [Plan] SET QUERY_STORE = OFF
GO
USE [Plan]
GO
/****** Object:  Table [dbo].[Carro]    Script Date: 30/10/2018 16:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carro](
	[IDCarro] [int] IDENTITY(1,1) NOT NULL,
	[IDModelo] [int] NOT NULL,
	[IDColor] [int] NOT NULL,
 CONSTRAINT [PK_Carro] PRIMARY KEY CLUSTERED 
(
	[IDCarro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 30/10/2018 16:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[IDIdioma] [int] NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 30/10/2018 16:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[IDColor] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[IDColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 30/10/2018 16:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IDCliente] [int] NOT NULL,
	[IDCarro] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[IDFactura] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 30/10/2018 16:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[IDIdioma] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[IDIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 30/10/2018 16:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IDMarca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IDMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 30/10/2018 16:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[IDModelo] [int] IDENTITY(1,1) NOT NULL,
	[IDMarca] [int] NOT NULL,
	[Anno] [int] NOT NULL,
	[IDPais] [int] NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[IDModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IDPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IDPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Color] FOREIGN KEY([IDColor])
REFERENCES [dbo].[Color] ([IDColor])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Color]
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Modelo] FOREIGN KEY([IDModelo])
REFERENCES [dbo].[Modelo] ([IDModelo])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Modelo]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Idioma] FOREIGN KEY([IDIdioma])
REFERENCES [dbo].[Idioma] ([IDIdioma])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Idioma]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Carro] FOREIGN KEY([IDCarro])
REFERENCES [dbo].[Carro] ([IDCarro])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Carro]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Modelo_Marca] FOREIGN KEY([IDMarca])
REFERENCES [dbo].[Marca] ([IDMarca])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [FK_Modelo_Marca]
GO
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Modelo_Pais] FOREIGN KEY([IDPais])
REFERENCES [dbo].[Pais] ([IDPais])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [FK_Modelo_Pais]
GO
/****** Object:  StoredProcedure [dbo].[insertCarro]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertCarro] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Carro.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDModelo  int, IDColor  int)
INSERT INTO @xmlTable SELECT IDModelo, IDColor
FROM OPENXML(@hDoc, 'dataset/Carro')
WITH 
(
IDModelo [int] '@IDModelo',
IDColor [int] '@IDColor'
);

DECLARE @IDModelo  int, @IDColor int
DECLARE cursorTabla cursor GLOBAL for SELECT IDModelo, IDColor  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDModelo , @IDColor
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Carro WHERE IDModelo = @IDModelo AND IDColor = @IDColor) 
    BEGIN
        INSERT INTO dbo.Carro VALUES (@IDModelo, @IDColor)
    END
    FETCH cursorTabla INTO @IDModelo , @IDColor
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertCliente]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertCliente] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Cliente.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50), Apellido varchar(50), Correo varchar(50), IDIdioma int, Telefono varchar(50))
INSERT INTO @xmlTable SELECT Nombre, Apellido, Correo, IDIdioma, Telefono
FROM OPENXML(@hDoc, 'dataset/Cliente')
WITH 
(
Nombre [varchar](50) '@Nombre',
Apellido [varchar](50) '@Apellido',
Correo [varchar](50) '@Correo',
IDIdioma [int] '@IDIdioma',
Telefono [varchar](50) '@Telefono'
);

DECLARE @Nombre varchar(50), @Apellido varchar(50), @Correo varchar(50), @IDIdioma int, @Telefono varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre, Apellido, Correo, IDIdioma, Telefono FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre, @Apellido, @Correo, @IDIdioma, @Telefono 
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Cliente WHERE Nombre = @Nombre AND Apellido = @Apellido) 
    BEGIN
        INSERT INTO dbo.Cliente VALUES (@Correo, @Nombre, @Apellido, @IDIdioma, @Telefono)
    END
	
    FETCH cursorTabla INTO @Nombre, @Apellido, @Correo, @IDIdioma, @Telefono 
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertColor]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertColor] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Color.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Color')
WITH 
(
Nombre [varchar](50) '@Nombre'
);

DECLARE @Nombre varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Color WHERE Color = @Nombre) 
    BEGIN
        INSERT INTO dbo.Color VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertFactura]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertFactura] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Factura.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDCliente int, IDCarro int, Fecha DateTime, Cantidad int, Total money)
INSERT INTO @xmlTable SELECT IDCliente, IDCarro, Fecha, Cantidad, Total 
FROM OPENXML(@hDoc, 'dataset/Factura')
WITH 
(
IDCliente [int] '@IDCliente',
IDCarro [int] '@IDCarro',
Fecha [DateTime] '@Fecha',
Cantidad [int] '@Cantidad',
Total [money] '@Total'
);

DECLARE @IDCliente int, @IDCarro int, @Fecha DateTime, @Cantidad int, @Total money
DECLARE cursorTabla cursor GLOBAL for SELECT IDCliente, IDCarro, Fecha, Cantidad, Total  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDCliente, @IDCarro, @Fecha, @Cantidad, @Total 
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Factura WHERE IDCarro = @IDCarro AND IDCliente = @IDCliente) 
    BEGIN
        INSERT INTO dbo.Factura VALUES (@IDCliente, @IDCarro, @Fecha, @Cantidad, @Total)
    END
	
    FETCH cursorTabla INTO @IDCliente, @IDCarro, @Fecha, @Cantidad, @Total 
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertIdioma]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertIdioma] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Idioma.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Idioma')
WITH 
(
Nombre [varchar](50) '@Nombre'
);

DECLARE @Nombre varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Idioma WHERE Nombre = @Nombre) 
    BEGIN
        INSERT INTO dbo.Idioma VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertMarca]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertMarca] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Marca.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Marca')
WITH 
(
Nombre [varchar](50) '@Nombre'
);

DECLARE @Nombre varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Marca WHERE Nombre = @Nombre) 
    BEGIN
        INSERT INTO dbo.Marca VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertModelo]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertModelo] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Modelo.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (IDMarca  int, Anno  int, IDPais  int, Precio  int)
INSERT INTO @xmlTable SELECT IDMarca, Anno, IDPais, Precio
FROM OPENXML(@hDoc, 'dataset/Modelo')
WITH 
(
IDMarca [int] '@IDMarca',
Anno [int] '@Anno',
IDPais [int] '@IDPais',
Precio [int] '@Precio'
);

DECLARE @IDMarca  int, @Anno  int, @IDPais  int, @Precio  int
DECLARE cursorTabla cursor GLOBAL for SELECT IDMarca , Anno , IDPais , Precio  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDMarca , @Anno, @IDPais, @Precio 
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Modelo WHERE IDPais = @IDPais AND IDMarca = @IDMarca) 
    BEGIN
        INSERT INTO dbo.Modelo VALUES (@IDMarca, @Anno, @IDPais, @Precio)
    END
    FETCH cursorTabla INTO @IDMarca , @Anno, @IDPais, @Precio 
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertPais]    Script Date: 30/10/2018 16:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertPais] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Pais.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Pais')
WITH 
(
Nombre [varchar](50) '@Nombre'
);

DECLARE @Nombre varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Pais WHERE Nombre = @Nombre) 
    BEGIN
        INSERT INTO dbo.Pais VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
USE [master]
GO
ALTER DATABASE [Plan] SET  READ_WRITE 
GO
