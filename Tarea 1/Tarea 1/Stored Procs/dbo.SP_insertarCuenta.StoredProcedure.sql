USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_insertarCuenta]    Script Date: 29/09/2018 22:08:02 ******/
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
