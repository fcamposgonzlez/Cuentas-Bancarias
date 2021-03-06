USE [BD_1_Tarea]
GO
/****** Object:  StoredProcedure [dbo].[SP_ListaCuentas]    Script Date: 29/09/2018 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaCuentas]
as
begin
	begin try
	declare @t table(
		CodigoCuenta varchar(50), 
		PromSaldoFin float, 
		PromSaldoMin float, 
		CantMovimiento float,
		CantPromMov float,
		CantMultas float,
		SumMultas float)
		
		INSERT INTO @t (CodigoCuenta, PromSaldoFin, PromSaldoMin,CantMovimiento)
		SELECT c.codigoCuenta, AVG(ec.SaldoFinal),AVG(ec.SaldoMinimo),COUNT(m.ID)
		FROM Cuenta c join EstadoDeCuenta ec on (ec.ID_Cuenta = c.ID)  join Movimiento m  on (c.ID = m.ID_Cuenta)
		where ec.abierto = 0
		Group By c.codigoCuenta
		

		Merge into @t tab using( 
		SELECT c.codigoCuenta vv,AVG(m.ID) cc
		FROM Cuenta c join EstadoDeCuenta ec on (ec.ID_Cuenta = c.ID) join Movimiento m  on (c.ID = m.ID_Cuenta)
		Group By c.codigoCuenta
		) S 
		on tab.CodigoCuenta = S.vv
		When Matched then
			Update
			Set tab.CantPromMov = (S.cc/30)/4;

		Merge into @t tab using( 
		SELECT c.codigoCuenta vv, COUNT(m.ID) cc
		FROM Cuenta c inner join EstadoDeCuenta ec on (ec.ID_Cuenta = c.ID) inner join Movimiento m  on (c.ID = m.ID_Cuenta)
		where (m.tipoMovimiento = 7 or m.tipoMovimiento = 8 or m.tipoMovimiento = 9 or m.tipoMovimiento = 13)
		Group By c.codigoCuenta
		) S 
		on tab.CodigoCuenta = S.vv
		When Matched then
			Update
			Set CantMultas = S.cc;

		Merge into @t tab using( 
		SELECT c.codigoCuenta vv, SUM(m.monto) cc
		FROM Cuenta c inner join EstadoDeCuenta ec on (ec.ID_Cuenta = c.ID) inner join Movimiento m  on (c.ID = m.ID_Cuenta)
		where (m.tipoMovimiento = 7 or m.tipoMovimiento = 8 or m.tipoMovimiento = 9 or m.tipoMovimiento = 13)
		Group By c.codigoCuenta
		) S 
		on tab.CodigoCuenta = S.vv
		When Matched then
			Update
			Set tab.SumMultas = S.cc;

		SELECT * 
		FROM @t
		ORDER BY PromSaldoFin DESC

	end try
	begin catch
		return 0
	end catch
end;
GO
