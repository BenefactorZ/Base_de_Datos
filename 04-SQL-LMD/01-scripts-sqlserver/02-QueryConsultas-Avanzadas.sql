--CONSULTAS AVANZADAS

 SELECT  R.Nombre AS [Nombre Empleado], 
         R.Num_Empl AS [Num Empleado],
		 R.Fecha_Contrato AS [Fecha de Contratacion],
		 R.Cuota AS [Cuotas de Ventas],
		 R.Ventas AS [Ventas Totales],
		 O.Ciudad AS [Ciudad de Oficina], 
		 R.Jefe AS [Numero de Jefe]
 FROM Representantes AS R
 INNER JOIN Oficinas AS O
 ON O.Oficina = R.Oficina_Rep
 WHERE (O.Ciudad IN ('Daimiel','Navarra','Castellón')) OR
 (R.Jefe IS NULL AND R.Fecha_Contrato >='1988-07-01') OR
 (R.Ventas>Cuota AND R.Ventas<=600000);

 --Listar todos los pedidos, mostrando el número de pedido
 --su importe y el nombre y el limite de credito del clientes

 SELECT * FROM Clientes;
  SELECT * FROM Pedidos;


  SELECT  P.Num_Pedido AS [Numero de Pedido],
          P.Importe AS [Importe Pedido],
		  C.Empresa AS [Nombre Cliente],
		  C.Limite_Credito AS [Limite de Credito]
 FROM Pedidos AS P
 INNER JOIN Clientes AS C
 ON P.Cliente = C.Num_Cli;