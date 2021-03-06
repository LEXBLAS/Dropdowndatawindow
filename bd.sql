USE [ejemplo01]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 30/01/2017 09:58:52 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulo](
	[idArticulo] [int] NOT NULL,
	[idsubgrupo] [int] NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 30/01/2017 09:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grupo](
	[idgrupo] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[idgrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subgrupo]    Script Date: 30/01/2017 09:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subgrupo](
	[idsubgrupo] [int] NOT NULL,
	[idgrupo] [int] NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Subgrupo] PRIMARY KEY CLUSTERED 
(
	[idsubgrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Articulo] ([idArticulo], [idsubgrupo], [descripcion]) VALUES (1, 2, N'fhfgh')
INSERT [dbo].[Articulo] ([idArticulo], [idsubgrupo], [descripcion]) VALUES (2, 1, N'dfhdfh')
INSERT [dbo].[Grupo] ([idgrupo], [descripcion]) VALUES (1, N'grupo 1')
INSERT [dbo].[Grupo] ([idgrupo], [descripcion]) VALUES (2, N'grupo 2')
INSERT [dbo].[Subgrupo] ([idsubgrupo], [idgrupo], [descripcion]) VALUES (1, 1, N'subgrupo 1 -grupo 1')
INSERT [dbo].[Subgrupo] ([idsubgrupo], [idgrupo], [descripcion]) VALUES (2, 1, N'subgrupo 2 - grupo 1')
INSERT [dbo].[Subgrupo] ([idsubgrupo], [idgrupo], [descripcion]) VALUES (3, 2, N'subgrupo 3 - grupo 2')
INSERT [dbo].[Subgrupo] ([idsubgrupo], [idgrupo], [descripcion]) VALUES (4, 2, N'subgrupo 4 - grupo 2')
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Subgrupo] FOREIGN KEY([idsubgrupo])
REFERENCES [dbo].[Subgrupo] ([idsubgrupo])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Subgrupo]
GO
ALTER TABLE [dbo].[Subgrupo]  WITH CHECK ADD  CONSTRAINT [FK_Subgrupo_Grupo] FOREIGN KEY([idgrupo])
REFERENCES [dbo].[Grupo] ([idgrupo])
GO
ALTER TABLE [dbo].[Subgrupo] CHECK CONSTRAINT [FK_Subgrupo_Grupo]
GO
