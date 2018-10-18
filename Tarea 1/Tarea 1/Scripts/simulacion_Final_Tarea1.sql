SET NOCOUNT ON 
use BD_1_Tarea
--se declara la variable fechainicial para la simulaciond
declare @temp varchar(12)
declare @fechaInicial date
declare @fechaFinal date
set @temp='8/1/2018'
set @fechaInicial= convert(varchar, @temp,103)
set @temp= '12/10/2018'
set @fechaFinal= convert(varchar, @temp,103)

DECLARE @XML XML
SET @XML = (
			  SELECT *
			  FROM OPENROWSET(BULK 'C:\Users\fcamp\OneDrive\TEC\Bases de Datos 1\Tareas Programadas\Tarea 1\Tarea 1\Tarea 1\XML\Operaciones.xml', SINGLE_BLOB) AS data
			)
DECLARE @handle INT  
DECLARE @PrepareXmlStatus INT  
EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML

declare @Tfechas table (fecha varchar(20))
declare @clientesCrear table(sec int identity(1,1),nombre varchar(50),valorDocId varchar(50),contrasenna varchar(50))
declare @cuentasCrear table(sec int identity(1,1), docIdCliente varchar(50),tipoCuenta int,codigoCuenta varchar(50))
declare @movimientosCrear table(sec int identity(1,1),monto money, tipoMovimiento int, codigoCuenta_Movimiento varchar(50),descripcion varchar(150))
declare @estadosActualizar table(sec int identity(1,1),cuentaID INT,codigoCuenta varchar(50),fecha date,saldoInicial money,saldoFinal money, saldoMinimo money,QOpManuales int,QOpATM int,abierto bit)


declare @low1 int
declare @hi1 int
declare @low2 int
declare @hi2 int
declare @low3 int
declare @hi3 int
declare @low4 int
declare @hi4 int
declare @low5 int
declare @hi5 int

declare @monto money
declare @codCuenta varchar(50)
declare @descripcion varchar(100)
declare @tipoMov int

declare @cuentaIDm int
declare @saldo money 
declare @idEC INT
declare @fechaEC date
declare @saldomin money
declare @fechaReal datetime
set @fechaReal=SYSDATETIME()
declare @ipadress varchar(50)
set @ipadress='192.168.1.1'
declare @var int
set @var = 0
declare @fechaTemp date
declare @ruta varchar(50)
declare @idEC2 int 
declare @valorDocId varchar(50)
declare @nombre varchar(50)
declare @password varchar(50)
declare @DocId varchar(50)
declare @tipoCuenta int
declare @codigoCuenta varchar(50)
declare @clienteID INT
declare @cuentaID INT
declare @tasaInteres float

insert @Tfechas (fecha)
select fecha
from OPENXML(@handle,'dataset/fechaOperacion') WITH (fecha varchar(20))
insert @Tfechas (fecha)
select convert(varchar,fecha,103) 
from @Tfechas

