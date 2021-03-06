USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarTipoCuenta]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarTipoCuenta]
@ID int,
@nombre varchar(50),
@tasaInteres nvarchar,
@saldoMinimo money,
@QMaxManual int,
@QMaxATM int,
@multaSaldoMinimo money,
@multaQMaxManual money,
@multaQMaxAtm money,
@multaSaldoNegativo money,
@cargoXservicio money,
@activo bit,

@pastIP varchar(50),
@pastTime varchar(50),
@adminDocID VARCHAR(50)


AS
BEGIN
IF(@ID=0)
	exec SP_insertarTipoCuenta @ID,@nombre,@tasaInteres,@saldoMinimo,@QMaxManual,@QMaxATM,@multaSaldoMinimo,@multaQMaxManual,@multaQMaxAtm,@multaSaldoNegativo,@cargoXservicio,@pastIP,@adminDocID
ELSE
	exec SP_modificarTipoCuenta @ID,@nombre,@tasaInteres,@saldoMinimo,@QMaxATM,@QMaxManual,@multaSaldoMinimo,@multaSaldoNegativo,@multaQMaxAtm,@multaQMaxManual,@cargoXservicio,@activo,@pastIP,@adminDocID
END
GO
