use BD_1_Tarea
DECLARE @XML XML
--Se insertan los datos basicos Tipo de cuenta 
SET @XML = (
			  SELECT *
			  FROM OPENROWSET(BULK 'C:\Users\fcamp\OneDrive\TEC\Bases de Datos 1\Tareas Programadas\Tarea 1\Tarea 1\Tarea 1\XML\TipoCuenta.xml', SINGLE_BLOB) AS data
			)


DECLARE @handle INT  
DECLARE @PrepareXmlStatus INT  

EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML 
INSERT dbo.TipoCuenta (id, nombre, tasaInteres, saldoMinimo,QMaxManual,QMaxATM,multaSaldoMinimo,multaQMaxManual,multaQMaxATM,multaSaldoNegativo,cargoXservicio)
	SELECT id, nombre, (tasaInteres/100), saldoMinimo,QMaxManual,QMaxATM,multaSaldoMinimo,multaQMaxManual,multaQMaxATM,multaSaldoNegativo,cargoXservicio
	FROM OPENXML(@handle, 'dataset/TipoCuenta') WITH (id int, nombre varchar(20),tasaInteres float ,saldoMinimo money,QMaxManual int,QMaxATM int,multaSaldoMinimo money,multaQMaxManual money,multaQMaxATM money, multaSaldoNegativo money,cargoXservicio money)


--Se insertan los datos basicos para Tipo evento
SET @XML = (
			  SELECT *
			  FROM OPENROWSET(BULK 'C:\Users\fcamp\OneDrive\TEC\Bases de Datos 1\Tareas Programadas\Tarea 1\Tarea 1\Tarea 1\XML\TipoEvento.xml', SINGLE_BLOB) AS data
			)
EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML
INSERT dbo.TipoEvento (id,nombre,descripcion)
	SELECT id, nombre, descripcion
	FROM OPENXML(@handle, 'dataset/TipoEvento') WITH (id int, nombre varchar(50),descripcion varchar(100))

--Se insertan los datos basicos para Tipo de Movimiento
SET @XML = (
			  SELECT *
			  FROM OPENROWSET(BULK 'C:\Users\fcamp\OneDrive\TEC\Bases de Datos 1\Tareas Programadas\Tarea 1\Tarea 1\Tarea 1\XML\TipoMovimiento.xml', SINGLE_BLOB) AS data
			)
EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML
INSERT dbo.TipoMovimiento(id,nombre,descripcion)
	SELECT id, nombre, descripcion
	FROM OPENXML(@handle, 'dataset/TipoMovimiento') WITH (id int, nombre varchar(50),descripcion varchar(100))

--Se insertan los datos basicos para Tipo de MovimientoInteres
SET @XML = (
			  SELECT *
			  FROM OPENROWSET(BULK 'C:\Users\fcamp\OneDrive\TEC\Bases de Datos 1\Tareas Programadas\Tarea 1\Tarea 1\Tarea 1\XML\TipoMovimientoInteres.xml', SINGLE_BLOB) AS data
			)
EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML
INSERT dbo.TipoMovimientoInteres(id,nombre,descripcion)
	SELECT id, nombre, descripcion
	FROM OPENXML(@handle, 'dataset/TipoMovimientoInteres') WITH (id int, nombre varchar(50),descripcion varchar(100))
--Se insertan los datos basicos para los administradores
SET @XML = (
			  SELECT *
			  FROM OPENROWSET(BULK 'C:\Users\fcamp\OneDrive\TEC\Bases de Datos 1\Tareas Programadas\Tarea 1\Tarea 1\Tarea 1\XML\Administrador.xml', SINGLE_BLOB) AS data
			)
EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @XML
INSERT dbo.Administrador(ID,Nombre,ValorDocID,Password)
	SELECT id,Nombre,ValorDocID,contrasenna
	FROM OPENXML(@handle, 'dataset/Administrador') WITH (id int, nombre varchar(50),valorDocId varchar(50),contrasenna varchar(50))

--delete from Movimiento
--delete from MovimientoInteres
--delete from EstadoDeCuenta
--delete from cuenta
--delete from cliente

--delete from dbo.Evento
--delete from dbo.TIpoEvento
--delete from dbo.TipoCuenta
--delete from dbo.TipoMovimiento
--delete from dbo.TipoMovimientoInteres
--delete from dbo.Administrador

--select * from Movimiento