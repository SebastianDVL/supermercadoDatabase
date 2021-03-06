USE [master]
GO
/****** Object:  Database [supermercado]    Script Date: 13/04/2022 9:22:58 p. m. ******/
CREATE DATABASE [supermercado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'supermercado', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\supermercado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'supermercado_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\supermercado_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [supermercado] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supermercado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [supermercado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [supermercado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [supermercado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [supermercado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [supermercado] SET ARITHABORT OFF 
GO
ALTER DATABASE [supermercado] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [supermercado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [supermercado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [supermercado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [supermercado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [supermercado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [supermercado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [supermercado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [supermercado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [supermercado] SET  ENABLE_BROKER 
GO
ALTER DATABASE [supermercado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [supermercado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [supermercado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [supermercado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [supermercado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [supermercado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [supermercado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [supermercado] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [supermercado] SET  MULTI_USER 
GO
ALTER DATABASE [supermercado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [supermercado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [supermercado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [supermercado] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [supermercado] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [supermercado] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [supermercado] SET QUERY_STORE = OFF
GO
USE [supermercado]
GO
/****** Object:  Table [dbo].[administradores]    Script Date: 13/04/2022 9:22:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administradores](
	[id] [varchar](15) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[celular] [varchar](20) NOT NULL,
	[contraseña] [varchar](20) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 13/04/2022 9:22:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[cod_produco] [varchar](15) NOT NULL,
	[nombre_producto] [varchar](45) NOT NULL,
	[marca] [varchar](45) NOT NULL,
	[existencias] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[descuento] [int] NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_produco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[administradores] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ((1)) FOR [activo]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_producto]    Script Date: 13/04/2022 9:22:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_producto]
@pcod_producto varchar(15),
@pnom_producto varchar(45),
@pmarca varchar(45),
@pexistencias int,
@pprecio int,
@pdescuento int
as
	update productos
	set nombre_producto = @pnom_producto,
		marca = @pmarca, 
		existencias = @pexistencias, 
		precio = @pprecio,
		descuento = @pdescuento
	where
		cod_produco = @pcod_producto
GO
/****** Object:  StoredProcedure [dbo].[borrar_producto]    Script Date: 13/04/2022 9:22:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[borrar_producto]
@pcod_producto varchar(15)
as
	delete from productos where cod_produco = @pcod_producto
GO
/****** Object:  StoredProcedure [dbo].[consultar_admin]    Script Date: 13/04/2022 9:22:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[consultar_admin] 
@pid_admin varchar(15)
as
	select * from administradores where id = @pid_admin
GO
/****** Object:  StoredProcedure [dbo].[consultar_producto]    Script Date: 13/04/2022 9:22:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[consultar_producto]
@pcod_producto varchar(15)
as
	if @pcod_producto = ''
		select * from productos
	else
		select * from productos where cod_produco = @pcod_producto
GO
/****** Object:  StoredProcedure [dbo].[guardar_producto]    Script Date: 13/04/2022 9:22:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[guardar_producto]
@pcod_producto varchar(15),
@pnombre_producto varchar(45),
@pmarca_producto varchar(45),
@pprecio int,
@pexistencias int,
@pdescuento int
as
	insert into productos(cod_produco,nombre_producto,marca,existencias,precio,descuento)
	values(@pcod_producto,@pnombre_producto,@pmarca_producto,@pexistencias,@pprecio,@pdescuento)
GO
USE [master]
GO
ALTER DATABASE [supermercado] SET  READ_WRITE 
GO
