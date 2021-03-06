USE [master]
GO
/****** Object:  Database [Escuela]    Script Date: 03/03/2018 11:10:10 a.m. ******/
CREATE DATABASE [Escuela]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Escuela', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Escuela.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Escuela_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Escuela_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Escuela] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Escuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Escuela] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Escuela] SET ARITHABORT OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Escuela] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Escuela] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Escuela] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Escuela] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Escuela] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Escuela] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Escuela] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Escuela] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Escuela] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Escuela] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Escuela] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Escuela] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Escuela] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Escuela] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Escuela] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Escuela] SET  MULTI_USER 
GO
ALTER DATABASE [Escuela] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Escuela] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Escuela] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Escuela] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Escuela]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 03/03/2018 11:10:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[IdNombre] [nchar](10) NOT NULL,
	[Matricula] [int] NULL,
	[Semestre] [int] NULL,
	[Carrera] [nchar](10) NULL,
	[NumMateriasCursadas] [int] NULL,
	[Materias] [nchar](10) NULL,
	[Id] [nchar](10) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[IdNombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 03/03/2018 11:10:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[NombreCarrera] [nchar](10) NOT NULL,
	[AlumnosTotal] [int] NULL,
	[FechaCreacion] [date] NULL,
	[Costo] [int] NULL,
	[IVA]  AS ([Costo]*(0.16)),
	[IdMaestro] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MateriaHorario]    Script Date: 03/03/2018 11:10:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MateriaHorario](
	[Nombre] [nchar](10) NULL,
	[Creditos] [numeric](18, 0) NULL,
	[Salon] [numeric](18, 0) NULL,
	[IdMaestro] [nchar](10) NOT NULL,
	[Grupo] [numeric](18, 0) NULL,
 CONSTRAINT [PK_MateriaHorario] PRIMARY KEY CLUSTERED 
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mestro]    Script Date: 03/03/2018 11:10:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mestro](
	[IdMaestro] [nvarchar](50) NOT NULL,
	[Salon] [nchar](10) NULL,
	[HorasAsignadas] [date] NULL,
	[Materias] [nchar](10) NOT NULL,
	[Id] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Mestro_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tabla_Horarios]    Script Date: 03/03/2018 11:10:10 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tabla_Horarios](
	[Id] [nchar](10) NOT NULL,
	[Salon] [int] NULL,
	[Materia] [nchar](10) NULL,
	[Fecha] [date] NULL,
	[Maestro] [nchar](10) NULL,
	[Dias] [date] NULL,
 CONSTRAINT [PK_Tabla_Horarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Mestro]    Script Date: 03/03/2018 11:10:10 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Mestro] ON [dbo].[Mestro]
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tabla_Horarios]    Script Date: 03/03/2018 11:10:10 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Tabla_Horarios] ON [dbo].[Tabla_Horarios]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_MateriaHorario] FOREIGN KEY([IdNombre])
REFERENCES [dbo].[MateriaHorario] ([IdMaestro])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_MateriaHorario]
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD  CONSTRAINT [FK_Carrera_Alumno] FOREIGN KEY([NombreCarrera])
REFERENCES [dbo].[Alumno] ([IdNombre])
GO
ALTER TABLE [dbo].[Carrera] CHECK CONSTRAINT [FK_Carrera_Alumno]
GO
ALTER TABLE [dbo].[Mestro]  WITH CHECK ADD  CONSTRAINT [FK_Mestro_MateriaHorario] FOREIGN KEY([Id])
REFERENCES [dbo].[MateriaHorario] ([IdMaestro])
GO
ALTER TABLE [dbo].[Mestro] CHECK CONSTRAINT [FK_Mestro_MateriaHorario]
GO
ALTER TABLE [dbo].[Tabla_Horarios]  WITH CHECK ADD  CONSTRAINT [FK_Tabla_Horarios_Alumno] FOREIGN KEY([Id])
REFERENCES [dbo].[Alumno] ([IdNombre])
GO
ALTER TABLE [dbo].[Tabla_Horarios] CHECK CONSTRAINT [FK_Tabla_Horarios_Alumno]
GO
ALTER TABLE [dbo].[Tabla_Horarios]  WITH CHECK ADD  CONSTRAINT [FK_Tabla_Horarios_Mestro] FOREIGN KEY([Id])
REFERENCES [dbo].[Mestro] ([Id])
GO
ALTER TABLE [dbo].[Tabla_Horarios] CHECK CONSTRAINT [FK_Tabla_Horarios_Mestro]
GO
USE [master]
GO
ALTER DATABASE [Escuela] SET  READ_WRITE 
GO
