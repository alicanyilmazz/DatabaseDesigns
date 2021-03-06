USE [master]
GO
/****** Object:  Database [ElectronicTrade]    Script Date: 04/02/2020 12:50:13 ******/
CREATE DATABASE [ElectronicTrade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AMK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\AMK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AMK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\AMK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ElectronicTrade] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectronicTrade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectronicTrade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectronicTrade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectronicTrade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectronicTrade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectronicTrade] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectronicTrade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElectronicTrade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectronicTrade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectronicTrade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectronicTrade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectronicTrade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectronicTrade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectronicTrade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectronicTrade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectronicTrade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElectronicTrade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectronicTrade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectronicTrade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectronicTrade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectronicTrade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectronicTrade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectronicTrade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectronicTrade] SET RECOVERY FULL 
GO
ALTER DATABASE [ElectronicTrade] SET  MULTI_USER 
GO
ALTER DATABASE [ElectronicTrade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectronicTrade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectronicTrade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectronicTrade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ElectronicTrade] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ElectronicTrade', N'ON'
GO
ALTER DATABASE [ElectronicTrade] SET QUERY_STORE = OFF
GO
USE [ElectronicTrade]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ElectronicTrade]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 04/02/2020 12:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CutomerType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillingAddresses]    Script Date: 04/02/2020 12:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingAddresses](
	[Id] [int] NOT NULL,
	[AddressesId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BillingAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Card]    Script Date: 04/02/2020 12:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[Id] [int] NOT NULL,
	[PaymentCardType] [tinyint] NOT NULL,
	[CardType] [tinyint] NOT NULL,
	[CardNumber] [int] NOT NULL,
	[CardOwnerName] [nvarchar](50) NOT NULL,
	[Expiration] [date] NOT NULL,
	[CVV] [int] NOT NULL,
	[Nper] [int] NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 04/02/2020 12:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [tinyint] NOT NULL,
	[CargoTrackingNumber] [nvarchar](50) NULL,
	[AddedDate] [date] NOT NULL,
	[SupplierId] [int] NOT NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CargoStatus]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CargoId] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Statement] [nvarchar](50) NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_CargoStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[QueryString] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NULL,
	[ParentCategoryId] [int] NULL,
	[UserBy] [nvarchar](50) NULL,
	[AddedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommentDetails]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NULL,
	[Text] [nvarchar](50) NULL,
	[AddedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_CommentDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CouponRestrictionType] [tinyint] NOT NULL,
	[CouponLowerBoundryPrice] [decimal](18, 0) NOT NULL,
	[NumberOfCoupon] [int] NOT NULL,
	[CouponStatus] [tinyint] NOT NULL,
	[DiscountType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CouponBrandType]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponBrandType](
	[Id] [int] NOT NULL,
	[BrandType] [tinyint] NOT NULL,
 CONSTRAINT [PK_CouponBrandType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CouponCategoryType]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponCategoryType](
	[Id] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CouponCategoryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CouponOrder]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CouponId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_CouponOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Crypto]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crypto](
	[Id] [int] NOT NULL,
	[WalletNumber] [nvarchar](50) NOT NULL,
	[WalletOwnerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Crypto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerType] [nvarchar](50) NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAccountActivation]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccountActivation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[ActivationType] [tinyint] NOT NULL,
	[CustomerType] [tinyint] NULL,
 CONSTRAINT [PK_CustomerAccountActivation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAddresses]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddresses](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Country] [tinyint] NULL,
	[City] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerCard]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCard](
	[Id] [int] NOT NULL,
	[CardType] [tinyint] NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_CustomerCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerCreditCard]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCreditCard](
	[Id] [int] NOT NULL,
	[CardNumber] [int] NOT NULL,
	[CardOwnerName] [nvarchar](50) NOT NULL,
	[CardType] [tinyint] NOT NULL,
	[Expiration] [date] NOT NULL,
	[CVV] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_CustomerCreditCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerCrypto]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCrypto](
	[Id] [int] NOT NULL,
	[WalletNumber] [int] NOT NULL,
	[WalletOwnerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerCrypto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerDebitCard]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDebitCard](
	[Id] [int] NOT NULL,
	[CardNumber] [int] NOT NULL,
	[CardOwnerName] [nvarchar](50) NOT NULL,
	[CardType] [tinyint] NOT NULL,
	[Expiration] [date] NOT NULL,
	[CVV] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_CustomerDebitCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerPayment]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPayment](
	[Id] [int] NOT NULL,
	[PaymentType] [tinyint] NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_CustomerPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerStatus]    Script Date: 04/02/2020 12:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerStatus](
	[Id] [int] NOT NULL,
	[CustomerStatusType] [tinyint] NOT NULL,
 CONSTRAINT [PK_CustomerStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerWireTransfer]    Script Date: 04/02/2020 12:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerWireTransfer](
	[Id] [int] NOT NULL,
	[TransferCode] [nvarchar](50) NOT NULL,
	[TransferBank] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerWireTransfer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DirectDiscount]    Script Date: 04/02/2020 12:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectDiscount](
	[Id] [int] NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_DirectDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LegalCustomer]    Script Date: 04/02/2020 12:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LegalCustomer](
	[Id] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[CompanySector] [tinyint] NOT NULL,
	[CompanyType] [tinyint] NOT NULL,
 CONSTRAINT [PK_LegalCustomer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LegalCustomerPassword]    Script Date: 04/02/2020 12:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LegalCustomerPassword](
	[Id] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LegalCustomerPassword] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Limited]    Script Date: 04/02/2020 12:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Limited](
	[Id] [int] NOT NULL,
	[MersisNumber] [nvarchar](50) NOT NULL,
	[MersisVerification] [bit] NOT NULL,
 CONSTRAINT [PK_Limited] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Link]    Script Date: 04/02/2020 12:50:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[Id] [int] NOT NULL,
	[LinkUrl] [uniqueidentifier] NOT NULL,
	[LinkType] [tinyint] NOT NULL,
	[Statement] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 04/02/2020 12:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](250) NOT NULL,
	[CustomerFromId] [int] NULL,
	[CustomerToId] [int] NULL,
	[IsRead] [bit] NOT NULL,
	[ParentMessageId] [int] NULL,
	[AddedDate] [date] NOT NULL,
	[ModifiedDate] [date] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderAdresses]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAdresses](
	[Id] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Country] [tinyint] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrderAdresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CargoId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[CouponUnitPrice] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderRequest]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
	[ModifiedDate] [date] NOT NULL,
	[RequestStatus] [tinyint] NOT NULL,
	[RequestSupporter] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderRequestDetail]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRequestDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderRequestId] [int] NOT NULL,
	[Reason] [nvarchar](200) NOT NULL,
	[RequestType] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrderRequestDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[CustomerType] [tinyint] NOT NULL,
	[TotalNotDiscountedPrice] [decimal](18, 0) NOT NULL,
	[TotalDiscountedPrice] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Password]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Password](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CustomerType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Password] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PaymentType] [tinyint] NOT NULL,
	[PaidCost] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PercentageDiscount]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PercentageDiscount](
	[Id] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_PercentageDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 04/02/2020 12:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
	[UserBy] [nvarchar](50) NOT NULL,
	[ModifiedDate] [date] NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductLikes]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[LikeRate] [tinyint] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_ProductLikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[RegularPrice] [decimal](18, 0) NOT NULL,
	[DiscountPrice] [decimal](18, 0) NOT NULL,
	[AddedDate] [date] NOT NULL,
	[StarPoint] [int] NOT NULL,
	[DiscountRate] [int] NOT NULL,
	[Barcode] [nvarchar](50) NOT NULL,
	[Brand] [tinyint] NOT NULL,
	[Type] [tinyint] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealCustomer]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealCustomer](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RealCustomer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealCustomerInformation]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealCustomerInformation](
	[Id] [int] NOT NULL,
	[Identification] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[RealCustomerId] [int] NOT NULL,
	[MernisVerification] [bit] NOT NULL,
 CONSTRAINT [PK_RealCustomerInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RealCustomerPassword]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealCustomerPassword](
	[Id] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RealCustomerPassword] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Redemand]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Redemand](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[TotalPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Redemand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RedemandDetail]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedemandDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[RedemandId] [int] NOT NULL,
	[RedemandReason] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_RedemandDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesDetails]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[AdeedDate] [date] NOT NULL,
 CONSTRAINT [PK_SalesDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShipmentTypeId] [int] NOT NULL,
	[PaymentType] [tinyint] NOT NULL,
	[ShippingAddressId] [int] NOT NULL,
	[BillingAddressId] [int] NOT NULL,
	[CustomerType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipmentCargo]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentCargo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShipmentId] [int] NOT NULL,
	[CargoId] [int] NOT NULL,
	[Status_Time] [timestamp] NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_ShipmentCargo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipmentType]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [tinyint] NULL,
 CONSTRAINT [PK_ShipmentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingAddreses]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddreses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressesId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ShippingAddreses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SimpleEntry]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SimpleEntry](
	[Id] [int] NOT NULL,
	[MernisNumber] [nvarchar](50) NOT NULL,
	[MernisVerification] [bit] NOT NULL,
 CONSTRAINT [PK_SimpleEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierLikes]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierLikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[LikeRate] [tinyint] NOT NULL,
	[AddedDate] [date] NOT NULL,
 CONSTRAINT [PK_SupplierLikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WireTransfer]    Script Date: 04/02/2020 12:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WireTransfer](
	[Id] [int] NOT NULL,
	[TransferCode] [nvarchar](50) NOT NULL,
	[TransferBank] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WireTransfer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Customer]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_CustomerAddresses] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerAddresses] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_CustomerAddresses]
