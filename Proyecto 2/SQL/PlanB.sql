USE [master]
GO
/****** Object:  Database [PlanB]    Script Date: 06/11/2018 21:36:11 ******/
CREATE DATABASE [PlanB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlanB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PlanB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PlanB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PlanB_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PlanB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlanB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlanB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlanB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlanB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlanB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlanB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlanB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PlanB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlanB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlanB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlanB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlanB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlanB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlanB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlanB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlanB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PlanB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlanB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlanB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlanB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlanB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlanB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlanB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlanB] SET RECOVERY FULL 
GO
ALTER DATABASE [PlanB] SET  MULTI_USER 
GO
ALTER DATABASE [PlanB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlanB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlanB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlanB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlanB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PlanB', N'ON'
GO
ALTER DATABASE [PlanB] SET QUERY_STORE = OFF
GO
USE [PlanB]
GO
/****** Object:  Table [dbo].[Anno]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anno](
	[IDAnno] [int] IDENTITY(1,1) NOT NULL,
	[Anno] [int] NOT NULL,
 CONSTRAINT [PK_Anno] PRIMARY KEY CLUSTERED 
(
	[IDAnno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apellido]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apellido](
	[IDApellido] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Apellido] PRIMARY KEY CLUSTERED 
(
	[IDApellido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carro]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carro](
	[IDCarro] [int] IDENTITY(1,1) NOT NULL,
	[IDModelo] [int] NOT NULL,
	[IDColor] [int] NOT NULL,
	[IDMarca] [int] NOT NULL,
	[IDAnno] [int] NOT NULL,
	[IDPais] [int] NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Carro] PRIMARY KEY CLUSTERED 
(
	[IDCarro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[IDCorreo] [int] NOT NULL,
	[IDNombre] [int] NOT NULL,
	[IDApellido] [int] NOT NULL,
	[IDIdioma] [int] NOT NULL,
	[IDTelefono] [int] NOT NULL,
	[IDTitulo] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 06/11/2018 21:36:11 ******/
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
/****** Object:  Table [dbo].[Correo]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correo](
	[IDCorreo] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Correo] PRIMARY KEY CLUSTERED 
(
	[IDCorreo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 06/11/2018 21:36:11 ******/
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
/****** Object:  Table [dbo].[Idioma]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[IDIdioma] [int] IDENTITY(1,1) NOT NULL,
	[Idioma] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[IDIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IDMarca] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IDMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 06/11/2018 21:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[IDModelo] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[IDModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nombre]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nombre](
	[IDNombre] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Nombre] PRIMARY KEY CLUSTERED 
(
	[IDNombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IDPais] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IDPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[IDTelefono] [int] IDENTITY(1,1) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[IDTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titulo]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titulo](
	[IDTitulo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Titulo] PRIMARY KEY CLUSTERED 
(
	[IDTitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Anno] FOREIGN KEY([IDAnno])
REFERENCES [dbo].[Anno] ([IDAnno])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Anno]
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Color] FOREIGN KEY([IDColor])
REFERENCES [dbo].[Color] ([IDColor])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Color]
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Marca] FOREIGN KEY([IDMarca])
REFERENCES [dbo].[Marca] ([IDMarca])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Marca]
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Modelo] FOREIGN KEY([IDModelo])
REFERENCES [dbo].[Modelo] ([IDModelo])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Modelo]
GO
ALTER TABLE [dbo].[Carro]  WITH CHECK ADD  CONSTRAINT [FK_Carro_Pais] FOREIGN KEY([IDPais])
REFERENCES [dbo].[Pais] ([IDPais])
GO
ALTER TABLE [dbo].[Carro] CHECK CONSTRAINT [FK_Carro_Pais]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Apellido] FOREIGN KEY([IDApellido])
REFERENCES [dbo].[Apellido] ([IDApellido])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Apellido]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Correo] FOREIGN KEY([IDCorreo])
REFERENCES [dbo].[Correo] ([IDCorreo])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Correo]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Idioma] FOREIGN KEY([IDIdioma])
REFERENCES [dbo].[Idioma] ([IDIdioma])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Idioma]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Nombre] FOREIGN KEY([IDNombre])
REFERENCES [dbo].[Nombre] ([IDNombre])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Nombre]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Telefono] FOREIGN KEY([IDTelefono])
REFERENCES [dbo].[Telefono] ([IDTelefono])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Telefono]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Titulo] FOREIGN KEY([IDTitulo])
REFERENCES [dbo].[Titulo] ([IDTitulo])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Titulo]
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
/****** Object:  StoredProcedure [dbo].[insertAnno]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertAnno] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Anno.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Anno int)
INSERT INTO @xmlTable SELECT Anno
FROM OPENXML(@hDoc, 'dataset/Anno')
WITH 
(
Anno int '@Anno'
);

DECLARE @Anno int
DECLARE cursorTabla cursor GLOBAL for SELECT Anno FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Anno
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Anno WHERE Anno = @Anno) 
    BEGIN
        INSERT INTO dbo.Anno VALUES (@Anno)
    END
	
    FETCH cursorTabla INTO @Anno
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertApellido]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertApellido] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Apellido.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Apellido varchar(50))
INSERT INTO @xmlTable SELECT Apellido
FROM OPENXML(@hDoc, 'dataset/Apellido')
WITH 
(
Apellido [varchar](50) '@Apellido'
);

DECLARE @Apellido varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Apellido FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Apellido
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Apellido WHERE Apellido = @Apellido) 
    BEGIN
        INSERT INTO dbo.Apellido VALUES (@Apellido)
    END
	
    FETCH cursorTabla INTO @Apellido
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertCarro]    Script Date: 06/11/2018 21:36:12 ******/
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
DECLARE @xmlTable Table (IDModelo  int, IDColor  int, IDMarca int,IDAnno int,  IDPais int, Precio money)
INSERT INTO @xmlTable SELECT IDModelo, IDColor,IDMarca, IDAnno,  IDPais, Precio
FROM OPENXML(@hDoc, 'dataset/Carro')
WITH 
(
IDModelo [int] '@IDModelo',
IDColor [int] '@IDColor',
IDAnno [int] '@IDAnno',
IDMarca [int] '@IDMarca',
IDPais [int] '@IDPais', 
Precio [money] '@Precio'
);

DECLARE @IDModelo  int, @IDColor int,  @IDMarca int,@IDAnno int, @IDPais int, @Precio money
DECLARE cursorTabla cursor GLOBAL for SELECT IDModelo, IDColor,  IDMarca,IDAnno, IDPais, Precio  FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDModelo , @IDColor, @IDMarca ,@IDAnno, @IDPais, @Precio
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Carro WHERE IDModelo = @IDModelo AND IDColor = @IDColor AND IDAnno = @IDAnno AND IDMarca = @IDMarca AND IDPais = @IDPais) 
    BEGIN
        INSERT INTO dbo.Carro VALUES (@IDModelo, @IDColor, @IDMarca , @IDAnno, @IDPais, @Precio)
    END
    FETCH cursorTabla INTO @IDModelo , @IDColor, @IDMarca ,@IDAnno, @IDPais, @Precio
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertCliente]    Script Date: 06/11/2018 21:36:12 ******/
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
DECLARE @xmlTable Table (IDNombre varchar(50), IDApellido int, IDCorreo int, IDIdioma int, IDTelefono int, IDTitulo int)
INSERT INTO @xmlTable SELECT IDNombre, IDApellido, IDCorreo, IDIdioma, IDTelefono, IDTitulo
FROM OPENXML(@hDoc, 'dataset/Cliente')
WITH 
(
IDNombre [int] '@IDNombre',
IDApellido [int] '@IDApellido',
IDCorreo [int] '@IDCorreo',
IDIdioma [int] '@IDIdioma',
IDTelefono [int] '@IDTelefono',
IDTitulo [int] '@IDTitulo'
);

