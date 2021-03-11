USE [master]
GO
/****** Object:  Database [pc_store_VVVelizarov]    Script Date: 11.3.2021 г. 15:11:15 ******/
CREATE DATABASE [pc_store_VVVelizarov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pc_store_VVVelizarov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pc_store_VVVelizarov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pc_store_VVVelizarov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pc_store_VVVelizarov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pc_store_VVVelizarov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pc_store_VVVelizarov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET ARITHABORT OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET  MULTI_USER 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pc_store_VVVelizarov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pc_store_VVVelizarov] SET DELAYED_DURABILITY = DISABLED 
GO
USE [pc_store_VVVelizarov]
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 11.3.2021 г. 15:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[YearOfManufacture] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[AvailableUnits] [int] NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[PriceWithDiscount]  AS ([Price]-[Price]*([Discount]/(100))),
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Table_1] ON 
GO
INSERT [dbo].[Table_1] ([Id], [Name], [Manufacturer], [Model], [YearOfManufacture], [Price], [AvailableUnits], [Discount]) VALUES (1, N'Laptop1', N'Dell', N's100', 2019, CAST(500 AS Decimal(18, 0)), 3, CAST(10 AS Decimal(18, 0)))
GO
INSERT [dbo].[Table_1] ([Id], [Name], [Manufacturer], [Model], [YearOfManufacture], [Price], [AvailableUnits], [Discount]) VALUES (3, N'Laptop2', N'HP', N's200', 2020, CAST(300 AS Decimal(18, 0)), 5, CAST(20 AS Decimal(18, 0)))
GO
INSERT [dbo].[Table_1] ([Id], [Name], [Manufacturer], [Model], [YearOfManufacture], [Price], [AvailableUnits], [Discount]) VALUES (4, N'Laptop3', N'HP', N's300', 2020, CAST(50 AS Decimal(18, 0)), 4, CAST(10 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Table_1] OFF
GO
ALTER TABLE [dbo].[Table_1] ADD  CONSTRAINT [DF_Table_1_AvailableUnits]  DEFAULT ((0)) FOR [AvailableUnits]
GO
ALTER TABLE [dbo].[Table_1] ADD  CONSTRAINT [DF_Table_1_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Table_1]  WITH CHECK ADD  CONSTRAINT [CK_prodicts_yearOfManufacture] CHECK  (([YearOfManufacture]>(2018) AND [YearOfManufacture]<(2030)))
GO
ALTER TABLE [dbo].[Table_1] CHECK CONSTRAINT [CK_prodicts_yearOfManufacture]
GO
ALTER TABLE [dbo].[Table_1]  WITH CHECK ADD  CONSTRAINT [CK_products_AvailableUnits] CHECK  (([AvailableUnits]>=(0)))
GO
ALTER TABLE [dbo].[Table_1] CHECK CONSTRAINT [CK_products_AvailableUnits]
GO
ALTER TABLE [dbo].[Table_1]  WITH CHECK ADD  CONSTRAINT [CK_products_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(30)))
GO
ALTER TABLE [dbo].[Table_1] CHECK CONSTRAINT [CK_products_Discount]
GO
ALTER TABLE [dbo].[Table_1]  WITH CHECK ADD  CONSTRAINT [CK_products_price] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Table_1] CHECK CONSTRAINT [CK_products_price]
GO
USE [master]
GO
ALTER DATABASE [pc_store_VVVelizarov] SET  READ_WRITE 
GO
