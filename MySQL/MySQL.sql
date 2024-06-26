
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
TIPO_USUARIO		CHAR(20) NOT NULL,
NOMBRE_USUARIO		VARCHAR(20) NOT NULL UNIQUE,
PAS_USUARIO		VARCHAR(20) NOT NULL,
CHECK(TIPO_USUARIO IN ('EMPLEADO', 'ADMIN', 'SUPERADMIN')),
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
PRESENTACION 		VARCHAR(20) NOT NULL,
M_CONTROLADO 		BIT NOT NULL,
CHECK (PRECIO_UNIT_COMPRA > 0),
CHECK (PRECIO_UNIT_VENTA > 0),
CHECK (STOCK_MIN >= 0),
CHECK (STOCK_MAX >= 0),
FOREIGN KEY(NUM_CATEGORIA) REFERENCES CATEGORIA(NUM_CATEGORIA),
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
CHECK(STOCK>=0),
CHECK(FECHA_VENCIMIENTO>FECHA_FABRICACION),
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
PRIMARY KEY (COD_BOLETA, COD_LOTE, COD_UNIDAD)
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

/*PROCEDIMIENTOS ALMACENADOS PARA CATEGORIA-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_CATEGORIA(
NOM_CATE			VARCHAR(40)
)
INSERT INTO CATEGORIA VALUES(NULL, NOM_CATE);

CREATE PROCEDURE SP_MODIFICAR_CATEGORIA(
COD_CATE 			INT,
NOM_CATE			VARCHAR(40)
)
UPDATE CATEGORIA SET NOMBRE_CATEGORIA = NOM_CATE
WHERE NUM_CATEGORIA = COD_CATE;

CREATE PROCEDURE SP_ELIMINAR_CATEGORIA(
COD_CATE			INT
)
DELETE FROM CATEGORIA
WHERE NUM_CATEGORIA = COD_CATE;

CREATE PROCEDURE SP_LISTAR_CATEGORIA()
SELECT * FROM CATEGORIA;

CREATE PROCEDURE SP_BUSCAR_CATEGORIA(
COD_CATE			INT
)
SELECT * FROM CATEGORIA
WHERE NUM_CATEGORIA = COD_CATE;

/*PROCEDIMIENTOS ALMACENADOS PARA CLIENTE---------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_CLIENTE(
DNI_CLI			CHAR(8),
NOM_CLI         VARCHAR(40),
APE_CLI         VARCHAR(40)
)
INSERT INTO CLIENTE VALUES(NULL, DNI_CLI, NOM_CLI, APE_CLI);

CREATE PROCEDURE SP_MODIFICAR_CLIENTE(
COD_CLI 		INT,
DNI_CLI			CHAR(8),
NOM_CLI         VARCHAR(40),
APE_CLI         VARCHAR(40)
)
UPDATE CLIENTE SET DNI_CLIENTE=DNI_CLI, NOMBRE_CLIENTE=NOM_CLI, APELLIDO_CLIENTE=APE_CLI
WHERE COD_CLIENTE = COD_CLI;

CREATE PROCEDURE SP_ELIMINAR_CLIENTE(
COD_CLI			INT
)
DELETE FROM CLIENTE
WHERE COD_CLIENTE = COD_CLI;

CREATE PROCEDURE SP_LISTAR_CLIENTE()
SELECT * FROM CLIENTE;

CREATE PROCEDURE SP_BUSCAR_CLIENTE(
COD_CLI			INT
)
SELECT * FROM CLIENTE
WHERE COD_CLIENTE = COD_CLI;

/*PROCEDIMIENTOS ALMACENADOS PARA EMPLEADO---------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_EMPLEADO(
DNI_EMPL		CHAR(8),
NOM_EMPL        VARCHAR(40),
APE_EMPL        VARCHAR(40),
TELEF_EMPL      CHAR(9),
CORREO_EMPL     VARCHAR(40),
DIRE_EMPL       VARCHAR(40),
TIPO_USER       VARCHAR(20),
NOM_USER        VARCHAR(20),
PASS_USER       VARCHAR(20)
)
INSERT INTO EMPLEADO VALUES(NULL, DNI_EMPL, NOM_EMPL, APE_EMPL, TELEF_EMPL, CORREO_EMPL, DIRE_EMPL, TIPO_USER, NOM_USER, PASS_USER);

CREATE PROCEDURE SP_MODIFICAR_EMPLEADO(
COD_EMPL        INT,
DNI_EMPL		CHAR(8),
NOM_EMPL        VARCHAR(40),
APE_EMPL        VARCHAR(40),
TELEF_EMPL      CHAR(9),
CORREO_EMPL     VARCHAR(40),
DIRE_EMPL       VARCHAR(40),
TIPO_USER       VARCHAR(20),
NOM_USER        VARCHAR(20),
PASS_USER       VARCHAR(20)
)
UPDATE EMPLEADO SET DNI_EMPLEADO=DNI_EMPL, NOMBRE_EMPLEADO=NOM_EMPL, APELLIDO_EMPLEADO=APE_EMPL, TELF_EMPLEADO=TELEF_EMPL, CORREO_EMPLEADO=CORREO_EMPL, DIRE_EMPLEADO=DIRE_EMPL, TIPO_USUARIO=TIPO_USER, NOMBRE_USUARIO=NOM_USER, PAS_USUARIO=PASS_USER
WHERE COD_EMPLEADO = COD_EMPL;

CREATE PROCEDURE SP_ELIMINAR_EMPLEADO(
COD_EMPL		INT
)
DELETE FROM EMPLEADO
WHERE COD_EMPLEADO = COD_EMPL;

CREATE PROCEDURE SP_LISTAR_EMPLEADO()
SELECT * FROM EMPLEADO;

CREATE PROCEDURE SP_BUSCAR_EMPLEADO(
COD_EMPL			INT
)
SELECT * FROM EMPLEADO
WHERE COD_EMPLEADO = COD_EMPL;

CREATE PROCEDURE SP_ACCESO_EMPLEADO
( in user varchar(20),
  in  clave varchar(20)
)
SELECT * FROM EMPLEADO WHERE NOMBRE_USUARIO=user AND PAS_USUARIO=clave;

CREATE PROCEDURE SP_RECUPERAR_CLAVE
( in nom varchar(40),
  in  ape varchar(40),
  in  correo varchar(40),
  in user_e varchar(20)
)
SELECT * FROM 
EMPLEADO 
WHERE NOMBRE_EMPLEADO=nom 
AND APELLIDO_EMPLEADO=ape 
AND CORREO_EMPLEADO=correo 
AND NOMBRE_USUARIO=user_e;  


/*PROCEDIMIENTOS ALMACENADOS PARA PROVEEDOR---------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_PROVEEDOR(
RUC_PROV		CHAR(11),
NOMBRE_PROV	    VARCHAR(40),
TELF_PROV		CHAR(9),
DIRE_PROV		VARCHAR(40),
CORREO_PROV	    VARCHAR(40),
WEB_PROV		VARCHAR(40)
)
INSERT INTO PROVEEDOR VALUES(NULL, RUC_PROV, NOMBRE_PROV, TELF_PROV, DIRE_PROV, CORREO_PROV, WEB_PROV);

CREATE PROCEDURE SP_MODIFICAR_PROVEEDOR(
COD_PROV        INT,
RUC_PROV		CHAR(11),
NOMBRE_PROV	    VARCHAR(40),
TELF_PROV		CHAR(9),
DIRE_PROV		VARCHAR(40),
CORREO_PROV	    VARCHAR(40),
WEB_PROV		VARCHAR(40)
)
UPDATE PROVEEDOR SET RUC_PROVEEDOR=RUC_PROV, NOMBRE_PROVEEDOR=NOMBRE_PROV, TELF_PROVEEDOR=TELF_PROV, DIRE_PROVEEDOR=DIRE_PROV, CORREO_PROVEEDOR=CORREO_PROV, WEB_PROVEEDOR=WEB_PROV
WHERE COD_PROVEEDOR = COD_PROV;

CREATE PROCEDURE SP_ELIMINAR_PROVEEDOR(
COD_PROV		INT
)
DELETE FROM PROVEEDOR
WHERE COD_PROVEEDOR = COD_PROV;

CREATE PROCEDURE SP_LISTAR_PROVEEDOR()
SELECT * FROM PROVEEDOR;

CREATE PROCEDURE SP_BUSCAR_PROVEEDOR(
COD_PROV			INT
)
SELECT * FROM PROVEEDOR
WHERE COD_PROVEEDOR = COD_PROV;

/*PROCEDIMIENTOS ALMACENADOS PARA UNIDAD DE MEDIDA-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_UM(
ABTR_UND 		    VARCHAR(20),
DESCRIPCION_UND 	VARCHAR(50)
)
INSERT INTO UNIDAD_MEDIDA VALUES(NULL, ABTR_UND, DESCRIPCION_UND);

CREATE PROCEDURE SP_MODIFICAR_UM(
COD_UND 		    INT,
ABTR_UND 		    VARCHAR(20),
DESCRIPCION_UND 	VARCHAR(50)
)
UPDATE UNIDAD_MEDIDA SET ABTR_UNIDAD=ABTR_UND, DESCRIPCION_UNIDAD=DESCRIPCION_UND
WHERE COD_UNIDAD = COD_UND;

CREATE PROCEDURE SP_ELIMINAR_UM(
COD_UND			INT
)
DELETE FROM UNIDAD_MEDIDA
WHERE COD_UNIDAD = COD_UND;

CREATE PROCEDURE SP_LISTAR_UM()
SELECT * FROM UNIDAD_MEDIDA;

CREATE PROCEDURE SP_BUSCAR_UM(
COD_UND			INT
)
SELECT * FROM UNIDAD_MEDIDA
WHERE COD_UNIDAD = COD_UND;

/*PROCEDIMIENTOS ALMACENADOS PARA PRODUCTO-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_PRODUCTO(
COD_CATE	 		INT,
NOM_PROD		 	VARCHAR(30),
PRE_UNIT_COMPRA 	DECIMAL(10,2),
PRE_UNIT_VENTA		DECIMAL(10,2),
ST_MIN 				INT,
ST_MAX 				INT,
PRES 				VARCHAR(20),
M_CONTROL 			BIT
)
INSERT INTO PRODUCTO VALUES(NULL,COD_CATE, NOM_PROD, PRE_UNIT_COMPRA, PRE_UNIT_VENTA, ST_MIN, ST_MAX, PRES, M_CONTROL);

CREATE PROCEDURE SP_MODIFICAR_PRODUCTO(

COD_PRO 			INT,
NUM_CATE			INT,
NOMBRE_PROD			VARCHAR(30),
PRE_UNIT_COMPRA 	DECIMAL(10,2),
PRE_UNIT_VENTA 		DECIMAL(10,2),
ST_MIN 				INT,
ST_MAX 				INT,
PRES 				VARCHAR(20),
M_CONTROL 			BIT
)
UPDATE PRODUCTO 
SET NUM_CATEGORIA = NUM_CATE,
	NOMBRE_PRODUCTO = NOMBRE_PROD,
    PRECIO_UNIT_COMPRA = PRE_UNIT_COMPRA,
    PRECIO_UNIT_VENTA = PRE_UNIT_VENTA,
    STOCK_MIN = ST_MIN,
    STOCK_MAX = ST_MAX,
    PRESENTACION = PRES,
    M_CONTROLADO = M_CONTROL
WHERE COD_PROD = COD_PRO;

CREATE PROCEDURE SP_ELIMINAR_PRODUCTO(
COD_PRO				INT
)
DELETE FROM PRODUCTO
WHERE COD_PROD = COD_PRO;

CREATE PROCEDURE SP_LISTAR_PRODUCTO()
SELECT * FROM PRODUCTO;

CREATE PROCEDURE SP_BUSCAR_PRODUCTO(
COD_PRO				INT
)
SELECT * FROM PRODUCTO
WHERE COD_PROD = COD_PRO;

/*PROCEDIMIENTOS ALMACENADOS PARA UM_PRODUCTO-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_UM_PRODUCTO(
COD_UNI 			INT,
COD_PRO	 		INT,
FACTOR			 	INT
)
INSERT INTO UM_PRODUCTO VALUES(COD_UNI, COD_PRO, FACTOR);

CREATE PROCEDURE SP_MODIFICAR_UM_PRODUCTO(
COD_UNI 			INT,
COD_PROD	 		INT,
FACTOR			 	INT
)
UPDATE UM_PRODUCTO SET FACTOR_CONVERCION  = FACTOR
WHERE COD_UNIDAD  = COD_UNI AND COD_PRODUCTO = COD_PROD;

CREATE PROCEDURE SP_ELIMINAR_UM_PRODUCTO(
COD_UNI 			INT,
COD_PROD	 		INT
)
DELETE FROM UM_PRODUCTO
WHERE COD_UNIDAD  = COD_UNI AND COD_PRODUCTO = COD_PROD;

CREATE PROCEDURE SP_LISTAR_UM_PRODUCTO()
SELECT * FROM UM_PRODUCTO;

CREATE PROCEDURE SP_BUSCAR_UM_PRODUCTO(
COD_UNI 			INT,
COD_PROD	 		INT
)
SELECT * FROM UM_PRODUCTO
WHERE COD_UNIDAD  = COD_UNI AND COD_PRODUCTO = COD_PROD;

CREATE PROCEDURE SP_LISTAR_UM_PRODUCTO_X_COD_PROD(
COD_PROD			INT
)
SELECT 
	UM_PRODUCTO.*,
    UNIDAD_MEDIDA.ABTR_UNIDAD,
    UNIDAD_MEDIDA.DESCRIPCION_UNIDAD
FROM UM_PRODUCTO
INNER JOIN UNIDAD_MEDIDA
ON UM_PRODUCTO.COD_UNIDAD = UNIDAD_MEDIDA.COD_UNIDAD
WHERE COD_PRODUCTO = COD_PROD;

/*PROCEDIMIENTOS ALMACENADOS PARA LOTE-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_LOTE(
COD_PRO				INT,
ST					INT,
FECHA_VENC			DATE,
FECHA_FAB			DATE,
CONDICIONES_TRANS	VARCHAR(200)
)
INSERT INTO LOTE VALUES(NULL, COD_PRO, ST, FECHA_VENC, FECHA_FAB, CONDICIONES_TRANS);

CREATE PROCEDURE SP_MODIFICAR_LOTE(
COD_LOTE			INT,
COD_PRO				INT,
ST					INT,
FECHA_VENC			DATE,
FECHA_FAB			DATE,
CONDICIONES_TRANS	VARCHAR(200)
)
UPDATE LOTE 
SET STOCK = ST,
	FECHA_VENCIMIENTO = FECHA_VENC,
    FECHA_FABRICACION = FECHA_FAB,
    CONDICIONES_TRANSPORTE = CONDICIONES_TRANS
WHERE NRO_LOTE = COD_LOTE;

CREATE PROCEDURE SP_ELIMINAR_LOTE(
COD_LOTE			INT
)
DELETE FROM LOTE
WHERE NRO_LOTE = COD_LOTE;

CREATE PROCEDURE SP_LISTAR_LOTE()
SELECT 
LOTE.*,
PRODUCTO.NOMBRE_PRODUCTO,
PRODUCTO.PRECIO_UNIT_VENTA,
PRODUCTO.PRECIO_UNIT_COMPRA
FROM LOTE
INNER JOIN PRODUCTO
ON LOTE.COD_PROD = PRODUCTO.COD_PROD
ORDER BY
LOTE.NRO_LOTE ASC;

CREATE PROCEDURE SP_BUSCAR_LOTE(
COD_LOTE			INT
)
SELECT * FROM LOTE
WHERE NRO_LOTE = COD_LOTE;

/*PROCEDIMIENTOS ALMACENADOS PARA BOLETA-------------------------------------------------------------------------------------*/
DELIMITER //
CREATE PROCEDURE SP_REGISTRAR_BOLETA(
COD_CLI				INT,
COD_EMP				INT,
MET_PAGO			VARCHAR(15),
FECHA_EM			DATE
)
BEGIN
	DECLARE P_COD_BOLETA INT;
	INSERT INTO BOLETA VALUES(NULL, COD_CLI, COD_EMP, MET_PAGO, FECHA_EM);
    SET P_COD_BOLETA = last_insert_id();
    SELECT P_COD_BOLETA;
