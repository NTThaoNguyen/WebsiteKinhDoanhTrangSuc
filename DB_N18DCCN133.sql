USE [master]
GO
/****** Object:  Database [TTTN_final]    Script Date: 9/7/2022 9:14:38 AM ******/
CREATE DATABASE [TTTN_final]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TTTN_final', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TTTN_final.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TTTN_final_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TTTN_final_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TTTN_final] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TTTN_final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TTTN_final] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TTTN_final] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TTTN_final] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TTTN_final] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TTTN_final] SET ARITHABORT OFF 
GO
ALTER DATABASE [TTTN_final] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TTTN_final] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TTTN_final] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TTTN_final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TTTN_final] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TTTN_final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TTTN_final] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TTTN_final] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TTTN_final] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TTTN_final] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TTTN_final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TTTN_final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TTTN_final] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TTTN_final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TTTN_final] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TTTN_final] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TTTN_final] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TTTN_final] SET RECOVERY FULL 
GO
ALTER DATABASE [TTTN_final] SET  MULTI_USER 
GO
ALTER DATABASE [TTTN_final] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TTTN_final] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TTTN_final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TTTN_final] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TTTN_final] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TTTN_final', N'ON'
GO
USE [TTTN_final]
GO
/****** Object:  Table [dbo].[CT_DDH]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DDH](
	[maTS] [nvarchar](10) NOT NULL,
	[idPD] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[gia] [int] NOT NULL,
 CONSTRAINT [PK_CT_DDH_1] PRIMARY KEY CLUSTERED 
(
	[maTS] ASC,
	[idPD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_GH]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_GH](
	[idCTGH] [int] IDENTITY(1,1) NOT NULL,
	[maGioHang] [nvarchar](50) NOT NULL,
	[maTS] [nvarchar](10) NOT NULL,
	[soLuong] [int] NOT NULL,
	[gia] [float] NOT NULL,
 CONSTRAINT [PK_CT_GH] PRIMARY KEY CLUSTERED 
(
	[idCTGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_KHUYENMAI]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_KHUYENMAI](
	[maKM] [nvarchar](10) NOT NULL,
	[maTS] [nvarchar](10) NOT NULL,
	[phanTramGiam] [float] NOT NULL,
 CONSTRAINT [PK_CT_KHUYENMAI] PRIMARY KEY CLUSTERED 
(
	[maKM] ASC,
	[maTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_PHIEUNHAP]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PHIEUNHAP](
	[idPN] [int] NOT NULL,
	[maTS] [nvarchar](10) NOT NULL,
	[soLuong] [int] NOT NULL,
	[gia] [int] NOT NULL,
 CONSTRAINT [PK_CT_PHIEUNHAP_1] PRIMARY KEY CLUSTERED 
(
	[idPN] ASC,
	[maTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIOHANG]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIOHANG](
	[maGioHang] [nvarchar](50) NOT NULL,
	[maNVDuyet] [nvarchar](10) NULL,
	[maNVGiao] [nvarchar](10) NULL,
	[maKH] [nvarchar](10) NOT NULL,
	[soHoaDon] [nvarchar](50) NULL,
	[hoTen] [nvarchar](30) NOT NULL,
	[diaChiNhan] [nvarchar](100) NOT NULL,
	[emailNhan] [nvarchar](50) NULL,
	[SDTNhan] [nvarchar](11) NOT NULL,
	[maTrangThaiDonHang] [nvarchar](10) NOT NULL,
	[ngayDat] [date] NOT NULL,
	[ngayGiaoDuKien] [date] NOT NULL,
 CONSTRAINT [PK__GIOHANG__3EB7A99F63097E5C] PRIMARY KEY CLUSTERED 
(
	[maGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HANGTRANGSUC]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGTRANGSUC](
	[maHang] [nvarchar](10) NOT NULL,
	[tenHang] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HINHANH]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HINHANH](
	[maHA] [int] IDENTITY(1,1) NOT NULL,
	[maTS] [nvarchar](10) NOT NULL,
	[tenHA] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__HINHANH__7A3E14832878B431] PRIMARY KEY CLUSTERED 
(
	[maHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[soHoaDon] [nvarchar](50) NOT NULL,
	[maNV] [nvarchar](10) NOT NULL,
	[ngayTao] [date] NOT NULL,
	[tongTien] [float] NOT NULL,
	[maSoThue] [nvarchar](13) NULL,
 CONSTRAINT [PK__HOADON__B060C52C6FE8914F] PRIMARY KEY CLUSTERED 
(
	[soHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[maKH] [nvarchar](10) NOT NULL,
	[maTK] [nvarchar](10) NOT NULL,
	[ho] [nvarchar](20) NOT NULL,
	[ten] [nvarchar](10) NOT NULL,
	[gioiTinh] [nvarchar](3) NULL CONSTRAINT [DF_KHACHHANG_gioiTinh]  DEFAULT (N'nam'),
	[diaChi] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](11) NOT NULL,
	[maSoThue] [nvarchar](13) NULL,
 CONSTRAINT [PK__KHACHHAN__7A3ECFE497F9B332] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHUYENMAI]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHUYENMAI](
	[maKM] [nvarchar](10) NOT NULL,
	[maNV] [nvarchar](10) NOT NULL,
	[ngayBD] [date] NOT NULL,
	[ngayKT] [date] NOT NULL,
	[moTa] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK__KHUYENMA__7A3ECFFFA3FBB78C] PRIMARY KEY CLUSTERED 
(
	[maKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAITRANGSUC]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAITRANGSUC](
	[maLoai] [nvarchar](10) NOT NULL,
	[tenLoai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[maNCC] [nvarchar](10) NOT NULL,
	[tenNCC] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[maNV] [nvarchar](10) NOT NULL,
	[maTK] [nvarchar](10) NOT NULL,
	[ho] [nvarchar](20) NOT NULL,
	[ten] [nvarchar](10) NOT NULL,
	[gioiTinh] [nvarchar](3) NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[diaChi] [nvarchar](100) NOT NULL,
	[SDT] [nvarchar](11) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__NHANVIEN__7A3EC7D539F48360] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUDAT]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUDAT](
	[idPD] [int] IDENTITY(1,1) NOT NULL,
	[maNCC] [nvarchar](10) NOT NULL,
	[maNV] [nvarchar](10) NOT NULL,
	[idPN] [int] NOT NULL,
	[ngayDat] [date] NOT NULL,
 CONSTRAINT [PK__PHIEUDAT__9DB848CC246D47B6] PRIMARY KEY CLUSTERED 
(
	[idPD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAP](
	[idPN] [int] IDENTITY(1,1) NOT NULL,
	[idPD] [int] NOT NULL,
	[maNV] [nvarchar](10) NOT NULL,
	[ngayTao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUYEN]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYEN](
	[maQuyen] [nvarchar](10) NOT NULL,
	[tenQuyen] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[maTK] [nvarchar](10) NOT NULL,
	[maQuyen] [nvarchar](10) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[maTrangThaiTK] [nvarchar](10) NULL,
 CONSTRAINT [PK__TAIKHOAN__7A22625E13DEF022] PRIMARY KEY CLUSTERED 
(
	[maTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THAYDOIGIA]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THAYDOIGIA](
	[idThayDoi] [int] IDENTITY(1,1) NOT NULL,
	[maTS] [nvarchar](10) NOT NULL,
	[ngayApDung] [date] NOT NULL,
	[maNV] [nvarchar](10) NOT NULL,
	[gia] [int] NOT NULL,
 CONSTRAINT [PK_THAYDOIGIA_1] PRIMARY KEY CLUSTERED 
(
	[idThayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRANGSUC]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGSUC](
	[maTS] [nvarchar](10) NOT NULL,
	[maLoai] [nvarchar](10) NOT NULL,
	[maHang] [nvarchar](10) NOT NULL,
	[maNCC] [nvarchar](10) NOT NULL,
	[tenTS] [nvarchar](100) NOT NULL,
	[soLuongTon] [int] NOT NULL,
	[moTaNgan] [nvarchar](300) NULL,
	[moTa] [nvarchar](max) NOT NULL,
	[trangThaiSP] [nvarchar](50) NOT NULL,
	[gia] [int] NULL,
	[luotMua] [int] NULL,
	[is_new] [bit] NULL,
 CONSTRAINT [PK__TRANGSUC__7A2262462766CCB4] PRIMARY KEY CLUSTERED 
(
	[maTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRANGTHAIDONHANG]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTHAIDONHANG](
	[maTrangThaiDonHang] [nvarchar](10) NOT NULL,
	[tenTrangThaiDonHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TRANGTHAIDONHANG] PRIMARY KEY CLUSTERED 
(
	[maTrangThaiDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRANGTHAITAIKHOAN]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTHAITAIKHOAN](
	[maTrangThaiTK] [nvarchar](10) NOT NULL,
	[tenTrangThaiTK] [nvarchar](20) NULL,
 CONSTRAINT [PK_TRANGTHAITAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[maTrangThaiTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CT_GH] ON 

INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (2, N'Sat Aug 27 22:43:04 ICT 2022', N'TS08', 1, 299000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (3, N'Sat Aug 27 22:57:25 ICT 2022', N'TS08', 1, 299000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (4, N'Wed Aug 31 17:30:25 ICT 2022', N'TS08', 1, 299000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (5, N'Wed Aug 31 17:30:25 ICT 2022', N'TS12', 1, 349000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (9, N'Thu Sep 01 23:24:01 ICT 2022', N'TS08', 1, 299000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (10, N'Thu Sep 01 23:24:01 ICT 2022', N'TS12', 1, 349000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (11, N'Thu Sep 01 23:30:10 ICT 2022', N'TS08', 1, 299000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (12, N'Thu Sep 01 23:30:10 ICT 2022', N'TS12', 1, 349000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (13, N'Fri Sep 02 09:22:01 ICT 2022', N'TS05', 2, 498000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (14, N'Sat Sep 03 09:32:17 ICT 2022', N'TS01', 2, 400000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (15, N'Sat Sep 03 09:32:17 ICT 2022', N'TS05', 1, 249000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (16, N'Sat Sep 03 09:32:17 ICT 2022', N'TS07', 2, 698000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (17, N'Sat Sep 03 13:29:45 ICT 2022', N'TS05', 1, 249000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (18, N'Sat Sep 03 13:29:45 ICT 2022', N'TS07', 1, 349000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (19, N'Sat Sep 03 16:29:02 ICT 2022', N'TS01', 2, 600000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (20, N'Sat Sep 03 16:29:02 ICT 2022', N'TS07', 1, 349000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (21, N'Sun Sep 04 21:24:32 ICT 2022', N'TS01', 1, 400000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (22, N'Sun Sep 04 22:07:27 ICT 2022', N'TS07', 3, 1047000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (23, N'Mon Sep 05 09:17:58 ICT 2022', N'TS07', 2, 698000)
INSERT [dbo].[CT_GH] ([idCTGH], [maGioHang], [maTS], [soLuong], [gia]) VALUES (24, N'Mon Sep 05 09:17:58 ICT 2022', N'TS05', 2, 498000)
SET IDENTITY_INSERT [dbo].[CT_GH] OFF
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS01', 0.05)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS02', 0.1)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS06', 0.1)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS07', 0.1)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS08', 0.1)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS09', 0.05)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS10', 0.05)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM01', N'TS11', 0.05)
INSERT [dbo].[CT_KHUYENMAI] ([maKM], [maTS], [phanTramGiam]) VALUES (N'KM02', N'TS01', 0.05)
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Fri Sep 02 09:22:01 ICT 2022', NULL, NULL, N'kh07', NULL, N'Nguyễn Thị ThảoNguyên', N'1/36 Thạnh Lộc, quận 12, tphcm', N'n18dccn133@student.ptithcm.edu.vn', N'0353198388', N'TTGH05', CAST(N'2022-09-02' AS Date), CAST(N'2022-09-05' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Mon Sep 05 09:17:58 ICT 2022', NULL, NULL, N'kh07', NULL, N'Nguyễn Thị ThảoNguyên', N'1/36 Thạnh Lộc', N'n18dccn133@student.ptithcm.edu.vn', N'0353198388', N'TTGH01', CAST(N'2022-09-05' AS Date), CAST(N'2022-09-08' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Sat Aug 27 22:43:04 ICT 2022', N'nv01', NULL, N'kh01', N'Sat Sep 03 14:39:45 ICT 2022', N'Nguyễn Quốc Nhật', N'123 An Phú Đông ahihihihih', NULL, N'0123123122', N'TTGH05', CAST(N'2022-08-27' AS Date), CAST(N'2022-08-30' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Sat Aug 27 22:57:25 ICT 2022', N'nv01', NULL, N'kh01', N'Mon Sep 05 07:52:09 ICT 2022', N'Nguyễn Thị Thảo Nguyên', N'1/36 Thạnh Lộc', NULL, N'0123123122', N'TTGH04', CAST(N'2022-08-27' AS Date), CAST(N'2022-08-30' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Sat Sep 03 09:32:17 ICT 2022', NULL, NULL, N'kh04', NULL, N'Nguyễn VănVịnh', N'1660 Bình Trung', NULL, N'0355177168', N'TTGH05', CAST(N'2022-09-03' AS Date), CAST(N'2022-09-06' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Sat Sep 03 13:29:45 ICT 2022', N'nv01', NULL, N'kh07', N'Sat Sep 03 14:38:29 ICT 2022', N'Nguyễn Thị Thảo Nguyên', N'1/36 Thạnh Lộc, Quận 12, TPHCM', N'n18dccn133@student.ptithcm.edu.vn', N'0353198388', N'TTGH04', CAST(N'2022-09-03' AS Date), CAST(N'2022-09-06' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Sat Sep 03 16:29:02 ICT 2022', N'nv01', NULL, N'kh07', N'Mon Sep 05 09:19:13 ICT 2022', N'Nguyễn Thị ThảoNguyên', N'1/36 Thạnh Lộc, q12, tphcm', N'n18dccn133@student.ptithcm.edu.vn', N'0353198388', N'TTGH03', CAST(N'2022-09-03' AS Date), CAST(N'2022-09-06' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Sun Sep 04 21:24:32 ICT 2022', N'nv03', NULL, N'kh01', N'Sun Sep 04 23:40:23 ICT 2022', N'Nguyễn QuốcNhật', N'123 An Phú Đông, hi', NULL, N'0123123122', N'TTGH04', CAST(N'2022-09-04' AS Date), CAST(N'2022-09-07' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Sun Sep 04 22:07:27 ICT 2022', NULL, NULL, N'kh07', NULL, N'Nguyễn Thị ThảoNguyên', N'1/36 Thạnh Lộc, Quan12, tpchm', N'n18dccn133@student.ptithcm.edu.vn', N'0353198388', N'TTGH05', CAST(N'2022-09-04' AS Date), CAST(N'2022-09-07' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Thu Sep 01 23:24:01 ICT 2022', NULL, NULL, N'kh07', N'Thu Sep 01 23:31:24 ICT 2022', N'Nguyễn Thị ThảoNguyên', N'1/36 Thạnh Lộc, Quận 12, TPHCM', NULL, N'0353198388', N'TTGH05', CAST(N'2022-09-01' AS Date), CAST(N'2022-09-04' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Thu Sep 01 23:30:10 ICT 2022', N'nv01', NULL, N'kh07', N'Sat Sep 03 14:40:42 ICT 2022', N'Nguyễn Thị ThảoNguyên', N'1/36 Thạnh Lộc, Quận 12, TPHCM', NULL, N'0353198388', N'TTGH04', CAST(N'2022-09-01' AS Date), CAST(N'2022-09-04' AS Date))
INSERT [dbo].[GIOHANG] ([maGioHang], [maNVDuyet], [maNVGiao], [maKH], [soHoaDon], [hoTen], [diaChiNhan], [emailNhan], [SDTNhan], [maTrangThaiDonHang], [ngayDat], [ngayGiaoDuKien]) VALUES (N'Wed Aug 31 17:30:25 ICT 2022', NULL, NULL, N'kh04', N'Wed Aug 31 20:21:05 ICT 2022', N'Nguyễn VănVịnh', N'1660 Bình Trung', N'vinh.nv@gmail.com', N'0355177168', N'TTGH05', CAST(N'2022-08-31' AS Date), CAST(N'2022-09-03' AS Date))
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H01', N'Thương hiệu PNJ')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H02', N'Thương hiệu DOJI')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H03', N'Thương hiệu Skymond Luxury')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H04', N'Tierra Diamond - Kim cương Thiên nhiên')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H05', N'Thương hiệu Trang sức Huy Thanh')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H06', N'Thương hiệu Phú Quý')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H07', N'Thương hiệu Bảo Tín Minh Châu')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H08', N'H.A.S')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H09', N'Thương hiệu SJC')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H10', N'Cartino')
INSERT [dbo].[HANGTRANGSUC] ([maHang], [tenHang]) VALUES (N'H11', N'Thương Hiệu TNJ')
SET IDENTITY_INSERT [dbo].[HINHANH] ON 

INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (1, N'TS01', N'https://tnj.vn/16769-large_default/lac-tay-bac-nu-ha-noi-hinh-lap-phuong-dinh-da-dep-ltn0170.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (2, N'TS02', N'https://tnj.vn/42335-large_default/qua-sinh-nhat-cho-ban-than-ltn0198.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (3, N'TS06', N'https://tnj.vn/16636-large_default/nhan-doi-bac-nhan-cap-bac-dep-gia-re-nd0092.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (4, N'TS07', N'https://tnj.vn/17822-large_default/lac-tay-bi-bac-nu-khac-ten-theo-yeu-cau-ltn0146.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (5, N'TS13', N'https://tnj.vn/34176-large_default/qua-sinh-nhat-cho-bo-lta0002.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (6, N'TS08', N'https://tnj.vn/10128-large_default/day-chuyen-bac-nu-hinh-trai-tim-khac-ten-dep-dcn0450.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (7, N'TS09', N'https://tnj.vn/13670-large_default/day-chuyen-bac-nam-1-cay-dck0005.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (8, N'TS10', N'https://tnj.vn/16365-large_default/khuyen-tai-bac-nam-hinh-ngoi-sao-bta0004.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (9, N'TS11', N'https://tnj.vn/37278-large_default/lac-bac-cho-be-khac-ten-hinh-con-ho-ltt0070.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (10, N'TS12', N'https://tnj.vn/16425-large_default/bo-trang-suc-bac-nu-dep-hoa-5-canh-bts0019.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (11, N'TS14', N'https://tnj.vn/17068-large_default/qua-tang-thoi-noi-cho-be-gai-hinh-hello-kitty-dtn0005.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (14, N'TS05', N'https://tnj.vn/40667-large_default/day-chuyen-co-4-la-nam-cham-dcn0561.jpg')
INSERT [dbo].[HINHANH] ([maHA], [maTS], [tenHA]) VALUES (17, N'TS15', N'https://tnj.vn/17852-large_default/lac-tay-pha-le-danh-cho-nu-bang-bac-khac-ten-ltn0176.jpg')
SET IDENTITY_INSERT [dbo].[HINHANH] OFF
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Fri Sep 02 23:25:21 ICT 2022', N'nv01', CAST(N'2022-09-02' AS Date), 648000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Mon Aug 29 22:19:29 ICT 2022', N'nv01', CAST(N'2022-08-29' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Mon Aug 29 23:01:57 ICT 2022', N'nv01', CAST(N'2022-08-29' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Mon Sep 05 07:52:09 ICT 2022', N'nv01', CAST(N'2022-09-05' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Mon Sep 05 09:19:13 ICT 2022', N'nv01', CAST(N'2022-09-05' AS Date), 949000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sat Sep 03 14:37:08 ICT 2022', N'nv01', CAST(N'2022-09-03' AS Date), 598000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sat Sep 03 14:38:29 ICT 2022', N'nv01', CAST(N'2022-09-03' AS Date), 598000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sat Sep 03 14:39:40 ICT 2022', N'nv01', CAST(N'2022-09-03' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sat Sep 03 14:39:45 ICT 2022', N'nv01', CAST(N'2022-09-03' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sat Sep 03 14:40:03 ICT 2022', N'nv01', CAST(N'2022-09-03' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sat Sep 03 14:40:42 ICT 2022', N'nv01', CAST(N'2022-09-03' AS Date), 648000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sat Sep 03 16:29:30 ICT 2022', N'nv01', CAST(N'2022-09-03' AS Date), 949000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sun Sep 04 21:25:03 ICT 2022', N'nv01', CAST(N'2022-09-04' AS Date), 400000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Sun Sep 04 23:40:23 ICT 2022', N'nv03', CAST(N'2022-09-04' AS Date), 400000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Thu Sep 01 23:31:24 ICT 2022', N'nv01', CAST(N'2022-09-01' AS Date), 648000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Tue Aug 30 21:07:19 ICT 2022', N'nv01', CAST(N'2022-08-30' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Tue Aug 30 21:07:23 ICT 2022', N'nv01', CAST(N'2022-08-30' AS Date), 299000, NULL)
INSERT [dbo].[HOADON] ([soHoaDon], [maNV], [ngayTao], [tongTien], [maSoThue]) VALUES (N'Wed Aug 31 20:21:05 ICT 2022', N'nv01', CAST(N'2022-08-31' AS Date), 648000, NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh01', N'tk03', N'Nguyễn Quốc', N'Nhật', N'Nam', N'123 An Phú Đông', N'0123123122', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh02', N'tk07', N'Nguyễn Thị Thảo', N'Nguyên', N'Nữ', N'1/36 Thạnh Lộc', N'0353198388', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh03', N'tk05', N'Tạ Thương', N'Thương', N'Nữ', N'97 Man Thiện', N'0333444556', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh04', N'tk08', N'Nguyễn Văn', N'Vịnh', N'Nam', N'1660 Bình Trung', N'0355177168', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh05', N'tk09', N'Nguyễn Thị', N'Hạnh', N'Nữ', N'1661 Bình Trung', N'0355177167', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh06', N'TK12', N'Nguyễn Tôn Thùy', N'Tiên', N'Nữ', N'Hà Giang', N'0362524088', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh07', N'TK13', N'Nguyễn Thị Thảo', N'Nguyên', N'Nữ', N'1/36 Thạnh Lộc', N'0353198388', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh10', N'tk16', N'Đặng Xinh Lung', N'Linh', N'Nữ', N'Đồng Nai', N'0362608044', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh11', N'tk17', N'Nguyễn Văn', N'Vịnh', NULL, N'1660 Tổ 21 thôn 3 xã bình trung', N'0355177168', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh12', N'tk18', N'Trịnh Văn', N'Bình', N'Nam', N'1660 Tổ 21 thôn 3 xã bình trung', N'0353198388', NULL)
INSERT [dbo].[KHACHHANG] ([maKH], [maTK], [ho], [ten], [gioiTinh], [diaChi], [SDT], [maSoThue]) VALUES (N'kh8', N'tk14', N'Nguyễn Thị Thảo', N'Nguyên', N'Nữ', N'1/36 Thạnh Lộc', N'0353198388', NULL)
INSERT [dbo].[KHUYENMAI] ([maKM], [maNV], [ngayBD], [ngayKT], [moTa]) VALUES (N'KM01', N'nv01', CAST(N'2021-05-07' AS Date), CAST(N'2023-05-09' AS Date), N'Khuyến mãi mừng ngày 2/9')
INSERT [dbo].[KHUYENMAI] ([maKM], [maNV], [ngayBD], [ngayKT], [moTa]) VALUES (N'KM02', N'nv01', CAST(N'2021-05-07' AS Date), CAST(N'2023-06-07' AS Date), N'Khuyến mãi mừng sinh nhật chủ cửa hàng')
INSERT [dbo].[KHUYENMAI] ([maKM], [maNV], [ngayBD], [ngayKT], [moTa]) VALUES (N'KM03', N'nv01', CAST(N'2022-01-04' AS Date), CAST(N'2021-01-05' AS Date), N'Khuyến mãi mừng quốc tế lao động')
INSERT [dbo].[LOAITRANGSUC] ([maLoai], [tenLoai]) VALUES (N'L01', N'Trang sức nữ')
INSERT [dbo].[LOAITRANGSUC] ([maLoai], [tenLoai]) VALUES (N'L02', N'Trang sức đôi')
INSERT [dbo].[LOAITRANGSUC] ([maLoai], [tenLoai]) VALUES (N'L03', N'Trang sức nam')
INSERT [dbo].[LOAITRANGSUC] ([maLoai], [tenLoai]) VALUES (N'L04', N'Trang sức cho bé')
INSERT [dbo].[LOAITRANGSUC] ([maLoai], [tenLoai]) VALUES (N'L05', N'Trang sức cài áo')
INSERT [dbo].[LOAITRANGSUC] ([maLoai], [tenLoai]) VALUES (N'L06', N'Quà tặng')
INSERT [dbo].[NHACUNGCAP] ([maNCC], [tenNCC], [diaChi], [email], [SDT]) VALUES (N'NCC01', N'Trang sức bạc Glosbe ', N'55 Đường 3/2, Phường 11, Quận 10, Thành phố Hồ Chí Minh', N'glosbejewelry@gmail.com', N'0901331767')
INSERT [dbo].[NHACUNGCAP] ([maNCC], [tenNCC], [diaChi], [email], [SDT]) VALUES (N'NCC02', N'Bảo Ngọc Jewelry', N'Số 9/4/47 Nguyên Hồng, Đống Đa, Hà Nội', N'tsbaongoc@gmail.com', N'0963453432')
INSERT [dbo].[NHACUNGCAP] ([maNCC], [tenNCC], [diaChi], [email], [SDT]) VALUES (N'NCC03', N'H.A.S JEWELRY SILVER', N'61 Tú Xương, Phường 7, Quận 3,  TPHCM', N'hasjewelry@gmail.com', N'0932733024')
INSERT [dbo].[NHANVIEN] ([maNV], [maTK], [ho], [ten], [gioiTinh], [ngaySinh], [diaChi], [SDT], [email]) VALUES (N'nv01', N'tk1', N'Nguyễn Thảo', N'Nguyên', N'nữ', CAST(N'2000-05-07' AS Date), N'1/36 Thạnh Lộc', N'0353198388', N'nttnguyen05072000@gmail.com')
INSERT [dbo].[NHANVIEN] ([maNV], [maTK], [ho], [ten], [gioiTinh], [ngaySinh], [diaChi], [SDT], [email]) VALUES (N'nv02', N'tk2', N'Ngô Thu', N'Hà', N'nữ', CAST(N'2000-02-04' AS Date), N'123 Hồ Chí Minh', N'0353198300', N'nth02042000@gmail.com')
INSERT [dbo].[NHANVIEN] ([maNV], [maTK], [ho], [ten], [gioiTinh], [ngaySinh], [diaChi], [SDT], [email]) VALUES (N'nv03', N'tk06', N'Nguyễn Anh', N'Khoa', N'nam', CAST(N'2000-01-10' AS Date), N'123 Láng Lớn', N'0971037548', N'nak039@gmail.com')
INSERT [dbo].[QUYEN] ([maQuyen], [tenQuyen]) VALUES (N'q01', N'Admin')
INSERT [dbo].[QUYEN] ([maQuyen], [tenQuyen]) VALUES (N'q02', N'Khách hàng')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk03', N'q02', N'nqn21052000@gmail.com', N'12312312', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk04', N'q02', N'dotam1234@gmail.com', N'14725836', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk05', N'q02', N'thuong.tt@gmail.com', N'98765432', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk06', N'q01', N'nak039@gmail.com', N'NaoCaVang123', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk07', N'q02', N'nguyen.ntt@gmail.com', N'NguyenCute@@', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk08', N'q02', N'vinh.nv@gmail.com', N'P@ssw0rd!', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk09', N'q02', N'hanh.nt@gmail.com', N'P@ssw0rd!', N'TT02')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk1', N'q01', N'nttnguyen05072000@gmail.com', N'711958', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk10', N'q01', N'nhat.nq@gmail.com', N'12345678!', N'TT02')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk11', N'q02', N'tam.dt@gmail.com', N'tam2002@', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk12', N'q02', N'thuytien@gmail.com', N'123', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk13', N'q02', N'n18dccn133@student.ptithcm.edu.vn', N'12345678', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk14', N'q02', N'abc.test3@gmail.com', N'12345678', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk16', N'q02', N'abc1@gmail.com', N'147258', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk17', N'q02', N'vinh.nv05@gmail.com', N'12345678', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk18', N'q02', N'nttnguyen05072002@gmail.com', N'147258', N'TT01')
INSERT [dbo].[TAIKHOAN] ([maTK], [maQuyen], [email], [password], [maTrangThaiTK]) VALUES (N'tk2', N'q01', N'nth02042000@gmail.com', N'02042000@@', N'TT01')
SET IDENTITY_INSERT [dbo].[THAYDOIGIA] ON 

INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (3, N'TS01', CAST(N'2022-07-07' AS Date), N'nv01', 300000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (4, N'TS02', CAST(N'2022-07-18' AS Date), N'nv01', 450000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (8, N'TS06', CAST(N'2022-01-01' AS Date), N'nv01', 449000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (9, N'TS08', CAST(N'2022-05-15' AS Date), N'nv01', 299000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (10, N'TS07', CAST(N'2022-04-30' AS Date), N'nv01', 349000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (11, N'TS09', CAST(N'2022-08-01' AS Date), N'nv01', 199000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (12, N'TS10', CAST(N'2022-07-30' AS Date), N'nv01', 119000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (13, N'TS11', CAST(N'2022-07-30' AS Date), N'nv01', 409000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (16, N'TS12', CAST(N'2022-07-30' AS Date), N'nv01', 349000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (17, N'TS13', CAST(N'2022-07-29' AS Date), N'nv01', 1150000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (18, N'TS14', CAST(N'2022-07-29' AS Date), N'nv01', 279000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (20, N'TS01', CAST(N'2022-09-07' AS Date), N'nv01', 300000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (25, N'TS01', CAST(N'2022-08-01' AS Date), N'nv01', 275000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (26, N'TS06', CAST(N'2022-08-18' AS Date), N'nv01', 439000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (27, N'TS05', CAST(N'2022-09-01' AS Date), N'nv01', 249000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (28, N'TS15', CAST(N'2022-08-01' AS Date), N'nv01', 499000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (29, N'TS09', CAST(N'2022-08-31' AS Date), N'nv01', 1150000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (30, N'TS01', CAST(N'2022-09-01' AS Date), N'nv01', 400000)
INSERT [dbo].[THAYDOIGIA] ([idThayDoi], [maTS], [ngayApDung], [maNV], [gia]) VALUES (31, N'TS01', CAST(N'2022-09-01' AS Date), N'nv01', 350000)
SET IDENTITY_INSERT [dbo].[THAYDOIGIA] OFF
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS01', N'L01', N'H08', N'NCC03', N'Lắc tay bạc nữ Hà Nội hình lập phương đính đá LTN0170', 25, N'<li>Lắc tay bạc nữ chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N'<h2 class="product-description__title" style="text-align: left;">Giới thiệu sản phẩm lắc tay bạc nữ Hà Nội hình lập phương đính đá đẹp LTN0170</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - <span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/17-lac-tay-bac-nu">Lắc tay bạc nữ</a>  </strong></em></span>Hà Nội<i><span style="text-decoration: underline;"> </span></i>hình lập phương đính đá<strong></strong><span style="text-decoration: underline;"><em><strong> </strong></em></span>LTN0170</span><span style="height: auto; font-weight: bolder;"><span style="font-weight: bolder; height: auto;"> </span>được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">  Lắc tay bạc nữ được thiết kế cách điệu cực HOT - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 lắc tay </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Lắc tay bạc nữ Hà Nội hình lập phương đính đá đẹp LTN0170 - Biểu tượng cho tình yêu vĩnh cửu rất phù hợp để làm quà tặng cho dịp lễ tết Valentine, 20/10, Noel,... sắp tới</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc cao cấp 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá của 1 lắc tay</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết lắc tay bạc nữ Hà Nội hình lập phương đính đá đẹp LTN0170</h2>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0170/lac-tay-bac-nu-hinh-lap-phuong-LTN0170-8.jpg" alt="Lắc tay bạc nữ Hà Nội hình lập phương đính đá LTN0170" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay bạc nữ được làm từ chất liệu bạc cao cấp 925</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0170/lac-tay-bac-nu-ha-noi-hinh-lap-phuong-LTN0170-14.jpg" alt="Lắc tay bạc nữ Hà Nội hình lập phương đính đá LTN0170" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay bạc nữ Hà Nội hình lập phương đính đá đẹp LTN0170</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0170/lac-tay-bac-nu-ha-noi-hinh-lap-phuong-LTN0170-10.jpg" alt="Lắc tay bạc nữ Hà Nội hình lập phương đính đá LTN0170" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0170/lac-tay-bac-nu-ha-noi-hinh-lap-phuong-LTN0170-12.jpg" alt="Lắc tay bạc nữ Hà Nội hình lập phương đính đá LTN0170" width="900" height="900" /></p>
<h3 style="text-align: center;"><strong>Hình ảnh móc chờ của lắc tay bạc nữ LTN0170</strong></h3>
<p><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0170/lac-tay-bac-nu-ha-noi-hinh-lap-phuong-LTN0170-7.jpg" alt="Lắc tay bạc nữ Hà Nội hình lập phương đính đá LTN0170" width="900" height="900" /></p>
<h3 style="text-align: center;"><strong> Hình ảnh  cụ thể sản phẩm lắc tay bạc nữ LTN0170 khi đeo trên tay</strong></h3>
<p><strong><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0170/lac-tay-bac-nu-ha-noi-hinh-lap-phuong-LTN0170-6.jpg" alt="Lắc tay bạc nữ Hà Nội hình lập phương đính đá LTN0170" width="900" height="900" /></strong></p>
<h2><strong>Tại sao bạn nên mua </strong>lắc tay bạc nữ <strong>tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất lắc tay bạc nữ lập phương tại Trang Sức TNJ</strong></strong></h2>
<p><span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/17-lac-tay-bac-nu">Lắc tay nữ bạc</a></strong></em></span> Hà Nội hình lập phương LTN0170 được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj-10.jpg" alt="xưởng sản xuất trang sức tnj" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/khac-ten-theo-yeu-cau-tren-cong-nghe-laser-hien-dai-1 .jpg" alt="khắc tên trên công nghệ laser hiện đại" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2>Hộp đựng sản phẩm sang trọng đi kèm</h2>
<p><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></p>
<p><strong>Lắc tay bạc nữ Hà Nội hình lập phương đẹp LTN0170</strong> chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Còn hàng', 400000, 16, 1)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS02', N'L02', N'H11', N'NCC03', N'Quà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198', 20, N'<li>Lắc tay hồ ly chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N'<h2 class="product-description__title">Giới thiệu sản phẩm quà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - <a href="https://tnj.vn/17-lac-tay-bac-nu">Lắc tay bạc nữ</a> hồ ly LTN0198</span><span style="height: auto; font-weight: bolder;"><span style="font-weight: bolder; height: auto;"> </span>được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">  Lắc tay bạc nữ được thiết kế cách điệu cực HOT với mặt hồ ly - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 lắc tay </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Lắc tay hồ ly bạc LTN0198 khi đeo lên mang lại nhiều may mắn đặc biệt trong đường tình duyên và gia đình phù hợp làm quà tặng cho dịp lễ tết Valentine, quà sinh nhật, 20/10, Noel,... sắp tới</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc cao cấp 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Lắc dài 16cm và 1 đoạn móc chờ có thể điều chỉnh được rộng chật ( thiết kế phù hợp cho các bạn nữ đeo)</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá của 1 lắc tay</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết q<a href="https://tnj.vn/lac-tay-bac-nu/1400-lac-tay-ho-ly-bac-ltn0198.html">uà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198</a></h2>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0198-1/qua-sinh-nhat-cho-ban-than-LTN0198-4.jpg" alt="Quà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay hồ ly được làm từ chất liệu bạc cao cấp 925</h3>
<p><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0198-1/qua-sinh-nhat-cho-ban-than-LTN0198.jpg" alt="Quà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198" width="900" height="900" /></p>
<h3 style="text-align: center;">Quà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198</h3>
<p><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0198-1/qua-sinh-nhat-cho-ban-than-LTN0198-2.jpg" alt="Quà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay hồ ly được bảo hành trọn đời đánh bóng làm mới và rơi đá miễn phí</h3>
<p><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0198-1/qua-sinh-nhat-cho-ban-than-LTN0198-1.jpg" alt="Quà sinh nhật cho bạn thân lắc tay hồ ly bạc LTN0198" width="900" height="900" /></p>
<p><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0198/lac-tay-ho-ly-bac-LTN0198.jpg" alt="Lắc tay hồ ly bạc LTN0198 " width="900" height="900" /></p>
<p></p>
<h3 style="text-align: center;"><strong> Hình ảnh cụ thể sản phẩm lắc bạc bạc nữ hồ ly LTN0198 khi đeo trên tay</strong></h3>
<p><strong><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0198/lac-tay-ho-ly-bac-LTN0198-1.jpg" alt="Lắc tay hồ ly bạc LTN0198 " width="900" height="900" /></strong></p>', N'Còn hàng', 450000, 1, 0)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS05', N'L01', N'H11', N'NCC03', N'Dây chuyền cỏ 4 lá nam châm DCN0561', 9, N'<li>Dây chuyền cỏ 4 lá chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N'<h2 class="product-description__title">Giới thiệu sản phẩm dây chuyền cỏ 4 lá nam châm DCN0561</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - </span><span style="height: auto; font-weight: bolder;"><span color="#666666" face="Montserrat, sans-serif" style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><b>Dây chuyền cỏ 4 lá nam châm DCN0561 </b></span><span style="font-size: 14px; font-weight: bolder;">được khách hàng lựa chọn nhiều nhất</span></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/16-day-chuyen-bac-nu">Dây chuyền bạc nữ</a> </strong></em></span>được thiết kế cách điệu cực HOT - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 dây + mặt sản phẩm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Dây chuyền cỏ 4 lá nam châm DCN0561 k<span style="box-sizing: inherit;">hi đeo lên nó mang đến niềm tin, hi vọng, tình yêu và sự may mắn cho người đeo,</span> rất phù hợp để làm quà tặng cho dịp lễ tết Valentine, 20/10, Noel,... sắp tới</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu<strong><a href="https://tnj.vn/tin-tuc/bac-925-la-gi.html"> Bạc cao cấp 925</a> </strong><strong> </strong>. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Khắc tên hoặc ngày tháng miễn phí lên sản phẩm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá cho 1 dây kèm mặt</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1.5rem; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Dây dài 45cm shop thiết kế phù hợp cho các bạn nữ đeo</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/day-chuyen-bac-nu/3194-day-chuyen-co-4-la-nam-cham-dcn0561.html">dây chuyền cỏ 4 lá nam châm DCN0561</a></h2>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0561/DCN0561-trang/day-chuyen-co-4-la-nam-cham-DCN0561-20.jpg" alt="Dây chuyền cỏ 4 lá nam châm DCN0561" width="900" height="900" /></p>
<h3 style="text-align: center;">Dây chuyền được làm từ chất liệu bạc cao cấp 925 và được xi vàng trắng</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0561/DCN0561-trang/day-chuyen-co-4-la-nam-cham-DCN0561-22.jpg" alt="Dây chuyền cỏ 4 lá nam châm DCN0561" width="900" height="900" /></p>
<h3 style="text-align: center;">Dây chuyền cỏ 4 lá nam châm DCN0561</h3>
<p><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0561/DCN0561-trang/day-chuyen-co-4-la-nam-cham-DCN0561-23.jpg" alt="Dây chuyền cỏ 4 lá nam châm DCN0561" width="900" height="900" /></p>
<h3 style="text-align: center;">Dây chuyền cỏ 4 lá được bảo hành trọn đời đánh bóng làm mới và rơi đá miễn phí</h3>
<p><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0561/DCN0561-trang/day-chuyen-co-4-la-nam-cham-DCN0561-24.jpg" alt="Dây chuyền cỏ 4 lá nam châm DCN0561" width="900" height="900" /></p>
<p><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0561/DCN0561-trang/day-chuyen-co-4-la-nam-cham-DCN0561-26.jpg" alt="Dây chuyền cỏ 4 lá nam châm DCN0561" width="900" height="900" /></p>
<h3 style="text-align: center;">Hình ảnh cụ thể sản phẩm dây chuyền cỏ 4 lá nam châm DCN0561 khi đeo lên cổ</h3>
<p><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0561/DCN0561-trang/day-chuyen-co-4-la-nam-cham-DCN0561-25.jpg" alt="Dây chuyền cỏ 4 lá nam châm DCN0561" width="900" height="900" /></p>
<h2><strong>Tại sao bạn nên mua dây chuyền cỏ 4 lá nam châm tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>', N'Còn hàng', 249000, 16, 1)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS06', N'L02', N'H11', N'NCC03', N'Nhẫn đôi bạc nhẫn cặp bạc đẹp giá rẻ ND0092', 0, N'<li>Chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N'<h2 class="product-description__title">- Giới thiệu sản phẩm nh<span style="font-weight: bolder; height: auto;">ẫn đôi bạc nhẫn cặp bạc đẹp đính đá ND0092 </span></h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">- <span style="height: auto; font-weight: bolder;">Nhẫn đôi bạc nhẫn cặp bạc đẹp giá rẻ ND0092 được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> <span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/30-nhan-doi-bac-nhan-cap-bac">Nhẫn cặp bạc</a></strong></em></span> được thiết kế cách điệu cực HOT - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Kích cỡ: Bạn đừng quá lo lắng vì tay mình  quá to hay quá nhỏ không có size nhẫn?</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Bởi vì nhẫn được làm theo size tay của khách hàng (có hướng dẫn đo size tay chi tiết) hoặc bạn có thể nhắn tin với shop để được tư vấn cụ thể hơn nhé.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 nhẫn nam và 1 nhẫn nữ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Nhẫn cặp bạc đính đá tinh tế ND0092 <span style="box-sizing: inherit;">minh chứng cho tình yêu, bảo vệ người bạn quan tâm, đặc biệt tượng trưng cho tình yêu thiêng liêng, cao cả</span><span face="arial" size="3" style="box-sizing: inherit; font-family: arial; font-size: medium;"> </span><span color="#666666" face="Montserrat, sans-serif" style="box-sizing: inherit;">rất phù hợp để làm quà tặng cho dịp lễ tết Valentine, 20/10, Noel,... sắp tới</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc cao cấp 925 . Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá cho 1 cặp</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Khắc tên + ngày tháng năm sinh và các kí tự đặc biệt như: trái tim, cỏ 4 lá,... miễn phí theo yêu cầu</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Shop khắc tên trong lòng nhẫn nhé</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hàng y hình và có video chi tiết, sản phẩm đã được kiểm duyệt nên các bạn yên tâm về chất lượng & mẫu mã sản phẩm nhé</p>
<h2>Hình ảnh chi tiết <a href="https://tnj.vn/nhan-doi-bac-nhan-cap-bac/139-17298-nhan-doi-bac-nhan-cap-bac-dep-tinh-te-nd0092.html">nhẫn cặp bạc đẹp ND0092</a></h2>
<div class="video-ctn"><iframe width="900" height="506" src="https://www.youtube.com/embed/h3hOq5WR6Bc?controls=0" frameborder="0"></iframe></div>
<h3 style="text-align: center;">Video quay chi tiết sản phẩm nhẫn đôi bạc đẹp giá rẻ ND0092</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/nhan-doi-bac/ND0092/nhan-doi-bac-nhan-cap-bac-dep-ND0092-34.jpg" alt="Nhẫn đôi bạc nhẫn cặp bạc đẹp giá rẻ ND0092" width="900" height="900" /></p>
<h3 style="text-align: center;">Nhẫn đôi bạc được làm từ chất liệu bạc cao cấp 925</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/nhan-doi-bac/ND0092/nhan-doi-bac-nhan-cap-bac-dep-ND0092-32.jpg" alt="Nhẫn đôi bạc nhẫn cặp bạc đẹp tinh tế ND0092" width="900" height="900" /></p>
<h3 style="text-align: center;">Bản nhẫn được thiết kế nhẹ nhàng ,lên tay rất nhẹ nhàng và ôm tay</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/nhan-doi-bac/ND0092/nhan-doi-bac-nhan-cap-bac-dep-ND0092-33.jpg" alt="Nhẫn đôi bạc nhẫn cặp bạc đẹp tinh tế ND0092" width="900" height="900" /></p>
<h3 style="text-align: center;">Nhẫn được đính đá cubic zirconia chống trầy xước</h3>
<p><img src="https://tnj.vn/img/cms/nhan-doi-bac/ND0092/nhan-doi-bac-nhan-cap-bac-dep-ND0092-30.jpg" alt="Nhẫn đôi bạc nhẫn cặp bạc đẹp tinh tế ND0092" width="900" height="900" /></p>
<h3 style="text-align: center;">Nhẫn được bảo hành miễn phí trọn đời đánh bóng,làm mới ,rơi đá    </h3>
<p><img src="https://tnj.vn/img/cms/nhan-doi-bac/ND0092/nhan-doi-bac-nhan-cap-bac-dep-ND0092-31.jpg" alt="Nhẫn đôi bạc nhẫn cặp bạc đẹp tinh tế ND0092" width="900" height="900" /></p>
<h2><strong>Tại sao bạn nên mua nhẫn đôi bạc tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất nhẫn đôi bạc Trang Sức TNJ</strong></strong></h2>
<p><span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/30-nhan-doi-bac-nhan-cap-bac">Nhẫn đôi nhẫn</a> </strong></em></span>khắc tên đẹp ND0092 được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj-12.png" alt="xưởng tnj" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/khac-ten-theo-yeu-cau-tren-cong-nghe-laser-hien-dai-1 .jpg" alt="khắc tên trên công nghệ lasere hiện đại" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="anh-cua-hang-trang-suc-tnj" width="900" height="506" /></p>
<p><strong>Hướng dẫn cách đo size nhẫn:</strong></p>
<p><strong>CÁCH 1: </strong>Nếu có một chiếc nhẫn khác để đo, cách chính xác nhất là bạn dùng một chiếc nhẫn có độ rộng và kiểu dáng tương tự bạn định mua và làm theo các bước:</p>
<p>Bước 1: Quý khách dùng thước để đo đường kính bên trong của chiếc nhẫn.</p>
<p><img src="https://tnj.vn/img/cms/do-duong-kinh-ben-trong-nhan.jpg" alt="cách đo size nhẫn" style="margin-left: auto; margin-right: auto;" width="409" height="224" /></p>
<p>Bước 2: Quý khách đối chiếu số mm của thước với kích thước đường kính của những ni nhẫn sau.</p>
<p>Bước 3: Size nhẫn của bạn chính là ký tự ghi trên vòng tròn của ảnh bên dưới</p>
<p><img src="https://tnj.vn/img/cms/bang-size-nhan-chuan.jpg" alt="bảng đo size nhẫn" style="margin-left: auto; margin-right: auto;" width="900" height="650" /></p>
<p><strong>CÁCH 2:</strong></p>
<p>Lấy một sợi dây chỉ mảnh hoặc mảnh giấy nhỏ hình chữ nhật (Như hình ), quấn quanh ngón tay cần đeo nhẫn, đánh dấu, sau đó duổi thẳng sợi dây và dùng thước kẻ đo chính xác từng  mm. Trường hợp xương khớp ngón tay của bạn to, thì bạn nên đo chu vi ở gần khớp dưới (không phải trên khớp) Sao cho khi đeo nhẫn dễ vào nhưng không bị tuột mất. Sau đó lấy số mm đo được chia cho 3.14 ra được kết quả đường kính chiếc nhẫn và đối chiếu với bảng size bên trên.</p>
<p><img src="https://tnj.vn/img/cms/do-size-tay-chuan-1.png" alt="cách đo size nhẫn" style="margin-left: auto; margin-right: auto;" width="788" height="252" /></p>
<p><strong>CÁCH 3: </strong>Tính ni tay theo chiều cao và cân nặng</p>
<p><img src="https://tnj.vn/img/cms/huongdan5.jpg" alt="cách đo size nhẫn" style="margin-left: auto; margin-right: auto;" width="784" height="185" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/huongdan6.jpg" alt="cách đo size nhẫn" width="784" height="194" /></p>
<h2>Hộp đựng sản phẩm sang trọng đi kèm</h2>
<p><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></p>
<p><strong>Nhẫn đôi nhẫn cặp bạc đẹp ND0092</strong> chắc chắn sẽ làm 2 bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 luôn hỗ trợ bạn!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Hết hàng', 439000, 20, 0)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS07', N'L01', N'H11', N'NCC03', N'Lắc tay bi bạc nữ khắc tên theo yêu cầu LTN0146', 17, N'<li>Lắc tay bi bạc khắc tên chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N'<h2 class="product-description__title">Giới thiệu sản phẩm lắc tay bi bạc nữ khắc tên theo yêu cầu LTN0146</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - Lắc tay bi bạc nữ khắc tên LTN0146</span><span style="height: auto; font-weight: bolder;"><span style="font-weight: bolder; height: auto;"> </span>được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">  <a href="https://tnj.vn/17-lac-tay-bac-nu"><strong>Lắc tay bạc nữ</strong></a> được thiết kế cách điệu cực HOT với những viên bi bạc liền nhau và khắc tên miễn phí theo yêu cầu - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 lắc tay </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Lắc tay bi bạc nữ khắc tên theo yêu cầu LTN0146 - Có phần khắc tên theo yêu cầu rất ý nghĩa phù hợp để làm quà tặng cho dịp sinh nhật, ngày lễ tết Valentine, 20/10, Noel,... sắp tới</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc cao cấp 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá của 1 lắc tay</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Khắc tên hoặc ngày tháng miễn phí theo yêu cầu ( sản phẩm khắc được 2 mặt )</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Lắc dài 16cm shop thiết kế phù hợp cho các bạn nữ đeo ( có thể nối dài miễn phí theo yêu cầu )</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/danh-mc/677-lac-tay-bac-nu-bi-bac-doc-dao-sang-trong-ltn0146.html">lắc tay bạc nữ bi bạc khắc tên theo yêu cầu LTN0146</a></h2>
<p><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0146/lac-tay-bac-nu-vong-bi-bac-doc-dao-sang-trong-LTN0146-10.jpg" alt="Lắc tay bi bạc nữ độc đáo và sang trọng khắc tên LTN0146" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay bi bạc nữ được làm từ chất liệu bạc nguyên chất </h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0146/lac-tay-bac-nu-vong-bi-bac-doc-dao-sang-trong-LTN0146-14.jpg" alt="Lắc tay bi bạc nữ độc đáo và sang trọng khắc tên LTN0146" width="900" height="900" /></p>
<h3 style="text-align: center;"> Lắc tay bi bạc nữ độc đáo và sang trọng LTN0146</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0146/lac-tay-bac-nu-vong-bi-bac-doc-dao-sang-trong-LTN0146-12.jpg" alt="Lắc tay bi bạc nữ độc đáo và sang trọng khắc tên LTN0146" width="900" height="900" /></p>
<h3 style="text-align: center;"> Lắc tay bi bạc nữ được bảo hành trọn đời đánh bóng làm mới</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0146/lac-tay-bac-nu-vong-bi-bac-doc-dao-sang-trong-LTN0146-13.jpg" alt="Lắc tay bi bạc nữ độc đáo và sang trọng khắc tên LTN0146" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0146/lac-tay-bac-nu-vong-bi-bac-doc-dao-sang-trong-LTN0146-15.jpg" alt="Lắc tay bi bạc nữ khắc tên theo yêu cầu LTN0146" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0146/lac-tay-bac-nu-vong-bi-bac-doc-dao-sang-trong-LTN0146-6.jpg" alt="Lắc tay bi bạc nữ độc đáo và sang trọng LTN0146" width="900" height="900" /></p>
<h3 style="text-align: center;">Hình ảnh thực tế sản phẩm lắc tay bi bạc nữ LTN0146 khi đeo trên tay</h3>
<h2 style="text-align: left;"><strong>Tại sao bạn nên mua </strong>lắc tay bi bạc khắc tên <strong>tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất lắc tay bi bạc sang trọng tại Trang Sức TNJ</strong></strong></h2>
<p><strong><a href="https://tnj.vn/17-lac-tay-bac-nu">Lắc tay nữ bạc </a></strong><a href="https://tnj.vn/17-lac-tay-bac-nu">k</a>hắc tên LTN0146<strong> </strong>được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj-10.jpg" alt="xưởng sản xuất trang sức tnj" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2> Hộp đựng sản phẩm sang trọng đi kèm </h2>
<p><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></p>
<p><strong>Lắc tay bi bạc nữ khắc tên theo yêu cầu LTN0146</strong> chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Còn hàng', 349000, 45, 1)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS08', N'L01', N'H08', N'NCC03', N'Dây chuyền bạc nữ khắc tên hình trái tim DCN0460', 10, N'<li>Dây chuyền bạc nữ khắc tên chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N' <h2 class="product-description__title">Giới thiệu sản phẩm dây chuyền bạc nữ khắc tên hình trái tim DCN0460</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - Dây chuyền bạc khắc tên hình trái tim</span><span style="height: auto; font-weight: bolder;"><span style="font-weight: bolder; height: auto;"><span><span style="font-size: 14px; font-weight: bolder;"><span><span style="font-size: 14px; font-weight: bolder;"><span><span><b> DCN0460</b></span><span style="font-size: 14px; font-weight: bolder;"> </span></span></span></span></span></span></span><span><span style="font-size: 14px; font-weight: bolder;">được khách hàng lựa chọn nhiều nhất</span></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">  <span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/16-day-chuyen-bac-nu">Dây chuyền bạc nữ</a></strong></em></span> khắc tên hình trái tim được thiết kế cách điệu được khắc tên theo yêu cầu cực HOT - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 dây + mặt sản phẩm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Dây chuyền bạc nữ khắc tên hình trái tim DCN0460 biểu tượng cho tình yêu vĩnh cửu và mãi mãi rất phù hợp để làm quà tặng cho dịp lễ tết Valentine, 20/10, Noel,... sắp tới</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu <strong><a href="https://tnj.vn/tin-tuc/bac-925-la-gi.html">Bạc cao cấp 925</a></strong>. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá cho 1 dây kèm mặt</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Khắc tên hoặc ngày tháng miễn phí theo yêu cầu</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Dây chuyền dài 45cm có thể cắt ngắn hoặc nối dài dây theo yêu cầu</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/day-chuyen-bac-nu/957-day-chuyen-bac-nu-khac-ten-hinh-trai-tim-dcn0460.html">dây chuyền bạc nữ khắc tên hình trái tim DCN0460</a></h2>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0460-1/day-chuyen-bac-nu-khac-ten-theo-yeu-cau-DCN0460-1.jpg" alt="Dây chuyền bạc nữ khắc tên hình trái tim DCN0460" width="900" height="900" /></p>
<h3 style="text-align: center;"> Dây chuyền bạc nữ được làm từ chất liệu bạc cao cấp 925</h3>
<p><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0460-1/day-chuyen-bac-nu-khac-ten-theo-yeu-cau-DCN0460-3.jpg" alt="Dây chuyền bạc nữ khắc tên hình trái tim DCN0460" width="900" height="900" /></p>
<h3 style="text-align: center;">Dây chuyền bạc nữ khắc tên hình trái tim DCN0460</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0460-1/day-chuyen-bac-nu-khac-ten-theo-yeu-cau-DCN0460-7.jpg" alt="Dây chuyền bạc nữ khắc tên hình trái tim DCN0460" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/day-chuyen-kem-mat-nu/DCN0460-1/day-chuyen-bac-nu-khac-ten-theo-yeu-cau-DCN0460.jpg" alt="Dây chuyền bạc nữ khắc tên hình trái tim DCN0460" width="900" height="900" /></p>
<h3 style="text-align: center;">Hình ảnh cụ thể sản phẩm dây chuyền bạc nữ khắc tên hình trái tim DCN0460 khi đeo trên cổ</h3>
<h2><strong>Tại sao bạn nên mua dây chuyền bạc nữ khắc tên tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất dây chuyền bạc nữ khắc tên tại Trang Sức TNJ</strong></strong></h2>
<p><span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/16-day-chuyen-bac-nu">Dây chuyền bạc nữ</a></strong></em></span> khắc tên hình trái tim DCN0460 được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><iframe width="900" height="506" src="https://www.youtube.com/embed/Wm8to68EPRw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe></p>
<h3 style="text-align: center;">Trang Sức TNJ trong bản tin Chào Buổi Sáng của truyền hình quốc gia trên VTV1</h3>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj-12.png" alt="xưởng tnj" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/khac-ten-theo-yeu-cau-tren-cong-nghe-laser-hien-dai-1 .jpg" alt="khắc tên trên công nghệ laser hiện đại" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2>Hộp đựng sản phẩm sang trọng đi kèm  </h2>
<p><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></p>
<p><strong>Dây chuyền bạc nữ khắc tên</strong> <strong>hình trái tim DCN0460</strong> chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Còn hàng', 299000, 129, 1)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS09', N'L03', N'H08', N'NCC03', N'Dây chuyền bạc nam 1 cây DCK0005', 0, N'<li>Chất liệu bạc nguyên chất 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N' <h2 class="product-description__title" style="text-align: left;">Giới thiệu sản phẩm dây chuyền bạc nam 1 cây DCK0005</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - Dây chuyền bạc nam 1 cây DCK0005 </span><span style="height: auto; font-weight: bolder;">được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><strong> <a href="https://tnj.vn/65-day-chuyen-bac-nam"> Dây chuyền bạc nam</a> </strong>được thiết kế cách điệu kiểu dáng vảy rồng cực HOT - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 dây</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Dây chuyền bạc nam 1 cây rất phù hợp dành cho các anh em cá tính, mang đến sự nam tính, sang trọng cho người đeo, rất phù hợp để làm quà tặng sinh nhật, các ngày lễ lớn trong năm, nhân dịp Noel, ngày kỉ niệm cho các bạn nam...vv</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc nguyên chất 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá cho 1 dây trọng lượng 1 cây</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">Ngoài ra các bạn còn có thể mua trọng lượng tùy theo ý của mình như 1 cây, 2 cây, 3 cây ... 10 cây</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Dây chuyền dài khoảng 52cm </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 100% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/day-chuyen-bac-nam/868-day-chuyen-bac-nam-1-cay-dck0005.html">dây chuyền bạc nam 1 cây DCK0005</a></h2>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/day-chuyen-nam-bac/DCK0005/day-chuyen-bac-nam-1-cay-DCK0005.jpg" alt="Dây chuyền bạc nam 1 cây DCK0005" width="900" height="900" /></p>
<p></p>
<h3 style="text-align: center;"><strong> Dây chuyền bạc nam được làm từ bạc nguyên chất 925</strong></h3>
<p><strong><img src="https://tnj.vn/img/cms/day-chuyen-nam-bac/DCK0005/day-chuyen-bac-nam-1-cay-DCK0005-4.jpg" alt="Dây chuyền bạc nam 1 cây DCK0005" width="900" height="900" /></strong></p>
<p></p>
<p></p>
<h3 style="text-align: center;">Dây chuyền bạc nam 1 cây DCK0005<strong> </strong></h3>
<p><strong><img src="https://tnj.vn/img/cms/day-chuyen-nam-bac/DCK0005/day-chuyen-bac-nam-1-cay-DCK0005-2.jpg" alt="Dây chuyền bạc nam 1 cây DCK0005" width="900" height="900" /></strong></p>
<p></p>
<h3 style="text-align: center;"><strong> Dây chuyền bạc nam được bảo hành trọn đời đánh bóng làm mới miễn phí</strong></h3>
<p><strong><img src="https://tnj.vn/img/cms/day-chuyen-nam-bac/DCK0005/day-chuyen-bac-nam-1-cay-DCK0005-6.jpg" alt="Dây chuyền bạc nam 1 cây DCK0005" width="900" height="900" /></strong></p>
<p><strong><img src="https://tnj.vn/img/cms/day-chuyen-nam-bac/DCK0005/day-chuyen-bac-nam-1-cay-DCK0005-10.jpg" alt="Dây chuyền bạc nam 1 cây DCK0005" width="900" height="900" /></strong></p>
<h3 style="text-align: center;"><strong>Hình ảnh cụ thể sản phẩm dây chuyền bạc nam 1 cây khi đeo trên cổ</strong></h3>', N'Đang nhập hàng', 1150000, 43, 0)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS10', N'L03', N'H08', N'NCC03', N'Khuyên tai bạc nam hình ngôi sao BTA0004', 0, N'<li>Chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung mạnh mẽ nam tính</li>', N'<h2 class="product-description__title" style="text-align: left;">Giới thiệu sản phẩm khuyên tai bạc hình ngôi sao BTA0004</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Khuyên tai bạc nam hình ngôi sao</span><span style="height: auto; font-weight: bolder;"><span style="height: auto; font-weight: bolder;"> </span>được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><strong><a href="https://tnj.vn/73-khuyen-tai-bac-nam">Khuyên tai bạc nam</a></strong> được thiết kế cách điệu cực HOT  - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 cặp khuyên tai</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Khuyên tai bạc nam hình ngôi sao BTA0004 đeo lên tai thể hiện sự cá tính mạnh mẽ,sang trọng cho người đeo</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc cao cấp 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá cho 1 cặp</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/danh-mc/975-khuyen-tai-bac-nam-hinh-ngoi-sao-bta0004.html">khuyên tai bạc nam hình ngôi sao BTA0004</a></h2>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/Bong-tai-nam/BTA0004/khuyen-tai-nam-hinh-ngoi-sao-BTA0004-5.jpg" alt="Khuyên tai bạc nam hình ngôi sao BTA0004" width="900" height="900" /></p>
<h3 style="text-align: center;">Khuyên tai bạc nam được làm từ chất liệu bạc cao cấp 925</h3>
<p><img src="https://tnj.vn/img/cms/Bong-tai-nam/BTA0004/khuyen-tai-nam-hinh-ngoi-sao-BTA0004-1.jpg" alt="Khuyên tai bạc nam hình ngôi sao BTA0004" width="900" height="900" /></p>
<h3 style="text-align: center;">Khuyên tai bạc nam hình ngôi sao BTA0004</h3>
<p><img src="https://tnj.vn/img/cms/Bong-tai-nam/BTA0004/khuyen-tai-nam-hinh-ngoi-sao-BTA0004-3.jpg" alt="Khuyên tai bạc nam hình ngôi sao BTA0004" width="900" height="900" /></p>
<p><img src="https://tnj.vn/img/cms/Bong-tai-nam/BTA0004/khuyen-tai-nam-hinh-ngoi-sao-BTA0004.jpg" alt="Khuyên tai bạc nam hình ngôi sao BTA0004" width="900" height="900" /></p>
<p><strong><img src="https://tnj.vn/img/cms/Bong-tai-nam/BTA0004/khuyen-tai-nam-hinh-ngoi-sao-BTA0004-2.jpg" alt="Khuyên tai bạc nam hình ngôi sao BTA0004" width="900" height="900" /></strong></p>
<h2><strong>Tại sao bạn nên mua khuyên tai bạc nam</strong> <strong>tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất khuyên tai bạc nam tại Trang Sức TNJ</strong></strong></h2>
<p><a href="https://tnj.vn/73-khuyen-tai-bac-nam"><strong>Khuyên tai bạc nam</strong></a> hình ngôi sao BTA0004 được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj.jpg" alt="Quy trình thiết kế và sản xuất tại trang sức tnj" style="margin-left: auto; margin-right: auto;" width="906" height="906" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="cửa hàng trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="cửa hàng trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2>Hộp đựng sản phẩm sang trọng đi kèm</h2>
<p><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></p>
<p><strong>Khuyên tai bạc nam hình ngôi sao BTA0004</strong> chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Ðang nhap hàng', 119000, 55, 1)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS11', N'L04', N'H08', N'NCC03', N'Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070', 10, N'<li><strong><span style="text-decoration: underline;"></span></strong>Chất liệu bạc nguyên chất</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>', N' <h2 class="product-description__title" style="text-align: left;">Giới thiệu sản phẩm lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="font-weight: bolder; height: auto;">- </span><span style="height: auto; font-weight: bolder;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><b>Thấu hiểu nhu cầu bảo vệ sức khoẻ của bé, TNJ ra mắt mẫu lắc bạc khắc tên hình con hổ có chuông </b></span></span></span><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"><b style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;">LTT0070</b></span></span></span></span></span></span></span><b style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"> vô cùng ý nghĩa</b></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><em><strong><a href="https://tnj.vn/70-lac-bac-cho-be">Lắc bạc cho bé</a></strong></em> được thiết kế cách điệu khắc tên theo yêu cầu - sản phẩm độc quyền bởi Trang Sức TNJ</span></span></span></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;">Với chất liệu bạc nguyên chất đẹp cho Bé đeo giúp tránh gió, tránh cảm</span></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"> ▪️Theo nghiên cứu, Bạc bị đen do hút gió, hút độc tố cơ thể hoặc môi trường sống bị ô nhiễm </span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;">▪️ Kim Bạc được dùng thử độc tố trong rượu, trong thức ăn </span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;">▪️ Ngoài ra, giúp tránh tà ma giúp Bé luôn ngủ sâu giấc và không bị giật mình!</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"> Với một số công dụng như vậy, các mẹ nhanh tay chọn ngay cho bé nhà mềnh mẫu lắc bạc chuông để mang đến MAY MẮN và SỰ BÌNH AN nhé! </span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 lắc tay </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070 phù hợp để làm quà tặng trong dịp sinh nhật, kỷ niệm đầy tháng hay món quà để giúp bé bảo vệ sức khỏe...v.v.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc nguyên chất. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Khắc tên + ngày tháng năm sinh ,số điện thoại và các kí tự đặc biệt như: trái tim, cỏ 4 lá,... miễn phí theo yêu cầu</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Lắc điều chỉnh được rộng chật tùy vào kích thước tay của bé nhà mình</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá của 1 lắc bạc</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/lac-bac-cho-be/3336-lac-bac-cho-be-khac-ten-hinh-con-ho-ltt0069.html">lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070<br /></a></h2>
<p style="text-align: left;"><img src="https://tnj.vn/img/cms/Lac-bac-cho-be/LTT0070/lac-bac-cho-be-khac-ten-hinh-con-ho-LTT0069.jpg" alt="Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc bạc cho bé được làm từ chất liệu bạc nguyên chất</h3>
<p style="text-align: left;"><img src="https://tnj.vn/img/cms/Lac-bac-cho-be/LTT0070/lac-bac-cho-be-khac-ten-hinh-con-ho-LTT0069-5.jpg" alt="Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070</h3>
<p style="text-align: left;"><img src="https://tnj.vn/img/cms/Lac-bac-cho-be/LTT0070/lac-bac-cho-be-khac-ten-hinh-con-ho-LTT0069-3.jpg" alt="Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc bạc cho bé có thể điều chỉnh được rộng chật tùy theo kích cỡ</h3>
<p style="text-align: left;"><img src="https://tnj.vn/img/cms/Lac-bac-cho-be/LTT0070/lac-bac-cho-be-khac-ten-hinh-con-ho-LTT0069-2.jpg" alt="Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc bạc cho bé được bảo hành trọn đời đánh bóng làm mới miễn phí</h3>
<h2 style="text-align: left;"><strong>Tại sao bạn nên mua </strong>lắc bạc cho bé <strong>tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất lắc bạc cho bé tại Trang Sức TNJ</strong></strong></h2>
<p><em><strong><a href="https://tnj.vn/70-lac-bac-cho-be">Lắc bạc cho bé</a></strong></em> khắc tên hình con hổ có chuông LTT0070 được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj-10.jpg" alt="quy trình sản xuất và thiết kế tại trang sức tnj" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/khac-ten-theo-yeu-cau-tren-cong-nghe-laser-hien-dai-1 .jpg" alt="khắc tên trên công nghệ laser hiện đại" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2>Hộp đựng sản phẩm sang trọng đi kèm<br /><br /><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></h2>
<p><b>Lắc bạc cho bé khắc tên hình con hổ có chuông LTT0070 </b>chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Còn hàng', 409000, 46, 1)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS12', N'L01', N'H11', N'NCC03', N'Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019', 1, N'<li>Chất liệu bạc nguyên chất 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N' <h2 class="product-description__title" style="text-align: left;">Giới thiệu sản phẩm bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - </span><span style="height: auto; font-weight: bolder;"><span style="font-weight: bolder; height: auto;"><span color="#666666" face="Montserrat, sans-serif" style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><b>Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019</b></span><span style="font-size: 14px; font-weight: bolder;"> </span></span></span><span color="#666666" face="Montserrat, sans-serif" style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px; font-weight: bolder;">được nhiều khách hàng lựa chọn nhiều nhất!</span></span><br /></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">-  <span style="text-decoration: underline;"><em><strong><a href="https://tnj.vn/72-bo-trang-suc">Bộ trang sức</a></strong></em></span> được thiết kế cách điệu cực HOT - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 dây + mặt sản phẩm và bông tai cùng bộ đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019 rất phù hợp để làm quà tặng cho dịp lễ tết Valentine, 20/10, Noel,... sắp tới. Đây là sản phẩm độc đáo với các bạn nữ và là món quà tặng ý nghĩa cho các chàng trai trong các dịp lễ, sinh nhật</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc cao cấp 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá cho 1 dây kèm mặt và bông tai cùng bộ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Dây chuyền dài 45cm có thể cắt ngắn hoặc nối dài thêm hoàn toàn miễn phí</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/trang-suc-nu/783-bo-trang-suc-hoa-5-canh-dinh-da-tim-dep-bts0019.html"><strong>b</strong>ộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019</a></h2>
<p><img src="https://tnj.vn/img/cms/bo-trang-suc/BTS0019/bo-trang-suc-hoa-5-canh-dinh-da-dep-TSB0019-8.jpg" alt="Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019" width="900" height="900" /></p>
<p class="product-description__title"><img src="https://tnj.vn/img/cms/bo-trang-suc/BTS0019/bo-trang-suc-hoa-5-canh-dinh-da-dep-TSB0019.jpg" alt="Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019" width="900" height="900" /></p>
<h3 style="text-align: center;">Bộ trang sức bạc nữ đẹp được làm từ chất liệu bạc cao cấp 925</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/bo-trang-suc/BTS0019/bo-trang-suc-hoa-5-canh-dinh-da-dep-TSB0019-1.jpg" alt="Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019" width="900" height="900" /></p>
<h3 style="text-align: center;">Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/bo-trang-suc/BTS0019/bo-trang-suc-hoa-5-canh-dinh-da-dep-TSB0019-2.jpg" alt="Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/bo-trang-suc/BTS0019/bo-trang-suc-hoa-5-canh-dinh-da-dep-TSB0019-5.jpg" alt="Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019" width="900" height="900" /></p>
<h3 style="text-align: center;">Hình ảnh thực tế sản phẩm bộ trang sức bạc nữ đẹp hoa 5 cánh khi đeo</h3>
<p><img src="https://tnj.vn/img/cms/bo-trang-suc/BTS0019/bo-trang-suc-hoa-5-canh-dinh-da-dep-TSB0019-3.jpg" alt="Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019" width="900" height="900" /></p>
<h2><strong>Tại sao bạn nên mua bộ trang sức bạc nữ đẹp tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất bộ trang sức bạc nữ đẹp hoa 5 cánh tại Trang Sức TNJ</strong></strong></h2>
<p><em><strong><span style="text-decoration: underline;"><a href="https://tnj.vn/72-bo-trang-suc">Bộ trang sứ</a>c</span></strong></em> bạc nữ đẹp hoa 5 cánh BTS0019 được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><iframe width="900" height="506" src="https://www.youtube.com/embed/Wm8to68EPRw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe></p>
<h3 style="text-align: center;">Trang Sức TNJ trong bản tin Chào Buổi Sáng của truyền hình quốc gia trên VTV1</h3>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj-10.jpg" alt="xưởng sản xuất trang sức tnj" width="870" height="870" style="undefined" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="cửa hàng trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="cửa hàng trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2> Hộp đựng sản phẩm sang trọng đi kèm</h2>
<p><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></p>
<p><strong>Bộ trang sức bạc nữ đẹp hoa 5 cánh BTS0019</strong> chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Còn hàng', 349000, 58, 0)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS13', N'L05', N'H11', N'NCC03', N'Quà sinh nhật cho bố lắc tay bạc nam mắt xích LTA0002', 10, N'<li>Chất liệu bạc ta nguyên chất 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N' <h2 class="product-description__title" style="text-align: left;">Giới thiệu sản phẩm quà sinh nhật cho bố lắc tay bạc nam mắt xích LTA0002</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;"> - Quà sinh nhật cho bố lắc tay bạc nam mắt xích LTA0002 </span><span style="height: auto; font-weight: bolder;">được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><a href="https://tnj.vn/66-lac-tay-bac-nam"><span style="text-decoration: underline;"><em><strong>Lắc tay bạc nam</strong></em></span></a> được thiết kế cách điệu cực HOT với những mắt xích nối liền nhau - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 lắc tay </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Quà sinh nhật cho bố lắc tay bạc nam mắt xích LTA0002 rất phù hợp dành cho các anh em cá tính, mang đến sự nam tính, sang trọng cho người đeo, rất phù hợp để làm quà tặng sinh nhật, các ngày lễ lớn trong năm, nhân dịp Noel, ngày kỉ niệm cho các bạn nam...vv</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc ta nguyên chất 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá cho 1 lắc tay</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Lắc tay bạc nam mắt xích dài 20cm </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Trọng lượng của lắc là 1 cây</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 100% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết q<a href="https://tnj.vn/trang-suc-nam/697-lac-tay-bac-nam-mat-xich-LTA0002.html">uà sinh nhật cho bố lắc tay bạc nam mắt xích LTA0002</a></h2>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nam/LTA0002/lac-tay-bac-nam-mat-xich-LTA0002.jpg" alt=" Lắc tay bạc nam mắt xích LTA0002" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay bạc nam được làm từ chất liệu bạc nguyên chất 925</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nam/LTA0002/lac-tay-bac-nam-mat-xich-LTA0002-1.jpg" alt=" Lắc tay bạc nam mắt xích LTA0002" width="900" height="900" /></p>
<h3 style="text-align: center;"><strong> </strong>Lắc tay bạc nam mặt xích LTA0002 mạnh mẽ và cá tính</h3>
<p><img src="https://tnj.vn/img/cms/lac-tay-nam/LTA0002/lac-tay-bac-nam-mat-xich-LTA0002-4.jpg" alt="Lắc tay bạc nam mắt xích LTA0002" width="900" height="900" /></p>
<h3 style="text-align: center;"><strong> Hình ảnh cụ thể sản phẩm lắc tay bạc nam mắt xích LTA0002 khi đeo trên tay</strong></h3>
<p><strong><img src="https://tnj.vn/img/cms/lac-tay-nam/LTA0002/lac-tay-bac-nam-mat-xich-LTA0002-3.jpg" alt="Lắc tay bạc nam mắt xích LTA0002" width="900" height="900" /></strong></p>
<h2><strong>Tại sao bạn nên mua lắc tay bạc nam tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2>Quy trình thiết kế và sản xuất lắc bạc nam kiểu dáng mắt xích tại Trang Sức TNJ</h2>
<p><strong><a href="https://tnj.vn/66-lac-tay-bac-nam">Lắc tay bạc nam</a> </strong>mắt xích LTA0002 được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj-10.jpg" alt="xưởng sản xuất trang sức tnj" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/khac-ten-theo-yeu-cau-tren-cong-nghe-laser-hien-dai-1 .jpg" alt="khắc tên trên công nghệ laser hiện đại" width="870" height="870" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="cửa hàng trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="cửa hàng trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2 style="text-align: left;">Hộp đựng sản phẩm sang trọng đi kèm </h2>
<p><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></p>
<p><b>Quà sinh nhật cho bố lắc tay bạc nam mắt xích LTA0002 </b>chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Còn hàng', 1150000, 22, 0)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS14', N'L06', N'H11', N'NCC03', N'Quà tặng thôi nôi cho bé gái hình Hello Kitty DTN0005', 15, N'<li>Chất liệu bạc ta nguyên chất </li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Tác dụng tránh gió và tránh cảm cho bé</li>', N'<h2 class="product-description__title">Giới thiệu sản phẩm dây chuyền bạc trẻ em hình Hello Kitty DTN0005</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="font-weight: bolder; height: auto;">- </span><span style="height: auto; font-weight: bolder;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><b>Thấu hiểu nhu cầu bảo vệ sức khoẻ của bé, TNJ ra mắt mẫu d</b></span></span></span><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><b>ây chuyền bạc trẻ em hình Hello Kitty DTN0005</b></span></span><b style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"> vô cùng ý nghĩa</b></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;"><a href="https://tnj.vn/75-day-chuyen-bac-cho-be-gai"><strong>Dây chuyền bạc trẻ em</strong></a> hình Hello Kitty DTN0005 được thiết kế kiểu mặt xích - sản phẩm độc quyền bởi Trang Sức TNJ</span></span></span></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"><span style="color: #666666; font-family: Montserrat, sans-serif;"><span style="font-size: 14px;">Với chất liệu bạc ta nguyên chất  giúp bé tránh gió, tránh cảm</span></span></span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"> ▪️Theo nghiên cứu, Bạc bị đen do hút gió, hút độc tố cơ thể hoặc môi trường sống bị ô nhiễm </span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;">▪️ Kim Bạc được dùng thử độc tố trong rượu, trong thức ăn </span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;">▪️ Ngoài ra, giúp tránh tà ma giúp em bé luôn ngủ sâu giấc và không bị giật mình!</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;"><span style="height: auto;"> Với một số công dụng như vậy, các mẹ nhanh tay chọn ngay cho bé nhà mình dây chuyền bạc hình Hello Kitty để mang đến MAY MẮN và SỰ BÌNH AN nhé! </span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 dây cho bé</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Dây chuyền bạc trẻ em hình Hello Kitty DTN0005 phù hợp để làm quà tặng trong dịp sinh nhật, quà thôi nôi cho bé gái, kỷ niệm đầy tháng hay món quà để giúp bé bảo vệ sức khỏe...v.v.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu bạc ta nguyên chất . Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá của 1 dây </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chiều dài của dây là 37cm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; height: auto; font-family: Montserrat, sans-serif; text-align: left;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/trang-suc-cho-be/1113-day-chuyen-bac-tre-em-hinh-hello-kitty-dtn0005.html">dây chuyền bạc trẻ em hình Hello Kitty DTN0005<br /></a></h2>
<p><iframe width="900" height="506" src="https://www.youtube.com/embed/bi3eu65T2OM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe></p>
<h3 style="text-align: center;">Video quay chi tiết sản phẩm dây chuyền trẻ em hình Hello Kitty DTN0005</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/Day chuyen bac cho be/DTN0005/day-chuyen-bac-cho-be-gai-hinh-hello-kitty-DTN0005.jpg" alt="Quà tặng thôi nôi cho bé gái hình Hello Kitty DTN0005" width="900" height="900" /><br /><br /><img src="https://tnj.vn/img/cms/Day chuyen bac cho be/DTN0005/day-chuyen-bac-cho-be-gai-hinh-hello-kitty-DTN0005-2 (FILEminimizer).jpg" alt="Quà tặng thôi nôi cho bé gái hình Hello Kitty DTN0005" width="900" height="900" /><br /><br /><img src="https://tnj.vn/img/cms/Day chuyen bac cho be/DTN0005/day-chuyen-bac-cho-be-gai-hinh-hello-kitty-DTN0005-3.jpg" alt="Quà tặng thôi nôi cho bé gái hình Hello Kitty DTN0005" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/Day chuyen bac cho be/DTN0005/day-chuyen-bac-cho-be-gai-hinh-hello-kitty-DTN0005-1.jpg" alt="Quà tặng thôi nôi cho bé gái hình Hello Kitty DTN0005" width="900" height="900" /></p>
<p><img src="https://tnj.vn/img/cms/Day chuyen bac cho be/DTN0005/day-chuyen-bac-cho-be-gai-hinh-hello-kitty-DTN0005-8.jpg" alt="Quà tặng thôi nôi cho bé gái hình Hello Kitty DTN0005" width="900" height="900" /></p>
<h2><strong>Tại sao bạn nên mua dây chuyền bạc</strong> trẻ em <strong>tại Trang Sức TNJ</strong></h2>
<p><strong><img src="https://tnj.vn/img/cms/tai-sao-mua-hang-tai-tnj-1.png" alt="Tại sao nên mua nhẫn đôi bạc trang sức tnj" style="margin-left: auto; margin-right: auto;" width="900" height="900" /></strong></p>
<h2><strong><strong>Quy trình thiết kế và sản xuất dây chuyền bạc trẻ em tại Trang Sức TNJ</strong></strong></h2>
<p><span style="color: #0000ee;"><a href="https://tnj.vn/75-day-chuyen-bac-cho-be-gai"><strong><span style="text-decoration: underline;">Dây chuyền bạc </span><span style="text-decoration: underline;">trẻ em</span></strong></a><span style="color: #000000;"> hình Hello Kitty DTN0005</span></span> được thiết kế với quy trình khép kín với máy móc hiện đại cùng đội ngũ thợ kim hoàn lành nghề có nhiều năm kinh nghiệm đam mê với nghề</p>
<p><img src="https://tnj.vn/img/cms/quy-trinh-san-xuat-trang-suc-tnj.jpg" alt="Quy trình thiết kế và sản xuất tại trang sức tnj" style="margin-left: auto; margin-right: auto;" width="906" height="906" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1-1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<p><img src="https://tnj.vn/img/cms/anh-cua-hang-trang-suc-TNJ1.jpg" alt="anh-cua-hang-trang-suc-tnj" style="margin-left: auto; margin-right: auto;" width="900" height="506" /></p>
<h2>Hộp đựng sản phẩm sang trọng đi kèm<br /><br /><img src="https://tnj.vn/img/cms/hop-dung-san-pham-trang-suc-tnj.jpg" alt="hộp đựng sản phẩm trang sức tnj" width="900" height="506" /></h2>
<p><strong> Dây chuyền tặng thôi nôi cho bé gái </strong><strong>DTN0005 </strong>chắc chắn sẽ làm bạn hài lòng. Liên hệ ngay với TNJ  qua Hotline/Zalo: 0976827283 - 0979238755 để sở hữu ngay sản phẩm đầy ý nghĩa này nhé!</p>
<p>Địa chỉ: Số 193 Khương Trung - Thanh Xuân - Hà Nội</p>', N'Còn hàng', 279000, 1233, 1)
INSERT [dbo].[TRANGSUC] ([maTS], [maLoai], [maHang], [maNCC], [tenTS], [soLuongTon], [moTaNgan], [moTa], [trangThaiSP], [gia], [luotMua], [is_new]) VALUES (N'TS15', N'L01', N'H11', N'NCC03', N'Lắc tay pha lê dành cho nữ bằng bạc khắc tên LTN0176', 10, N'<li>Lắc tay pha lê chất liệu bạc cao cấp 925</li>
<li>Thiết kế tinh xảo trên công nghệ 3D tiên tiến</li>
<li>Bảo hành miễn phí trọn đời đánh bóng làm mới hoặc rơi đá</li>
<li>Kiểu dáng trẻ trung thời trang</li>', N'<h2 class="product-description__title">Giới thiệu sản phẩm lắc tay pha lê dành cho nữ bằng bạc LTN0176</h2>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="font-weight: bolder; height: auto;">- <a href="https://tnj.vn/17-lac-tay-bac-nu"><em><strong>Lắc tay bạc nữ</strong></em> </a>pha lê danh cho nữ khắc tên LTN0176 </span><span style="height: auto; font-weight: bolder;">được khách hàng lựa chọn nhiều nhất</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">  Lắc tay bạc nữ được thiết kế cách điệu cực HOT với các hạt pha lê nối liền nhau sáng lấp lánh - sản phẩm độc quyền bởi Trang Sức TNJ</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Bộ sản phẩm: 1 lắc tay </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> - Đóng gói: sản phẩm có hộp đựng sang trọng đi kèm</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="color: #666666; font-family: Montserrat, sans-serif; font-size: 14px;"> - Lắc tay pha lê dành cho nữ bằng bạc LTN0176 - Pha lê được xem là vật có rất nhiều ý nghĩa trong cuộc sống. Màu sắc của pha lê mang năng lượng tốt giúp công việc kinh doanh của bạn thuận lợi, mang đến tài lộc, công việc và cuộc sống sẽ thuận lợi hơn. Nó còn biểu tượng cho tình yêu đẹp trong sáng và thuần khiết. Đây là món quà ý nghĩa mà các bạn nam không nên bỏ lỡ tặng bạn gái của mình vào những dịp lễ tết, ngày sinh nhật, 20/10, Valentine... sắp tới nhé.</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"><span style="height: auto; font-weight: bolder;">- Thông tin chi tiết về sản phẩm:</span></p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Chất liệu pha lê nhân tạo và bạc cao cấp 925. Độ trắng sáng cao, không lo bị đen, xỉn màu.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;"> Chất liệu bạc 925: 92,5% bạc nguyên chất phần còn lại là hợp chất làm tăng độ cứng và sáng bóng cho sản phẩm.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Bảo hành miễn phí trọn đời đánh bóng, làm mới hoặc gắn lại đá</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giá trên là giá của 1 lắc tay</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Khắc tên miễn phí theo yêu cầu </p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Lắc dài 16cm và 1 đoạn móc chờ bạn có thể điều chỉnh được rộng chật tùy ý.</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Giao hàng toàn quốc và thanh toán khi nhận được hàng</p>
<p style="margin-top: 0px; font-size: 14px; color: #666666; line-height: 24px; text-align: justify; height: auto; font-family: Montserrat, sans-serif;">❄ Hoàn tiền 200% nếu không đúng mẫu mã và chất lượng</p>
<h2 class="product-description__title">Hình ảnh chi tiết <a href="https://tnj.vn/trang-suc-nu/960-lac-tay-pha-le-danh-cho-nu-bang-bac-ltn0176.html">lắc tay pha lê dành cho nữ bằng bạc tinh tế và sang trọng LTN0176</a></h2>
<p><iframe width="900" height="506" src="https://www.youtube.com/embed/R-prO4kosFc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe></p>
<h3 style="text-align: center;">Video quay chi tiết sản phẩm lắc tay pha lê dành cho nữ LTN0176 </h3>
<p><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0176/lac-tay-pha-le-dep-danh-cho-nu-LTN0176-5.jpg" alt="Lắc tay pha lê dành cho nữ bằng bạc LTN0176" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay bạc nữ được làm từ chất liệu bạc cao cấp 925</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0176/lac-tay-pha-le-dep-danh-cho-nu-LTN0176-6.jpg" alt="Lắc tay pha lê dành cho nữ bằng bạc LTN0176" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0176/lac-tay-pha-le-dep-danh-cho-nu-LTN0176-8.jpg" alt="Lắc tay pha lê dành cho nữ bằng bạc LTN0176" width="900" height="900" /></p>
<h3 style="text-align: center;">Lắc tay pha lê dành cho nữ bằng bạc LTN0176</h3>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0176/lac-tay-pha-le-dep-danh-cho-nu-LTN0176-9.jpg" alt="Lắc tay pha lê dành cho nữ bằng bạc LTN0176" width="900" height="900" /></p>
<p style="text-align: center;"><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0176/lac-tay-pha-le-dep-danh-cho-nu-LTN0176-7.jpg" alt="Lắc tay pha lê dành cho nữ bằng bạc LTN0176" width="900" height="900" /></p>
<p style="text-align: center;"><strong><img src="https://tnj.vn/img/cms/lac-tay-nu-bac/LTN0176/lac-tay-pha-le-dep-danh-cho-nu-bang-bac-LTN0176-3.jpg" alt="Lắc tay pha lê dành cho nữ bằng bạc LTN0176" width="900" height="900" /></strong></p>
<h3 style="text-align: center;"><strong> Hình ảnh cụ thể chi tiết lắc tay pha lê dành cho nữ bằng bạc khắc tên LTN0176 khi đeo trên tay</strong></h3>
<h2><strong>Tại sao bạn nên mua </strong>lắc tay pha lê dành cho nữ bằng bạc <strong>tại Trang Sức TNJ</strong></h2>', N'Còn hàng', 499000, 22, 1)
INSERT [dbo].[TRANGTHAIDONHANG] ([maTrangThaiDonHang], [tenTrangThaiDonHang]) VALUES (N'TTGH01', N'Chờ xác nhận')
INSERT [dbo].[TRANGTHAIDONHANG] ([maTrangThaiDonHang], [tenTrangThaiDonHang]) VALUES (N'TTGH02', N'Đã xác nhận')
INSERT [dbo].[TRANGTHAIDONHANG] ([maTrangThaiDonHang], [tenTrangThaiDonHang]) VALUES (N'TTGH03', N'Đang giao')
INSERT [dbo].[TRANGTHAIDONHANG] ([maTrangThaiDonHang], [tenTrangThaiDonHang]) VALUES (N'TTGH04', N'Đã nhận')
INSERT [dbo].[TRANGTHAIDONHANG] ([maTrangThaiDonHang], [tenTrangThaiDonHang]) VALUES (N'TTGH05', N'Đã hủy')
INSERT [dbo].[TRANGTHAITAIKHOAN] ([maTrangThaiTK], [tenTrangThaiTK]) VALUES (N'TT01', N'Hoạt động')
INSERT [dbo].[TRANGTHAITAIKHOAN] ([maTrangThaiTK], [tenTrangThaiTK]) VALUES (N'TT02', N'Đã Khóa')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_KHACHHANG]    Script Date: 9/7/2022 9:14:38 AM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [UK_KHACHHANG] UNIQUE NONCLUSTERED 
(
	[maTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_NHANVIEN]    Script Date: 9/7/2022 9:14:38 AM ******/
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [UK_NHANVIEN] UNIQUE NONCLUSTERED 
(
	[maTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_PHIEUNHAP]    Script Date: 9/7/2022 9:14:38 AM ******/
ALTER TABLE [dbo].[PHIEUNHAP] ADD  CONSTRAINT [UK_PHIEUNHAP] UNIQUE NONCLUSTERED 
(
	[idPD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_DDH]  WITH CHECK ADD  CONSTRAINT [FK__CT_DDH__idPD__5629CD9C] FOREIGN KEY([idPD])
REFERENCES [dbo].[PHIEUDAT] ([idPD])
GO
ALTER TABLE [dbo].[CT_DDH] CHECK CONSTRAINT [FK__CT_DDH__idPD__5629CD9C]
GO
ALTER TABLE [dbo].[CT_DDH]  WITH CHECK ADD  CONSTRAINT [FK__CT_DDH__maTS__5535A963] FOREIGN KEY([maTS])
REFERENCES [dbo].[TRANGSUC] ([maTS])
GO
ALTER TABLE [dbo].[CT_DDH] CHECK CONSTRAINT [FK__CT_DDH__maTS__5535A963]
GO
ALTER TABLE [dbo].[CT_GH]  WITH CHECK ADD  CONSTRAINT [FK__CT_GH__idGio__6E01572D] FOREIGN KEY([maGioHang])
REFERENCES [dbo].[GIOHANG] ([maGioHang])
GO
ALTER TABLE [dbo].[CT_GH] CHECK CONSTRAINT [FK__CT_GH__idGio__6E01572D]
GO
ALTER TABLE [dbo].[CT_GH]  WITH CHECK ADD  CONSTRAINT [FK__CT_GH__maTS__6D0D32F4] FOREIGN KEY([maTS])
REFERENCES [dbo].[TRANGSUC] ([maTS])
GO
ALTER TABLE [dbo].[CT_GH] CHECK CONSTRAINT [FK__CT_GH__maTS__6D0D32F4]
GO
ALTER TABLE [dbo].[CT_KHUYENMAI]  WITH CHECK ADD  CONSTRAINT [FK__CT_KHUYENM__maKM__32E0915F] FOREIGN KEY([maKM])
REFERENCES [dbo].[KHUYENMAI] ([maKM])
GO
ALTER TABLE [dbo].[CT_KHUYENMAI] CHECK CONSTRAINT [FK__CT_KHUYENM__maKM__32E0915F]
GO
ALTER TABLE [dbo].[CT_KHUYENMAI]  WITH CHECK ADD  CONSTRAINT [FK__CT_KHUYENM__maTS__31EC6D26] FOREIGN KEY([maTS])
REFERENCES [dbo].[TRANGSUC] ([maTS])
GO
ALTER TABLE [dbo].[CT_KHUYENMAI] CHECK CONSTRAINT [FK__CT_KHUYENM__maTS__31EC6D26]
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK__CT_PHIEUNH__idPN__5CD6CB2B] FOREIGN KEY([idPN])
REFERENCES [dbo].[PHIEUNHAP] ([idPN])
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP] CHECK CONSTRAINT [FK__CT_PHIEUNH__idPN__5CD6CB2B]
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK__CT_PHIEUNH__maTS__5BE2A6F2] FOREIGN KEY([maTS])
REFERENCES [dbo].[TRANGSUC] ([maTS])
GO
ALTER TABLE [dbo].[CT_PHIEUNHAP] CHECK CONSTRAINT [FK__CT_PHIEUNH__maTS__5BE2A6F2]
GO
ALTER TABLE [dbo].[GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK__GIOHANG__maKH__6754599E] FOREIGN KEY([maKH])
REFERENCES [dbo].[KHACHHANG] ([maKH])
GO
ALTER TABLE [dbo].[GIOHANG] CHECK CONSTRAINT [FK__GIOHANG__maKH__6754599E]
GO
ALTER TABLE [dbo].[GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK__GIOHANG__maNVDuy__656C112C] FOREIGN KEY([maNVDuyet])
REFERENCES [dbo].[NHANVIEN] ([maNV])
GO
ALTER TABLE [dbo].[GIOHANG] CHECK CONSTRAINT [FK__GIOHANG__maNVDuy__656C112C]
GO
ALTER TABLE [dbo].[GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK__GIOHANG__maNVGia__66603565] FOREIGN KEY([maNVGiao])
REFERENCES [dbo].[NHANVIEN] ([maNV])
GO
ALTER TABLE [dbo].[GIOHANG] CHECK CONSTRAINT [FK__GIOHANG__maNVGia__66603565]
GO
ALTER TABLE [dbo].[GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK_GIOHANG_HOADON] FOREIGN KEY([soHoaDon])
REFERENCES [dbo].[HOADON] ([soHoaDon])
GO
ALTER TABLE [dbo].[GIOHANG] CHECK CONSTRAINT [FK_GIOHANG_HOADON]
GO
ALTER TABLE [dbo].[GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK_GIOHANG_TRANGTHAIDONHANG] FOREIGN KEY([maTrangThaiDonHang])
REFERENCES [dbo].[TRANGTHAIDONHANG] ([maTrangThaiDonHang])
GO
ALTER TABLE [dbo].[GIOHANG] CHECK CONSTRAINT [FK_GIOHANG_TRANGTHAIDONHANG]
GO
ALTER TABLE [dbo].[HINHANH]  WITH CHECK ADD  CONSTRAINT [FK__HINHANH__maTS__2C3393D0] FOREIGN KEY([maTS])
REFERENCES [dbo].[TRANGSUC] ([maTS])
GO
ALTER TABLE [dbo].[HINHANH] CHECK CONSTRAINT [FK__HINHANH__maTS__2C3393D0]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK__HOADON__maNV__6A30C649] FOREIGN KEY([maNV])
REFERENCES [dbo].[NHANVIEN] ([maNV])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK__HOADON__maNV__6A30C649]
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD  CONSTRAINT [FK__KHACHHANG__maTK__182C9B23] FOREIGN KEY([maTK])
REFERENCES [dbo].[TAIKHOAN] ([maTK])
GO
ALTER TABLE [dbo].[KHACHHANG] CHECK CONSTRAINT [FK__KHACHHANG__maTK__182C9B23]
GO
ALTER TABLE [dbo].[KHUYENMAI]  WITH CHECK ADD  CONSTRAINT [FK__KHUYENMAI__maNV__2F10007B] FOREIGN KEY([maNV])
REFERENCES [dbo].[NHANVIEN] ([maNV])
GO
ALTER TABLE [dbo].[KHUYENMAI] CHECK CONSTRAINT [FK__KHUYENMAI__maNV__2F10007B]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__NHANVIEN__maTK__15502E78] FOREIGN KEY([maTK])
REFERENCES [dbo].[TAIKHOAN] ([maTK])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK__NHANVIEN__maTK__15502E78]
GO
ALTER TABLE [dbo].[PHIEUDAT]  WITH CHECK ADD  CONSTRAINT [FK__PHIEUDAT__maNCC__534D60F1] FOREIGN KEY([maNCC])
REFERENCES [dbo].[NHACUNGCAP] ([maNCC])
GO
ALTER TABLE [dbo].[PHIEUDAT] CHECK CONSTRAINT [FK__PHIEUDAT__maNCC__534D60F1]
GO
ALTER TABLE [dbo].[PHIEUDAT]  WITH CHECK ADD  CONSTRAINT [FK__PHIEUDAT__maNV__52593CB8] FOREIGN KEY([maNV])
REFERENCES [dbo].[NHANVIEN] ([maNV])
GO
ALTER TABLE [dbo].[PHIEUDAT] CHECK CONSTRAINT [FK__PHIEUDAT__maNV__52593CB8]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK__PHIEUNHAP__idPD__59FA5E80] FOREIGN KEY([idPD])
REFERENCES [dbo].[PHIEUDAT] ([idPD])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [FK__PHIEUNHAP__idPD__59FA5E80]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK__PHIEUNHAP__maNV__59063A47] FOREIGN KEY([maNV])
REFERENCES [dbo].[NHANVIEN] ([maNV])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [FK__PHIEUNHAP__maNV__59063A47]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK__TAIKHOAN__maQuye__1273C1CD] FOREIGN KEY([maQuyen])
REFERENCES [dbo].[QUYEN] ([maQuyen])
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK__TAIKHOAN__maQuye__1273C1CD]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_TRANGTHAITAIKHOAN] FOREIGN KEY([maTrangThaiTK])
REFERENCES [dbo].[TRANGTHAITAIKHOAN] ([maTrangThaiTK])
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_TRANGTHAITAIKHOAN]
GO
ALTER TABLE [dbo].[THAYDOIGIA]  WITH CHECK ADD  CONSTRAINT [FK__THAYDOIGIA__maNV__29572725] FOREIGN KEY([maNV])
REFERENCES [dbo].[NHANVIEN] ([maNV])
GO
ALTER TABLE [dbo].[THAYDOIGIA] CHECK CONSTRAINT [FK__THAYDOIGIA__maNV__29572725]
GO
ALTER TABLE [dbo].[THAYDOIGIA]  WITH CHECK ADD  CONSTRAINT [FK__THAYDOIGIA__maTS__286302EC] FOREIGN KEY([maTS])
REFERENCES [dbo].[TRANGSUC] ([maTS])
GO
ALTER TABLE [dbo].[THAYDOIGIA] CHECK CONSTRAINT [FK__THAYDOIGIA__maTS__286302EC]
GO
ALTER TABLE [dbo].[TRANGSUC]  WITH CHECK ADD  CONSTRAINT [FK__TRANGSUC__maHang__24927208] FOREIGN KEY([maHang])
REFERENCES [dbo].[HANGTRANGSUC] ([maHang])
GO
ALTER TABLE [dbo].[TRANGSUC] CHECK CONSTRAINT [FK__TRANGSUC__maHang__24927208]
GO
ALTER TABLE [dbo].[TRANGSUC]  WITH CHECK ADD  CONSTRAINT [FK__TRANGSUC__maLoai__239E4DCF] FOREIGN KEY([maLoai])
REFERENCES [dbo].[LOAITRANGSUC] ([maLoai])
GO
ALTER TABLE [dbo].[TRANGSUC] CHECK CONSTRAINT [FK__TRANGSUC__maLoai__239E4DCF]
GO
ALTER TABLE [dbo].[TRANGSUC]  WITH CHECK ADD  CONSTRAINT [FK__TRANGSUC__maNCC__25869641] FOREIGN KEY([maNCC])
REFERENCES [dbo].[NHACUNGCAP] ([maNCC])
GO
ALTER TABLE [dbo].[TRANGSUC] CHECK CONSTRAINT [FK__TRANGSUC__maNCC__25869641]
GO
/****** Object:  StoredProcedure [dbo].[Get_Khuyen_Mai]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Khuyen_Mai]
AS 
BEGIN
    SELECT TRANGSUC.*, LOAITRANGSUC.tenLoai, HANGTRANGSUC.tenHang, NHACUNGCAP.tenNCC, CT_KHUYENMAI.phanTramGiam
	FROM TRANGSUC
	LEFT JOIN LOAITRANGSUC on TRANGSUC.maLoai=LOAITRANGSUC.maLoai
	LEFT JOIN HANGTRANGSUC on TRANGSUC.maHang=HANGTRANGSUC.maHang
	LEFT JOIN NHACUNGCAP on TRANGSUC.maNCC=NHACUNGCAP.maNCC
	LEFT JOIN CT_KHUYENMAI on CT_KHUYENMAI.maTS=TRANGSUC.maTS
	LEFT JOIN KHUYENMAI on KHUYENMAI.maKM=CT_KHUYENMAI.maKM
	WHERE trangThaiSP='Còn hàng' and GETDATE()>=KHUYENMAI.ngayBD and GETDATE()<=KHUYENMAI.ngayKT
END;
GO
/****** Object:  StoredProcedure [dbo].[Get_new_TS]    Script Date: 9/7/2022 9:14:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_new_TS]
AS 
BEGIN
     SELECT TRANGSUC.*, LOAITRANGSUC.tenLoai, HANGTRANGSUC.tenHang, NHACUNGCAP.tenNCC, CT_KHUYENMAI.phanTramGiam
	FROM TRANGSUC
	LEFT JOIN LOAITRANGSUC on TRANGSUC.maLoai=LOAITRANGSUC.maLoai
	LEFT JOIN HANGTRANGSUC on TRANGSUC.maHang=HANGTRANGSUC.maHang
	LEFT JOIN NHACUNGCAP on TRANGSUC.maNCC=NHACUNGCAP.maNCC
	LEFT JOIN CT_KHUYENMAI on CT_KHUYENMAI.maTS=TRANGSUC.maTS
	LEFT JOIN KHUYENMAI on KHUYENMAI.maKM=CT_KHUYENMAI.maKM
	WHERE is_new=1 and trangThaiSP='Còn hàng' and GETDATE()>=KHUYENMAI.ngayBD and GETDATE()<=KHUYENMAI.ngayKT
END;
GO
USE [master]
GO
ALTER DATABASE [TTTN_final] SET  READ_WRITE 
GO
