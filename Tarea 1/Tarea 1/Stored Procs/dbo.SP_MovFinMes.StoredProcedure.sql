USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_MovFinMes]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_MovFinMes]
@fechaActual date
as
begin
	declare @estadosActualizar table(ID_Cuenta INT,codigoCuenta varchar(50),fecha date,saldoInicial money,saldoFinal money, saldoMinimo money,QOpManuales int,QOpATM int,abierto bit)
	delete from @estadosActualizar
	
	insert @estadosActualizar(saldoMinimo,saldoInicial,saldoFinal,QOpManuales,QOpATM,fecha,ID_Cuenta,codigoCuenta,abierto)
	select SaldoMinimo,SaldoInicial,SaldoFinal,QOpManuales,QOpATM,Fecha,ID_Cuenta,codigoCuenta,abierto
	from EstadoDeCuenta
	where (day(@fechaActual)=day(Fecha) and MONTH(@fechaActual)>month(Fecha)) and abierto=1


	--Multas de saldo negativo
	begin transaction
	begin try
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,t.multaSaldoNegativo,'192.168.1.1',SYSDATETIME(),'Simulacion',7,'Multa por saldo negativo'
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where c.saldo<0

		update dbo.Cuenta
		set saldo=saldo-t.multaSaldoNegativo
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where c.saldo<0

		--Multas de salgo minimo
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,t.multaSaldoMinimo,'192.168.1.1',SYSDATETIME(),'Simulacion',13,'Multa por saldo minimo saldo: '+str(e.saldoMinimo)
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.saldoMinimo<t.saldoMinimo

		update dbo.Cuenta
		set saldo=saldo-t.multaSaldoNegativo
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.saldoMinimo<t.saldoMinimo

		--Multas de maximo QopATM
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,t.multaQMaxAtm,'192.168.1.1',SYSDATETIME(),'Simulacion',9,'Multa por maximo de operaciones en ATM: '+STR(e.QOpATM)
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.QOpATM>t.QMaxATM

		update dbo.Cuenta
		set saldo=saldo-t.multaQMaxAtm
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.QOpATM>t.QMaxATM
	
		--Multas de maxmimo QopManuales
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,t.multaQMaxManual,'192.168.1.1',SYSDATETIME(),'Simulacion',7,'Multa por maximo de operaciones manuales: '+STR(e.QOpManuales)
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where e.QOpManuales>t.QMaxManual

		update dbo.Cuenta
		set saldo=saldo-t.multaQMaxManual
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
		where  e.QOpManuales>t.QMaxManual

		--Aplicar cargos por servicio y sumar interes acumulados 
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
		select c.codigoCuenta,c.ID,e.fecha,t.cargoXservicio,'192.168.1.1',SYSDATETIME(),'Simulacion',10,'cargo por servicio'
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)
	
		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,descripcion)
		select c.ID,2,e.Fecha,c.saldo,((t.tasaInteres*c.saldo)/365),'calculo de intereses acumulados'
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)

		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,descripcion)
		select c.ID,1,e.fecha,c.saldo,((t.tasaInteres*c.saldo)/365),'debito de intereses acumulados'
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)

		update dbo.Cuenta
		set saldo=(c.saldo-t.cargoXservicio+c.interesesAcum),interesesAcum=0
		from @estadosActualizar e inner join Cuenta c on(e.ID_Cuenta=c.ID) inner join TipoCuenta t on (t.id=c.tipoCuenta)

		-- cerrar estados de cuenta y abrir los del siguiente mes
		update @estadosActualizar
		set abierto=0, SaldoFinal=c.saldo
		from @estadosActualizar e inner join  Cuenta c on(e.ID_Cuenta=c.ID)
	

		update dbo.EstadoDeCuenta
		set abierto=0,SaldoFinal=saldo
		from  @estadosActualizar e inner join  Cuenta c on(e.ID_Cuenta=c.ID) inner join EstadoDeCuenta e2 on (e2.ID_Cuenta=c.ID)
		where e2.abierto=1

		insert dbo.EstadoDeCuenta(Fecha,ID_Cuenta,codigoCuenta,SaldoInicial,SaldoMinimo)--CREAR UN NUEVO ESTADO DE CUENTA @ID_Cuentam
		select @fechaActual,e.ID_Cuenta,e.codigoCuenta,e.SaldoFinal,c.saldo
		From @estadosActualizar e inner join cuenta c on (e.ID_Cuenta=c.ID) 
	
	commit
	return 1
	end try
	begin catch 
	rollback
	print('error al aplicar movimientos de fin de mes')
	return 0
	end catch
end
GO
