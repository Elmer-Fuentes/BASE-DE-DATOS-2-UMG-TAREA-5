CREATE DATABASE db_Inmobiliaria;
GO

USE db_Inmobiliaria;
GO

CREATE TABLE Tbl_Sucursal(
    CodigoSucursal INT IDENTITY(1,1) PRIMARY KEY,
    NombreSucursal VARCHAR(120),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Departamento VARCHAR(100),
    Telefono CHAR(15),
    Email VARCHAR(120),
    FechaApertura DATE,
    Activa BIT,
    CapacidadEmpleados INT,
    Latitud DECIMAL(10,6),
    Longitud DECIMAL(10,6),
    FechaRegistro DATETIME
);
GO

CREATE TABLE Tbl_Agente(
    CodigoAgente INT IDENTITY(1,1) PRIMARY KEY,
    CodigoSucursal INT,
    Nombres VARCHAR(120),
    Apellidos VARCHAR(120),
    DPI CHAR(13),
    Telefono CHAR(15),
    Email VARCHAR(120),
    FechaContratacion DATE,
    Salario DECIMAL(12,2),
    ComisionPorcentaje DECIMAL(5,2),
    Activo BIT,
    FechaRegistro DATETIME,
    FOREIGN KEY (CodigoSucursal) REFERENCES Tbl_Sucursal(CodigoSucursal)
);
GO

CREATE TABLE Tbl_Cliente(
    CodigoCliente BIGINT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(120),
    Apellidos VARCHAR(120),
    DPI CHAR(13),
    Nit CHAR(12),
    Telefono CHAR(15),
    Email VARCHAR(120),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    FechaNacimiento DATE,
    FechaRegistro DATETIME,
    Activo BIT
);
GO

CREATE TABLE Tbl_TipoPropiedad(
    CodigoTipoPropiedad INT IDENTITY(1,1) PRIMARY KEY,
    NombreTipo VARCHAR(100),
    Descripcion VARCHAR(200),
    RequiereMantenimiento BIT,
    UsoPrincipal VARCHAR(100),
    AreaPromedio DECIMAL(12,2),
    PermiteMascotas BIT,
    Activo BIT,
    FechaRegistro DATETIME,
    UsuarioRegistro VARCHAR(50)
);
GO

CREATE TABLE Tbl_Propiedad(
    CodigoPropiedad BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoTipoPropiedad INT,
    CodigoSucursal INT,
    CodigoAgente INT,
    NombrePropiedad VARCHAR(150),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Departamento VARCHAR(100),
    AreaTerreno DECIMAL(12,2),
    AreaConstruccion DECIMAL(12,2),
    CantidadHabitaciones INT,
    CantidadBanos INT,
    PrecioVenta DECIMAL(14,2),
    PrecioRenta DECIMAL(14,2),
    Disponible BIT,
    FechaRegistro DATETIME,
    FOREIGN KEY (CodigoTipoPropiedad) REFERENCES Tbl_TipoPropiedad(CodigoTipoPropiedad),
    FOREIGN KEY (CodigoSucursal) REFERENCES Tbl_Sucursal(CodigoSucursal),
    FOREIGN KEY (CodigoAgente) REFERENCES Tbl_Agente(CodigoAgente)
);
GO

CREATE TABLE Tbl_Propietario(
    CodigoPropietario BIGINT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(120),
    Apellidos VARCHAR(120),
    DPI CHAR(13),
    Nit CHAR(12),
    Telefono CHAR(15),
    Email VARCHAR(120),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    FechaRegistro DATETIME,
    Activo BIT,
    Observaciones VARCHAR(200)
);
GO

CREATE TABLE Tbl_PropiedadPropietario(
    CodigoPropiedadPropietario BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoPropiedad BIGINT,
    CodigoPropietario BIGINT,
    PorcentajePropiedad DECIMAL(5,2),
    FechaInicio DATE,
    FechaFin DATE,
    Activo BIT,
    FechaRegistro DATETIME,
    UsuarioRegistro VARCHAR(50),
    Observaciones VARCHAR(200),
    FOREIGN KEY (CodigoPropiedad) REFERENCES Tbl_Propiedad(CodigoPropiedad),
    FOREIGN KEY (CodigoPropietario) REFERENCES Tbl_Propietario(CodigoPropietario)
);
GO

CREATE TABLE Tbl_Contrato(
    CodigoContrato BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoPropiedad BIGINT,
    CodigoCliente BIGINT,
    CodigoAgente INT,
    TipoContrato CHAR(1),
    FechaInicio DATE,
    FechaFin DATE,
    PrecioAcordado DECIMAL(14,2),
    Deposito DECIMAL(14,2),
    Estado CHAR(1),
    FechaFirma DATETIME,
    Observaciones VARCHAR(300),
    FOREIGN KEY (CodigoPropiedad) REFERENCES Tbl_Propiedad(CodigoPropiedad),
    FOREIGN KEY (CodigoCliente) REFERENCES Tbl_Cliente(CodigoCliente),
    FOREIGN KEY (CodigoAgente) REFERENCES Tbl_Agente(CodigoAgente)
);
GO

CREATE TABLE Tbl_PagoContrato(
    CodigoPagoContrato BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoContrato BIGINT,
    FechaPago DATETIME,
    MontoPago DECIMAL(14,2),
    MetodoPago VARCHAR(50),
    NumeroRecibo VARCHAR(50),
    Banco VARCHAR(100),
    Estado CHAR(1),
    FechaRegistro DATETIME,
    UsuarioRegistro VARCHAR(50),
    Observaciones VARCHAR(200),
    FOREIGN KEY (CodigoContrato) REFERENCES Tbl_Contrato(CodigoContrato)
);
GO

CREATE TABLE Tbl_VisitaPropiedad(
    CodigoVisita BIGINT IDENTITY(1,1) PRIMARY KEY,
    CodigoPropiedad BIGINT,
    CodigoCliente BIGINT,
    CodigoAgente INT,
    FechaVisita DATETIME,
    InteresCliente BIT,
    CalificacionPropiedad INT,
    Comentarios VARCHAR(300),
    Estado CHAR(1),
    FechaRegistro DATETIME,
    UsuarioRegistro VARCHAR(50),
    FOREIGN KEY (CodigoPropiedad) REFERENCES Tbl_Propiedad(CodigoPropiedad),
    FOREIGN KEY (CodigoCliente) REFERENCES Tbl_Cliente(CodigoCliente),
    FOREIGN KEY (CodigoAgente) REFERENCES Tbl_Agente(CodigoAgente)
);
GO



