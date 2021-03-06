USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_AcutalizarCuenta]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_AcutalizarCuenta]
@tipoCuenta int,
@codigoCuenta varchar(50),
@clienteDocId varchar(50),
@pastIP varchar(50),
@pastTime varchar(50),
@adminDocID VARCHAR(50),
@saldo money,
@interesAcum money
as
begin
	declare @idCliente int
	declare @idAdmin int
	declare @xmlantes varchar(8000)
	declare @xmldespues varchar(8000)
	select @idCliente=id
	from Cliente
	where @clienteDocId=ID

	select @idAdmin=id
	from Administrador
	where @adminDocID=ID
	
	begin transaction
	begin try
	set @xmlantes=(select * FROM Cuenta  
				   where codigoCuenta=@codigoCuenta
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,5,@xmlantes)

	update cuenta set tipoCuenta=@tipoCuenta,saldo=@saldo,interesesAcum=@interesAcum,docIdCliente=@clienteDocID
	where codigoCuenta=@codigoCuenta
	update Evento set XMLdespues=(select * FROM Cuenta  
				   where codigoCuenta=@codigoCuenta
				   FOR XML AUTO)
	commit
	end try
	begin catch
	rollback
	end catch

end
GO
