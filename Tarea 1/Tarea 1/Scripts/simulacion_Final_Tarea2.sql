SET NOCOUNT ON 
use BD_1_Tarea
declare @fechaInicial date
declare @fechaFinal date
set @fechaInicial='8/1/2018'
set @fechaFinal= '12/10/2018'

declare @contFecha int
set @contFecha = 0
DECLARE @XML XML
SET @XML = (
			  SELECT *
			  FROM OPENROWSET(BULK 'C:\Users\fcamp\OneDrive\TEC\Bases de Datos 1\Tareas Programadas\Tarea 1\Tarea 1\Tarea 1\XML\Operaciones.xml', SINGLE_BLOB) AS data
			)

DECLARE @handle INT  
DECLARE @PrepareXmlStatus INT  
EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML
declare @ruta varchar(50)

while @fechaInicial<=@fechaFinal
begin
	--crear clientes
	set @contFecha=@contFecha+1
	set @ruta=	'dataset/fechaOperacion[' + cast(@contFecha as varchar) + ']/Cliente'	
	insert dbo.Cliente (nombre ,valorDocId,contrasenna)
	select nombre,valorDocId ,contrasenna 
	from OPENXML(@handle,@ruta) WITH (nombre varchar(50),valorDocId varchar(50),contrasenna varchar(50))
	
	--crear cuentas
	set @ruta=	'dataset/fechaOperacion[' + cast(@contFecha as varchar) + ']/Cuenta'	
	insert dbo.Cuenta(docIdCliente,tipoCuenta,codigoCuenta,fechaCreacion,saldo,interesesAcum,activo)
	select docIdCliente,tipoCuenta,codigoCuenta,@fechaInicial,0,0,1
	from OPENXML(@handle,@ruta) WITH (docIdCliente varchar(50),tipoCuenta int,codigoCuenta varchar(50))
	
	update dbo.Cuenta set clienteID=(select c.ID from Cliente c where c.valorDocId=docIdCliente)
	where fechaCreacion=@fechaInicial
	
	--crear estados de cuentas
	insert dbo.EstadoDeCuenta(Fecha,ID_Cuenta,codigoCuenta,SaldoMinimo,SaldoInicial)
	select @fechaInicial,c.ID,c.codigoCuenta,15000,15000
	from dbo.Cuenta c
	where c.fechaCreacion=@fechaInicial

	--crear movimientos
	set @ruta=	'dataset/fechaOperacion[' + cast(@contFecha as varchar) + ']/Movimiento'
	begin transaction
	begin try
		insert dbo.Movimiento(monto, tipoMovimiento, codigoCuentaMovimiento,descripcion,fecha,pastTime,pastUser,pastIP)
		select monto, tipoMovimiento, codigoCuenta_Movimiento,descripcion,@fechaInicial,'N\A','Simulacion','192.168.1.1' 
		from OPENXML(@handle,@ruta) WITH (monto money, tipoMovimiento int, codigoCuenta_Movimiento varchar(500),descripcion varchar(100))

		update dbo.Movimiento 
		set ID_cuenta=(select c.ID from Cuenta c where c.codigoCuenta=codigoCuentaMovimiento)
		where fecha=@fechaInicial

		update dbo.Movimiento 
		set monto=-monto 
		where (tipoMovimiento=3 or tipoMovimiento=4 or tipoMovimiento=5) and fecha=@fechaInicial

		update dbo.EstadoDeCuenta 
		set SaldoMinimo=case
							when c.saldo+m.monto<e.saldoMinimo
							then c.saldo+m.monto
							else e.saldoMinimo
						end,
		QOpATM=case
							when m.tipoMovimiento=2 or m.tipoMovimiento=4
							then e.QOpATM+1
							else e.QOpATM
						end,
		QOpManuales=case
							when m.tipoMovimiento=1 or m.tipoMovimiento=3
							then e.QOpManuales+1
							else e.QOpManuales
						end
		from dbo.Cuenta	c inner join dbo.Movimiento m on (c.ID=m.ID_Cuenta) inner join EstadoDeCuenta e on(e.ID_Cuenta=c.ID)
		where m.fecha=@fechaInicial and e.abierto=1
		
		update dbo.Cuenta set saldo=saldo+m.monto
					  from dbo.Cuenta c inner join dbo.Movimiento m on(m.ID_cuenta=c.ID) 
					  where m.fecha=@fechaInicial
								
	commit 
	end try
	begin catch

	rollback
	print('error actualizando estados de cuenta')
	end catch	
							
	--SUMAR INTERES DIARIO
	update dbo.Cuenta set interesesAcum =interesesAcum+((c.saldo*t.tasaInteres)/365)
	from Cuenta c inner join TipoCuenta t on(c.tipoCuenta=t.id)
	where c.activo=1 and c.saldo>0

	exec SP_MovFinMes @fechaInicial-- stored procedure que se encarga de ejecutar los movimientos de fin de mes de las cuentas correspondientes 

	set @fechaInicial = dateadd(d,1,@fechaInicial)
end

--delete from Movimiento
--delete from MovimientoInteres
--delete from EstadoDeCuenta
--delete from cuenta
--delete from cliente
