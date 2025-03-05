SEGUN ESTOS DATOS PARA LA CREACION DE LA BBDD DE POSTGRESQL. QUIERO QUE ME HAGAS  EL EJERCICIO COMO SI FUERA UN ESTUDIANTE QUE ESTA EMPEZANDO EN POSTGRESQL DE LA FORMA MAS SENCILLA.

EJERCICIO:
5.- Mostrar, en minúscula con la primera letra en mayúsculas, 
el nombre del miembro del jurado que haya dado más puntos en total.

-- ********** CREACIÓN DE TABLAS *************
DROP TABLE IF EXISTS VOTOS CASCADE;
DROP TABLE IF EXISTS JURADOS CASCADE;
DROP TABLE IF EXISTS GRUPOS CASCADE;
DROP TABLE IF EXISTS MIEMBROS CASCADE;
DROP TABLE IF EXISTS TIPO_GRUPO CASCADE;

CREATE TABLE MIEMBROS (
    COD_MI     INTEGER PRIMARY KEY,
    NOMBRE_MI  VARCHAR(40) NOT NULL,
    GRUPO_MI   INTEGER,
    FECNAC_MI  DATE
);

CREATE TABLE GRUPOS (
    COD_GR     INTEGER PRIMARY KEY,
    NOMBRE_GR  VARCHAR(50),
    LETRISTA_GR INTEGER,
    TIPO_GR    INTEGER
);

CREATE TABLE TIPO_GRUPO (
    COD_TP    INTEGER PRIMARY KEY,
    NOMBRE_TP VARCHAR(10)
);

CREATE TABLE JURADOS (
    COD_JU    INTEGER PRIMARY KEY,
    NOMBRE_JU VARCHAR(12)
);

CREATE TABLE VOTOS (
    GRUPO_VO  INTEGER,
    JURADO_VO INTEGER,
    PUNTOS_VO INTEGER,
    PRIMARY KEY (GRUPO_VO, JURADO_VO)
);

