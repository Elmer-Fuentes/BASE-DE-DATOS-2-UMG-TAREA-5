CREATE DATABASE db_Veterinaria;
GO

USE db_Veterinaria;
GO

CREATE TABLE Tbl_Sucursal(
    CodigoSucursal INT IDENTITY(1,1) PRIMARY KEY,
    NombreSucursal VARCHAR(100) NOT NULL,
    CodigoSucursalPadre INT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Ciudad VARCHAR(100) NOT NULL,
    Departamento VARCHAR(100) NOT NULL,
    Telefono CHAR(15),
    Email VARCHAR(120),
    FechaApertura DATE,
    Activa BIT DEFAULT 1,
    CapacidadMascotas INT,
    Latitud DECIMAL(10,6),
    Longitud DECIMAL(10,6),
    FechaRegistro DATETIME 
);
GO

CREATE TABLE Tbl_Cliente(
    CodigoCliente BIGINT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(120) NOT NULL,
    Apellidos VARCHAR(120) NOT NULL,
    DPI CHAR(13),
    Nit CHAR(12),
    Telefono CHAR(15),
    Email VARCHAR(120),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    FechaNacimiento DATE,
    FechaRegistro DATETIME ,
    Activo BIT DEFAULT 1
);
GO

CREATE TABLE Tbl_TipoMascota(
    CodigoTipoMascota INT IDENTITY(1,1) PRIMARY KEY,
    NombreTipo VARCHAR(100),
    Descripcion VARCHAR(200),
    RequiereVacunas BIT,
    PromedioVida INT,
    Activo BIT,
    FechaRegistro DATETIME,
    UsuarioRegistro VARCHAR(50),
    Clasificacion CHAR(1),
    Observaciones VARCHAR(200)
);
GO

CREATE TABLE Tbl_Raza(
    CodigoRaza INT IDENTITY(1,1) PRIMARY KEY,
    CodigoTipoMascota INT,
    NombreRaza VARCHAR(100),
    PaisOrigen VARCHAR(100),
    PesoPromedio DECIMAL(8,2),
    AlturaPromedio DECIMAL(8,2),
    Temperamento VARCHAR(100),
    Activo BIT,
    FechaRegistro DATETIME,
    Observaciones VARCHAR(200),
    FOREIGN KEY (CodigoTipoMascota) REFERENCES Tbl_TipoMascota(CodigoTipoMascota)
);
GO

CREATE TABLE Tbl_Mascota(
    CodigoMascota BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente BIGINT,
    CodigoRaza INT,
    NombreMascota VARCHAR(120),
    Sexo CHAR(1),
    Color VARCHAR(50),
    Peso DECIMAL(8,2),
    FechaNacimiento DATE,
    NumeroChip VARCHAR(50),
    Activa BIT,
    FechaRegistro DATETIME,
    Observaciones VARCHAR(200),
    FOREIGN KEY (CodigoCliente) REFERENCES Tbl_Cliente(CodigoCliente),
    FOREIGN KEY (CodigoRaza) REFERENCES Tbl_Raza(CodigoRaza)
);
GO

CREATE TABLE Tbl_Veterinario(
    CodigoVeterinario INT IDENTITY(1,1) PRIMARY KEY,
    CodigoSucursal INT,
    Nombres VARCHAR(120),
    Apellidos VARCHAR(120),
    NumeroColegiado VARCHAR(50),
    Especialidad VARCHAR(100),
    Telefono CHAR(15),
    Email VARCHAR(120),
    FechaContratacion DATE,
    Salario DECIMAL(12,2),
    Activo BIT,
    FechaRegistro DATETIME,
    FOREIGN KEY (CodigoSucursal) REFERENCES Tbl_Sucursal(CodigoSucursal)
);
GO

CREATE TABLE Tbl_Cita(
    CodigoCita BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoMascota BIGINT,
    CodigoVeterinario INT,
    CodigoSucursal INT,
    FechaCita DATETIME,
    MotivoConsulta VARCHAR(200),
    Estado CHAR(1),
    PesoMascota DECIMAL(8,2),
    Temperatura DECIMAL(5,2),
    Observaciones VARCHAR(300),
    Activa BIT,
    FechaRegistro DATETIME,
    FOREIGN KEY (CodigoMascota) REFERENCES Tbl_Mascota(CodigoMascota),
    FOREIGN KEY (CodigoVeterinario) REFERENCES Tbl_Veterinario(CodigoVeterinario),
    FOREIGN KEY (CodigoSucursal) REFERENCES Tbl_Sucursal(CodigoSucursal)
);
GO

CREATE TABLE Tbl_Producto(
    CodigoProducto INT IDENTITY(1,1) PRIMARY KEY,
    NombreProducto VARCHAR(150),
    TipoProducto VARCHAR(100),
    Marca VARCHAR(100),
    CodigoBarras VARCHAR(50),
    PrecioCompra DECIMAL(12,2),
    PrecioVenta DECIMAL(12,2),
    StockMinimo INT,
    Activo BIT,
    FechaRegistro DATETIME,
    UnidadMedida CHAR(10),
    Descripcion VARCHAR(200)
);
GO

CREATE TABLE Tbl_Venta(
    CodigoVenta BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoSucursal INT,
    CodigoCliente BIGINT,
    FechaVenta DATETIME,
    SubTotal DECIMAL(14,2),
    Impuesto DECIMAL(14,2),
    Total DECIMAL(14,2),
    MetodoPago VARCHAR(50),
    Estado CHAR(1),
    NumeroFactura VARCHAR(50),
    UsuarioRegistro VARCHAR(50),
    FechaRegistro DATETIME,
    FOREIGN KEY (CodigoSucursal) REFERENCES Tbl_Sucursal(CodigoSucursal),
    FOREIGN KEY (CodigoCliente) REFERENCES Tbl_Cliente(CodigoCliente)
);
GO

CREATE TABLE Tbl_DetalleVenta(
    CodigoDetalleVenta BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoVenta BIGINT,
    CodigoProducto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(12,2),
    Descuento DECIMAL(12,2),
    SubTotal DECIMAL(12,2),
    Impuesto DECIMAL(12,2),
    Total DECIMAL(12,2),
    FechaRegistro DATETIME,
    Activo BIT,
    FOREIGN KEY (CodigoVenta) REFERENCES Tbl_Venta(CodigoVenta),
    FOREIGN KEY (CodigoProducto) REFERENCES Tbl_Producto(CodigoProducto)
);
GO