while @fechaInicial<=@fechaFinal
begin
	--crear clientes
	delete from @clientesCrear

	set @var=@var+1
	set @ruta=	'dataset/fechaOperacion[' + cast(@var as varchar) + ']/Cliente'				
	insert @clientesCrear (nombre ,valorDocId,contrasenna)
	select nombre,valorDocId ,contrasenna 
	from OPENXML(@handle,@ruta) WITH (nombre varchar(50),valorDocId varchar(50),contrasenna varchar(50))


	select @low1=min(sec),@hi1=max(sec)
	from @clientesCrear

	while @low1<=@hi1
	begin
		select  @valorDocId=c.valorDocId,@nombre=c.Nombre,@password=c.contrasenna
		from @clientesCrear c
		where c.sec=@low1
		insert dbo.Cliente(Nombre,ValorDocID,contrasenna,activo)
		values(@nombre,@valorDocId,@password,1)
		set @low1=@low1+1
	end
	--crear cuentas
	delete @cuentasCrear

	set @ruta=	'dataset/fechaOperacion[' + cast(@var as varchar) + ']/Cuenta'
	insert @cuentasCrear(docIdCliente,tipoCuenta,codigoCuenta )
	select docIdCliente,tipoCuenta,codigoCuenta
	from OPENXML(@handle,@ruta) WITH (docIdCliente varchar(50),tipoCuenta int,codigoCuenta varchar(50))

	select @low2=min(sec),@hi2=max(sec)
	from @cuentasCrear

	while @low2<=@hi2
	begin

		
		select  @DocId=c.docIdCliente,@tipoCuenta=c.tipoCuenta,@codigoCuenta=c.codigoCuenta
		from @cuentasCrear c
		where c.sec=@low2

		select @clienteID=t.ID
		from Cliente t 
		where t.ValorDocID=@DocId

		insert dbo.Cuenta(ClienteID,tipoCuenta,docIdCliente,codigoCuenta,fechaCreacion,saldo,interesesAcum,activo)
		values(@clienteID,@tipoCuenta,@DocId,@codigoCuenta,@fechaInicial,0,0,1)

		--crear estadoDeCuenta
		select @cuentaID=t.ID
		from dbo.Cuenta t 
		where t.codigoCuenta=@codigoCuenta
		
		set @fechaTemp =@fechaInicial
		if (Day(@fechaTemp)=31)
		begin
			set @fechaTemp= dateadd(d,-2,@fechaTemp)
		end
		insert dbo.EstadoDeCuenta(Fecha,CuentaID,codigoCuenta,SaldoMinimo,SaldoInicial)
		values(@fechaTemp,@cuentaID,@codigoCuenta,15000,15000)
		set @low2=@low2+1
	end
	
	--crear movimientos
	delete @movimientosCrear

	set @ruta=	'dataset/fechaOperacion[' + cast(@var as varchar) + ']/Movimiento'
	insert @movimientosCrear(monto, tipoMovimiento, codigoCuenta_Movimiento,descripcion)
	select monto, tipoMovimiento, codigoCuenta_Movimiento,descripcion 
	from OPENXML(@handle,@ruta) WITH (monto money, tipoMovimiento int, codigoCuenta_Movimiento varchar(50),descripcion varchar(150))

	select @low3=min(sec),@hi3=max(sec)
	from @movimientosCrear

	while @low3<=@hi3
	begin
		select  @monto=c.monto,@tipoMov=c.tipoMovimiento,@codCuenta=c.codigoCuenta_Movimiento,@descripcion=c.descripcion
		from @movimientosCrear c
		where c.sec=@low3

		select @cuentaIDm=t.ID,@saldo=t.saldo 
		from dbo.Cuenta t 
		where (t.codigoCuenta=@codCuenta)

		select @idEC = t.ID,@saldomin= t.SaldoMinimo
		from dbo.EstadoDeCuenta t
		where (t.CuentaID=@cuentaIDm) and (t.abierto=1)
		
		set @monto=case 
					when @tipoMov=3 or  @tipoMov=4 or  @tipoMov=5 
						then -@monto
						else @monto
					end
		begin transaction
			begin try
				update EstadoDeCuenta
				set SaldoMinimo=case 
									when @saldo+@monto<SaldoMinimo
									then @saldo+@monto
									else SaldoMinimo
								end,
				QOpATM=case
								when @tipoMov=2 or @tipoMov=4
								then  QOpATM+1
								else QOpATM
						end,
				QOpManuales=case
								when @tipoMov=1 or @tipoMov=3
								then  QOpManuales+1
								else QOpManuales
						end
				where ID=@idEC

				insert dbo.Movimiento(cuentaID,tipoMovimiento,Monto,descripcion,codigoCuentaMovimiento,fecha,pastIP,pastTime,pastUser)
				values(@cuentaIDm,@tipoMov,@monto,@descripcion,@codCuenta,@fechaInicial,@ipadress,@fechaReal,'Simulacion')

			
				update Cuenta set saldo=saldo+@monto where codigoCuenta=@codCuenta
			commit
			end try
			begin catch
				print('error actualizando estados de cuenta')
				rollback
			end catch
		set @low3=@low3+1
	end
	--SUMAR INTERES DIARIO
	select @low4=min(ID),@hi4=max(ID)
	from dbo.Cuenta
	

	while @low4<@hi4
	begin
		set @tasaInteres=(select tasaInteres 
						  from dbo.Cuenta c inner join dbo.TipoCuenta t on (c.tipoCuenta=t.id) 
						   where c.ID=@low4)
		begin transaction
			begin try
				update Cuenta 
				set interesesAcum=interesesAcum+((saldo*@tasaInteres)/365)
				commit
			end try
			begin catch
				print('error al calcular interes diario')
				rollback
			end catch
	set @low4=@low4+1						
	end
	
	select @low5=min(ID),@hi5=max(ID)
	from dbo.EstadoDeCuenta
	where abierto=1


	while @low5<@hi5
	begin
		select @idEC2=id,@fechaEC=Fecha
		from EstadoDeCuenta
		where @low5=id
	if (day(@fechaInicial)=day(@fechaEC) and MONTH(@fechaInicial)> MONTH(@fechaEC))
		begin

			exec dbo.SP_multas @idEC2 --aplica multas
					
			update dbo.EstadoDeCuenta
			set SaldoFinal=(select saldo
				from dbo.Cuenta
				where ID=@cuentaIDm
				)
			where ID=@idEC2

			update dbo.EstadoDeCuenta set abierto=0 where ID=@idEC2 --cierra el estado de cuenta
			insert dbo.EstadoDeCuenta(Fecha,CuentaID,codigoCuenta,SaldoInicial,SaldoMinimo)--CREAR UN NUEVO ESTADO DE CUENTA @cuentaIDm
			select @fechaInicial,e.CuentaID,e.codigoCuenta,e.SaldoFinal,c.saldo
			From dbo.EstadoDeCuenta e inner join cuenta c on (e.CuentaID=c.ID)
			where e.ID=@idEC2
						 
		end		

	set @low5=@low5+1						
	end
	

	set @fechaInicial = dateadd(d,1,@fechaInicial)
end

--delete from Movimiento
--delete from MovimientoInteres
--delete from EstadoDeCuenta
--delete from cuenta
--delete from cliente

