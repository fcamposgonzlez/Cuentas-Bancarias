USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_consultaAdmin]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_consultaAdmin]
@usu varchar (50),
@pas varchar (50)

as
begin
	begin try
		select Nombre, ValorDocId, Password from Administrador where @usu = ValorDocID and @pas = Password;
	end try
	begin catch
		return 0
	end catch
end;
GO
