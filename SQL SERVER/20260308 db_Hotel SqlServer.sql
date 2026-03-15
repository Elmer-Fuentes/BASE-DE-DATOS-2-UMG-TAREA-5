
Create Database db_Hotel;

Use db_Hotel;

CREATE TABLE tbl_Empleados 
(
    CodigoEmpleado Int Primary Key Identity(1,1) Not Null,
	Nombre Varchar(100) Not Null,
    NumeroDpi BigInt Not Null,
    Genero Char(1) Not Null,
    Cargo Varchar(50) Not Null,
    Salario Decimal(10, 2) Not Null,
    FechaNacimiento DateTime Not Null,
    FechaContratacion DateTime Not Null,
	Estado Bit Not Null,    -- Activo, Inactivo
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime
);

CREATE TABLE tbl_Usuarios 
(
    CodigoUsuario Int Primary Key Identity(1,1) Not Null,
    CodigoEmpleado Int Not Null,
    Correo Varchar(100) Not Null,
    Usuario Varchar(100) Not Null,
    Contrasenia Varchar(100) Not Null,
    Rol Varchar(100) Not Null,    --Admin, Soporte, Gerencia, Recepcion, Asistente
    IntentosFallidos Int,
    UltimoAcceso DateTime,
	Estado Bit Not Null,    -- Activo, Inactivo
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime,
    Foreign Key (CodigoEmpleado) References tbl_Empleados(CodigoEmpleado)
);

CREATE TABLE tbl_PlanillasEnc
(
    CodigoPlanillaEnc Int Primary Key Identity(1,1) Not Null,
    FechaPlanilla DateTime Not Null,
    TipoPlanilla Varchar(50) Not Null, -- Mensual, Quincenal
    Banco Varchar(50), -- BI, GYT, BAM, BAC
    DocReferencia BigInt, 
    TipoMoneda Char(3) Not Null,
    MontoTotal Decimal(10,2) Not Null, 
    Observaciones Varchar(255),
	Estado Varchar(50) Not Null,            -- Creada, Pagada, Cancelada
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime
);


CREATE TABLE tbl_PlanillasDet
(
    CodigoPlanillaDet Int Primary Key Identity(1,1) Not Null,
    CodigoPlanillaEnc Int Not Null,
    CodigoEmpleado Int Not Null,
    SalarioBase Decimal(10, 2) Not Null,
    BonoLey Decimal(10,2) Not Null,
    BonoExtra Decimal(10,2),
    HorasExtras int,
    MontoHorasExtras Decimal(10,2),
    Isr Decimal(10,2),
    Igss Decimal(10,2),
    MontoTotal Decimal(10, 2) Not Null,
	Estado Bit Not Null,    -- Pagado, Pendiete
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime,
    Foreign Key (CodigoPlanillaEnc) References tbl_PlanillasEnc(CodigoPlanillaEnc),
    Foreign Key (CodigoEmpleado) References tbl_Empleados(CodigoEmpleado)
);

CREATE TABLE tbl_Habitaciones (
    CodigoHabitacion Int Primary Key Identity(1,1) Not Null,
    Numero Varchar(10)  Not Null,
    Ubicacion Varchar(100),
    Tipo Varchar(50) Not Null,
    PetFriendly Bit,
    CantidadHuesped Int,    
    Precio Decimal(10, 2) Not Null,
    PorcentajeAnticipo Decimal(10,2),
	Estado Bit Not Null,    -- Activo, Inactivo
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime
);

CREATE TABLE tbl_ServiciosHabitacion 
(
    CodigoServicioHab Int Primary Key Identity(1,1) Not Null,
    CodigoEmpleado Int Not Null,
    CodigoHabitacion Int Not Null,
    TipoServicio Varchar(50) Not Null,
    Turno Char(1) Not Null,
    FechaInicio DateTime Not Null,
    FechaFin DateTime Not Null,
	Observaciones Varchar(255),
    Estado Bit Not Null,    -- Finalizado, Pendiente
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime,
    Foreign Key (CodigoEmpleado) References tbl_Empleados(CodigoEmpleado),
    Foreign Key (CodigoHabitacion) References tbl_Habitaciones(CodigoHabitacion)
);

