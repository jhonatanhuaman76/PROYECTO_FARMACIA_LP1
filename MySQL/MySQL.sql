
DROP DATABASE IF EXISTS BD_FARMAPLUS;

CREATE DATABASE BD_FARMAPLUS; 
USE BD_FARMAPLUS;

CREATE TABLE CLIENTE(
COD_CLIENTE 		INT AUTO_INCREMENT,
DNI_CLIENTE 		CHAR(8) NOT NULL UNIQUE,
NOMBRE_CLIENTE		VARCHAR(40) NOT NULL,
APELLIDO_CLIENTE	VARCHAR(40) NOT NULL,
PRIMARY KEY (COD_CLIENTE)
);

CREATE TABLE EMPLEADO(
COD_EMPLEADO		INT AUTO_INCREMENT,
DNI_EMPLEADO		CHAR(8) NOT NULL UNIQUE,
NOMBRE_EMPLEADO		VARCHAR(40) NOT NULL,
APELLIDO_EMPLEADO	VARCHAR(40) NOT NULL,
TELF_EMPLEADO		CHAR(9) NOT NULL,
CORREO_EMPLEADO		VARCHAR(40) NOT NULL,
DIRE_EMPLEADO		VARCHAR(40) NOT NULL,
TIPO_USUARIO		CHAR(1) NOT NULL,
NOMBRE_USUARIO		VARCHAR(20) NOT NULL,
PAS_USUARIO		VARCHAR(20) NOT NULL,
PRIMARY KEY (COD_EMPLEADO) 
);

CREATE TABLE PROVEEDOR(
COD_PROVEEDOR		INT AUTO_INCREMENT,
RUC_PROVEEDOR		CHAR(11) NOT NULL UNIQUE,
NOMBRE_PROVEEDOR	VARCHAR(40) NOT NULL,
TELF_PROVEEDOR		CHAR(9) NOT NULL,
DIRE_PROVEEDOR		VARCHAR(40) NOT NULL,
CORREO_PROVEEDOR	VARCHAR(40) NULL,
WEB_PROVEEDOR		VARCHAR(40) NULL,
PRIMARY KEY (COD_PROVEEDOR)
);

CREATE TABLE MARCA(
COD_MARCA 			INT AUTO_INCREMENT,
NOMBRE_MARCA 		VARCHAR(40) NOT NULL,
PRIMARY KEY (COD_MARCA)
);

CREATE TABLE CATEGORIA(
NUM_CATEGORIA 		INT AUTO_INCREMENT,
NOMBRE_CATEGORIA	VARCHAR(40) NOT NULL,
PRIMARY KEY(NUM_CATEGORIA)
);

CREATE TABLE UNIDAD_MEDIDA(
COD_UNIDAD 			INT AUTO_INCREMENT,
ABTR_UNIDAD 		VARCHAR(20) NOT NULL,
DESCRIPCION_UNIDAD 	VARCHAR(50) NOT NULL,
PRIMARY KEY (COD_UNIDAD) 
);

CREATE TABLE PRODUCTO(
COD_PROD 			INT AUTO_INCREMENT,
NUM_CATEGORIA 		INT NOT NULL,
NOMBRE_PRODUCTO 	VARCHAR(30) NOT NULL,
PRECIO_UNIT_COMPRA 	DECIMAL(10,2) NOT NULL,
PRECIO_UNIT_VENTA 	DECIMAL(10,2) NOT NULL,
STOCK_MIN 			INT NOT NULL,
STOCK_MAX 			INT NOT NULL,
COD_MARCA 			INT NOT NULL,
PRESENTACION 		VARCHAR(20) NOT NULL,
M_CONTROLADO 		BIT NOT NULL,
CHECK (PRECIO_UNIT_COMPRA > 0),
CHECK (PRECIO_UNIT_VENTA > 0),
CHECK (STOCK_MIN >= 0),
CHECK (STOCK_MAX >= 0),
FOREIGN KEY(NUM_CATEGORIA) REFERENCES CATEGORIA(NUM_CATEGORIA),
FOREIGN KEY(COD_MARCA) REFERENCES MARCA(COD_MARCA),
PRIMARY KEY (COD_PROD)
);

CREATE TABLE UM_PRODUCTO (
COD_UNIDAD 			INT NOT NULL,
COD_PRODUCTO 		INT NOT NULL,
FACTOR_CONVERCION 	INT NOT NULL,
FOREIGN KEY(COD_UNIDAD) REFERENCES UNIDAD_MEDIDA(COD_UNIDAD),
FOREIGN KEY(COD_PRODUCTO) REFERENCES PRODUCTO(COD_PROD),
PRIMARY KEY(COD_UNIDAD, COD_PRODUCTO)
);

