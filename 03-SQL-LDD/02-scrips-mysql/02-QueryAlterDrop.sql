#Crear bd empresapatito
CREATE DATABASE empresapatito

USE empresapatito;

CREATE TABLE empleado(
IdEmpleado int not null,
Nombre varchar(100) not null,
Puesto varchar(50),
FechadeIngresao date,
Salario decimal(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (IdEmpleado)
);

#Ageragar una columna
ALTER TABLE empleado
ADD column CorreoElectronico varchar(100);

SELECT * FROM empleado;

#Modificar tipo de datos

ALTER TABLE empleado
modify COLUMN Salario decimal(12,2) not null;

#Renombrar COLUMNA

ALTER TABLE empleado
RENAME COLUMN CorreoElectronico TO Email;

#cREAR TABLA DEPARTAMENTOS
CREATE TABLE departamentos(
IdDepartamentos int not null auto_increment primary key,
NombreDepart varchar(100)
); 

#agregar una campo a la tabla EMPLEADO
#para que funcione de fk
ALTER TABLE empleado
ADD column IdDepartamentos int not null;

#agregar fk
ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_departamentos
FOREIGN KEY (IdDepartamentos)
REFERENCES departamentos (IdDepartamentos);

#ELIMINAR UNA PK DE empleado
ALTER TABLE empleado
DROP primary key;

#ELIMINAR UNA fK DE empleado
ALTER TABLE empleado
DROP foreign key fk_empleado_departamentos;

#ELIMINAR EL AUTO INCREMENT
ALTER TABLE departamentos
modify column IdDepartamentos int not null;

#ELIMINAR UNA PK DE DEPRTAMENTOS
ALTER TABLE departamentos
drop primary key;

#CREAR UN CONSTRAINT DE VEREFICACION
#EN SALARIO
ALTER TABLE empleado
ADD CONSTRAINT chk_salario
CHECK (Salario>0.0);

CREATE TABLE categoria(
ID int not null primary key default -1,
Nombre varchar(20) not null,
Estatus char(1) DEFAULT 'A'
);

drop table categoria;

 INSERT INTO categoria
VALUES (1, 'CARNES', 'D');

INSERT INTO categoria
VALUES (default, 'CARNES', DEFAULT);

SELECT * FROM categoria;

#eliminar la columna email

ALTER TABLE empleado
DROP COLUMN Email;

alter table departamentos
add constraint pk_departamentos
primary key (IdDepartamentos);

#eliminar tabla

drop table empleado;

drop table departamentos;

drop table categoria;

drop database empresapatito;
