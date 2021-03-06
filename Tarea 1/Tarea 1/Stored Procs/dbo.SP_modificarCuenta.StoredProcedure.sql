USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_modificarCuenta]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_modificarCuenta]
@ID int,
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
	where @ID = ID

	select @idAdmin=id
	from Administrador
	where ValorDocID = @adminDocID
	set @pastTime=SYSDATETIMEOFFSET()

	begin transaction
	begin try
	set @xmlantes=(select * FROM Cuenta  
				   where ID = @ID
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,5,@xmlantes)

	set @saldo = @saldo/1000
	set @interesAcum = @interesAcum/1000

	update cuenta set tipoCuenta=@tipoCuenta,saldo=@saldo,interesesAcum=@interesAcum,docIdCliente=@clienteDocID,activo=@activo
	where ID = @ID
	update Evento set XMLdespues=(select * FROM Cuenta  
				   where ID = @ID
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
