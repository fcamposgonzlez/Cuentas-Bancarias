USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_ViewAllCuentasByID]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ViewAllCuentasByID]
@ID int
AS
begin
	begin try
		Select *
		from Cuenta
		where @ID = ID
		return 1
	end try
	begin catch
		return 0
	end catch
end
GO
