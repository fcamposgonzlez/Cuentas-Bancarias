USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_modificarTipoCuenta]    Script Date: 29/09/2018 22:08:02 ******/
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

		set @saldoMinimo = @saldoMinimo/10000
		set @multaSaldoMin = @multaSaldoMin/10000
		set @multaSaldoNeg = @multaSaldoNeg /10000
		set @multaQATM = @multaQATM /10000
		set @multaManual = @multaManual/10000 
		set @cargoxser = @cargoxser/10000

		update dbo.TipoCuenta set nombre=@nombre,tasaInteres=@tasaInteres,saldoMinimo=@saldoMinimo,QMaxATM=@qAtmMax,QMaxManual=@qManualesMax,multaSaldoMinimo=@multaSaldoMin,multaSaldoNegativo=@multaSaldoNeg,multaQMaxAtm=@multaQATM,multaQMaxManual=@multaManual,cargoXservicio=@cargoxser,activo=@activo
		where id = @id
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
