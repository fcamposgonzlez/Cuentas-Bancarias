USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_crearCliente]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_crearCliente]
@docID varchar(50),
@nombre varchar(50),
@contrasenna varchar(50)
as
begin
begin try
	insert Cliente(nombre,valorDocId,contrasenna)
	values (@nombre,@docID,@contrasenna)
	return 1
end try
begin catch
	return 0
end catch 
end  
GO