END //
DELIMITER ;

CREATE PROCEDURE SP_MODIFICAR_BOLETA(
COD_BOLE			INT,
COD_CLI				INT,
COD_EMP				INT,
MET_PAGO			VARCHAR(15),
FECHA_EM			DATE
)
UPDATE BOLETA
SET COD_CLIENTE = COD_CLI,
	COD_EMPLEADO = COD_EMP,
    MET_PAGO = METODO_PAGO,
    FECHA_EMISION = FECHA_EM
WHERE COD_BOLETA = COD_BOLE;

CREATE PROCEDURE SP_ELIMINAR_BOLETA(
COD_BOLE			INT
)
DELETE FROM BOLETA
WHERE COD_BOLETA = COD_BOLE;

CREATE PROCEDURE SP_LISTAR_BOLETA()
SELECT * FROM BOLETA;

CREATE PROCEDURE SP_BUSCAR_BOLETA(
COD_BOLE			INT
)
SELECT * FROM BOLETA
WHERE COD_BOLETA = COD_BOLE;

/*PROCEDIMIENTOS ALMACENADOS PARA DETALLE_BOLETA-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_DETALLE_BOLETA(
COD_BOLE 			INT,
COD_LOT 			INT,
COD_PRO	 			INT,
COD_UNI				INT,
CANT_VENDIDA_BASE 	INT,
CANT_VENDIDA_PRES 	INT,
PRE_UNIT_VENTA		DECIMAL(10,2)
)
INSERT INTO DETALLE_BOLETA VALUES(COD_BOLE, COD_LOT, COD_PRO, COD_UNI, CANT_VENDIDA_BASE, CANT_VENDIDA_PRES, PRE_UNIT_VENTA);

CREATE PROCEDURE SP_MODIFICAR_DETALLE_BOLETA(
COD_BOLE 			INT,
COD_LOT 			INT,
COD_PRO	 			INT,
COD_UNI				INT,
CANT_VENDIDA_BASE 	INT,
CANT_VENDIDA_PRES 	INT,
PRE_UNIT_VENTA		DECIMAL(10,2)
)
UPDATE DETALLE_BOLETA
SET COD_PROD = COD_PRO,
    COD_UNIDAD = COD_UNI,
    CANTIDAD_VENDIDA_BASE = CANT_VENDIDA_BASE,
    CANTIDAD_VENDIDA_PRES = CANT_VENDIDA_PRES,
    PRECIO_UNIT_VENTA = PRE_UNIT_VENTA
WHERE COD_BOLETA = COD_BOLE AND COD_LOTE = COD_LOT;

CREATE PROCEDURE SP_ELIMINAR_DETALLE_BOLETA(
COD_BOLE 			INT,
COD_LOT 			INT
)
DELETE FROM DETALLE_BOLETA
WHERE COD_BOLETA = COD_BOLE AND COD_LOTE = COD_LOT;

CREATE PROCEDURE SP_LISTAR_DETALLE_BOLETA()
SELECT * FROM DETALLE_BOLETA;

CREATE PROCEDURE SP_LISTAR_DETALLE_BOLETA_X_CODIGO_BOLETA(
COD_BOLE 		INT
)
SELECT
DETALLE_BOLETA.*,
PRODUCTO.NOMBRE_PRODUCTO,
UNIDAD_MEDIDA.ABTR_UNIDAD,
DETALLE_BOLETA.CANTIDAD_VENDIDA_BASE*DETALLE_BOLETA.PRECIO_UNIT_VENTA
FROM DETALLE_BOLETA
INNER JOIN PRODUCTO
ON PRODUCTO.COD_PROD = DETALLE_BOLETA.COD_PROD
INNER JOIN UNIDAD_MEDIDA
ON UNIDAD_MEDIDA.COD_UNIDAD = DETALLE_BOLETA.COD_UNIDAD
WHERE DETALLE_BOLETA.COD_BOLETA = COD_BOLE;

CREATE PROCEDURE SP_BUSCAR_DETALLE_BOLETA(
COD_BOLE 			INT,
COD_LOT 			INT
)
SELECT * FROM DETALLE_BOLETA
WHERE COD_BOLETA = COD_BOLE AND COD_LOTE = COD_LOT;

/*PROCEDIMIENTOS ALMACENADOS PARA FACTURA_PROVEEDOR-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_FACTURA_PROVEEDOR(
COD_PROV			INT,
COD_EMP				INT,
FECHA_EM			DATE,
MET_PAGO			VARCHAR(15)
)
INSERT INTO FACTURA_PROVEEDOR VALUES(NULL, COD_PROV, COD_EMP, FECHA_EM, MET_PAGO);

CREATE PROCEDURE SP_MODIFICAR_FACTURA_PROVEEDOR(
COD_FAC				INT,
COD_PROV			INT,
COD_EMP				INT,
FECHA_EM			DATE,
MET_PAGO			VARCHAR(15)
)
UPDATE FACTURA_PROVEEDOR
SET COD_PROVEEDOR = COD_PROV,
	COD_EMPLEADO = COD_EMP,
    FECHA_EMISION = FECHA_EM,
    MET_PAGO = METODO_PAGO
WHERE COD_FACTURA = COD_FAC;

CREATE PROCEDURE SP_ELIMINAR_FACTURA_PROVEEDOR(
COD_FAC				INT
)
DELETE FROM FACTURA_PROVEEDOR
WHERE COD_FACTURA = COD_FAC;

CREATE PROCEDURE SP_LISTAR_FACTURA_PROVEEDOR()
SELECT * FROM FACTURA_PROVEEDOR;

CREATE PROCEDURE SP_BUSCAR_FACTURA_PROVEEDOR(
COD_FAC				INT
)
SELECT * FROM FACTURA_PROVEEDOR
WHERE COD_FACTURA = COD_FAC;

/*PROCEDIMIENTOS ALMACENADOS PARA DETALLE_FACTURA-------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_REGISTRAR_DETALLE_FACTURA(
COD_LOT 			INT,
COD_FAC 			INT,
COD_PRO	 			INT,
COD_UNI				INT,
CANT_RECIBIDA_BASE 	INT,
CANT_RECIBIDA_PRES 	INT,
PRE_UNIT_COMPRA		DECIMAL(10,2)
)
INSERT INTO DETALLE_FACTURA VALUES(COD_LOT, COD_FAC, COD_PRO, COD_UNI, CANT_RECIBIDA_BASE, CANT_RECIBIDA_PRES, PRE_UNIT_COMPRA);

CREATE PROCEDURE SP_MODIFICAR_DETALLE_FACTURA(
COD_LOT 			INT,
COD_FAC 			INT,
COD_PRO	 			INT,
COD_UNI				INT,
CANT_RECIBIDA_BASE 	INT,
CANT_RECIBIDA_PRES 	INT,
PRE_UNIT_COMPRA		DECIMAL(10,2)
)
UPDATE DETALLE_FACTURA
SET COD_PROD = COD_PRO,
    COD_UNIDAD = COD_UNI,
    CANTIDAD_RECIBIDA_BASE = CANT_RECIBIDA_BASE,
    CANTIDAD_RECIBIDA_PRES = CANT_RECIBIDA_PRES,
    PRECIO_UNIT_COMPRA = PRE_UNIT_COMPRA
WHERE COD_LOTE = COD_LOT AND COD_FACTURA = COD_FACTURA;

CREATE PROCEDURE SP_ELIMINAR_DETALLE_FACTURA(
COD_LOT 			INT,
COD_FAC 			INT
)
DELETE FROM DETALLE_FACTURA
WHERE COD_LOTE = COD_LOT AND COD_FACTURA = COD_FACTURA;

CREATE PROCEDURE SP_LISTAR_DETALLE_FACTURA()
SELECT * FROM DETALLE_FACTURA;

CREATE PROCEDURE SP_BUSCAR_DETALLE_FACTURA(
COD_LOT 			INT,
COD_FAC 			INT
)
SELECT * FROM DETALLE_FACTURA
WHERE COD_LOTE = COD_LOT AND COD_FACTURA = COD_FACTURA;

/*PROCEDIMIENTO ALMACENADO PARA REPORTES*/
CREATE PROCEDURE SP_REPORTE_GENERAL_PRODUCTOS()
SELECT 
    PRODUCTO.COD_PROD,
    PRODUCTO.NOMBRE_PRODUCTO,
    CATEGORIA.NOMBRE_CATEGORIA,
    PRODUCTO.PRECIO_UNIT_VENTA,
    PRODUCTO.STOCK_MIN,
    PRODUCTO.STOCK_MAX,
    STOCK_TOTAL.TOTAL,
    PRODUCTO.PRESENTACION,
    COUNT(VENTAS.COD_BOLETA) AS 'TOTAL VENTAS'
