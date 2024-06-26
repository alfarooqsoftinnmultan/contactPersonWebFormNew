USE [master]
GO
/****** Object:  Database [contacts]    Script Date: 14-May-24 10:02:05 AM ******/
CREATE DATABASE [contacts] ON  PRIMARY 
( NAME = N'contacts', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\contacts.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'contacts_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\contacts_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [contacts] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [contacts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [contacts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [contacts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [contacts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [contacts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [contacts] SET ARITHABORT OFF 
GO
ALTER DATABASE [contacts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [contacts] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [contacts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [contacts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [contacts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [contacts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [contacts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [contacts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [contacts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [contacts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [contacts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [contacts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [contacts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [contacts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [contacts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [contacts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [contacts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [contacts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [contacts] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [contacts] SET  MULTI_USER 
GO
ALTER DATABASE [contacts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [contacts] SET DB_CHAINING OFF 
GO
USE [contacts]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 14-May-24 10:02:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [nvarchar](100) NULL,
	[state_id] [int] NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[persons]    Script Date: 14-May-24 10:02:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[person_name] [nvarchar](100) NULL,
	[person_last_name] [nvarchar](100) NULL,
	[phone_no] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[gender] [nvarchar](50) NULL,
	[city_id] [int] NULL,
	[state_id] [int] NULL,
 CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[states]    Script Date: 14-May-24 10:02:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[states](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_states] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cities] ON 

INSERT [dbo].[cities] ([city_id], [city_name], [state_id]) VALUES (1, N'Multan', 1)
INSERT [dbo].[cities] ([city_id], [city_name], [state_id]) VALUES (2, N'RYK', 1)
INSERT [dbo].[cities] ([city_id], [city_name], [state_id]) VALUES (3, N'Lodhran', 1)
INSERT [dbo].[cities] ([city_id], [city_name], [state_id]) VALUES (4, N'Peshawar', 3)
INSERT [dbo].[cities] ([city_id], [city_name], [state_id]) VALUES (5, N'Noshera', 3)
INSERT [dbo].[cities] ([city_id], [city_name], [state_id]) VALUES (6, N'Sakkur', 2)
SET IDENTITY_INSERT [dbo].[cities] OFF
SET IDENTITY_INSERT [dbo].[persons] ON 

INSERT [dbo].[persons] ([person_id], [person_name], [person_last_name], [phone_no], [email], [gender], [city_id], [state_id]) VALUES (1, N'Farooq', N'qureshi', N'11-22', N'ali@gmail.com', N'Male', 3, 1)
INSERT [dbo].[persons] ([person_id], [person_name], [person_last_name], [phone_no], [email], [gender], [city_id], [state_id]) VALUES (3, N'ishfaq', N'Karim', N'0301', N'ishfaq@gmail.com', N'Female', 5, 3)
SET IDENTITY_INSERT [dbo].[persons] OFF
SET IDENTITY_INSERT [dbo].[states] ON 

INSERT [dbo].[states] ([state_id], [state_name]) VALUES (1, N'Punjab')
INSERT [dbo].[states] ([state_id], [state_name]) VALUES (2, N'Sind')
INSERT [dbo].[states] ([state_id], [state_name]) VALUES (3, N'KPK')
SET IDENTITY_INSERT [dbo].[states] OFF
USE [master]
GO
ALTER DATABASE [contacts] SET  READ_WRITE 
GO
