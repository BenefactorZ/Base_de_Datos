--Leguaje SQL-LDD (ceate, alter, drop)

--Crear la base de datos empresa 

CREATE DATABASE empresa;
GO 
--Utilizar la base de datos creada 
USE empresa;
GO
--Crear la tabla empleados
CREATE TABLE Empleados(
IdEmpleado int  not null,
Nombre varchar(100) not null,
Puesto varchar(50) not null,
FechaIngreso date null,
Salario money not null,
CONSTRAINT pk_Empleados
PRIMARY KEY (IdEmpleado)
);
GO

CREATE TABLE Productos(
IdProducto int PRIMARY KEY,
NombreProducto nvarchar(50) not null,
Existencia int not null,
PrecioUnitario money not null
);
GO

CREATE TABLE Productos2(
IdProducto int not null identity(1,1),
NombreProducto nvarchar(50) not null,
Existencia int not null,
Precio money not null,
CONSTRAINT pk_productos2
PRIMARY KEY(IdProducto),
CONSTRAINT unique_nombreproducto
UNIQUE(NombreProducto),
CONSTRAINT chk_existencia
CHECK (Existencia>0 AND Existencia<=1000),
CONSTRAINT chk_precio
CHECK(Precio>0.0)
);
GO

--Insertar un producto en el productos sin identity
INSERT INTO Productos(IdProducto, NombreProducto, Existencia, PrecioUnitario)
VALUES(1,'Burritos de Frijoles', 65, 20.99);
GO

INSERT INTO Productos(IdProducto, NombreProducto, Existencia, PrecioUnitario)
VALUES(2,'Burritos de Frijoles', 65, 20.99);
GO

SELECT * FROM Productos;
GO

--Insertar un producto en el productos2 con identity
INSERT INTO Productos2(NombreProducto, Existencia, Precio)
VALUES('Burritos de Chorizo Verde', 100, 21.0);
GO

INSERT INTO Productos2(NombreProducto, Existencia, Precio)
VALUES('Burritos de Chorizo Grueso', 450, 42.10);
GO

INSERT INTO Productos2(NombreProducto, Existencia, Precio)
VALUES('Burritos de Chorizo Grueso2', 450, 42.10);
GO

INSERT INTO Productos2(NombreProducto, Existencia, Precio)
VALUES('Burritos de Frijol', 999, 424.10);
GO

SELECT * FROM Productos2;
GO