FROM 
    PRODUCTO
INNER JOIN 
    CATEGORIA ON PRODUCTO.NUM_CATEGORIA = CATEGORIA.NUM_CATEGORIA
INNER JOIN (
	SELECT
		PRODUCTO.COD_PROD,
		SUM(LOTE.STOCK) AS TOTAL
	FROM PRODUCTO
    INNER JOIN LOTE
    ON LOTE.COD_PROD = PRODUCTO.COD_PROD
    GROUP BY
		PRODUCTO.COD_PROD
) AS STOCK_TOTAL ON STOCK_TOTAL.COD_PROD = PRODUCTO.COD_PROD
INNER JOIN (
    SELECT 
        DETALLE_BOLETA.COD_PROD,
        BOLETA.COD_BOLETA
    FROM 
        DETALLE_BOLETA
    INNER JOIN 
        BOLETA ON BOLETA.COD_BOLETA = DETALLE_BOLETA.COD_BOLETA
    GROUP BY 
        DETALLE_BOLETA.COD_PROD,
        BOLETA.COD_BOLETA
) AS VENTAS ON PRODUCTO.COD_PROD = VENTAS.COD_PROD
GROUP BY
	PRODUCTO.COD_PROD,
	PRODUCTO.NOMBRE_PRODUCTO,
    CATEGORIA.NOMBRE_CATEGORIA,
    PRODUCTO.PRECIO_UNIT_VENTA,
    PRODUCTO.STOCK_MIN,
    PRODUCTO.STOCK_MAX,
    STOCK_TOTAL.TOTAL,
    PRODUCTO.PRESENTACION;

