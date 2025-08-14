use NORTHWND;
GO
 USE BDEJEMPLO2;

--SELECCIONAR TODOS LOS CLIENTES 
SELECT * FROM Customers;
GO

--Seleccionar todos los clientes pero solamente mostrando, 
--La clave, el nombre del cliente, la ciudad y el pais (Proyeccion)
SELECT CustomerID, CompanyName, city, Country
FROM Customers;
GO

--Alias de columna
SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Cliente', city  Ciudad, Country AS [Ciudad chida]
FROM Customers;
GO

--Campos Calculadora

--Seleccionar las ordenes de compra mostrando los productos, la cantidad vendida
--precio de venta, el descuente y el total

SELECT ProductID AS [Nombre producto], UnitPrice AS [Precio],
Quantity AS [Cantidad], Discount AS [Descuento],
UnitPrice * Quantity AS [Importe sin descuento],
UnitPrice * Quantity  * (1 * Discount) AS [Importe]
FROM [Order Details];

--Seleccionar las ordenes de compra, mostrando el cliente al que se le
--vendio, l empleado que le realizo, laa fecha de la orden, el transportista
--y la fecha de la orden, dividirla, el añor, mes, dia, trimestre

SELECT OrderID AS [Numero de Orden], OrderDate AS [Fecha de Orden],
CustomerID AS [Cliente], EmployeeID AS [Empleado], ShipVia AS [Transportista],
YEAR(OrderDate) AS [Año de la Compra],
MONTH(OrderDate) AS [Mes de la Compra],
DAY(OrderDate) AS [Dia de la Compra]
FROM Orders;
go

SELECT OrderID AS [Numero de Orden], OrderDate AS [Fecha de Orden],
CustomerID AS [Cliente], EmployeeID AS [Empleado], ShipVia AS [Transportista],
DATEPART(year, OrderDate) AS [Año de la Compra],
DATEPART(mm, OrderDate) AS [Mes de la Compra],
DATEPART(d, OrderDate) AS [Dia de la Compra],
DATEPART(qq, OrderDate) AS [Trimestre],
DATEPART(week, OrderDate) AS [Semana],
DATEPART(WEEKDAY, OrderDate) AS [Dia Semana],
DATENAME(WEEKDAY, OrderDate) AS [Nombre Dia]
FROM Orders
ORDER BY 9 asc;
GO

--order by -> Ordenar los datos de forma asendente y desendente
--Seleccionar los empleados ordenados por su pais
SELECT (TitleOfCourtesy + '' + FirstName + ''+ LastName) AS [Nmobre completo],
country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country ASC;

SELECT (TitleOfCourtesy + '' + FirstName + ''+ LastName) AS [Nmobre completo],
country AS [Pais],
City AS [Ciudad]
FROM Employees
ORDER BY 2 DESC;

SELECT (TitleOfCourtesy + '' + FirstName + ''+ LastName) AS [Nmobre completo],
country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country DESC, City ;

SELECT (TitleOfCourtesy + '' + FirstName + ''+ LastName) AS [Nmobre completo],
country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country ASC, City DESC;

SELECT (TitleOfCourtesy + '' + FirstName + ''+ LastName) AS [Nmobre completo],
country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY 1 ASC, Country ASC, 3 DESC;

--Seleccionar todos los productos que su precio sea mayor a 40.3
--(MOSTRAR EL NUM DEL PRODUCTO, NOM DE DEL PRODUCTO Y EL PRECIO UNITARIO)

