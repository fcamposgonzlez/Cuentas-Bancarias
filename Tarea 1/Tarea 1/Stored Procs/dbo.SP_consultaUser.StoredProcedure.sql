USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_consultaUser]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_consultaUser]
@usu varchar (50),
@pas varchar (50)

as
begin
	begin try
		select Nombre, valorDocId, contrasenna, activo from Cliente where @usu = ValorDocID and @pas = contrasenna;
	end try
	begin catch
		return 0
	end catch
end;
GO
