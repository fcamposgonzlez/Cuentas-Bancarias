USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_ClienteDeleteByID]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ClienteDeleteByID]
@ID int
AS
begin
		begin try
			Update Cliente
			Set
			activo = 0
			WHERE ID = @ID
		end try
		begin catch
			return 0
		end catch
end
GO
