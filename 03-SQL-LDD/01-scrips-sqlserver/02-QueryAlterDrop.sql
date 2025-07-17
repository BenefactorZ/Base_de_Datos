-- Crear bd empresapatito
CREATE DATABASE empresapatito
GO

USE empresapatito;
GO

CREATE TABLE empleado(
IdEmpleado int not null,
Nombre varchar(100) not null,
Puesto varchar(50),
FechadeIngresao date,
Salario decimal(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (IdEmpleado)
);
GO

--Ageragar una columna
ALTER TABLE empleado
ADD CorreoElectronico varchar(100);
GO

SELECT * FROM empleado;

--Modificar tipo de datos

ALTER TABLE empleado
ALTER COLUMN Salario money not null;
GO

--Renombrar COLUMNA

EXEC sp_rename 'empleado.CorreoElectronico',
               'Email', 'COLUMN';
GO

--cREAR TABLA DEPARTAMENTOS
CREATE TABLE departamentos(
IdDepartamentos int not null identity(1,1) primary key,
NombreDepart varchar(100)
);
GO 

--agregar una campo a la tabla EMPLEADO
--para que funcione de fk
ALTER TABLE empleado
ADD IdDepartamentos int not null;
GO

--agregar fk
ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_departamentos
FOREIGN KEY (IdDepartamentos)
REFERENCES departamentos (IdDepartamentos);
GO

--ELIMINAR UNA PK DE empleado
ALTER TABLE empleado
DROP CONSTRAINT pk_empleados;
GO

--ELIMINAR UNA fK DE empleado
ALTER TABLE empleado
DROP CONSTRAINT fk_empleado_departamentos;
GO

--ELIMINAR UNA PK DE DEPRTAMENTOS
ALTER TABLE departamentos
drop CONSTRAINT PK__departam__87FA9BFF1DB560C3;
GO

--CREAR UN CONSTRAINT DE VEREFICACION
-- EN SALARIO
ALTER TABLE empleado
ADD CONSTRAINT chk_salario
CHECK (Salario>0.0);
GO

CREATE TABLE categoria(
ID int not null primary key default -1,
Nombre varchar(20) not null,
Estatus char(1) DEFAULT 'A'
);
GO

drop table categoria;
go

 INSERT INTO categoria
VALUES (1, 'CARNES', 'D');

INSERT INTO categoria
VALUES (default, 'CARNES', DEFAULT);

SELECT * FROM categoria;

--eliminar la columna email

ALTER TABLE empleado
DROP COLUMN Email;
go

alter table departamentos
add constraint pk_departamentos
primary key (IdDepartamentos);
go
--eliminar tabla

drop table empleado;
go

drop table departamentos;
go
drop table categoria;
go

use master;
go
drop database empresapatito;
go