CREATE PROCEDURE SP_REPORTE_GENERAL_VENDEDORES()
SELECT 
    EMPLEADO.COD_EMPLEADO,
    EMPLEADO.DNI_EMPLEADO,
    EMPLEADO.NOMBRE_EMPLEADO,
    EMPLEADO.APELLIDO_EMPLEADO,
    EMPLEADO.TELF_EMPLEADO,
    COUNT(BOLETA.COD_BOLETA) AS 'NUMERO DE VENTAS'
FROM 
    EMPLEADO
LEFT JOIN 
    BOLETA ON EMPLEADO.COD_EMPLEADO = BOLETA.COD_EMPLEADO
GROUP BY
    EMPLEADO.COD_EMPLEADO,
    EMPLEADO.DNI_EMPLEADO,
    EMPLEADO.NOMBRE_EMPLEADO,
    EMPLEADO.APELLIDO_EMPLEADO,
    EMPLEADO.TELF_EMPLEADO;

CREATE PROCEDURE SP_REPORTE_X_VENDEDOR(
COD_EMP			INT
)
SELECT 
	BOLETA.COD_BOLETA,
	CLIENTE.NOMBRE_CLIENTE,
    CLIENTE.APELLIDO_CLIENTE,
    BOLETA.METODO_PAGO,
    BOLETA.FECHA_EMISION,
    SUM(DETALLE_BOLETA.PRECIO_UNIT_VENTA*DETALLE_BOLETA.CANTIDAD_VENDIDA_BASE) AS 'TOTAL'