SELECT ProductID AS [Numero del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice > 40.3;
GO

SELECT ProductID AS [Numero del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers';
GO

SELECT ProductID AS [Numero del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers'; -- <> es diferente o !=
GO

SELECT ProductID AS [Numero del Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers';
GO

--Seleccionar todas las ordenes que sean de brazil, rio de janeiro, mostrando solo el numero de orden
--la fecha de orden, pais de envio, ciudad y transprotista

SELECT OrderID AS [Numero de Orden],
OrderDate AS [Fecha de orden],
ShipCountry AS [Pais],
ShipCity AS [Ciudad],
ShipVia AS [Trasportista]
FROM Orders
WHERE ShipCountry = 'Brazil' AND ShipCity = 'Rio de Janeiro';
GO

SELECT * FROM Orders;

--INNER JOIN


SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de orden],
o.ShipCountry AS [Pais],
o.ShipCity AS [Ciudad],
s.ShipperID AS [Numero de Trasportista],
s.CompanyName AS [Transportista]

FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID =  o.ShipVia
WHERE ShipCountry = 'Brazil' AND ShipCity = 'Rio de Janeiro';
GO

--Seleccionar todas la ordenes 
--mosrando lo mismo que la consulta anterior
--pero todas aquellas que no tengan region de envio


SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de orden],
o.ShipCountry AS [Pais],
o.ShipCity AS [Ciudad],
s.ShipperID AS [Numero de Trasportista],
s.CompanyName AS [Transportista],
o.ShipRegion AS [Region]
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID =  o.ShipVia
WHERE  ShipRegion is null; --is es el = para null o not null
GO

--ShipCountry = 'Brazil' AND ShipCity = 'Rio de Janeiro' AND

--Seleccionar todas la ordenes enviadas a brazil, alemania yque tengan region

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de orden],
o.ShipCountry AS [Pais],
s.ShipperID AS [Numero de Trasportista],
s.CompanyName AS [Transportista],
o.ShipRegion AS [Region]
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID =  o.ShipVia
WHERE  ShipCountry = 'Alemania' OR ShipCountry = 'Brazil' AND ShipRegion is not null; 
GO

--SELECCIONAR CUANTOS PUESTOS DIFERENTES TIENE LOS REPRESENTANTES
Select * from Representantes;

SELECT DISTINCT Puesto
FROM Representantes;
go

use NORTHWND;
--Seleccionar todos los paises diferentes
SELECT DISTINCT Country, city
FROM Customers;

SELECT  Country, city, CompanyName
FROM Customers
ORDER BY 1 ASC;

SELECT  Country, city, CompanyName
FROM Customers
where City = 'Buenos Aires'
ORDER BY 1 ASC;

USE BDEJEMPLO2;
SELECT COUNT (DISTINCT Puesto) AS [Numero de Puestos] 
FROM Representantes;

--Seleccionar el precio minimo de los productos
SELECT MIN(Precio) AS [Precio Minimo]
FROM Productos;

--listar las ofiionas cullas venyas estan por deajo del 80% de sus objetivos
--montrar cuidad, ventas y ibjetivos de oficinas

SELECT 
  Ciudad, Ventas, Objetivo, (.8 * Objetivo) AS [80% DEL Objetivo]
FROM Oficinas
WHERE Ventas < (.8 * Objetivo);

--Seleccionar los primeros 5 registros de los pedidos

SELECT
Num_Pedido,Fecha_Pedido,Producto,Cantidad,Importe
FROM Pedidos;

SELECT Top 5 Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY 5 DESC;

--TEST de rango (BETWEEN)
--Hallar los pedidos del ultimo trimentre de 1989
SELECT 
Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
FROM Pedidos
WHERE Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
ORDER BY Fecha_Pedido DESC;
GO

SELECT 
Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
FROM Pedidos
WHERE Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
ORDER BY Fecha_Pedido DESC;
GO

 SELECT 
Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
FROM Pedidos
WHERE datepart(QUARTER, Fecha_Pedido) = 4
ORDER BY Fecha_Pedido DESC;
GO

--Hallar los pedidos que se tienen un importe entre 30000 y
--39999.99
 SELECT 
Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
FROM Pedidos
WHERE Importe BETWEEN 30000 AND 39999.99
GO

--Listar los representantes cullas ventas no se encuentran
--entre 80 y el 120 ciento de su cuota

select * from Representantes;
 SELECT 
Num_Empl, Nombre, Puesto, Cuota, Ventas
FROM Representantes
WHERE Ventas NOT BETWEEN (Cuota* .8) AND (Cuota * 1.20)
GO

--Test de pertenecia a conjuntos (IN)
--Hallar los pedidos de cuatro representantes en concreto

SELECT Num_Pedido,Fecha_Pedido,Importe,Rep 
FROM Pedidos
WHERE Rep IN (107,109,101,103);

SELECT Num_Pedido,Fecha_Pedido,Importe,Rep 
FROM Pedidos
WHERE Rep = 107 OR
Rep = 109 OR
Rep = 101 OR
Rep = 103 ;

SELECT Num_Pedido,Fecha_Pedido,Importe,Rep 
FROM Pedidos
WHERE Rep NOT IN (107,109,101,103);

SELECT Num_Pedido,Fecha_Pedido,Importe,Rep 
FROM Pedidos
WHERE NOT (Rep = 107 OR
Rep = 109 OR
Rep = 101 OR
Rep = 103 );

--Test de encaje de patrone (LIKE)
SELECT * FROM Clientes;
SELECT * 
FROM Clientes
WHERE Empresa LIKE 'Ac%';

SELECT * 
FROM Clientes
WHERE Empresa LIKE '%L';

SELECT * 
FROM Clientes
WHERE Empresa LIKE '%er%';

use BDEJEMPLO2;

SELECT * 
FROM Clientes
WHERE Empresa LIKE '%[A-D]%';

SELECT * 
FROM Clientes
WHERE Empresa LIKE '%[ADf]%';

SELECT * 
FROM Clientes;
WHERE Empresa LIKE '_ilas';

SELECT * 
FROM Clientes
WHERE Empresa LIKE '____'; 

--hallas todos los reprecentantes que o bien :
--a)trabajan en Daimiel, Navarra o Castellón; o o bien
--b)no tiene jefe y están cintratados desde junio de 1988; o
--c)superan su cuota pero tienen ventas de 600000 o menos

