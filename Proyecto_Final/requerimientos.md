Requerimientos del Proyecto RoomMaster
Propuesta de Caso Práctico para la Creación de una Base de Datos
Asignatura: Base de Datos 
Elaborado por:  Angel Yair Monroy Silva
Fecha 21/05/2025
1️⃣ Descripción del Caso Práctico
Nombre del Proyecto: Sistema de Gestión de Reservas para Hotel
Objetivo General:
Diseñar e implementar una base de datos relacional que permita gestionar eficientemente las reservas, habitaciones, clientes, empleados y pagos de un pequeño hotel.
Descripción del Problema o Necesidad:
El hotel actualmente gestiona las reservas y la información de los clientes de forma manual, lo que genera errores frecuentes, pérdida de datos, y dificultades para el control del inventario de habitaciones y seguimiento de pagos. Se necesita una solución digital centralizada que permita el acceso rápido, organizado y seguro a la información, optimizando así la administración operativa y la atención al cliente.
2️⃣ Requerimientos Funcionales y No Funcionales
Funcionalidades Clave:
-Registro y gestión de reservas de habitaciones.
-Administración de información de clientes y empleados.
-Generación de reportes de ocupación y pagos.
Requerimientos Técnicos y Restricciones:Requerimientos Técnicos y Restricciones:
- La base de datos debe ser relacional (MySQL, PostgreSQL o similar).
-Acceso controlado mediante autenticación para los empleados (seguridad de usuarios).
-El sistema debe permitir respaldos periódicos de los datos para evitar pérdidas.

3️⃣   Alcance del Proyecto
Módulos a Desarrollar:
-Módulo de gestión de reservas (crear, modificar, cancelar reservas).
-Módulo de administración de clientes, habitaciones y empleados.
-Módulo de pagos y generación de reportes administrativos.
Entidades Principales y Relaciones:
-Cliente realiza una o más Reservas.
-Habitación puede ser reservada en diferentes fechas por distintas Reservas
-Pago: IdPago, Fecha_Pago, Método, Monto
-Recepcionista: IdEmpleado, Nombre, Apellido1, Apellido2, Teléfono, Email, NSS
-Empleado de limpieza: IdEmpleado, Nombre, Apellido1, Apellido2, Teléfono, Email, NSS
-Material: NumMaterial, Nombre, Cantidad
-Categoria: IdCategoria, Nombre, Descripción
4️⃣ Herramientas a Utilizar
Software de Modelado: _______________________________
Gestor de Bases de Datos: _______________________________
 5️⃣ Cronograma Tentativo
Fases de Desarrollo Propuestas:
- ______________________________________
- ______________________________________
- ______________________________________
Tiempo Estimado para cada Fase:
- ______________________________________
- ______________________________________
- ______________________________________