FROM BOLETA
INNER JOIN CLIENTE
ON CLIENTE.COD_CLIENTE = BOLETA.COD_CLIENTE
INNER JOIN DETALLE_BOLETA
ON DETALLE_BOLETA.COD_BOLETA = BOLETA.COD_BOLETA
WHERE 
    BOLETA.COD_EMPLEADO = COD_EMP
GROUP BY
	BOLETA.COD_BOLETA,
    BOLETA.METODO_PAGO,
    BOLETA.FECHA_EMISION,
   	CLIENTE.NOMBRE_CLIENTE,
    CLIENTE.APELLIDO_CLIENTE;
    
CREATE PROCEDURE SP_REPORTE_X_PRODUCTO(
    IN COD_PRO INT
)
SELECT 
    BOLETA.COD_BOLETA,
	CLIENTE.NOMBRE_CLIENTE,
    CLIENTE.APELLIDO_CLIENTE,
	EMPLEADO.NOMBRE_EMPLEADO,
    EMPLEADO.APELLIDO_EMPLEADO,
    BOLETA.METODO_PAGO,
    BOLETA.FECHA_EMISION,
    VENTA.TOTAL_VENTA
FROM 
    BOLETA
INNER JOIN 
    CLIENTE ON CLIENTE.COD_CLIENTE = BOLETA.COD_CLIENTE
