/*
-- CREACIÓN BASE DE DATOS
DROP DATABASE IF EXISTS pub_provinciales;
CREATE DATABASE pub_provinciales
    WITH
    OWNER = usuariot
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
*/

-- Creamos la tabla de localidad
DROP TABLE IF EXISTS LOCALIDAD CASCADE;
CREATE TABLE LOCALIDAD (
    cod_localidad INT,
    nombre VARCHAR(50) NOT NULL
);

-- Creamos la tabla del pub
DROP TABLE IF EXISTS PUB CASCADE;
CREATE TABLE PUB (
    cod_pub SERIAL,
    nombre VARCHAR(50) NOT NULL,
    licencia_fisica VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100) UNIQUE,
    fecha_apertura DATE NOT NULL,
    horario CHAR(4) NOT NULL,
    cod_localidad INT NOT NULL
);

-- EMPLEADO, LOCALIDAD
DROP TABLE IF EXISTS EMPLEADO CASCADE;
CREATE TABLE EMPLEADO (
    dni_empleado CHAR(9),
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50)
);

-- Agregar restricciones a la tabla PUB
ALTER TABLE PUB
    ADD CONSTRAINT CHK_HORARIO CHECK (horario IN ('HOR1', 'HOR2', 'HOR3')),
    ADD CONSTRAINT fk_pub_localidad FOREIGN KEY (cod_localidad) REFERENCES LOCALIDAD(cod_localidad) ON DELETE CASCADE ON UPDATE CASCADE;

-- Creamos la tabla de existencias
DROP TABLE IF EXISTS EXISTENCIAS CASCADE;
CREATE TABLE EXISTENCIAS (
    cod_articulo INTEGER,
    nombre VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    cod_pub INT NOT NULL
);

-- Agregar restricciones a la tabla EXISTENCIAS
ALTER TABLE EXISTENCIAS
    ADD CONSTRAINT fk_existencias_pub FOREIGN KEY (cod_pub) REFERENCES PUB(cod_pub) ON DELETE RESTRICT;

DROP TABLE IF EXISTS TITULAR CASCADE;
CREATE TABLE TITULAR (
    dni_titular CHAR(9),
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50),
    cod_pub INT
);

-- Agregar restricciones a la tabla TITULAR
ALTER TABLE TITULAR
    ADD CONSTRAINT fk_titular_pub FOREIGN KEY (cod_pub) REFERENCES PUB(cod_pub) ON DELETE CASCADE;

-- Creamos la tabla del empleado del pub
DROP TABLE IF EXISTS PUB_EMPLEADO CASCADE;
CREATE TABLE PUB_EMPLEADO (
    cod_pub INTEGER NOT NULL,
    dni_empleado VARCHAR(10) NOT NULL,
    funcion VARCHAR(16),
);


ALTER TABLE LOCALIDAD
ALTER COLUMN NOMBRE SET NOT NULL,
ADD CONSTRAINT PK_LOOCALIDAD PRIMARY KEY(COD_LOCALIDAD)
;

ALTER TABLE
ALTER COLUMN NOMBRE SET NOT NULL,
ALTER COLUMN LICENCIA_FISICA SET NOOT NULL,
ALTER COLUMN FECHA_APERTURA SET NOT NULL
ADD CONSTRAINT CHK_HORARIO CHECK (HORARIO IN ('HOR1', 'HOR2', 'HOR3')),
ADD CONSTRAINT PK_COD_PUB PRIMARY KEY (COD_PUB),
ADD CONSTRAINT FK_LOCALIDAD FOREIGN KEY(COD_LOCALIDAD) REFERENCES LOCALIDAD(COD_LOCALIDAD) ON DELETE CASCADE
;

ALTER TABLE TITULAR
ALTER COLUMN NOMBRE SET NOT NULL,
ADD CONSTRAINT PK_DNI_TITULAR PRIMARY KEY (DNI_TITULAR),
ADD CONSTRAINT FK_COD_PUB FOREIGN KEY (COD_PUB) REFERENCES PUB(COD_PUB) ON DELETE SET NULL ON UPDATE CASCADE,
;

ALTER TABLE EMPLEADO
ALTER COLUMN NOMBRE SET NOT NULL,
ADD CONSTRAINT PK_EMPLEADO PRIMARY KEY(DNI_EMPLEADO)
;

ALTER TABLE EXISTENCIAS
ALTER COLUMN NOMBRE SET NOT NULL
ADD COLUMN CANATIDAD SET NOT NULL,
ADD COLUMN PRECIO SET NOT NULL,
ALTER COLUMN COD_PUB SET NOT NULL,
ADD CONSTRAINT PK_EXISTENCIAS PRIMARY KEY(COD_ARTICULO),
ADD CONSTRAINT CK_EXISTENCIAS CHECK (PRECIO>0),
ADD CONSTRAINT FK_COD_PUB FOREIGN KEY (COD_PUB) REFERENCES PUB(COD_PUB) ON DELETE RESTRICT
;

ALTER TABLE PUB_EMPLEADO
ALTER COLUMN COD_PUB SET NOT NULL,
ALTER COLUMN DNI_EMPLEADO SET NOT NULL,
ADD CONSTRAINT CHK_FUNCION CHECK (FUNCION IN ('CAMARERO', 'SEGURIDAD', 'LIMPIEZA')),
ADD CONSTRAINT FK_COD_PUB FOREIGN KEY (COD_PUB) REFERENCES PUB(COD_PUB) ON DELETE NO ACTION,
ADD CONSTRAINT FK_DNI_EMPLEADO FOREIGN KEY (DNI_EMPLEADO) REFERENCES EMPLEADO(DNI_EMPLEADO) ON DELETE NO ACTION, 
ADD CONSTRAINT PK_PUB_EMPLEADO PRIMARY KEY ()
;