DECLARE @ListaCuentas TABLE
	(
		IDCuenta int, 
		SaldoPromedio float,
		SaldoMinimo float,
		CantMovPromedio float,
		CantidadMultas int,
		SumaMultas int
	)

		INSERT INTO @ListaCuentas (IDCuenta,SaldoPromedio)
			SELECT c.ID,AVG(ec.SaldoFinal)
			FROM Cuenta c inner join EstadoDeCuenta ec on (c.ID = ec.CuentaID) 
			where ec.abierto = 0 and c.ID = ec.CuentaID
			GROUP BY c.ID

select * from @ListaCuentas