DECLARE @IDNombre int, @IDApellido int, @IDCorreo int, @IDIdioma int, @IDTelefono int, @IDTitulo int
DECLARE cursorTabla cursor GLOBAL for SELECT IDNombre, IDApellido, IDCorreo, IDIdioma, IDTelefono, IDTitulo FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @IDNombre, @IDApellido, @IDCorreo, @IDIdioma, @IDTelefono, @IDTitulo
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Cliente WHERE IDNombre = @IDNombre AND IDApellido = @IDApellido AND IDCorreo = @IDCorreo AND IDTelefono = @IDTelefono AND IDTitulo = @IDTitulo) 
    BEGIN
        INSERT INTO dbo.Cliente VALUES (@IDCorreo, @IDNombre, @IDApellido, @IDIdioma, @IDTelefono, @IDTitulo)
    END
	
    FETCH cursorTabla INTO @IDNombre, @IDApellido, @IDCorreo, @IDIdioma, @IDTelefono , @IDTitulo
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertColor]    Script Date: 06/11/2018 21:36:12 ******/
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
/****** Object:  StoredProcedure [dbo].[insertCorreo]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertCorreo] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Correo.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Correo varchar(50))
INSERT INTO @xmlTable SELECT Correo
FROM OPENXML(@hDoc, 'dataset/Correo')
WITH 
(
Correo [varchar](50) '@Correo'
);

DECLARE @Correo varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Correo FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Correo
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Correo WHERE Correo = @Correo) 
    BEGIN
        INSERT INTO dbo.Correo VALUES (@Correo)
    END
	
    FETCH cursorTabla INTO @Correo
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertFactura]    Script Date: 06/11/2018 21:36:12 ******/
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
/****** Object:  StoredProcedure [dbo].[insertIdioma]    Script Date: 06/11/2018 21:36:12 ******/
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
    IF NOT EXISTS (SELECT * FROM dbo.Idioma WHERE Idioma = @Nombre) 
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
/****** Object:  StoredProcedure [dbo].[insertMarca]    Script Date: 06/11/2018 21:36:12 ******/
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
    IF NOT EXISTS (SELECT * FROM dbo.Marca WHERE Marca = @Nombre) 
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
/****** Object:  StoredProcedure [dbo].[insertModelo]    Script Date: 06/11/2018 21:36:12 ******/
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
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Modelo')
WITH 
(
Nombre [varchar](50) '@Modelo'
);

