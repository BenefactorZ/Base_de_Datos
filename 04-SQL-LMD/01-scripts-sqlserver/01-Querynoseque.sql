USE NORTHWND;
GO

SELECT * FROM Categories;

SELECT * FROM Products;

SELECT * FROM Employees;

SELECT * FROM Shippers;

SELECT * FROM Orders;

SELECT * FROM [Order Details];

create database ejercici09999;

use ejercici09999;

CREATE TABLE Empleado(
EmpleadoId int not null identity(1,1),
Nombre nvarchar(15) not null,
ApellidoP nvarchar(15) not null,
ApellidoM nvarchar(15) not null,
Direccion nvarchar(50) not null,
Salario decimal(10,2) not null,
Jef int,
Departamento int not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT chk_salario
CHECK (Salario between 200 and 50000),
CONSTRAINT fk_empleado_jefe
FOREIGN KEY (Jef)
REFERENCES Empleado(EmpleadoId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE Deparment (
DeparmentId int not null identity(1,1),
NombreDep nvarchar(50) not null,
Estatus char(2) not null,
Administrador int not null,
CONSTRAINT pk_departamento
PRIMARY KEY (DeparmentId),
CONSTRAINT unique_nombrecompleto
UNIQUE(NombreDep),
CONSTRAINT chk_estatus
CHECK (Estatus IN ('SI','NO')),
CONSTRAINT fk_empleado_depto
FOREIGN KEY (Administrador)
REFERENCES Empleado (EmpleadoId)
);
GO

ALTER TABLE Empleado
ADD CONSTRAINT fk_empleado_depto1
FOREIGN KEY (Departamento)
REFERENCES Deparment(DeparmentId);
GO

CREATE TABLE Ubicacion(
UbicacionId int not null identity(1,1),
Ubicacion nvarchar(50) not null,
DeparmentId int,
CONSTRAINT pk_ubicacionid
PRIMARY KEY (UbicacionId),
CONSTRAINT unique_department
UNIQUE (DeparmentId),
CONSTRAINT fk_ubicacion_depto1
FOREIGN KEY (DeparmentId)
REFERENCES Deparment(DeparmentId)
);
GO

DROP TABLE Ubicacion;