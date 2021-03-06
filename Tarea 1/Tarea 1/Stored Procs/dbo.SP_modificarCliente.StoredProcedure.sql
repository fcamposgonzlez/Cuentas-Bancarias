USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_modificarCliente]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_modificarCliente]
@ID int,
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
	where @adminDocID= ValorDocID
	begin transaction
	begin try
	set @xmlantes=(select * FROM Cliente  
				   where ID=@ID
				   FOR XML AUTO)
	insert Evento(AdminID,EntidadID,PastIP,PastTime,TipoDeEvento,XMLantes)
	values(@idAdmin,@adminDocID,@pastIP,@pastTime,2,@xmlantes)
	update cliente set nombre=@nombreN,valorDocId=@valorDocN,contrasenna=@contresennaN,activo=@activo
	where ID=@ID
	update Evento set XMLdespues=(select * FROM Cliente	  
								  where ID=@ID
				                  FOR XML AUTO)
								  where XMLantes=@xmlantes

	commit
	end try
	begin catch
		rollback 
	end catch
end
GO
