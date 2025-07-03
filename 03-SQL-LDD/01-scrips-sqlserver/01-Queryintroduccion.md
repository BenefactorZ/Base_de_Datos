```sql

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
--Crear dos tablas con razon de cardinalidad de 1:N con participacion total,
--esto quiere decir que la foreing key es not null

CREATE TABLE categoria(
IdCategoria int not null identity(1,1),
NombreCategoria nvarchar(50) not null,
CONSTRAINT pk_categoria
PRIMARY KEY(IdCategoria),
CONSTRAINT unique_nombrecategoria
UNIQUE(NombreCategoria)
);
GO

CREATE TABLE Productos3(
IdProducto int not null identity(1,1),
NombreProducto nvarchar(50) not null,
Existencia int not null,
PrecioUnitario money not null,
IdCategoria int not null,
CONSTRAINT pk_productos3
PRIMARY KEY (IdProducto),
CONSTRAINT unique_nombreproducto3
UNIQUE (NombreProducto),
CONSTRAINT chk_existencia3
CHECK (Existencia >0 AND Existencia<=1000),
CONSTRAINT chk_preciounitario
CHECK (PrecioUnitario>0.0),
CONSTRAINT fk_productos3_categoria
FOREIGN KEY(IdCategoria)
REFERENCES categoria(IdCategoria)
);
GO

CREATE TABLE categoria2(
Id int not null identity(1,1),
NombreCategoria nvarchar(50) not null,
CONSTRAINT pk_categoria2
PRIMARY KEY(Id),
CONSTRAINT unique_nombrecategoria2
UNIQUE(NombreCategoria)
);
GO

CREATE TABLE Productos4(
IdProducto int not null identity(1,1),
NombreProducto nvarchar(50) not null,
Existencia int not null,
PrecioUnitario money not null,
IdCategoria int not null,
CONSTRAINT pk_productos4
PRIMARY KEY (IdProducto),
CONSTRAINT unique_nombreproducto4
UNIQUE (NombreProducto),
CONSTRAINT chk_existencia4
CHECK (Existencia >0 AND Existencia<=1000),
CONSTRAINT chk_preciounitario4
CHECK (PrecioUnitario>0.0),
CONSTRAINT fk_productos4_categoria2
FOREIGN KEY(IdCategoria)
REFERENCES categoria2(Id)
);
GO

--Tablas
CREATE TABLE Tabla1(
tabla1id int not null identity(1,1),
tabla1id2 int not null,
nombre nvarchar(20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY (tabla1id,tabla1id2)
);
GO


CREATE TABLE Tabla2(
idtabla int not null identity(1,1),
nombre nvarchar(50) not null,
tabla1id int,
tabla1id2 int,
CONSTRAINT pk_tabla2
PRIMARY KEY (idtabla),
CONSTRAINT fk_Tabla2_Tabla1
FOREIGN KEY(tabla1id, tabla1id2)
REFERENCES Tabla1(tabla1id,tabla1id2),
);
GO

-- Crear tablas con razon de cardinalidad 1:1

CREATE TABLE employee(
id int not null identity(1,1),
nombre nvarchar(20) not null,
ap1 nvarchar(20) not null,
ap2 nvarchar(20) not null,
sexo char(10) not null,
salario money not null,
CONSTRAINT pk_employee
PRIMARY KEY (id)
);
GO

CREATE TABLE Deparment(
id int not null identity(1,1),
nombre nvarchar(20) not null,
ubicacion nvarchar(30) not null,
employeeid int not null,
CONSTRAINT pk_deparment 
Primary key (employeeid),
CONSTRAINT fk_deparment_employee
FOREIGN KEY (employeeid)
REFERENCES employee(id),
CONSTRAINT unique_employeeid
UNIQUE (employeeid)
);
GO
```