GO
ALTER TABLE [dbo].[BillingAddresses]  WITH CHECK ADD  CONSTRAINT [FK_BillingAddresses_Addresses] FOREIGN KEY([AddressesId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[BillingAddresses] CHECK CONSTRAINT [FK_BillingAddresses_Addresses]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_PaymentType] FOREIGN KEY([Id])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_PaymentType]
GO
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD  CONSTRAINT [FK_Cargo_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[Cargo] CHECK CONSTRAINT [FK_Cargo_Suppliers]
GO
ALTER TABLE [dbo].[CargoStatus]  WITH CHECK ADD  CONSTRAINT [FK_CargoStatus_Cargo] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargo] ([Id])
GO
ALTER TABLE [dbo].[CargoStatus] CHECK CONSTRAINT [FK_CargoStatus_Cargo]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentCategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[CommentDetails]  WITH CHECK ADD  CONSTRAINT [FK_CommentDetails_Comments] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[CommentDetails] CHECK CONSTRAINT [FK_CommentDetails_Comments]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Customer]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Orders]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Suppliers]
GO
ALTER TABLE [dbo].[CouponBrandType]  WITH CHECK ADD  CONSTRAINT [FK_CouponBrandType_Coupon] FOREIGN KEY([Id])
REFERENCES [dbo].[Coupon] ([Id])
GO
ALTER TABLE [dbo].[CouponBrandType] CHECK CONSTRAINT [FK_CouponBrandType_Coupon]
GO
ALTER TABLE [dbo].[CouponCategoryType]  WITH CHECK ADD  CONSTRAINT [FK_CouponCategoryType_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CouponCategoryType] CHECK CONSTRAINT [FK_CouponCategoryType_Categories]
GO
ALTER TABLE [dbo].[CouponCategoryType]  WITH CHECK ADD  CONSTRAINT [FK_CouponCategoryType_Coupon] FOREIGN KEY([Id])
REFERENCES [dbo].[Coupon] ([Id])
GO
ALTER TABLE [dbo].[CouponCategoryType] CHECK CONSTRAINT [FK_CouponCategoryType_Coupon]
GO
ALTER TABLE [dbo].[CouponOrder]  WITH CHECK ADD  CONSTRAINT [FK_CouponOrder_Coupon] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupon] ([Id])
GO
ALTER TABLE [dbo].[CouponOrder] CHECK CONSTRAINT [FK_CouponOrder_Coupon]
GO
ALTER TABLE [dbo].[CouponOrder]  WITH CHECK ADD  CONSTRAINT [FK_CouponOrder_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[CouponOrder] CHECK CONSTRAINT [FK_CouponOrder_Orders]
GO
ALTER TABLE [dbo].[CouponOrder]  WITH CHECK ADD  CONSTRAINT [FK_CouponOrder_Orders1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[CouponOrder] CHECK CONSTRAINT [FK_CouponOrder_Orders1]
GO
ALTER TABLE [dbo].[Crypto]  WITH CHECK ADD  CONSTRAINT [FK_Crypto_PaymentType] FOREIGN KEY([Id])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[Crypto] CHECK CONSTRAINT [FK_Crypto_PaymentType]
GO
ALTER TABLE [dbo].[CustomerAccountActivation]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountActivation_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerAccountActivation] CHECK CONSTRAINT [FK_CustomerAccountActivation_Customer]
GO
ALTER TABLE [dbo].[CustomerAccountActivation]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountActivation_CustomerStatus] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerStatus] ([Id])
GO
ALTER TABLE [dbo].[CustomerAccountActivation] CHECK CONSTRAINT [FK_CustomerAccountActivation_CustomerStatus]
GO
ALTER TABLE [dbo].[CustomerCard]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCard_CustomerPayment] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerPayment] ([Id])
GO
ALTER TABLE [dbo].[CustomerCard] CHECK CONSTRAINT [FK_CustomerCard_CustomerPayment]
GO
ALTER TABLE [dbo].[CustomerCreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCreditCard_CustomerCard] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerCard] ([Id])
GO
ALTER TABLE [dbo].[CustomerCreditCard] CHECK CONSTRAINT [FK_CustomerCreditCard_CustomerCard]
GO
ALTER TABLE [dbo].[CustomerCrypto]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCrypto_CustomerPayment] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerPayment] ([Id])
GO
ALTER TABLE [dbo].[CustomerCrypto] CHECK CONSTRAINT [FK_CustomerCrypto_CustomerPayment]
GO
ALTER TABLE [dbo].[CustomerDebitCard]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDebitCard_CustomerCard] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerCard] ([Id])
GO
ALTER TABLE [dbo].[CustomerDebitCard] CHECK CONSTRAINT [FK_CustomerDebitCard_CustomerCard]
GO
ALTER TABLE [dbo].[CustomerPayment]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPayment_Customer] FOREIGN KEY([Id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerPayment] CHECK CONSTRAINT [FK_CustomerPayment_Customer]
GO
ALTER TABLE [dbo].[CustomerWireTransfer]  WITH CHECK ADD  CONSTRAINT [FK_CustomerWireTransfer_CustomerPayment] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerPayment] ([Id])
GO
ALTER TABLE [dbo].[CustomerWireTransfer] CHECK CONSTRAINT [FK_CustomerWireTransfer_CustomerPayment]
GO
ALTER TABLE [dbo].[DirectDiscount]  WITH CHECK ADD  CONSTRAINT [FK_DirectDiscount_Coupon] FOREIGN KEY([Id])
REFERENCES [dbo].[Coupon] ([Id])
GO
ALTER TABLE [dbo].[DirectDiscount] CHECK CONSTRAINT [FK_DirectDiscount_Coupon]
GO
ALTER TABLE [dbo].[LegalCustomer]  WITH CHECK ADD  CONSTRAINT [FK_LegalCustomer_Customer] FOREIGN KEY([Id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[LegalCustomer] CHECK CONSTRAINT [FK_LegalCustomer_Customer]
GO
ALTER TABLE [dbo].[LegalCustomer]  WITH CHECK ADD  CONSTRAINT [FK_LegalCustomer_SimpleEntry] FOREIGN KEY([Id])
REFERENCES [dbo].[SimpleEntry] ([Id])
GO
ALTER TABLE [dbo].[LegalCustomer] CHECK CONSTRAINT [FK_LegalCustomer_SimpleEntry]
GO
ALTER TABLE [dbo].[LegalCustomerPassword]  WITH CHECK ADD  CONSTRAINT [FK_LegalCustomerPassword_Password] FOREIGN KEY([Id])
REFERENCES [dbo].[Password] ([Id])
GO
ALTER TABLE [dbo].[LegalCustomerPassword] CHECK CONSTRAINT [FK_LegalCustomerPassword_Password]
GO
ALTER TABLE [dbo].[Limited]  WITH CHECK ADD  CONSTRAINT [FK_Limited_LegalCustomer] FOREIGN KEY([Id])
REFERENCES [dbo].[LegalCustomer] ([Id])
GO
ALTER TABLE [dbo].[Limited] CHECK CONSTRAINT [FK_Limited_LegalCustomer]
GO
ALTER TABLE [dbo].[Link]  WITH CHECK ADD  CONSTRAINT [FK_Link_CustomerAccountActivation] FOREIGN KEY([Id])
REFERENCES [dbo].[CustomerAccountActivation] ([Id])
GO
ALTER TABLE [dbo].[Link] CHECK CONSTRAINT [FK_Link_CustomerAccountActivation]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Customer] FOREIGN KEY([CustomerFromId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Customer]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Customer1] FOREIGN KEY([CustomerToId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Customer1]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Messages] FOREIGN KEY([ParentMessageId])
REFERENCES [dbo].[Messages] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Messages]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Cargo] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargo] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Cargo]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Suppliers]
GO
ALTER TABLE [dbo].[OrderRequest]  WITH CHECK ADD  CONSTRAINT [FK_OrderRequest_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[OrderRequest] CHECK CONSTRAINT [FK_OrderRequest_Customer]
GO
ALTER TABLE [dbo].[OrderRequest]  WITH CHECK ADD  CONSTRAINT [FK_OrderRequest_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderRequest] CHECK CONSTRAINT [FK_OrderRequest_Orders]
GO
ALTER TABLE [dbo].[OrderRequest]  WITH CHECK ADD  CONSTRAINT [FK_OrderRequest_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[OrderRequest] CHECK CONSTRAINT [FK_OrderRequest_Suppliers]
GO
ALTER TABLE [dbo].[OrderRequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderRequestDetail_OrderRequest] FOREIGN KEY([OrderRequestId])
REFERENCES [dbo].[OrderRequest] ([Id])
GO
ALTER TABLE [dbo].[OrderRequestDetail] CHECK CONSTRAINT [FK_OrderRequestDetail_OrderRequest]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Addresses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Password]  WITH CHECK ADD  CONSTRAINT [FK_Password_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Password] CHECK CONSTRAINT [FK_Password_Customer]
GO
ALTER TABLE [dbo].[PaymentType]  WITH CHECK ADD  CONSTRAINT [FK_PaymentType_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_Customer]
GO
ALTER TABLE [dbo].[PaymentType]  WITH CHECK ADD  CONSTRAINT [FK_PaymentType_Orders] FOREIGN KEY([Id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[PaymentType] CHECK CONSTRAINT [FK_PaymentType_Orders]
GO
ALTER TABLE [dbo].[PercentageDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PercentageDiscount_Coupon] FOREIGN KEY([Id])
REFERENCES [dbo].[Coupon] ([Id])
GO
ALTER TABLE [dbo].[PercentageDiscount] CHECK CONSTRAINT [FK_PercentageDiscount_Coupon]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Categories]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Products]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_Products]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_Suppliers]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products]
GO
ALTER TABLE [dbo].[ProductLikes]  WITH CHECK ADD  CONSTRAINT [FK_ProductLikes_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[ProductLikes] CHECK CONSTRAINT [FK_ProductLikes_Customer]
GO
ALTER TABLE [dbo].[ProductLikes]  WITH CHECK ADD  CONSTRAINT [FK_ProductLikes_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[ProductLikes] CHECK CONSTRAINT [FK_ProductLikes_Orders]
GO
ALTER TABLE [dbo].[ProductLikes]  WITH CHECK ADD  CONSTRAINT [FK_ProductLikes_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductLikes] CHECK CONSTRAINT [FK_ProductLikes_Products]
GO
ALTER TABLE [dbo].[ProductLikes]  WITH CHECK ADD  CONSTRAINT [FK_ProductLikes_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[ProductLikes] CHECK CONSTRAINT [FK_ProductLikes_Suppliers]
GO
ALTER TABLE [dbo].[RealCustomer]  WITH CHECK ADD  CONSTRAINT [FK_RealCustomer_Customer] FOREIGN KEY([Id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[RealCustomer] CHECK CONSTRAINT [FK_RealCustomer_Customer]
GO
ALTER TABLE [dbo].[RealCustomerInformation]  WITH CHECK ADD  CONSTRAINT [FK_RealCustomerInformation_RealCustomer1] FOREIGN KEY([RealCustomerId])
REFERENCES [dbo].[RealCustomer] ([Id])
GO
ALTER TABLE [dbo].[RealCustomerInformation] CHECK CONSTRAINT [FK_RealCustomerInformation_RealCustomer1]
GO
ALTER TABLE [dbo].[RealCustomerPassword]  WITH CHECK ADD  CONSTRAINT [FK_RealCustomerPassword_Password] FOREIGN KEY([Id])
REFERENCES [dbo].[Password] ([Id])
GO
ALTER TABLE [dbo].[RealCustomerPassword] CHECK CONSTRAINT [FK_RealCustomerPassword_Password]
GO
ALTER TABLE [dbo].[Redemand]  WITH CHECK ADD  CONSTRAINT [FK_Redemand_Orders] FOREIGN KEY([Id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Redemand] CHECK CONSTRAINT [FK_Redemand_Orders]
GO
ALTER TABLE [dbo].[RedemandDetail]  WITH CHECK ADD  CONSTRAINT [FK_RedemandDetail_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[RedemandDetail] CHECK CONSTRAINT [FK_RedemandDetail_Products]
GO
ALTER TABLE [dbo].[RedemandDetail]  WITH CHECK ADD  CONSTRAINT [FK_RedemandDetail_Redemand] FOREIGN KEY([RedemandId])
REFERENCES [dbo].[Redemand] ([Id])
GO
ALTER TABLE [dbo].[RedemandDetail] CHECK CONSTRAINT [FK_RedemandDetail_Redemand]
GO
ALTER TABLE [dbo].[RedemandDetail]  WITH CHECK ADD  CONSTRAINT [FK_RedemandDetail_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[RedemandDetail] CHECK CONSTRAINT [FK_RedemandDetail_Suppliers]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Customer]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Orders] FOREIGN KEY([Id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Orders]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalesDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_SalesDetails_Products]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalesDetails_Sales] FOREIGN KEY([SalesId])
REFERENCES [dbo].[Sales] ([Id])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_SalesDetails_Sales]
GO
ALTER TABLE [dbo].[SalesDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalesDetails_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[SalesDetails] CHECK CONSTRAINT [FK_SalesDetails_Suppliers]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_BillingAddresses] FOREIGN KEY([BillingAddressId])
REFERENCES [dbo].[BillingAddresses] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_BillingAddresses]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Customer]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Orders] FOREIGN KEY([Id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Orders]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_ShippingAddreses] FOREIGN KEY([ShippingAddressId])
REFERENCES [dbo].[ShippingAddreses] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_ShippingAddreses]
GO
ALTER TABLE [dbo].[ShipmentCargo]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentCargo_Cargo] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargo] ([Id])
GO
ALTER TABLE [dbo].[ShipmentCargo] CHECK CONSTRAINT [FK_ShipmentCargo_Cargo]
GO
ALTER TABLE [dbo].[ShipmentCargo]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentCargo_Shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipment] ([Id])
GO
ALTER TABLE [dbo].[ShipmentCargo] CHECK CONSTRAINT [FK_ShipmentCargo_Shipment]
GO
ALTER TABLE [dbo].[ShippingAddreses]  WITH CHECK ADD  CONSTRAINT [FK_ShippingAddreses_Addresses] FOREIGN KEY([AddressesId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[ShippingAddreses] CHECK CONSTRAINT [FK_ShippingAddreses_Addresses]
GO
ALTER TABLE [dbo].[SupplierLikes]  WITH CHECK ADD  CONSTRAINT [FK_SupplierLikes_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[SupplierLikes] CHECK CONSTRAINT [FK_SupplierLikes_Customer]
GO
ALTER TABLE [dbo].[SupplierLikes]  WITH CHECK ADD  CONSTRAINT [FK_SupplierLikes_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[SupplierLikes] CHECK CONSTRAINT [FK_SupplierLikes_Orders]
GO
ALTER TABLE [dbo].[SupplierLikes]  WITH CHECK ADD  CONSTRAINT [FK_SupplierLikes_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[SupplierLikes] CHECK CONSTRAINT [FK_SupplierLikes_Suppliers]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_LegalCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[LegalCustomer] ([Id])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_LegalCustomer]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_Products]
GO
ALTER TABLE [dbo].[WireTransfer]  WITH CHECK ADD  CONSTRAINT [FK_WireTransfer_PaymentType] FOREIGN KEY([Id])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[WireTransfer] CHECK CONSTRAINT [FK_WireTransfer_PaymentType]
GO
USE [master]
GO
ALTER DATABASE [ElectronicTrade] SET  READ_WRITE 
GO
