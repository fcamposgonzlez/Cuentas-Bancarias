USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarCuenta]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarCuenta]
@ID int,
@docIdCliente varchar(50),
@tipoCuenta int,
@codigoCuenta varchar(50),
@saldo money,
@fechaCreacion date,
@interesesAcum money,
@activo bit,

@pastIP varchar(50),
@pastTime varchar(50),
@adminDocID VARCHAR(50)


AS
BEGIN
IF(@ID=0)
	exec SP_insertarCuenta @docIdCliente,@tipoCuenta,@codigoCuenta,@pastIP,@adminDocID
ELSE
	exec SP_modificarCuenta @ID,@tipoCuenta,@codigoCuenta,@docIdCliente,@saldo,@interesesAcum,@activo,@pastIP,@adminDocID

END
GO
