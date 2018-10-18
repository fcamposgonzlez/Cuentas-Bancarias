USE [BD_1_Tarea]
GO
/****** Object:  Database [BD_1_Tarea]    Script Date: 9/27/2018 1:20:40 PM ******/
CREATE DATABASE [BD_1_Tarea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_1_Tarea', FILENAME = N'C:\unidad_c\datos\BD_1_Tarea.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_1_Tarea_log', FILENAME = N'C:\unidad_d\bitacora\BD_1_Tarea_log.ldf' , SIZE = 4333568KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_1_Tarea] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_1_Tarea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_1_Tarea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_1_Tarea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_1_Tarea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_1_Tarea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_1_Tarea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_1_Tarea] SET  MULTI_USER 
GO
ALTER DATABASE [BD_1_Tarea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_1_Tarea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_1_Tarea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_1_Tarea] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BD_1_Tarea] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_1_Tarea', N'ON'
GO
ALTER DATABASE [BD_1_Tarea] SET QUERY_STORE = OFF
GO
USE [BD_1_Tarea]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BD_1_Tarea]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ValorDocID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[valorDocId] [varchar](50) NOT NULL,
	[contrasenna] [varchar](50) NOT NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[clienteID] [int] NULL,
	[docIdCliente] [varchar](50) NOT NULL,
	[tipoCuenta] [int] NULL,
	[codigoCuenta] [varchar](50) NOT NULL,
	[saldo] [money] NULL,
	[fechaCreacion] [date] NOT NULL,
	[interesesAcum] [money] NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoDeCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoDeCuenta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cuenta] [int] NOT NULL,
	[codigoCuenta] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[SaldoInicial] [money] NULL,
	[SaldoFinal] [money] NULL,
	[SaldoMinimo] [money] NULL,
	[QOpManuales] [int] NULL,
	[QOpATM] [int] NULL,
	[abierto] [bit] NULL,
 CONSTRAINT [PK__EstadoDe__3214EC27C75484B6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdminID] [int] NOT NULL,
	[TipoDeEvento] [int] NOT NULL,
	[PastIP] [varchar](50) NOT NULL,
	[PastTime] [varchar](50) NOT NULL,
	[XMLantes] [varchar](8000) NULL,
	[XMLdespues] [varchar](8000) NULL,
	[EntidadID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cuenta] [int] NULL,
	[tipoMovimiento] [int] NULL,
	[codigoCuentaMovimiento] [varchar](50) NULL,
	[fecha] [date] NOT NULL,
	[monto] [money] NULL,
	[saldoFinal] [money] NULL,
	[pastIP] [varchar](50) NULL,
	[pastUser] [varchar](50) NULL,
	[pastTime] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[invisible] [bit] NULL,
 CONSTRAINT [PK__Movimien__3214EC27DA79AEA1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoInteres]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoInteres](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cuenta] [int] NULL,
	[tipoMovimientoInteres] [int] NULL,
	[fecha] [date] NOT NULL,
	[saldo] [money] NULL,
	[interesDiario] [money] NULL,
	[descripcion] [varchar](100) NULL,
	[InteresAcumFinal] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuenta](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[tasaInteres] [float] NOT NULL,
	[saldoMinimo] [money] NULL,
	[QMaxManual] [int] NOT NULL,
	[QMaxATM] [int] NOT NULL,
	[multaSaldoMinimo] [money] NOT NULL,
	[multaQMaxManual] [money] NOT NULL,
	[multaQMaxAtm] [money] NOT NULL,
	[multaSaldoNegativo] [money] NOT NULL,
	[cargoXservicio] [money] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TipoDeCuenta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEvento]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEvento](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_TIpoEvento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoMov] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoInteres]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoInteres](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TIpoMovInt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[EstadoDeCuenta] ADD  CONSTRAINT [DF_EstadoDeCuenta_SaldoInicial]  DEFAULT ((0)) FOR [SaldoInicial]
GO
ALTER TABLE [dbo].[EstadoDeCuenta] ADD  CONSTRAINT [DF_EstadoDeCuenta_SaldoFinal]  DEFAULT ((0)) FOR [SaldoFinal]
GO
ALTER TABLE [dbo].[EstadoDeCuenta] ADD  CONSTRAINT [DF_EstadoDeCuenta_SaldoMinimo]  DEFAULT ((0)) FOR [SaldoMinimo]
GO
ALTER TABLE [dbo].[EstadoDeCuenta] ADD  CONSTRAINT [DF_EstadoDeCuenta_QOpManuales]  DEFAULT ((0)) FOR [QOpManuales]
GO
ALTER TABLE [dbo].[EstadoDeCuenta] ADD  CONSTRAINT [DF_EstadoDeCuenta_QOpATM]  DEFAULT ((0)) FOR [QOpATM]
GO
ALTER TABLE [dbo].[EstadoDeCuenta] ADD  CONSTRAINT [DF__EstadoDeC__abier__4D5F7D71]  DEFAULT ((1)) FOR [abierto]
GO
ALTER TABLE [dbo].[Movimiento] ADD  CONSTRAINT [DF__Movimient__invis__43D61337]  DEFAULT ((0)) FOR [invisible]
GO
ALTER TABLE [dbo].[TipoCuenta] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD FOREIGN KEY([clienteID])
REFERENCES [dbo].[Cliente] ([ID])
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD FOREIGN KEY([tipoCuenta])
REFERENCES [dbo].[TipoCuenta] ([id])
GO
ALTER TABLE [dbo].[EstadoDeCuenta]  WITH CHECK ADD  CONSTRAINT [FK__EstadoDeC__Cuent__489AC854] FOREIGN KEY([ID_Cuenta])
REFERENCES [dbo].[Cuenta] ([ID])
GO
ALTER TABLE [dbo].[EstadoDeCuenta] CHECK CONSTRAINT [FK__EstadoDeC__Cuent__489AC854]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Administrador] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Administrador] ([ID])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Administrador]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_TIpoEvento] FOREIGN KEY([TipoDeEvento])
REFERENCES [dbo].[TipoEvento] ([id])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_TIpoEvento]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK__Movimient__cuent__41EDCAC5] FOREIGN KEY([ID_Cuenta])
REFERENCES [dbo].[Cuenta] ([ID])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK__Movimient__cuent__41EDCAC5]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK__Movimient__tipoM__42E1EEFE] FOREIGN KEY([tipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([id])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK__Movimient__tipoM__42E1EEFE]
GO
ALTER TABLE [dbo].[MovimientoInteres]  WITH CHECK ADD FOREIGN KEY([ID_Cuenta])
REFERENCES [dbo].[Cuenta] ([ID])
GO
ALTER TABLE [dbo].[MovimientoInteres]  WITH CHECK ADD FOREIGN KEY([tipoMovimientoInteres])
REFERENCES [dbo].[TipoMovimientoInteres] ([id])
GO
/****** Object:  StoredProcedure [dbo].[SP_borrarCliente]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_borrarCliente]
@valorDocID varchar(50),
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	declare @idCliente int
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)
	declare @pastTime datetimeoffset

	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()
	
	begin transaction
	begin try
	set @xmlantes=(select * FROM Cliente  
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,3,@xmlantes)
	update Cliente set activo=0
	where valorDocId=@valorDocID
	update Evento set XMLdespues=(select * FROM Cliente FOR XML AUTO)
				   where PastTime=@pastTime and PastIP=@pastIP	
	commit
	return 1
	end try
	begin catch
	rollback
	return 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[SP_borrarCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_borrarCuenta]
@codigoCuenta varchar(50),
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)
	declare @pastTime datetimeoffset

	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()
	begin transaction
	begin try
	set @xmlantes=(select * FROM Cuenta  
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,6,@xmlantes)
	update Cuenta set activo=0
	where codigoCuenta=@codigoCuenta
	update Evento set XMLdespues=(select * FROM Cuenta FOR XML AUTO)
				   where PastTime=@pastTime and PastIP=@pastIP	
	commit
	return 1
	end try
	begin catch
	rollback
	return 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[SP_borrarTipoCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_borrarTipoCuenta]
@idTP varchar(50),
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)
	declare @pastTime datetimeoffset

	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()
	begin transaction
	begin try
	set @xmlantes=(select * FROM TipoCuenta  
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,9,@xmlantes)

	update TipoCuenta set activo=0
	where id=@idTP

	update Evento set XMLdespues=(select * FROM TipoCuenta FOR XML AUTO)
				   where PastTime=@pastTime and PastIP=@pastIP	
	commit
	return 1
	end try
	begin catch
	rollback
	return 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[SP_insertarCliente]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_insertarCliente]
@docID varchar(50),
@nombre varchar(50),
@contrasenna varchar(50),
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	declare @pastTime datetimeoffset
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)

	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()
	
	begin transaction
	begin try
		set @xmlantes=(select * FROM Cliente  
					   FOR XML AUTO)
		insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
		values(@idAdmin,@adminDocID,@pastIP,@pastTime,1,@xmlantes)

		insert Cliente(nombre,valorDocId,contrasenna)
		values (@nombre,@docID,@contrasenna)
		update Evento set XMLdespues=(select * FROM Cliente
					   FOR XML AUTO)
					   where PastTime=@pastTime and PastIP=@pastIP
	commit
	return 1
	end try
	begin catch
		
		rollback
		return 0
	end catch 
end  
GO
/****** Object:  StoredProcedure [dbo].[SP_insertarCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_insertarCuenta]
@docIdCliente varchar(50),
@Tipo int,
@codigo varchar(50),
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	declare @pastTime datetimeoffset
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)
	declare @clienteid int
	declare @cuentaID INT
	declare @fechaTemp date

	set @fechaTemp =getdate()
	if (Day(@fechaTemp)=31)
	begin
		set @fechaTemp= dateadd(d,-2,@fechaTemp)
	end
	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()

	select @clienteid=id
	from Cliente
	where valorDocId=@docIdCliente		

	begin transaction
	begin try
		set @xmlantes=(select * FROM Cuenta  
					   FOR XML AUTO)
		insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
		values(@idAdmin,@adminDocID,@pastIP,@pastTime,4,@xmlantes)


		insert dbo.Cuenta(clienteID,docIdCliente,tipoCuenta,codigoCuenta,fechaCreacion,saldo)
		values(@clienteid,@docIdCliente,@Tipo,@codigo,@fechaTemp,15000)

		select @cuentaID=ID from cuenta where codigoCuenta=@codigo
		insert dbo.EstadoDeCuenta(codigoCuenta,ID_Cuenta,Fecha,SaldoInicial,SaldoMinimo)
		values(@codigo,@cuentaID,@fechaTemp,15000,15000)

		update Evento set XMLdespues=(select * FROM Cuenta
					   FOR XML AUTO)
					   where PastTime=@pastTime and PastIP=@pastIP
	commit
	return 1
	end try
	begin catch
		rollback
		return 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[SP_insertarTipoCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_insertarTipoCuenta]
@id int,
@nombre varchar(50),
@tasaInteres float,
@saldoMinimo money,
@qAtmMax int,
@qManualesMax int,
@multaSaldoMin money,
@multaSaldoNeg money,
@multaQATM money,
@multaManual money,
@cargoxser money,
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	declare @pastTime datetimeoffset
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)

	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()
	
	begin transaction
	begin try
		set @xmlantes=(select * FROM TipoCuenta  
					   FOR XML AUTO)
		insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
		values(@idAdmin,@adminDocID,@pastIP,@pastTime,7,@xmlantes)

		insert dbo.TipoCuenta(id,nombre,tasaInteres,saldoMinimo,QMaxATM,QMaxManual,multaSaldoMinimo,multaSaldoNegativo,multaQMaxAtm,multaQMaxManual,cargoXservicio)
		values (@id,@nombre ,@tasaInteres ,@saldoMinimo ,@qAtmMax,@qManualesMax,@multaSaldoMin, @multaSaldoNeg, @multaQATM ,@multaManual ,@cargoxser )
		update Evento set XMLdespues=(select * FROM TipoCuenta
					   FOR XML AUTO)
					   where PastTime=@pastTime and PastIP=@pastIP
	commit
	return 1	
	end try
	begin catch 
		rollback
		return 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[SP_modificarCliente]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_modificarCliente]
@valorDocID varchar(50),
@valorDocN varchar(50),
@nombreN varchar(50),
@contresennaN varchar(50),
@activo bit,
@pastIP varchar(50),
@pastTime varchar(50),
@adminDocID VARCHAR(50)
as
begin
	
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)

	select @idAdmin=id
	from Administrador
	where @adminDocID=ID
	begin transaction
	begin try
	set @xmlantes=(select * FROM Cliente  
				   where valorDocId=@valorDocID
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,2,@xmlantes)
	update cliente set nombre=@nombreN,valorDocId=@valorDocN,contrasenna=@contresennaN,activo=@activo
	where valorDocId=@valorDocID
	update Evento set XMLdespues=(select * FROM Cliente	  
								  where valorDocId=@valorDocID
				                  FOR XML AUTO)
								  where XMLantes=@xmlantes

	commit
	end try
	begin catch
		rollback 
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[SP_modificarCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_modificarCuenta]
@tipoCuenta int,
@codigoCuenta varchar(50),
@clienteDocId varchar(50),
@saldo money,
@interesAcum money,
@activo bit,
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	declare @idCliente int
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)
	declare @pastTime datetimeoffset

	select @idCliente=id
	from Cliente
	where @clienteDocId=ID

	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()

	begin transaction
	begin try
	set @xmlantes=(select * FROM Cuenta  
				   where codigoCuenta=@codigoCuenta
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,5,@xmlantes)

	update cuenta set tipoCuenta=@tipoCuenta,saldo=@saldo,interesesAcum=@interesAcum,docIdCliente=@clienteDocID,activo=@activo
	where codigoCuenta=@codigoCuenta
	update Evento set XMLdespues=(select * FROM Cuenta  
				   where codigoCuenta=@codigoCuenta
				   FOR XML AUTO)
				   where PastTime=@pastTime and PastIP=@pastIP
	commit
	return 1
	end try
	begin catch
	rollback
	return 0
	end catch

end
GO
/****** Object:  StoredProcedure [dbo].[SP_modificarTipoCuenta]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_modificarTipoCuenta]
@id int,
@nombre varchar(50),
@tasaInteres float,
@saldoMinimo money,
@qAtmMax int,
@qManualesMax int,
@multaSaldoMin money,
@multaSaldoNeg money,
@multaQATM money,
@multaManual money,
@cargoxser money,
@activo bit,
@pastIP varchar(50),
@adminDocID VARCHAR(50)
as
begin
	
	declare @pastTime datetimeoffset
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)

	select @idAdmin=id
	from Administrador
	where @adminDocID=ValorDocID
	set @pastTime=SYSDATETIMEOFFSET()
	begin transaction
	begin try
		set @xmlantes=(select * FROM TipoCuenta
					   where @id=id  
					   FOR XML AUTO)
		insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
		values(@idAdmin,@adminDocID,@pastIP,@pastTime,8,@xmlantes)

		update dbo.TipoCuenta set nombre=@nombre,tasaInteres=@tasaInteres,saldoMinimo=@saldoMinimo,QMaxATM=@qAtmMax,QMaxManual=@qManualesMax,multaSaldoMinimo=@multaSaldoMin,multaSaldoNegativo=@multaSaldoMin,multaQMaxAtm=@multaQATM,multaQMaxManual=@multaManual,cargoXservicio=@cargoxser,activo=@activo

		update Evento set XMLdespues=(select * FROM TipoCuenta where id=@id
					   FOR XML AUTO)
					   where PastTime=@pastTime and PastIP=@pastIP
	commit
	return 1	
	end try
	begin catch 
		rollback
		return 0
	end catch
end		
GO
/****** Object:  StoredProcedure [dbo].[SP_MovFinMes]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MovFinMes]
@fechaActual date
as
begin
	declare @estadosActualizar table(ID_Cuenta INT,codigoCuenta varchar(50),fecha date,saldoInicial money,saldoFinal money, saldoMinimo money,QOpManuales int,QOpATM int,abierto bit)
	delete from @estadosActualizar
	
	insert @estadosActualizar(saldoMinimo,saldoInicial,saldoFinal,QOpManuales,QOpATM,fecha,ID_Cuenta,codigoCuenta,abierto)
	select SaldoMinimo,SaldoInicial,SaldoFinal,QOpManuales,QOpATM,Fecha,ID_Cuenta,codigoCuenta,abierto
	from EstadoDeCuenta
	where (day(@fechaActual)=day(Fecha) and MONTH(@fechaActual)>month(Fecha)) and abierto=1


	--Multas de saldo negativo
	begin transaction
	begin try
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion,saldoFinal)
		select c.codigoCuenta,c.ID,e.fecha,-t.multaSaldoNegativo,'192.168.1.1',SYSDATETIME(),'Simulacion',7,'Multa por saldo negativo',c.saldo-t.multaSaldoNegativo
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where c.saldo<0

		update dbo.Cuenta
		set saldo=saldo-t.multaSaldoNegativo
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where c.saldo<0

		--Multas de salgo minimo
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,saldoFinal,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,-t.multaSaldoMinimo,'192.168.1.1',SYSDATETIME(),'Simulacion',13,c.saldo-t.multaSaldoMinimo,'Multa por saldo minimo saldo: '+str(e.saldoMinimo)
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.saldoMinimo<t.saldoMinimo

		update dbo.Cuenta
		set saldo=saldo-t.multaSaldoNegativo
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.saldoMinimo<t.saldoMinimo

		--Multas de maximo QopATM
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,saldoFinal,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,-t.multaQMaxAtm,'192.168.1.1',SYSDATETIME(),'Simulacion',9,c.saldo-t.multaQMaxAtm,'Multa por maximo de operaciones en ATM: '+STR(e.QOpATM)
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.QOpATM>t.QMaxATM

		update dbo.Cuenta
		set saldo=saldo-t.multaQMaxAtm
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.QOpATM>t.QMaxATM
	
		--Multas de maxmimo QopManuales
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,saldoFinal,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,-t.multaQMaxManual,'192.168.1.1',SYSDATETIME(),'Simulacion',7,c.saldo-t.multaQMaxManual,'Multa por maximo de operaciones manuales: '+STR(e.QOpManuales)
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.QOpManuales>t.QMaxManual

		update dbo.Cuenta
		set saldo=saldo-t.multaQMaxManual
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where  e.QOpManuales>t.QMaxManual

		--Aplicar cargos por servicio y sumar interes acumulados 
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,saldoFinal,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,-t.cargoXservicio,'192.168.1.1',SYSDATETIME(),'Simulacion',10,c.saldo-t.cargoXservicio,'cargo por servicio'
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
	
		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,InteresAcumFinal,descripcion)
		select c.ID,2,e.Fecha,c.saldo,((t.tasaInteres*c.saldo)/365),c.interesesAcum,'calculo de intereses acumulados'
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)

		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,InteresAcumFinal,descripcion)
		select c.ID,1,e.fecha,c.saldo,((t.tasaInteres*c.saldo)/365),0,'debito de intereses acumulados'
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)

		update dbo.Cuenta
		set saldo=(c.saldo-t.cargoXservicio+c.interesesAcum),interesesAcum=0
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)

		-- cerrar estados de cuenta y abrir los del siguiente mes
		update @estadosActualizar
		set abierto=0, SaldoFinal=c.saldo
		from @estadosActualizar e inner join  Cuenta c on(e.ID_Cuenta=c.ID)
	

		update dbo.EstadoDeCuenta
		set abierto=0,SaldoFinal=saldo
		from  @estadosActualizar e inner join  Cuenta c on(e.ID_Cuenta=c.ID) inner join EstadoDeCuenta e2 on (e2.ID_Cuenta=c.ID)
		where e2.abierto=1

		insert dbo.EstadoDeCuenta(Fecha,ID_Cuenta,codigoCuenta,SaldoInicial,SaldoMinimo)--CREAR UN NUEVO ESTADO DE CUENTA @ID_Cuentam
		select @fechaActual,e.ID_Cuenta,e.codigoCuenta,e.SaldoFinal,c.saldo
		From @estadosActualizar e inner join cuenta c on (e.ID_Cuenta=c.ID) 
	
	commit
	return 1
	end try
	begin catch 
	rollback
	print('error al aplicar movimientos de fin de mes')
	return 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[SP_movRecientes]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_movRecientes]
@cliente_vid varchar(50) 
as
begin
	begin try
		select top 6 m.* 
		from dbo.Cliente c inner join dbo.Cuenta cu on(c.ID=cu.ClienteID) inner join dbo.Movimiento m on (cu.ID=m.ID_Cuenta)
		where @cliente_vid=c.valorDocId
		order by m.ID desc
    return 1
	end try
	begin catch
		return 0
	end catch
end

 
GO
/****** Object:  StoredProcedure [dbo].[SP_multas]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_multas]
@EC_ID int
as
begin
	declare @tipoDeCuenta int
	declare @cuentaID int
	declare @QOmanualesEC INT
	declare @QOAtmEC INT
	declare @SaldoMinEC money
	declare @QOpManuales int
	declare @QOpATM int
	declare @saldoMin money
	declare @multaSaldomin money
	declare @multaQMaxManual money
	declare @multaQMaxATM money
	declare @multaSaldoneg money
	declare @cargoXservicio money
	declare @fechaEC date
	declare @cuentaCod varchar(50)

	select @cuentaID=e.ID_Cuenta,@QOmanualesEC=e.QOpManuales,@QOAtmEC=e.QOpATM,@SaldoMinEC=e.SaldoMinimo,@fechaEC=Fecha
	from dbo.EstadoDeCuenta e
	where e.ID=@EC_ID

	select @tipoDeCuenta=c.tipoCuenta,@cuentaCod=codigoCuenta
	from Cuenta c
	where c.ID=@cuentaID

	select @QOpManuales=t.QMaxManual,@QOpATM=t.QMaxATM,@saldoMin=t.saldoMinimo,@multaSaldomin=t.multaSaldoMinimo,
	@multaQMaxManual=t.multaQMaxManual,@multaQMaxATM=t.multaQMaxAtm,@multaSaldoneg=t.multaSaldoNegativo,@cargoXservicio=t.cargoXservicio
	from dbo.TipoCuenta t
	where t.id=@tipoDeCuenta

	begin transaction 
	begin try
		if (select saldo from Cuenta where ID=@cuentaID)<0
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaSaldoneg,'192.168.1.1',SYSDATETIME(),'Simulacion',7,'Multa por saldo negativo')
			update dbo.Cuenta
			set saldo=saldo-@multaSaldoneg
			where ID=@cuentaID
		end
		if @SaldoMinEC<@saldoMin
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaSaldomin,'192.168.1.1',SYSDATETIME(),'Simulacion',13,'Multa por saldo minimo saldo: '+str(@SaldoMinEC))
			update dbo.Cuenta
			set saldo=saldo-@multaSaldomin
			where ID=@cuentaID
		end
		if @QOAtmEC>@QOpATM
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaQMaxATM,'192.168.1.1',SYSDATETIME(),'Simulacion',9,'Multa por maximo de operaciones en ATM: '+STR(@QOAtmEC))
			update dbo.Cuenta
			set saldo=saldo-@multaQMaxATM
			where ID=@cuentaID
		end
		if @QOmanualesEC>@QOpManuales
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaQMaxManual,'192.168.1.1',SYSDATETIME(),'Simulacion',7,'Multa por maximo de operaciones manuales: '+STR(@QOmanualesEC))
			update dbo.Cuenta
			set saldo=saldo-@multaQMaxManual
			where ID=@cuentaID
		end
		
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
		values(@cuentaCod,@cuentaID,@fechaEC,@cargoXservicio,'192.168.1.1',SYSDATETIME(),'Simulacion',10,' ')
		update dbo.Cuenta
		set saldo=saldo-@cargoXservicio
		where ID=@cuentaID

		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,descripcion)
		select c.ID,2,@fechaEC,c.saldo,((t.tasaInteres*c.saldo)/365),'calculo de intereses acumulados'
		from dbo.cuenta c inner join dbo.TipoCuenta t on(c.tipoCuenta=t.id) join dbo.EstadoDeCuenta e on (e.ID_Cuenta=c.ID)
		where e.ID=@EC_ID	
		update dbo.Cuenta
		set saldo=saldo+interesesAcum
		where ID=@cuentaID

		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,descripcion)
		select c.ID,1,@fechaEC,c.saldo,((t.tasaInteres*c.saldo)/365),'calculo de intereses acumulados'
		from dbo.cuenta c inner join dbo.TipoCuenta t on(c.tipoCuenta=t.id) join dbo.EstadoDeCuenta e on (e.ID_Cuenta=c.ID)
		where e.ID=@EC_ID	
		update dbo.Cuenta
		set interesesAcum=interesesAcum-interesesAcum
		where ID=@cuentaID		
		commit
	end try
	begin catch
		print('error al aplicar multas')
		rollback
	end catch

end
GO
/****** Object:  StoredProcedure [dbo].[SP_top20_CD]    Script Date: 9/27/2018 1:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_top20_CD]
as
begin 
	begin try
	select top 20 sum(monto),c.codigoCuenta
	from Movimiento m inner join cuenta c on(m.ID_Cuenta=c.ID)
	group by c.codigoCuenta
	order by sum(m.monto) desc
	return 1
	end try
	begin catch
	print('error top 20')
	return 0
	end catch
end
GO
USE [BD_1_Tarea]
GO
ALTER DATABASE [BD_1_Tarea] SET  READ_WRITE 
GO