SELECT Num_Empl, Nombre, Oficina_Rep, Ventas, Puesto, Cuota, Fecha_Contrato
FROM Representantes 
WHERE (Oficina_Rep IN (11,12,22)) OR
 (Jefe IS NULL AND Fecha_Contrato >='1988-07-01') OR
 (Ventas>Cuota AND Ventas<=600000);

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
GO


-- Listar las oficinas con un objetivo superios a 60000,
 --mostrando el nombre de la ciudad, el nombre del representante,
 -- y su puesto

use BDEJEMPLO2;

SELECT  o.Ciudad AS [Oficinas],
        r.Nombre AS [Representante],
		r.Puesto AS [Puesto],
		o.Objetivo AS [Objetivo de Ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;




--Listar todos los pedidos mostrando el numero de pedido, el importe, el nombre
-- y el limite de credito del cliente

SELECT  pe.Num_Pedido AS [Numero de Pedido],
        pe.Importe AS [Importe Pedido],
		c.Empresa AS [Nombre],
		c.Limite_Credito AS [Limite Credito]
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli;

--Listar cada representante mostrando la ciudad, la region en que trabajan

SELECT  r.Nombre AS [Representante],
        o.Ciudad AS [Ciudad],
		o.Region AS [Region]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Oficina_Rep = o.Oficina;

SELECT * FROM Representantes;

--
--Listar cada representante  mostrando su nombre, la ciudad y la region en que trabajan

SELECT r.Nombre AS [Representante],
       o. Ciudad AS [Oficina],
	   o.Region AS [Region]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Oficina_Rep = o.Oficina;

--Listar las oficinas(Ciuad), nombre y puestos de sus jefes

SELECT r.Nombre AS [Representante],
       o. Ciudad AS [Oficina],
	   o.Region AS [Region]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Num_Empl = o.Jef;

--lista todos los pedidos mostrand el numero de pedido, el importe y la cantidad de
-- cada producto

SELECT  pe.Num_Pedido AS [Numero de Pedido],
        pe.Importe AS [Importe Pedido],
        pe.Cantidad AS [Cantidad],
	    po.Descripcion AS [Producto]
FROM Pedidos AS pe
INNER JOIN Productos AS po
ON pe.Fab = po.Id_fab AND 
pe.Producto = po.Id_producto;

select * from Pedidos;

select * from Productos;

--Listar los nombres de los empleados y los nombres de sus jefes

SELECT  
   R1.Nombre as [empleado],
   R2.Nombre AS [jefe],
  R1.Jefe AS [Num Jefe]
FROM Representantes AS R1
INNER JOIN Representantes AS R2
ON R1.Jefe = R2.Num_Empl;

select * from Representantes;

--Listar los pedido con un importe superior a 25k  
--encluyedo el nom del pedido, el importe, el nombre del representante que tomo del pedido y el nombre del cliente

SELECT   
	  p.Num_Pedido AS [Numero de Pedido],
      p.Importe AS [Importe Pedido],
	  r.Nombre AS [Nombre Representante],
	  c.Empresa AS [Cliente]
FROM Representantes AS r
INNER JOIN Pedidos AS p
ON  p.Rep = r.Num_Empl
INNER JOIN Clientes AS c
ON P.Cliente = c.Num_Cli
WHERE (p.Importe > 25000);
go
select * from Clientes;
select * from Pedidos;
select * from Representantes;

go

--listar los pedidos superiores a 25k
--mostrando el num de prductos, el nombre del cliente que 
--lo encargo y el nombre del representante asignado al cliente 
-- y el importe

SELECT   
	  p.Num_Pedido AS [Numero de Pedido],
	  c.Empresa AS [Cliente],
	  r.Nombre AS [Representante Asignado al cliente],
	  p.Importe AS [Importe Pedido]
FROM Representantes AS r
INNER JOIN Clientes AS c
ON  c.Rep_Cli = r.Num_Empl
INNER JOIN Pedidos AS p
ON P.Cliente = c.Num_Cli
WHERE (p.Importe > 25000);