DECLARE @Nombre varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Modelo WHERE Modelo = @Nombre) 
    BEGIN
        INSERT INTO dbo.Modelo VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertNombre]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertNombre] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Nombre.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Nombre')
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
    IF NOT EXISTS (SELECT * FROM dbo.Nombre WHERE Nombre = @Nombre) 
    BEGIN
        INSERT INTO dbo.Nombre VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertPais]    Script Date: 06/11/2018 21:36:12 ******/
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
    IF NOT EXISTS (SELECT * FROM dbo.Pais WHERE Pais = @Nombre) 
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
/****** Object:  StoredProcedure [dbo].[insertTelefono]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertTelefono] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Telefono.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Telefono varchar(50))
INSERT INTO @xmlTable SELECT Telefono
FROM OPENXML(@hDoc, 'dataset/Telefono')
WITH 
(
Telefono [varchar](50) '@Telefono'
);

DECLARE @Telefono varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Telefono FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Telefono
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Telefono WHERE Telefono = @Telefono) 
    BEGIN
        INSERT INTO dbo.Telefono VALUES (@Telefono)
    END
	
    FETCH cursorTabla INTO @Telefono
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[insertTitulo]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertTitulo] 
AS 
BEGIN
DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SET @XML = (SELECT CONVERT(XML, BulkColumn) AS BulkColumn
FROM OPENROWSET(BULK 'C:\Users\ruben\OneDrive\TEC\4 Semestre\Bases de Datos 2\Bases2\Proyecto 2\XML\Titulo.XML', SINGLE_BLOB) AS x)

EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML
DECLARE @xmlTable Table (Nombre varchar(50))
INSERT INTO @xmlTable SELECT Nombre
FROM OPENXML(@hDoc, 'dataset/Titulo')
WITH 
(
Nombre [varchar](50) '@Titulo'
);

DECLARE @Nombre varchar(50)
DECLARE cursorTabla cursor GLOBAL for SELECT Nombre FROM @xmlTable
OPEN cursorTabla
FETCH cursorTabla INTO @Nombre
WHILE(@@fetch_status=0)
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Titulo WHERE Titulo = @Nombre) 
    BEGIN
        INSERT INTO dbo.Titulo VALUES (@Nombre)
    END
	
    FETCH cursorTabla INTO @Nombre
END
CLOSE cursorTabla
DEALLOCATE cursorTabla



EXEC sp_xml_removedocument @hDoc

END 

GO
/****** Object:  StoredProcedure [dbo].[total]    Script Date: 06/11/2018 21:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[total] 
AS 
BEGIN
DECLARE @IDFactura  int, @Cantidad int, @Precio int;
DECLARE cursorTabla cursor GLOBAL for SELECT IDFactura, Cantidad  FROM dbo.Factura
OPEN cursorTabla
FETCH cursorTabla INTO @IDFactura , @Cantidad
WHILE(@@fetch_status=0)
BEGIN
	SELECT @Precio = C.Precio FROM dbo.Carro C
	INNER JOIN dbo.Factura F  on F.IDCarro = C.IDCarro
	WHERE F.IDFactura = @IDFactura

    UPDATE dbo.Factura SET Total = @Cantidad * @Precio WHERE IDFactura = @IDFactura
    FETCH cursorTabla INTO @IDFactura , @Cantidad
END
CLOSE cursorTabla
DEALLOCATE cursorTabla




END 

GO
USE [master]
GO
ALTER DATABASE [PlanB] SET  READ_WRITE 
GO
