USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_ReducirSaldo]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ReducirSaldo]
@monto money, 
@codigoCuenta varchar(50)
as
begin
	begin try
		update dbo.Cuenta
		set saldo=saldo-@monto
		where codigoCuenta=@codigoCuenta
		return 1
	end try
	begin catch
		return 0
	end catch
end
GO
