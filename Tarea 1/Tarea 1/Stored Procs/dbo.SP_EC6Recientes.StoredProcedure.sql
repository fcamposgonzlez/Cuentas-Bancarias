USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_EC6Recientes]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_EC6Recientes]
@cliente_vid varchar(50) 
as
begin
	begin try
		select top 6* 
		from dbo.Cliente c inner join dbo.Cuenta cu on(c.ID=cu.clienteID) inner join dbo.EstadoDeCuenta ec on (cu.ID=ec.ID_Cuenta)
		where @cliente_vid=c.valorDocId
		order by ec.ID desc
    return 1
	end try
	begin catch
		return 0
	end catch
end
GO
