-- ************ TABLAS
-- ************ datos02.sql
-- HAY QUE ASEGURARSE QUE ESTÁ BIEN EL DATESTYLE (el formato de la fecha)

-- EN ORACLE ERA:
--ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
--SET LINESIZE 150
--SET PAGESIZE 50

-- ********** TABLA NOMBRES: ***********
DROP TABLE IF EXISTS NOMBRES CASCADE; 
CREATE TABLE NOMBRES
(
  NOMBRE VARCHAR(15),
  EDAD NUMERIC(2)
);

INSERT INTO NOMBRES VALUES('PEDRO', 17);
INSERT INTO NOMBRES VALUES('JUAN', 17);
INSERT INTO NOMBRES VALUES('MARIA', 16);
INSERT INTO NOMBRES VALUES('CLARA', 14);
INSERT INTO NOMBRES VALUES(NULL, 15);
INSERT INTO NOMBRES VALUES(NULL, 18);
INSERT INTO NOMBRES VALUES('JESUS', NULL);
--COMMIT;

-- ********** TABLA MISTEXTOS: *************
DROP TABLE IF EXISTS MISTEXTOS CASCADE; 
CREATE TABLE MISTEXTOS (
 TITULO  VARCHAR(35),
 AUTOR   VARCHAR(22),
 EDITORIAL VARCHAR(15), 
 PAGINA  NUMERIC(3)
 );

INSERT INTO MISTEXTOS VALUES ('METODOLOGIA DE LA PROGRAMACION', 'ALCALDE, GARCIA', 'MCGRAWHILL',140);
INSERT INTO MISTEXTOS VALUES ('"INFORMATICA BASICA"', 'GARCIA GARCERAN', 'PARANINFO',130);
INSERT INTO MISTEXTOS VALUES ('SISTEMAS OPERATIVOS', 'J.F. GARCIA', 'OBSBORNE',300);
INSERT INTO MISTEXTOS VALUES ('SISTEMAS DIGITALES', 'M.A. RUIZ', 'PRENTICE HALL',190);
INSERT INTO MISTEXTOS VALUES ('"MANUAL DE C."', 'M.A. RUIZ', 'MCGRAWHILL',340);
--COMMIT;

-- ********** TABLA LIBROS: *************
DROP TABLE IF EXISTS LIBROS CASCADE; 
CREATE TABLE LIBROS (
 TITULO  VARCHAR(32),
 AUTOR   VARCHAR(22),
 EDITORIAL VARCHAR(15), 
 PAGINA  NUMERIC(3)
 );

INSERT INTO LIBROS VALUES ('LA COLMENA', 'CELA, CAMILO JOSE', 'PLANETA',240);
INSERT INTO LIBROS VALUES ('LA HISTORIA DE MI HIJO', 'GORDIMER, NADINE', 'TIEM.MODERNOS',327);
INSERT INTO LIBROS VALUES ('LA MIRADA DEL OTRO', 'G.DELGADO, FERNANDO', 'PLANETA',298);
INSERT INTO LIBROS VALUES ('ULTIMAS TARDES CON TERESA','MARSE, JUAN', 'CIRCULO',350);
INSERT INTO LIBROS VALUES ('LA NOVELA DE P. ANSUREZ', 'TORRENTE B., GONZALO', 'PLANETA',162);
--COMMIT;

-- ********** TABLA NACIMIENTOS:******************
DROP TABLE IF EXISTS NACIMIENTOS CASCADE; 
CREATE TABLE NACIMIENTOS (
 NOMBRE CHAR(15),
 APELLIDO CHAR(15),
 FECHANAC DATE,
 EDAD NUMERIC
 );

INSERT INTO NACIMIENTOS VALUES ('PEDRO', 'SANCHEZ','12/05/1982', 17);
INSERT INTO NACIMIENTOS VALUES ('JUAN', 'JIMENEZ','23/08/1982', 17);
INSERT INTO NACIMIENTOS VALUES ('MARIA', 'LOPEZ','02/02/1983', 16);
INSERT INTO NACIMIENTOS VALUES ('CLARA', 'LASECA','20/05/1985', 14);
--COMMIT;
--PURGE recyclebin;
SELECT * FROM NOMBRES;
SELECT * FROM MISTEXTOS;
SELECT * FROM LIBROS;
SELECT * FROM NACIMIENTOS;

-- ********** FIN *************************