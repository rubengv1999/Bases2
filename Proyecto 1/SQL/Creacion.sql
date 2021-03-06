USE [Padron]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 21/09/2018 0:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[IDCanton] [int]  NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IDProvincia] [int] NOT NULL,
	[CodigoCanton] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[IDCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudadano]    Script Date: 21/09/2018 0:18:29 ******/
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
/****** Object:  Table [dbo].[Distrito]    Script Date: 21/09/2018 0:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[IDDistrito] [int]  NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IDCanton] [int] NOT NULL,
	[CodigoDistrito] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED 
(
	[IDDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Junta]    Script Date: 21/09/2018 0:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Junta](
	[IDJunta] [int]  NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Junta] PRIMARY KEY CLUSTERED 
(
	[IDJunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 21/09/2018 0:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[IDProvincia] [int]  NOT NULL,
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
USE [master]
GO
ALTER DATABASE [Padron] SET  READ_WRITE 
GO
USE Padron
INSERT INTO dbo.Junta VALUES (1,'00000')