INNER JOIN 
    EMPLEADO ON EMPLEADO.COD_EMPLEADO = BOLETA.COD_EMPLEADO
INNER JOIN DETALLE_BOLETA
ON DETALLE_BOLETA.COD_BOLETA = BOLETA.COD_BOLETA
INNER JOIN (
    SELECT 
        DETALLE_BOLETA.COD_BOLETA,
        SUM(DETALLE_BOLETA.PRECIO_UNIT_VENTA * DETALLE_BOLETA.CANTIDAD_VENDIDA_BASE) AS 'TOTAL_VENTA'
    FROM 
        DETALLE_BOLETA
    GROUP BY 
        DETALLE_BOLETA.COD_BOLETA
) AS VENTA ON VENTA.COD_BOLETA = BOLETA.COD_BOLETA
WHERE 
	DETALLE_BOLETA.COD_PROD = COD_PRO
GROUP BY
    BOLETA.COD_BOLETA,
    BOLETA.METODO_PAGO,
    BOLETA.FECHA_EMISION,
    CLIENTE.NOMBRE_CLIENTE,
    CLIENTE.APELLIDO_CLIENTE,
    EMPLEADO.NOMBRE_EMPLEADO,
    EMPLEADO.APELLIDO_EMPLEADO;
    
CREATE PROCEDURE SP_ESTADISTICAS_PRECIO()
SELECT
    (SELECT GROUP_CONCAT(NOMBRE_PRODUCTO SEPARATOR ' / ') FROM PRODUCTO WHERE PRECIO_UNIT_VENTA = (SELECT MAX(PRECIO_UNIT_VENTA) FROM PRODUCTO)) AS PRODUCTO_PRECIO_MAYOR,
	(SELECT GROUP_CONCAT(NOMBRE_PRODUCTO SEPARATOR ' / ') FROM PRODUCTO WHERE PRECIO_UNIT_VENTA = (SELECT MIN(PRECIO_UNIT_VENTA) FROM PRODUCTO)) AS PRODUCTO_PRECIO_MENOR,
    MAX(PRECIO_UNIT_VENTA) AS PRECIO_VENTA_MAYOR,
    MIN(PRECIO_UNIT_VENTA) AS PRECIO_VENTA_MENOR,
    AVG(PRECIO_UNIT_VENTA) AS PRECIO_VENTA_PROMEDIO