-- ********** INSERCIÓN DE DATOS *************
INSERT INTO MIEMBROS VALUES
(100, 'Alvarez, Antonio (Bizcocho)', 11, TO_DATE('23/07/1981', 'DD/MM/YYYY')),
(110, 'Gutierrez Ellibi, Emilio', 11, TO_DATE('15/11/1958', 'DD/MM/YYYY')),
(120, 'Cornejo Cornejo, Manuel', 11, TO_DATE('05/08/1965', 'DD/MM/YYYY')),
(130, 'Garcia Cossio, Selu', 12, TO_DATE('10/12/1966', 'DD/MM/YYYY')),
(140, 'Rey, Eder (Santonia)', 12, TO_DATE('12/04/1977', 'DD/MM/YYYY')),
(150, 'ElLobe , Jose', 12, TO_DATE('11/01/1967', 'DD/MM/YYYY')),
(160, 'Villegas Elgueli, Juan Miguel', 13, TO_DATE('06/12/1971', 'DD/MM/YYYY')),
(170, 'Santander, Manuel', 13, TO_DATE('31/10/1975', 'DD/MM/YYYY')),
(180, 'Perez Lobato, Eduardo Jesus', 13, TO_DATE('09/05/1982', 'DD/MM/YYYY')),
(190, 'Ramirez Richarte, Jesus', 20, TO_DATE('26/08/1977', 'DD/MM/YYYY')),
(200, 'Martines Ares, Antonio', 14, TO_DATE('12/02/1979', 'DD/MM/YYYY')),
(210, 'Sanchez Soriano, Jose Antonio', 14, TO_DATE('22/04/1973', 'DD/MM/YYYY')),
(220, 'Silva Mulero, Jeronimo', 21, TO_DATE('10/02/1987', 'DD/MM/YYYY')),
(230, 'Garcia ElChapa, Miguel Angel', 15, TO_DATE('03/07/1987', 'DD/MM/YYYY')),
(240, 'Jimenez Bautista, Angela', 15, TO_DATE('05/11/1986', 'DD/MM/YYYY')),
(250, 'Lopez Delgado, Abraham', 22, TO_DATE('05/08/1975', 'DD/MM/YYYY')),
(260, 'Beardo, Tamara', 16, TO_DATE('02/04/1977', 'DD/MM/YYYY')),
(270, 'Martin Martin, Miguel Angel', 21, TO_DATE('09/12/1986', 'DD/MM/YYYY')),
(280, 'Medina Zurbano, Luis', 17, TO_DATE('01/01/1986', 'DD/MM/YYYY')),
(290, 'Aguilera, Javier', 17, TO_DATE('21/10/1985', 'DD/MM/YYYY')),
(300, 'Movilla Aubri, Miguel Angel', 17, TO_DATE('16/12/1995', 'DD/MM/YYYY')),
(310, 'Peinado, Joshua', 18, TO_DATE('16/12/2000', 'DD/MM/YYYY')),
(320, 'Peinado, Manuel', 18, TO_DATE('19/05/2003', 'DD/MM/YYYY')),
(330, 'Ronquete, Alejandro', 18, TO_DATE('16/08/2004', 'DD/MM/YYYY')),
(340, 'Quecuty Ponce, Rafael', 19, TO_DATE('22/02/1979', 'DD/MM/YYYY')),
(350, 'Gago, Angel', 19, TO_DATE('12/04/1982', 'DD/MM/YYYY')),
(360, 'Aboza Molina, Jose Antonio', 19, TO_DATE('20/02/1987', 'DD/MM/YYYY')),
(370, 'Mendoza Llanos, Paola Elsa', 20, TO_DATE('22/05/1993', 'DD/MM/YYYY')),
(380, 'Rivas, Antonio', 20, TO_DATE('02/07/1953', 'DD/MM/YYYY')),
(390, 'Andrade Sanchez, Abraham', 25, TO_DATE('02/04/1989', 'DD/MM/YYYY')),
(400, 'Baglieto Bueno, Jesus', 21, TO_DATE('22/04/1999', 'DD/MM/YYYY')),
(410, 'Pardo, Julio', 32, TO_DATE('22/05/1970', 'DD/MM/YYYY')),
(420, 'Ponce Martinez, Elena', 21, TO_DATE('02/07/1993', 'DD/MM/YYYY')),
(430, 'Braza Elsheriff, Juan Manuel', 11, TO_DATE('02/04/1959', 'DD/MM/YYYY')),
(440, 'Remolino, Kike', 22, TO_DATE('22/04/1979', 'DD/MM/YYYY')),
(450, 'Alba, Paco', 22, TO_DATE('08/05/1968', 'DD/MM/YYYY')),
(460, 'Zahara, Alvaro', 23, TO_DATE('02/04/1985', 'DD/MM/YYYY'));

INSERT INTO MIEMBROS VALUES
(470, 'Barbate, Juan Antonio', 23, TO_DATE('22/04/1983', 'DD/MM/YYYY')),
(480, 'Eco de la Bahia, Umberto', 23, TO_DATE('08/05/1982', 'DD/MM/YYYY')),
(490, 'Jimena Hirene, Pascual', 23, TO_DATE('19/05/1982', 'DD/MM/YYYY')),
(500, 'Pozo Aguada, Maite', 23, TO_DATE('16/08/1985', 'DD/MM/YYYY')),
(510, 'Eldelcesto, Ernesto', 23, TO_DATE('22/02/1989', 'DD/MM/YYYY')),
(520, 'Solari Conarte, Elena', 23, TO_DATE('11/11/1986', 'DD/MM/YYYY')),
(530, 'Miranda , Enrique', 23, TO_DATE('11/08/1977', 'DD/MM/YYYY')),
(540, 'Peralta , Miriam', 24, TO_DATE('10/10/1977', 'DD/MM/YYYY')),
(550, 'Elcaja , Pepe', 25, TO_DATE('07/03/1982', 'DD/MM/YYYY')),
(560, 'Jartible, Andrea', 26, TO_DATE('11/11/1986', 'DD/MM/YYYY')),
(570, 'Lahierbabuena , Maria', 27, TO_DATE('11/08/1990', 'DD/MM/YYYY')),
(580, 'Martinez, ElCabra', 28, TO_DATE('12/10/1974', 'DD/MM/YYYY')),
(590, 'Montes, Andres', 29, TO_DATE('05/09/1987', 'DD/MM/YYYY')),
(600, 'Elyuyu, Jose Guerrero', 29, TO_DATE('02/02/1972', 'DD/MM/YYYY')),
(610, 'Elbatitora, Antonio', 30, TO_DATE('01/07/1971', 'DD/MM/YYYY')),
(620, 'EldelMentidero, Juanelo', 30, TO_DATE('05/09/1948', 'DD/MM/YYYY')),
(630, 'Fernandez Vilches , Juanfra', 31, TO_DATE('01/02/1980', 'DD/MM/YYYY'));


