USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_borrarCliente]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_borrarCliente]
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
