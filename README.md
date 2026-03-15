# Tarea 5: Implementación de Scripts SQL (Oracle & SQL Server)

Este repositorio contiene la solución técnica para la **Tarea 5 de Base de Datos 2 (UMG)**. El objetivo principal es demostrar la implementación de objetos programables y gestión de datos tanto en entornos **SQL Server** como en **Oracle Database**.

## 🗄️ Contenido del Repositorio
El proyecto se divide en dos secciones principales según el motor de base de datos:

### 1. Microsoft SQL Server
En el archivo correspondiente a SQL Server, se incluye la lógica para:
* **Estructura DDL**: Creación de tablas para el sistema de ferretería (Productos, Ventas, Clientes).
* **Triggers de Inventario**: Automatización para descontar existencias cada vez que se registra una nueva línea de detalle en una venta.
* **Procedimientos Almacenados (Stored Procedures)**: Lógica para la inserción segura de registros y validación de stock.
* **Funciones (UDF)**: Cálculos dinámicos de totales con impuestos incluidos.

### 2. Oracle Database
En la sección de Oracle, se adaptan los conceptos a su arquitectura específica:
* **Bloques PL/SQL**: Implementación de procedimientos y funciones utilizando el lenguaje procedural de Oracle.
* **Secuencias (Sequences)**: Manejo de campos autoincrementables (Identity) para las llaves primarias.
* **Triggers de Fila**: Control de integridad y actualización de saldos de inventario.

## 🛠️ Instrucciones de Ejecución
### Para SQL Server:
1. Conectarse a una instancia mediante SSMS.
2. Crear la base de datos `BASE_DATOS_2_T5`.
3. Ejecutar el script SQL para generar tablas y objetos programables.

### Para Oracle:
1. Utilizar Oracle SQL Developer o SQL*Plus.
2. Ejecutar los scripts de creación de tablas.
3. Compilar los paquetes o triggers PL/SQL proporcionados en el archivo.

## 📝 Detalles del Proyecto
* **Curso**: Base de Datos 2.
* **Institución**: Universidad Mariano Gálvez de Guatemala.
* **Enfoque**: Comparativa de sintaxis y funcionalidad entre T-SQL (SQL Server) y PL/SQL (Oracle).
* **Autor**: Elmer Fuentes.