CREATE TABLE tbl_Huespedes
(
	CodigoHuesped Int Primary Key Identity(1,1) Not Null,
	Nombre Varchar(100) Not Null,
	TipoIdentificacion Varchar(50) Not Null,
	NumeroIdentificacion BigInt Not Null,
	FechaNacimiento DateTime Not Null,
	Genero Char(1) Not Null,
	Telefono Int,
	Direccion Varchar(255),
	Calificacion Decimal(10,2),
	Estado Bit Not Null,    -- Activo, Inactivo
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime
);

CREATE TABLE tbl_Hospedajes 
(
    CodigoHospedaje Int Primary Key Identity(1,1) Not Null,
    CodigoHuesped Int Not Null,
    CodigoHabitacion Int Not Null,
    FechaIngreso DateTime Not Null,
    FechaSalida DateTime Not Null,
    MontoHabitacion Decimal(10,2),
    MontoAnticipo Decimal(10,2),
    MontoConsumos Decimal(10,2),
    MontoTotal Decimal(10, 2) Not Null,
	Estado Bit Not Null,    -- Activo, Inactivo
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime,
    Foreign Key (CodigoHuesped) References tbl_Huespedes(CodigoHuesped),
    Foreign Key (CodigoHabitacion) References tbl_Habitaciones(CodigoHabitacion)
);

CREATE TABLE tbl_Servicios 
(
    CodigoServicio Int Primary Key Identity(1,1) Not Null,
    Nombre Varchar(100) Not Null,
    Tipo Varchar(100) Not Null,   -- Cocina, Bar, habitacion, Entretenimiento
    Categoria Varchar(100) Not Null,  -- Alimentos, Bebidas, Limpieza, Spa, Zafari
    UnidadMedida Varchar(20),    -- Unidad, Botella, Hora, Libra
    PrecioUnitario Decimal(10, 2) Not Null,
	TiempoPreparacion Decimal(10,2),
    Estado Bit Not Null,    -- Activo, Inactivo    
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime
);


CREATE TABLE tbl_ConsumosEnc 
(
    CodigoConsumoEnc Int Primary Key Identity(1,1) Not Null,
    CodigoHospedaje Int Not Null,
    FechaConsumo DateTime Not Null,
    MontoTotal Decimal(10,2),
	Estado Bit Not Null,    -- Activo, Inactivo
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime,
    Foreign Key (CodigoHospedaje) References tbl_Hospedajes(CodigoHospedaje)
);


CREATE TABLE tbl_ConsumosDet 
(
    CodigoConsumoDet Int Primary Key Identity(1,1) Not Null,
    CodigoConsumoEnc Int Not Null,
    CodigoServicio Int Not Null,
    Cantidad Int Not Null,
    PrecioUnitario Decimal(10,2) Not Null,
    PrecioTotal Decimal(10,2) Not Null,
    MontoTotal Decimal(10, 2) Not Null,
    Observaciones Varchar(255),
    Estado Varchar(50), -- Solicitado, Entregado, Proceso, Cancelado
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime,
    Foreign Key (CodigoConsumoEnc) References tbl_ConsumosEnc(CodigoConsumoEnc),
    Foreign Key (CodigoServicio) References tbl_Servicios(CodigoServicio)
);

CREATE TABLE tbl_Pagos (
    CodigoPago Int Primary Key Identity(1,1) Not Null,
    CodigoHospedaje Int Not Null,
    FechaPago DateTime Not Null,
    MetodoPago Varchar(100) Not Null,
    ReferenciaPago BigInt,
    Monto Decimal(10, 2) Not Null,  -- MontoHabitacion + MontoConsumos
    Propina Decimal(10, 2),
    Impuesto Decimal(10, 2),
    Descuento Decimal(10, 2),
    TotalPago Decimal(10, 2) Not Null,
	Estado Bit Not Null,    -- Pagado, Pendiente
	UsuarioCreacion Varchar(50),
	FechaCreacion DateTime,
	UsuarioModificacion Varchar(50),
	FechaModificacion DateTime,
	UsuarioEliminacion Varchar(50),
	FechaEliminacion DateTime,
    Foreign Key (CodigoHospedaje) References tbl_Hospedajes(CodigoHospedaje)
);


