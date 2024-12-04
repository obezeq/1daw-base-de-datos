
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

-- Creamos la tabla de lcallidad
DROP TABLE IF EXISTS LOCALIDAD CASCADE;
CREATE TABLE LOCALIDAD (
    cod_localidad INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- EMPLEADO, LOCALIDAD
DROP TABLE IF EXISTS EMPLEADO CASCADE;
CREATE TABLE EMPLEADO (
    dni_empleado CHAR(9) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100)
);

-- Creamos la tabla del pub
DROP TABLE IF EXISTS PUB CASCADE;
CREATE TABLE PUB (
    cod_pub SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    licencia_fisica VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100) UNIQUE,
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(50) NOT NULL CONSTRAINT CHK_HORARIO CHECK (HORARIO IN('HOR1','HOR2','HOR3')),
    cod_localidad INT NOT NULL CONSTRAINT fk_pub_localidad REFERENCES LOCALIDAD(cod_localidad) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creamos la tabla de existencias
DROP TABLE IF EXISTS EXISTENCIAS CASCADE;
CREATE TABLE EXISTENCIAS (
    cod_articulo SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    cod_pub INT NOT NULL REFERENCES PUB(cod_pub) ON DELETE RESTRICT
);

DROP TABLE IF EXISTS TITULAR CASCADE;
CREATE TABLE TITULAR (
    dni_titular CHAR(9) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    cod_pub INT,
    CONSTRAINT fk_titular_pub FOREIGN KEY (cod_pub) REFERENCES PUB(cod_pub) ON DELETE CASCADE
);

-- Creamos la tabla del empleado del pub
DROP TABLE IF EXISTS PUB_EMPLEADO CASCADE;
CREATE TABLE PUB_EMPLEADO (
    cod_pub INTEGER NOT NULL REFERENCES PUB(cod_pub) ON DELETE NO ACTION,
    dni_empleado VARCHAR(10) NOT NULL REFERENCES EMPLEADO(dni_empleado) ON DELETE NO ACTION,
    funcion VARCHAR(16) CONSTRAINT chk_funcion CHECK (FUNCION  IN ('CAMARERO', 'SEGURIDAD', 'LIMPIEZA')),
    CONSTRAINT pk_pub_empleado PRIMARY KEY (funcion, dni_empleado, cod_pub)
);