FROM PRODUCTO;

/*CREANDO TRIGGER PARA RESTAR LAS CANTIDADES VENDIDAS A LOS LOTES*/
DELIMITER //
CREATE TRIGGER TR_RESTAR_STOCK_AL_REALIZAR_VENTA
AFTER INSERT ON DETALLE_BOLETA
FOR EACH ROW
BEGIN
    UPDATE LOTE
    SET LOTE.STOCK = LOTE.STOCK - NEW.CANTIDAD_VENDIDA_BASE
    WHERE LOTE.NRO_LOTE = NEW.COD_LOTE;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER TR_UNIDAD_MEDIDAD_DEFECTO
AFTER INSERT ON PRODUCTO
FOR EACH ROW
BEGIN
	INSERT INTO UM_PRODUCTO VALUES(1, NEW.COD_PROD, 1);
END
// DELIMITER ;

/*INSERTANDO DATOS PARA CLIENTE -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_CLIENTE("00000000", "PUBLICO", "GENERAL");
call SP_REGISTRAR_CLIENTE("95136248", "ADRIEL", "PINTADO");

/*INSERTANDO DATOS PARA EMPLEADO -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_EMPLEADO("00000000", "SUPERADMIN", "SUPERADMIN", "000000000", "superadmin@gmail.com", "adminadminadmin", "SuperAdmin", "admin123", "123");
call SP_REGISTRAR_EMPLEADO("63215984", "JHONATAN", "HUAMAN", "963258471", "JHONATAN@gmail.com", "Mateo Silva MzB ltD, San Luis", "EMPLEADO", "jhonatan123", "123");

/*INSERTANDO DATOS PARA PROVEEDOR -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_PROVEEDOR("12345678942", "JUAN PEREZ", "745896321", "Mz D lt 11 B Libertad", "JUANPEREZ@gmail.com", "https://juanperez.com");

/*INSERTANDO DATOS PARA CATEGORIA -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_CATEGORIA("ANTIINFLAMATORIO");
call SP_REGISTRAR_CATEGORIA("ANTIBIOTICO");
call SP_REGISTRAR_CATEGORIA("ANTIGRIPAL");

/*INSERTANDO DATOS PARA UNIDAD DE MEDIDA -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_UM("UND", "UNIDAD");
call SP_REGISTRAR_UM("BLR", "BLISTER");
call SP_REGISTRAR_UM("CAJ", "CAJA");

/*INSERTANDO DATOS PARA PRODUCTO -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_PRODUCTO(1, "ASPIRINA", 4.00, 6.40, 10, 400, "CAJA", 0);
call SP_REGISTRAR_PRODUCTO(2, "AMOVAL", 6.00, 10.40, 10, 400, "CAJA", 0);
call SP_REGISTRAR_PRODUCTO(3, "GRIPACHECK", 6.00, 10.40, 10, 400, "CAJA", 0);

/*INSERTANDO DATOS PARA UM_MEDIDA -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_UM_PRODUCTO(2,1, 10);
call SP_REGISTRAR_UM_PRODUCTO(3,1, 100);
call SP_REGISTRAR_UM_PRODUCTO(2,2, 10);
call SP_REGISTRAR_UM_PRODUCTO(3,2, 120);
call SP_REGISTRAR_UM_PRODUCTO(2,3, 4);

/*INSERTANDO DATOS PARA LOTE -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_LOTE(1,300,"2024-07-12", "2024-01-12", "ADECUADA");
call SP_REGISTRAR_LOTE(2,300,"2024-08-12", "2024-02-12", "ADECUADA");
call SP_REGISTRAR_LOTE(3,30,"2024-05-12", "2023-08-12", "ADECUADA");
call SP_REGISTRAR_LOTE(3,300,"2024-08-12", "2024-02-12", "ADECUADA");

/*INSERTANDO DATOS PARA BOLETA -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_BOLETA(1,2,"EFECTIVO", "2021-04-26");
call SP_REGISTRAR_BOLETA(1,2,"EFECTIVO", "2021-04-30");

/*INSERTANDO DATOS PARA DETALLE BOLETA -------------------------------------------------------------------------------------*/
call SP_REGISTRAR_DETALLE_BOLETA(1,1,1,2,100,10, 6.40);
call SP_REGISTRAR_DETALLE_BOLETA(1,1,1,1,5,5, 6.40);
call SP_REGISTRAR_DETALLE_BOLETA(1,2,2,2,100,10, 10.40);
call SP_REGISTRAR_DETALLE_BOLETA(1,3,3,2,10,10, 10.40);
call SP_REGISTRAR_DETALLE_BOLETA(2,3,3,2,10,10, 10.40);

select * from detalle_boleta;