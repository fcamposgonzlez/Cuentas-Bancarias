USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_top20_CD]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_top20_CD]
as
begin 
	begin try
	select top 20 c.codigoCuenta, sum(m.monto) as monto
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
