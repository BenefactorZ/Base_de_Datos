--EXAMEN
create database Examen1;
use Examen1;
go

CREATE TABLE Productos(
Id_fab char(3),
Id_producto char(5),
Nombre_producto varchar(20) not null,
Descripcion varchar(20) not null,
Precio money not null,
Stock int not null,
CONSTRAINT pk_productos
PRIMARY KEY (Id_fab, Id_producto),
CONSTRAINT unique_nombre_producto
UNIQUE (Nombre_producto),
CONSTRAINT chk_stock
CHECK (Stock < 0)
);
GO

CREATE TABLE Pedidos(
Num_Pedido int identity(1,1),
Fecha_Pedido date not null,
Cliente int not null,
Rep int not null,
Fab char(3) not null,
Producto char(5)not null,
Cantidad int not null,
Importe money not null,
Num__Cli int,
Id_fab char(3),
Id_producto char(5),
CONSTRAINT pk_pedidos
PRIMARY KEY (Num_Pedido),
CONSTRAINT fk_pedidos_productos
FOREIGN KEY (Id_fab, Id_producto)
REFERENCES Productos(Id_fab, Id_producto),
CONSTRAINT chk_cantidad
CHECK (Cantidad > 0)
);
GO

CREATE TABLE Clientes (
Num__Cli int identity(1,1),
Empresa varchar(20) not null,
Rep_Cli int not null,
Limite_Credito money not null,
CONSTRAINT pk_clientes
PRIMARY KEY (Num__Cli),
CONSTRAINT chk_limite_credito
CHECK (Limite_Credito > 0 AND Limite_Credito < 40000)
);
GO

ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedidos_clientes1
FOREIGN KEY (Num__Cli)
REFERENCES Clientes(Num__Cli);
GO

CREATE TABLE Representantes(
Num_Empl int identity(1,1),
Nombre varchar(16) not null,
Edad int not null,
Oficina_Rep int not null,
Puesto varchar(13) not null,
Fecha_Contrato date not null,
Jefe int not null,
Cuota money,
Ventas money,
Oficina int,
Num_Pedido int,
Num__Cli int,
CONSTRAINT chk_edad
CHECK (Edad > 18),
CONSTRAINT pk_representantes
PRIMARY KEY (Num_Empl),
CONSTRAINT fk_representantes
FOREIGN KEY (Jefe)
REFERENCES Representantes(Num_Empl)
);
GO

CREATE TABLE Oficinas(
Oficina int identity(1,1),
Ciudad varchar(15) not null,
Region varchar(10) not null,
Jef int,
Objetivo money,
Ventas money,
Num_Empl int,
CONSTRAINT pk_oficinas
PRIMARY KEY (Oficina),
CONSTRAINT fk_oficinas_representante
FOREIGN KEY (Num_Empl)
REFERENCES Representantes(Num_Empl),
CONSTRAINT chk_ventas
CHECK (Ventas < 0)
);
GO

ALTER TABLE Representantes
ADD CONSTRAINT fk_representante_oficinas
FOREIGN KEY (Oficina)
REFERENCES Oficinas(Oficina);
GO

ALTER TABLE Representantes
ADD CONSTRAINT fk_representante_pedidos
FOREIGN KEY (Num_Pedido)
REFERENCES Pedidos(Num_Pedido);
GO
ALTER TABLE Representantes
ADD CONSTRAINT fk_representante_clientes
FOREIGN KEY (Num__Cli)
REFERENCES Clientes(Num__Cli);
GO