INSERT INTO GRUPOS VALUES (11, 'El grinch de Cadiz'        , 430, 1);          
INSERT INTO GRUPOS VALUES (12, 'Que ni las hambre vamos a sentir', 130, 1);          
INSERT INTO GRUPOS VALUES (13, 'Los exageraos'        , 160, 1);          
INSERT INTO GRUPOS VALUES (14, 'La oveja negra', 200, 3);          
INSERT INTO GRUPOS VALUES (15, 'Los colgaos'       , 230, 3);          
INSERT INTO GRUPOS VALUES (16, 'Los ofendiditos'  , 260, 3);          
INSERT INTO GRUPOS VALUES (17, 'Los coco de Cadiz', 290, 2);          
INSERT INTO GRUPOS VALUES (18, 'En mi caseta cabe to el mundo'       , 320, 2);          
INSERT INTO GRUPOS VALUES (19, 'Punk y circo', 350, 2);          
INSERT INTO GRUPOS VALUES (20, 'El gremio'           , 380, 4);          
INSERT INTO GRUPOS VALUES (21, 'Los Luciernagas'     , 410, 4);          
INSERT INTO GRUPOS VALUES (22, 'Los iluminaos'    , 440, 4);   
INSERT INTO GRUPOS VALUES (23, 'Valiente Principe', 460, 5);          
INSERT INTO GRUPOS VALUES (24, 'Las sin filtro'        , 540, 5);          
INSERT INTO GRUPOS VALUES (25, 'Los Bacardi'          , 390, 5);  
INSERT INTO GRUPOS VALUES (26, 'Los becarios del telediario'        , 560, 5); 
INSERT INTO GRUPOS VALUES (27, 'Annunakis inmortales en la playa de los corrales'  , 570, 6);          
INSERT INTO GRUPOS VALUES (28, 'Callehero'           , 580, 6);          
INSERT INTO GRUPOS VALUES (29, 'Nostagia de hueva', 590, 6);  
INSERT INTO GRUPOS VALUES (30, 'La IA la gran puta'     , 600, 6);
INSERT INTO GRUPOS VALUES (31, 'Los Taquilleros de Vilches'  , 630, 3);  
INSERT INTO GRUPOS VALUES (32, 'El paraiso'  , 410, 4);  
        

INSERT INTO TIPO_GRUPO VALUES
(1, 'CHIRIGOTA'),
(2, 'CUARTETO'),
(3, 'COMPARSA'),
(4, 'CORO'),
(5, 'CALLEJERA'),
(6, 'ROMANCERO');

INSERT INTO JURADOS VALUES
(1, 'JUAN ANTONIO'),
(2, 'MARIA'),
(3, 'JORGE'),
(4, 'JOSE MARIA');

