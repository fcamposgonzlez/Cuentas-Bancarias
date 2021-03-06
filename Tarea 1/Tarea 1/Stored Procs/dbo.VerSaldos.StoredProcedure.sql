USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[VerSaldos]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerSaldos]
	@valorDocIDau varchar(50)
as
begin
	begin try
		select cu.codigoCuenta, cu.saldo 
		from Cliente c join Cuenta cu on (c.valorDocId = cu.docIdCliente) 
		where @valorDocIDau = cu.docIdCliente;
	end try
	begin catch
		return 0
	end catch
end;
GO
