USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_multas]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_multas]
@EC_ID int
as
begin
	declare @tipoDeCuenta int
	declare @cuentaID int
	declare @QOmanualesEC INT
	declare @QOAtmEC INT
	declare @SaldoMinEC money
	declare @QOpManuales int
	declare @QOpATM int
	declare @saldoMin money
	declare @multaSaldomin money
	declare @multaQMaxManual money
	declare @multaQMaxATM money
	declare @multaSaldoneg money
	declare @cargoXservicio money
	declare @fechaEC date
	declare @cuentaCod varchar(50)

	select @cuentaID=e.ID_Cuenta,@QOmanualesEC=e.QOpManuales,@QOAtmEC=e.QOpATM,@SaldoMinEC=e.SaldoMinimo,@fechaEC=Fecha
	from dbo.EstadoDeCuenta e
	where e.ID=@EC_ID

	select @tipoDeCuenta=c.tipoCuenta,@cuentaCod=codigoCuenta
	from Cuenta c
	where c.ID=@cuentaID

	select @QOpManuales=t.QMaxManual,@QOpATM=t.QMaxATM,@saldoMin=t.saldoMinimo,@multaSaldomin=t.multaSaldoMinimo,
	@multaQMaxManual=t.multaQMaxManual,@multaQMaxATM=t.multaQMaxAtm,@multaSaldoneg=t.multaSaldoNegativo,@cargoXservicio=t.cargoXservicio
	from dbo.TipoCuenta t
	where t.id=@tipoDeCuenta

	begin transaction 
	begin try
		if (select saldo from Cuenta where ID=@cuentaID)<0
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaSaldoneg,'192.168.1.1',SYSDATETIME(),'Simulacion',7,'Multa por saldo negativo')
			update dbo.Cuenta
			set saldo=saldo-@multaSaldoneg
			where ID=@cuentaID
		end
		if @SaldoMinEC<@saldoMin
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaSaldomin,'192.168.1.1',SYSDATETIME(),'Simulacion',13,'Multa por saldo minimo saldo: '+str(@SaldoMinEC))
			update dbo.Cuenta
			set saldo=saldo-@multaSaldomin
			where ID=@cuentaID
		end
		if @QOAtmEC>@QOpATM
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaQMaxATM,'192.168.1.1',SYSDATETIME(),'Simulacion',9,'Multa por maximo de operaciones en ATM: '+STR(@QOAtmEC))
			update dbo.Cuenta
			set saldo=saldo-@multaQMaxATM
			where ID=@cuentaID
		end
		if @QOmanualesEC>@QOpManuales
		begin
			insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
			values(@cuentaCod,@cuentaID,@fechaEC,@multaQMaxManual,'192.168.1.1',SYSDATETIME(),'Simulacion',7,'Multa por maximo de operaciones manuales: '+STR(@QOmanualesEC))
			update dbo.Cuenta
			set saldo=saldo-@multaQMaxManual
			where ID=@cuentaID
		end
		
		insert dbo.Movimiento (codigoCuentaMovimiento,ID_Cuenta,fecha,monto,pastIP,pastTime,pastUser,tipoMovimiento,descripcion)
		values(@cuentaCod,@cuentaID,@fechaEC,@cargoXservicio,'192.168.1.1',SYSDATETIME(),'Simulacion',10,' ')
		update dbo.Cuenta
		set saldo=saldo-@cargoXservicio
		where ID=@cuentaID

		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,descripcion)
		select c.ID,2,@fechaEC,c.saldo,((t.tasaInteres*c.saldo)/365),'calculo de intereses acumulados'
		from dbo.cuenta c inner join dbo.TipoCuenta t on(c.tipoCuenta=t.id) join dbo.EstadoDeCuenta e on (e.ID_Cuenta=c.ID)
		where e.ID=@EC_ID	
		update dbo.Cuenta
		set saldo=saldo+interesesAcum
		where ID=@cuentaID

		insert dbo.MovimientoInteres (ID_Cuenta,tipoMovimientoInteres,fecha,saldo,interesDiario,descripcion)
		select c.ID,1,@fechaEC,c.saldo,((t.tasaInteres*c.saldo)/365),'calculo de intereses acumulados'
		from dbo.cuenta c inner join dbo.TipoCuenta t on(c.tipoCuenta=t.id) join dbo.EstadoDeCuenta e on (e.ID_Cuenta=c.ID)
		where e.ID=@EC_ID	
		update dbo.Cuenta
		set interesesAcum=interesesAcum-interesesAcum
		where ID=@cuentaID		
		commit
	end try
	begin catch
		print('error al aplicar multas')
		rollback
	end catch

end
GO
