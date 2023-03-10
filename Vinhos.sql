USE [master]
GO
/****** Object:  Database [Vinhos]    Script Date: 31/01/2023 20:24:05 ******/
CREATE DATABASE [Vinhos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vinhos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Vinhos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vinhos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Vinhos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Vinhos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vinhos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vinhos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vinhos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vinhos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vinhos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vinhos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vinhos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Vinhos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vinhos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vinhos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vinhos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vinhos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vinhos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vinhos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vinhos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vinhos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Vinhos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vinhos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vinhos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vinhos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vinhos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vinhos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vinhos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vinhos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vinhos] SET  MULTI_USER 
GO
ALTER DATABASE [Vinhos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vinhos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vinhos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vinhos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vinhos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vinhos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Vinhos] SET QUERY_STORE = ON
GO
ALTER DATABASE [Vinhos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Vinhos]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](235) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casta]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](250) NOT NULL,
	[Caracteristicas] [nvarchar](1000) NULL,
 CONSTRAINT [pkCasta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enologo]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enologo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](250) NOT NULL,
	[Instragram] [nvarchar](150) NULL,
 CONSTRAINT [pkEnologo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtor]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](250) NOT NULL,
	[Morada] [nvarchar](500) NOT NULL,
	[CodigoPostal] [varchar](8) NULL,
	[Localidade] [nvarchar](250) NULL,
	[Telefone] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[URL] [nvarchar](150) NULL,
 CONSTRAINT [pkProdutor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](max) NOT NULL,
	[PropertyValueStrings] [nvarchar](max) NOT NULL,
	[PropertyValueBinary] [varbinary](max) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regiao]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regiao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Descricao] [nvarchar](1000) NULL,
 CONSTRAINT [pkRegiao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
 CONSTRAINT [pkTipo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizador](
	[UserId] [varchar](50) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[DataNascimento] [datetime2](7) NULL,
 CONSTRAINT [pkUtilizador] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vinho]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vinho](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](250) NOT NULL,
	[Foto] [nvarchar](200) NULL,
	[Regiao] [int] NULL,
	[Produtor] [int] NULL,
	[Enologo] [int] NULL,
	[Tipo] [int] NULL,
	[Volume] [decimal](4, 2) NULL,
	[TeorAlcoolico] [decimal](4, 2) NULL,
	[Ano] [int] NULL,
	[Utilizador] [varchar](50) NULL,
 CONSTRAINT [pkVinho] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VinhoCasta]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VinhoCasta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Vinho] [int] NULL,
	[Casta] [int] NULL,
 CONSTRAINT [pkVinhoCasta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VinhoComentario]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VinhoComentario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Vinho] [int] NULL,
	[Utilizador] [varchar](50) NULL,
	[Classificacao] [smallint] NULL,
	[Comentario] [nvarchar](1000) NULL,
 CONSTRAINT [pkVinhoComentário] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_UserName]    Script Date: 31/01/2023 20:24:05 ******/
CREATE NONCLUSTERED INDEX [IDX_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_Application]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_User]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [ProfileEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [ProfileEntity_User]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleEntity_Application]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [User_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [User_Application]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_Role]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_User]
GO
ALTER TABLE [dbo].[Vinho]  WITH CHECK ADD  CONSTRAINT [fkVinhoEnologo] FOREIGN KEY([Enologo])
REFERENCES [dbo].[Enologo] ([Id])
GO
ALTER TABLE [dbo].[Vinho] CHECK CONSTRAINT [fkVinhoEnologo]
GO
ALTER TABLE [dbo].[Vinho]  WITH CHECK ADD  CONSTRAINT [fkVinhoProdutor] FOREIGN KEY([Produtor])
REFERENCES [dbo].[Produtor] ([Id])
GO
ALTER TABLE [dbo].[Vinho] CHECK CONSTRAINT [fkVinhoProdutor]
GO
ALTER TABLE [dbo].[Vinho]  WITH CHECK ADD  CONSTRAINT [fkVinhoRegiao] FOREIGN KEY([Regiao])
REFERENCES [dbo].[Regiao] ([Id])
GO
ALTER TABLE [dbo].[Vinho] CHECK CONSTRAINT [fkVinhoRegiao]
GO
ALTER TABLE [dbo].[Vinho]  WITH CHECK ADD  CONSTRAINT [fkVinhoTipo] FOREIGN KEY([Tipo])
REFERENCES [dbo].[Tipo] ([Id])
GO
ALTER TABLE [dbo].[Vinho] CHECK CONSTRAINT [fkVinhoTipo]
GO
ALTER TABLE [dbo].[Vinho]  WITH CHECK ADD  CONSTRAINT [fkVinhoUtilizador] FOREIGN KEY([Utilizador])
REFERENCES [dbo].[Utilizador] ([UserId])
GO
ALTER TABLE [dbo].[Vinho] CHECK CONSTRAINT [fkVinhoUtilizador]
GO
ALTER TABLE [dbo].[VinhoCasta]  WITH CHECK ADD  CONSTRAINT [fkCastaVinho] FOREIGN KEY([Casta])
REFERENCES [dbo].[Casta] ([Id])
GO
ALTER TABLE [dbo].[VinhoCasta] CHECK CONSTRAINT [fkCastaVinho]
GO
ALTER TABLE [dbo].[VinhoCasta]  WITH CHECK ADD  CONSTRAINT [fkVinhoCasta] FOREIGN KEY([Vinho])
REFERENCES [dbo].[Vinho] ([Id])
GO
ALTER TABLE [dbo].[VinhoCasta] CHECK CONSTRAINT [fkVinhoCasta]
GO
ALTER TABLE [dbo].[VinhoComentario]  WITH CHECK ADD  CONSTRAINT [fkVinhoComentarioUtilizador] FOREIGN KEY([Utilizador])
REFERENCES [dbo].[Utilizador] ([UserId])
GO
ALTER TABLE [dbo].[VinhoComentario] CHECK CONSTRAINT [fkVinhoComentarioUtilizador]
GO
ALTER TABLE [dbo].[VinhoComentario]  WITH CHECK ADD  CONSTRAINT [fkVinhoComentarioVinho] FOREIGN KEY([Vinho])
REFERENCES [dbo].[Vinho] ([Id])
GO
ALTER TABLE [dbo].[VinhoComentario] CHECK CONSTRAINT [fkVinhoComentarioVinho]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetListaVinhos]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetListaVinhos]AS	SELECT				V.Id, V.Nome, V.Foto, P.Nome 'Produtor', R.Nome 'Regiao', T.Nome 'TipoVinho'	FROM				Vinho V JOIN Produtor P ON V.Produtor = P.Id					JOIN Regiao R ON V.Regiao = R.Id					JOIN Tipo T ON V.Tipo = T.Id	ORDER BY			V.Id DESC
GO
/****** Object:  StoredProcedure [dbo].[usp_GetVinhoById]    Script Date: 31/01/2023 20:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetVinhoById](@id INT)AS	SELECT				V.Id, V.Nome, V.Foto, P.Nome 'Produtor', R.Nome 'Regiao', T.Nome 'TipoVinho'	FROM				Vinho V JOIN Produtor P ON V.Produtor = P.Id					JOIN Regiao R ON V.Regiao = R.Id					JOIN Tipo T ON V.Tipo = T.Id	WHERE				V.Id = @id	ORDER BY			V.Nome
GO
USE [master]
GO
ALTER DATABASE [Vinhos] SET  READ_WRITE 
GO
