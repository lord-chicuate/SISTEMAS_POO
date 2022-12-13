CREATE DATABASE SISTEMA_VENTAS



USE SISTEMA_VENTAS



CREATE TABLE ROL (
IDRol INT PRIMARY KEY IDENTITY, 
descripcion varchar(50),
FechaRegistro datetime default getdate()
)



CREATE TABLE PERMISO(
IdPermiso INT PRIMARY KEY IDENTITY,
IdRol int references ROL(IdRol),
NombreMenu varchar(100),
FechaRegistro datetime default getdate()

)



CREATE TABLE PROVEEDOR(
IdProvedor INT PRIMARY KEY IDENTITY,
Documento varchar(50),
RazonSocial varchar(50),
Correo varchar(50),
Telefono varchar(50),
Estado bit,
FechaRegistro datetime default getdate()

)




CREATE TABLE CLIENTE(
IdCliente INT PRIMARY KEY IDENTITY,
Documento varchar(50),
NombreCompleto varchar(50),
Correo Varchar(50),
Telefono varchar(50),
Estado bit,
FechaRegistro datetime default getdate()
)



CREATE TABLE USUARIO(
IdUsuario INT PRIMARY KEY IDENTITY,
Documento varchar(50),
NombreCompleto varchar(50),
Correo Varchar(50),
Clave varchar(50),
IdRol int references Rol(IdRol),
Telefono varchar(50),
Estado bit,
FechaRegistro datetime default getdate()
)



CREATE TABLE CATEGORIA(
IdCategoria INT PRIMARY KEY IDENTITY,
Descripcion varchar,
Estado bit,
FechaRegistro datetime default getdate()
)



CREATE TABLE PRODUCTO(
IdProducto INT PRIMARY KEY IDENTITY,
Codigo varchar(50),
Nombre varchar(50),
Descripcion varchar(50),
IdCategoria int references CATEGORIA(IdCategoria),
Stock int not null default 0,
PrecioCompra decimal(10,2) default 0,
PrecioVenta decimal(10,2) default 0,
Estado bit,
FechaRegistro datetime default getdate()
)



CREATE TABLE COMPRA(
IdCompra INT PRIMARY KEY IDENTITY,
IdUsuario int references USUARIO(IdUsuario), 
IdProvedor int references PROVEEDOR(Idprovedor),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)



CREATE TABLE DETALLE_COMPRA(
IdDetalleCompra INT PRIMARY KEY IDENTITY,
IdCompra int references COMPRA(IdCompra), 
IdProducto int references PRODUCTO(IdProducto),
PrecioCompra decimal(10,2) default 0,
PrecioVenta decimal(10,2) default 0,
Cantidad int,
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)



CREATE TABLE VENTA(
IdVenta int primary key identity,
IdUsuario INT REFERENCES USUARIO(IdUsuario),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
DocumentoCliente varchar(100),
NombreCliente varchar(100),
MontoPago decimal(10,2),
MontoCambio decimal(10,2),
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)



CREATE TABLE DETALLE_VENTA(
Iddetalleventa int primary key identity,
IdVenta int references VENTA(IdVenta),
IdProducto int references PRODUCTO(IdProducto),
PrecioVenta decimal(10,2),
Cantidad int,
Sudtotal decimal(10,2),
FechaRegistro datetime default getdate()
)