INSERT INTO VOTOS VALUES (11, 1, 47);          
INSERT INTO VOTOS VALUES (12, 1, 23);          
INSERT INTO VOTOS VALUES (13, 1, 46);          
INSERT INTO VOTOS VALUES (14, 1, 49);          
INSERT INTO VOTOS VALUES (15, 1,  2);          
INSERT INTO VOTOS VALUES (16, 1, 15);          
INSERT INTO VOTOS VALUES (17, 1, 28);          
INSERT INTO VOTOS VALUES (18, 1, 31);          
INSERT INTO VOTOS VALUES (19, 1, 49);          
INSERT INTO VOTOS VALUES (20, 1,  7);          
INSERT INTO VOTOS VALUES (21, 1, 17);          
INSERT INTO VOTOS VALUES (22, 1, 25);  
INSERT INTO VOTOS VALUES (11, 2, 32);          
INSERT INTO VOTOS VALUES (12, 2, 40);          
INSERT INTO VOTOS VALUES (13, 2,  3);          
INSERT INTO VOTOS VALUES (14, 2, 16);          
INSERT INTO VOTOS VALUES (15, 2, 29);          
INSERT INTO VOTOS VALUES (16, 2, 32);          
INSERT INTO VOTOS VALUES (17, 2, 45);          
INSERT INTO VOTOS VALUES (18, 2,  8);          
INSERT INTO VOTOS VALUES (19, 2, 11);          
INSERT INTO VOTOS VALUES (20, 2, 24);          
INSERT INTO VOTOS VALUES (21, 2, 37);          
INSERT INTO VOTOS VALUES (22, 2, 41);  
INSERT INTO VOTOS VALUES (11, 3,  5);          
INSERT INTO VOTOS VALUES (12, 3, 10);          
INSERT INTO VOTOS VALUES (13, 3, 51);          
INSERT INTO VOTOS VALUES (14, 3, 30);          
INSERT INTO VOTOS VALUES (15, 3, 43);          
INSERT INTO VOTOS VALUES (16, 3,  6);          
INSERT INTO VOTOS VALUES (17, 3, 19);          
INSERT INTO VOTOS VALUES (18, 3, 22);          
INSERT INTO VOTOS VALUES (19, 3, 35);          
INSERT INTO VOTOS VALUES (20, 3, 48);          
INSERT INTO VOTOS VALUES (21, 3,  1);          
INSERT INTO VOTOS VALUES (22, 3, 14);  
INSERT INTO VOTOS VALUES (11, 4, 27);          
INSERT INTO VOTOS VALUES (12, 4, 31);          
INSERT INTO VOTOS VALUES (13, 4, 44);          
INSERT INTO VOTOS VALUES (14, 4,  7);          
INSERT INTO VOTOS VALUES (15, 4, 11);          
INSERT INTO VOTOS VALUES (16, 4, 25);          
INSERT INTO VOTOS VALUES (17, 4, 30);          
INSERT INTO VOTOS VALUES (18, 4, 41);          
INSERT INTO VOTOS VALUES (19, 4,  3);          
INSERT INTO VOTOS VALUES (20, 4, 19);          
INSERT INTO VOTOS VALUES (21, 4, 28);          
INSERT INTO VOTOS VALUES (22, 4, 38);  
COMMIT;                          
                                 

-- ********** FOREIGN KEYS *************
ALTER TABLE MIEMBROS ADD CONSTRAINT FK_MIEMBROS_GR FOREIGN KEY (GRUPO_MI) REFERENCES GRUPOS ON DELETE CASCADE;
ALTER TABLE GRUPOS ADD CONSTRAINT FK_GRUPOS_GR FOREIGN KEY (LETRISTA_GR) REFERENCES MIEMBROS ON DELETE CASCADE;
ALTER TABLE GRUPOS ADD CONSTRAINT FK_GRUPOS_TP FOREIGN KEY (TIPO_GR) REFERENCES TIPO_GRUPO ON DELETE CASCADE;
ALTER TABLE VOTOS ADD CONSTRAINT FK_VOTOS_GR FOREIGN KEY (GRUPO_VO) REFERENCES GRUPOS ON DELETE CASCADE;
ALTER TABLE VOTOS ADD CONSTRAINT FK_VOTOS_JU FOREIGN KEY (JURADO_VO) REFERENCES JURADOS ON DELETE CASCADE;

-- ********** CONSULTAS PARA VERIFICACIÓN *************
SELECT * FROM MIEMBROS;
SELECT * FROM GRUPOS;
SELECT * FROM TIPO_GRUPO;
SELECT * FROM JURADOS;
SELECT * FROM VOTOS;