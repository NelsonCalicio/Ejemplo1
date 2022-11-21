CREATE DATABASE Miscelanea DEFAULT CHARACTER SET UTF8 COLLATE utf8_general_ci;

USE Miscelanea;

CREATE TABLE Marcas(
    cod_marca smallint(5) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) NOT null
);

CREATE TABLE Clientes(
    nit_cliente int(8) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT null,
    apellido varchar(50),
    direccion varchar(100) NOT null,
    fecha_nac date
);

CREATE TABLE Facturas(
    cod_factura bigint(25) NOT null AUTO_INCREMENT PRIMARY KEY,
    nit_cliente int(8) NOT null,
    cod_producto int(10) NOT null
);

CREATE TABLE Proveedores(
    nit_proveedor int(8) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) NOT null,
    direccion varchar(100) NOT null,
    telefono int(8),
    email varchar(100)
);

CREATE TABLE Suministro(
    cod_producto int(10) NOT null AUTO_INCREMENT PRIMARY KEY,
    nit_proveedor int(8)
);

CREATE TABLE Productos(
    cod_producto int(10) NOT null AUTO_INCREMENT PRIMARY KEY,
    cod_marca smallint(5) NOT null,
    nombre varchar(250) NOT null,
    precio_unitario float NOT null
);

ALTER TABLE Productos
ADD CONSTRAINT PK_FK_cod_marca FOREIGN KEY (cod_marca) REFERENCES
Marcas(cod_marca) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE Facturas
ADD CONSTRAINT PK_FK_nit_cliente FOREIGN KEY (nit_cliente)  references
Clientes(nit_cliente) on update cascade on delete cascade;

ALTER TABLE Facturas
ADD CONSTRAINT PK_FK_cod_producto FOREIGN KEY (cod_producto)  references
Productos(cod_producto) on update cascade on delete cascade;

ALTER TABLE Productos
ADD CONSTRAINT FK_PK_cod_producto FOREIGN KEY (cod_producto)  references
Suministro(cod_producto) on update cascade on delete cascade;

ALTER TABLE Suministro
ADD CONSTRAINT PK_FK_nit_proveedor FOREIGN KEY (nit_proveedor)  references
Proveedores(nit_proveedor) on update cascade on delete cascade;