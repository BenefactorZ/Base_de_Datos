-- Crear base de datos
CREATE DATABASE restriccionesnbdg1;

--Utilizar la base de datos
USE restriccionesnbdg1;

--Crear la tabla categoria 
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(30)
); 

INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

INSERT INTO categoria
VALUES(3,'Ropa');

INSERT INTO categoria
VALUES(4,'Cositas');

SELECT * FROM categoria;

DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique(nombre)
);

CREATE TABLE producto(
productoid int not null,
nombreprod nvarchar(20) not null,
precio money not null,
existencia numeric(10,2) not null,
categoria int 
constraint pk_producto 
primary key(productoid),
constraint unique_nombreprod 
unique (nombreprod),
constraint chk_precio
check (precio>0 and precio<=4000),
constraint chk_existencia
check(existencia>=0),
constraint fk_producto_categoria
foreign key (categoria)
references categoria (categoriaid)
);

SELECT * FROM categoria;
SELECT * FROM producto;

DROP TABLE categoria;
DROP TABLE producto;

INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

INSERT INTO categoria
VALUES(8,'Ropa China');

SELECT *
from producto as p 
inner join categoria as c
ON c.categoriaid = p.categoria;

--productos

INSERT INTO producto
VALUES (1,'Tonayan', 4000, 4, 2);

INSERT INTO producto
VALUES (2,'Tonayan Chafon', 1250.6, 40, 2);

INSERT INTO producto
VALUES (3,'Bucañas', 200, 8, 2);

INSERT INTO producto
VALUES (4,'Calzon Chino', 6.3, 890, 8);


