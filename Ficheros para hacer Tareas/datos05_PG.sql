-- ************ TABLAS
-- ************ datos05.sql
-- HAY QUE ASEGURARSE QUE ESTÁ BIEN EL DATESTYLE (el formato de la fecha)
--ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY'; (esto en oracle)
--SET LINESIZE 150
--SET PAGESIZE 50

-- ************ TABLA ALUM, NUEVOS, ANTIGUOS ************

DROP TABLE IF EXISTS ALUM CASCADE;
DROP TABLE IF EXISTS NUEVOS CASCADE;
DROP TABLE IF EXISTS ANTIGUOS CASCADE;

Create TABLE ALUM
(
  NOMBRE VARCHAR(20),
 EDAD NUMERIC(2),
 LOCALIDAD VARCHAR(15)
);

Create TABLE  NUEVOS
(
  NOMBRE  VARCHAR(20),
 EDAD NUMERIC(2),
 LOCALIDAD VARCHAR(15)
);

Create TABLE ANTIGUOS
(
  NOMBRE  VARCHAR(20),
 EDAD NUMERIC(2),
 LOCALIDAD VARCHAR(15)
);

INSERT INTO ALUM VALUES('JUAN',18,'COSLADA');
INSERT INTO ALUM VALUES('PEDRO',19,'COSLADA');
INSERT INTO ALUM VALUES('ANA',17,'ALCALA');
INSERT INTO ALUM VALUES('LUISA',18,'TORREJON');
INSERT INTO ALUM VALUES('MARIA',20,'MADRID');
INSERT INTO ALUM VALUES('ERNESTO',21,'MADRID');
INSERT INTO ALUM VALUES('RAQUEL',19,'TOLEDO');

INSERT INTO NUEVOS VALUES('JUAN',18,'COSLADA');
INSERT INTO NUEVOS VALUES('MAITE',15,'ALCALA');
INSERT INTO NUEVOS VALUES('SOFIA',14,'ALCALA');
INSERT INTO NUEVOS VALUES('ANA',17,'ALCALA');
INSERT INTO NUEVOS VALUES('ERNESTO',21,'MADRID');

INSERT INTO ANTIGUOS VALUES('MARIA',20,'MADRID');
INSERT INTO ANTIGUOS VALUES('ERNESTO',21,'MADRID');
INSERT INTO ANTIGUOS VALUES('ANDRES',26,'LAS ROZAS');
INSERT INTO ANTIGUOS VALUES('IRENE',24,'LAS ROZAS');

COMMIT;

-- ************ TABLA PERSONAL, PROFESORES, CENTROS ***********

DROP TABLE IF EXISTS PERSONAL CASCADE; 

CREATE TABLE PERSONAL (
 COD_CENTRO   NUMERIC(4) NOT NULL,
 DNI NUMERIC(10),
 APELLIDOS VARCHAR(30),
 FUNCION VARCHAR(15),
 SALARIO NUMERIC (10) 
);

INSERT INTO PERSONAL VALUES (10,1112345,'Martinez Salas, Fernando','PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (10,4123005,'Bueno Zarco, Elisa', 'PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (10,4122025,'Montes Garcia, M.Pilar', 'PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (15,1112345,'Rivera Silvestre, Ana','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (15,9800990, 'Ramos Ruiz, Luis','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (15,8660990, 'De Lucas Fdez, M.Angel','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (22,7650000, 'Ruiz Lafuente, Manuel','PROFESOR', 220000);
INSERT INTO PERSONAL VALUES (45,43526789, 'Serrano Laguia, Maria','PROFESOR', 205000);
INSERT INTO PERSONAL VALUES (10,4480099,'Ruano Cerezo, Manuel','ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (15,1002345,'Albarran Serrano, Alicia','ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (15,7002660,'Muñoz Rey, Felicia','ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (22,5502678,'Marin Marin, Pedro','ADMINISTRATIVO', 180000);
INSERT INTO PERSONAL VALUES (22,6600980, 'Peinado Gil, Elena','CONSERJE', 175000);
INSERT INTO PERSONAL VALUES (45,4163222, 'Sarro Molina, Carmen','CONSERJE', 175000);

DROP TABLE IF EXISTS PROFESORES CASCADE; 
CREATE TABLE PROFESORES (
 COD_CENTRO   NUMERIC(4) NOT NULL,
 DNI          NUMERIC(10),
 APELLIDOS VARCHAR(30),
 ESPECIALIDAD VARCHAR(16) 
);


INSERT INTO PROFESORES VALUES (10,1112345,'Martinez Salas, Fernando','INFORMATICA');
INSERT INTO PROFESORES VALUES (10,4123005,'Bueno Zarco, Elisa', 'MATEMATICAS');
INSERT INTO PROFESORES VALUES (10,4122025,'Montes Garcia, M.Pilar', 'MATEMATICAS');
INSERT INTO PROFESORES VALUES (15,9800990, 'Ramos Ruiz, Luis',	'LENGUA');
INSERT INTO PROFESORES VALUES (15,1112345,'Rivera Silvestre, Ana',	'DIBUJO');
INSERT INTO PROFESORES VALUES (15,8660990, 'De Lucas Fdez, M.Angel','LENGUA');
INSERT INTO PROFESORES VALUES (22,7650000, 'Ruiz Lafuente, Manuel','MATEMATICAS');
INSERT INTO PROFESORES VALUES (45,43526789, 'Serrano Laguia, Maria','INFORMATICA');

DROP TABLE IF EXISTS CENTROS CASCADE; 
CREATE TABLE CENTROS (
 COD_CENTRO   NUMERIC(4) NOT NULL,
 TIPO_CENTRO  CHAR(1),
 NOMBRE VARCHAR(30),
 DIRECCION VARCHAR(26),
 TELEFONO VARCHAR(10),
 NUM_PLAZAS NUMERIC(4)
 );


INSERT INTO CENTROS VALUES (10,'S','IES El Quijote', 'Avda. Los Molinos 25', '965-887654',538);
INSERT INTO CENTROS VALUES (15,'P','CP Los Danzantes', 'C/Las Musas s/n','985-112322',250);
INSERT INTO CENTROS VALUES (22,'S', 'IES Planeta Tierra', 'C/Mina 45','925-443400',300);
INSERT INTO CENTROS VALUES (45,'P', 'CP Manuel Hidalgo', 'C/Granada 5','926-202310',220);
INSERT INTO CENTROS VALUES (50,'S', 'IES Antoñete', 'C/Los Toreros 21','989-406090',310);

-- *************** TABLA EMPLE30: **************
DROP TABLE IF EXISTS EMPLE30 CASCADE; 

CREATE TABLE EMPLE30 (
 EMP_NO    NUMERIC(4) NOT NULL,
 APELLIDO  VARCHAR(10)  ,
 OFICIO    VARCHAR(10)  ,
 DIR       NUMERIC(4) ,
 FECHA_ALT DATE      ,
 SALARIO   NUMERIC(10),
 COMISION  NUMERIC(10),
 DEPT_NO   NUMERIC(2) NOT NULL) ;

-- *************** TABLA COCHES: *************

DROP TABLE IF EXISTS COCHES CASCADE; 
CREATE TABLE COCHES (NOMBRE VARCHAR(15)) ;
INSERT INTO COCHES VALUES('SEAT');

COMMIT;


SELECT * FROM ALUM;
SELECT * FROM NUEVOS;
SELECT * FROM ANTIGUOS;
SELECT * FROM PERSONAL; 
SELECT * FROM PROFESORES; 
SELECT * FROM CENTROS;
SELECT * FROM EMPLE30;
SELECT * FROM COCHES;