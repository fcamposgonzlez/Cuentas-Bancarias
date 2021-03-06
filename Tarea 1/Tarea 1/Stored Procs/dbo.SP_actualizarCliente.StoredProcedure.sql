USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_actualizarCliente]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_actualizarCliente]
@ID int,
@Nombre varchar(50),
@valorDocId varchar(50),
@contrasenna varchar(50),
@activo bit,

@pastIP varchar(50),
@pastTime varchar(50),
@adminDocID VARCHAR(50)

AS
BEGIN
IF(@ID=0)
	exec SP_insertarCliente @valorDocId,@Nombre, @contrasenna,@pastIp,@adminDocID
ELSE
	BEGIN
	select valorDocId as vidaux
	from Cliente
	where @ID = ID

	exec SP_modificarCliente @ID,vidaux,@valorDocId,@Nombre,@contrasenna,@activo,@pastIp,@pastTime,@adminDocID
	END
END
GO