CREATE TABLE LOTE(
NRO_LOTE			INT AUTO_INCREMENT,
COD_PROD			INT NOT NULL,
STOCK				INT NOT NULL,
FECHA_VENCIMIENTO	DATE,
FECHA_FABRICACION	DATE,
CONDICIONES_TRANSPORTE	VARCHAR(200),
FOREIGN KEY (COD_PROD) REFERENCES PRODUCTO(COD_PROD),
PRIMARY KEY (NRO_LOTE)
);

CREATE TABLE BOLETA(
COD_BOLETA			INT AUTO_INCREMENT,
COD_CLIENTE			INT NOT NULL,
COD_EMPLEADO		INT NOT NULL,
METODO_PAGO			VARCHAR(15),
FECHA_EMISION		DATE,
CHECK(METODO_PAGO IN ('EFECTIVO', 'TRANSFERENCIA')),
FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (COD_CLIENTE),
FOREIGN KEY (COD_EMPLEADO) REFERENCES EMPLEADO (COD_EMPLEADO),
PRIMARY KEY(COD_BOLETA)	
);

CREATE TABLE DETALLE_BOLETA(
COD_BOLETA 			INT NOT NULL,
COD_LOTE 			INT NOT NULL,
COD_PROD	 		INT NOT NULL,
COD_UNIDAD			INT NOT NULL,
CANTIDAD_VENDIDA_BASE INT NOT NULL,
CANTIDAD_VENDIDA_PRES INT NOT NULL,
PRECIO_UNIT_VENTA	DECIMAL(10,2) NOT NULL,
CHECK (CANTIDAD_VENDIDA_BASE > 0),
CHECK (CANTIDAD_VENDIDA_PRES > 0),
CHECK (PRECIO_UNIT_VENTA > 0),
FOREIGN KEY (COD_BOLETA) REFERENCES	BOLETA(COD_BOLETA),
FOREIGN KEY (COD_LOTE) REFERENCES LOTE(NRO_LOTE),
FOREIGN KEY (COD_PROD) REFERENCES PRODUCTO(COD_PROD),
FOREIGN KEY (COD_UNIDAD) REFERENCES UNIDAD_MEDIDA(COD_UNIDAD),
PRIMARY KEY (COD_BOLETA, COD_LOTE)
);

CREATE TABLE FACTURA_PROVEEDOR(
COD_FACTURA			INT AUTO_INCREMENT,
COD_PROVEEDOR		INT NOT NULL,
COD_EMPLEADO		INT NOT NULL,
FECHA_EMISION		DATE,
METODO_PAGO			VARCHAR(15),
CHECK(METODO_PAGO IN ('EFECTIVO', 'TRANSFERENCIA')),
FOREIGN KEY (COD_PROVEEDOR) REFERENCES PROVEEDOR(COD_PROVEEDOR),
FOREIGN KEY (COD_EMPLEADO) REFERENCES EMPLEADO(COD_EMPLEADO),
PRIMARY KEY (COD_FACTURA)
);

CREATE TABLE DETALLE_FACTURA(
NRO_LOTE			INT NOT NULL,
NRO_FACTURA			INT NOT NULL,
COD_PROD			INT NOT NULL,
COD_UNIDAD			INT NOT NULL,
CANTIDAD_RECIBIDA_BASE INT NOT NULL,
CANTIDAD_RECIBIDA_PRES INT NOT NULL,
PRECIO_UNIT_COMPRA	DECIMAL(10,2) NOT NULL,
CHECK (CANTIDAD_RECIBIDA_BASE > 0),
CHECK (CANTIDAD_RECIBIDA_PRES > 0),
CHECK (PRECIO_UNIT_COMPRA > 0),
FOREIGN KEY (NRO_FACTURA) REFERENCES	FACTURA_PROVEEDOR(COD_FACTURA),
FOREIGN KEY (NRO_LOTE) REFERENCES LOTE(NRO_LOTE),
FOREIGN KEY (COD_PROD) REFERENCES PRODUCTO(COD_PROD),
FOREIGN KEY (COD_UNIDAD) REFERENCES UNIDAD_MEDIDA(COD_UNIDAD),
PRIMARY KEY (NRO_FACTURA, NRO_LOTE)
);

/*PROCEDIMIENTOS ALMACENADOS*/
CREATE PROCEDURE SP_REGISTRAR_CATEGORIA(
NOM_CATE		VARCHAR(40)
)
INSERT INTO CATEGORIA VALUES(NULL, NOM_CATE);

CALL SP_REGISTRAR_CATEGORIA("ATIBIOTICOS");