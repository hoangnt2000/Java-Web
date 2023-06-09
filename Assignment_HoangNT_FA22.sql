USE [master]
GO
/****** Object:  Database [Assignment_HoangNT_FA22]    Script Date: 10/30/2022 11:21:02 PM ******/
CREATE DATABASE [Assignment_HoangNT_FA22]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_HoangNT_FA22', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment_HoangNT_FA22.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_HoangNT_FA22_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment_HoangNT_FA22_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_HoangNT_FA22].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment_HoangNT_FA22', N'ON'
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET QUERY_STORE = OFF
GO
USE [Assignment_HoangNT_FA22]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/30/2022 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] NOT NULL,
	[Username] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Fullname] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[isEnable] [bit] NULL,
	[Phone] [varchar](20) NULL,
	[Role] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/30/2022 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/30/2022 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitPrice] [float] NULL,
	[CourseImage] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[isDelete] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[lastUpdateDate] [date] NULL,
	[userIDUpdate] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/30/2022 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] NULL,
	[OrderID] [int] NULL,
	[CourseID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/30/2022 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[UserID] [int] NULL,
	[ContactName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[OrderDate] [date] NULL,
	[ShipAddress] [nvarchar](150) NULL,
	[Payments] [varchar](20) NULL,
	[PaymentStatus] [bit] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 10/30/2022 11:21:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Address] [nvarchar](60) NULL,
	[Phone] [varchar](20) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Assignment_HoangNT_FA22] SET  READ_WRITE 
GO
