USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_crearCuenta]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_crearCuenta]
@docIdCliente varchar(50),
@Tipo int,
@codigo varchar(50)
as
begin
	begin try
		declare @clienteid int
		select @clienteid=id
		from Cliente
		where valorDocId=@docIdCliente

		insert dbo.Cuenta(clienteID,docIdCliente,tipoCuenta,codigoCuenta,fechaCreacion)
		values(@clienteid,@docIdCliente,@Tipo,@codigo,getdate())
		return 1
	end try
	begin catch
		return 0
	end catch
end
GO
