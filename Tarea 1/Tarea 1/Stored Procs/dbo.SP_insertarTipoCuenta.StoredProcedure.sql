USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_insertarTipoCuenta]    Script Date: 29/09/2018 22:08:02 ******/
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
		values (@id,@nombre ,@tasaInteres ,@saldoMinimo ,@qAtmMax,@qManualesMax,@multaSaldoMin, @multaSaldoNeg, @multaQATM,@multaManual,@cargoxser)
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
