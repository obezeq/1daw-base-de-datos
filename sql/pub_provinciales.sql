
-- CREACIÓN BASE DE DATOS
DROP DATABASE IF EXISTS pub_provinciales;
CREATE DATABASE pub_provinciales
    WITH
    OWNER = usuariot
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- EMPLEADO, LOCALIDAD
DROP TABLE IF EXISTS EMPLEADO;
CREATE TABLE EMPLEADO (
    dni_empleado CHAR(9) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100)
);

-- Creamos la tabla de lcallidad
DROP TABLE IF EXISTS LOCALIDAD;
CREATE TABLE LOCALIDAD (
    cod_localidad INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
);

-- Creamos la tabla del pub
DROP TABLE IF EXISTS PUB;
CREATE TABLE PUB (
    cod_pub SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    licencia_fisica VARCHAR(50) UNIQUE NOT NULL,
    domicilio VARCHAR(100) UNIQUE,
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(50) NOT NULL,
    CONSTRAINT cod_localidad FOREIGN KEY (cod_pub) REFERENCES LOCALIDAD(cod_localidad) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Creamos la tabla de existencias
DROP TABLE IF EXISTS EXISTENCIAS;
CREATE TABLE EXISTENCIAS (
    cod_articulo SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL NOT NULL,
    CONSTRAINT cod_pub FOREIGN KEY (cod_articulo) REFERENCES PUB(cod_pub) ON DELETE CASCADE
);

DROP TABLE IF EXISTS TITULAR;
CREATE TABLE TITULAR (
    dni_titular CHAR(9) PRIMARY KEY,
    nombre VARCHAR(50),
    domicilio VARCHAR(100)
    CONSTRAINT cod_pub FOREIGN KEY (dni_titular) REFERENCES PUB(cod_pub) ON DELETE CASCADE
);

-- Creamos la tabla del empleado del pub
DROP TABLE IF EXISTS PUB_EMPLEADO;
CREATE TABLE PUB_EMPLEADO (
    funcion VARCHAR(10) NOT NULL CHECK (funcion == "CAMARERO" OR funcion == "SEGURIDAD" OR funcion == "LIMPIEZA"),


    CONSTRAINT pub_empleado PRIMARY KEY ()
);