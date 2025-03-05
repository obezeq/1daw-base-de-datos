--------------------------------------------------------------------------------------
-- EXAMEN SQL SELECT DE FEBRERO 2025 - TABLAS CARNAVAL24 
--------------------------------------------------------------------------------------

-- Nombre: Ezequiel Ortega Bravo

Con este examen se evalua el Resultado de Aprendizaje 3 del Modulo de Base de datos,
con los criterios de evaluación a), b), c), d), e), f). 

RA3. Consulta la información almacenada en una base de datos empleando asistentes,
herramientas gráficas y el lenguaje de manipulación de datos.
Criterios de evaluación:
a) Se han identificado las herramientas y sentencias para realizar consultas.
b) Se han realizado consultas simples sobre una tabla.
c) Se han realizado consultas sobre el contenido de varias tablas mediante composiciones
internas.
d) Se han realizado consultas sobre el contenido de varias tablas mediante composiciones
externas.
e) Se han realizado consultas resumen.
f) Se han realizado consultas con subconsultas.


--------------------------------------------------------------------------------------
-- INSTRUCCIONES
--------------------------------------------------------------------------------------

- Pon tu nombre arriba y lee atentamente todas las preguntas.

-Salva este fichero con las iniciales de tu nombre y apellidos,
 en un  directorio de tu equipo, tipo     "C:\Examen\ ":
 
	Ejemplo: Si te llamas	Tomas Coronado Garcia tu archivo deberá llamarse
			    00TCG.sql
El numero que pones delante de tus iniciales debe ser el que aparece 
a continuación:

01 Fran Alba Muñoz
02 Sergio Aragón García
03 Alejandro Borrego Cruz
04 Alfonso Jesús Castejón Moreno
05 
06 Indalecio Domínguez Hita
07 Pablo Fernández Fernández
08 Rocío Luque Montes
09 José Ángel Masfarré Merchán
10 Daniel Montes Iglesias
11 Ángel Muñoz Gutiérrez
12 Ezequiel Ortega Bravo
13 Abel Suazo Cabeza de Vaca

- Entra en la consola de línea de comandos SQL con el usuario EXAMEN (u otro que tengas disponible). 

- Carga el script para el examen desde el fichero "Datos2024Febv1.sql".

- Donde ponga "SQL>", copiarás las sentencias SQL que has utilizado.

- Donde ponga "Resultado:" copiarás el resultado que SQL te devuelve.

- RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. 
Es lo que voy a evaluar, si lo pierdes, lo siento.

-RECUERDA: guardar, cada cierto tiempo, el contenido de este fichero. Es lo que voy a evaluar, si lo pierdes, es tu responsabilidad.
-PUNTUACIÓN:  	Cada pregunta se evaluará de 0 a 10 puntos, sumando el resultado final y dividiendo entre el numero de preguntas para obtener el resultado final.


-ENTREGA: Cuando finalices entrega antes de la hora limite de entrega, 
- subiendo a este fichero SQL a Moodle.

--------------------------------------------------------------------------------------
-- CRITERIOS
--------------------------------------------------------------------------------------

- Las consultas deben poder ejecutarse (sin errores de sintaxis) 

- Deben mostrar la información pedida.

--------------------------------------------------------------------------------------
-- TABLAS	(CARNAVAL DE CADIZ)
--------------------------------------------------------------------------------------
	
CREATE TABLE MIEMBROS(
  COD_MI		NUMBER(3)	 	PRIMARY KEY,
  NOMBRE_MI		VARCHAR2(30)  	NOT NULL,
  GRUPO_MI		NUMBER(2)	 	REFERENCES GRUPOS,
  FECNAC_MI		DATE
);
  
CREATE TABLE GRUPOS(
  COD_GR		NUMBER(2)		PRIMARY KEY,
  NOMBRE_GR		VARCHAR2(20),
  LETRISTA_GR	NUMBER(3)		REFERENCES MIEMBROS,
  TIPO_GR		NUMBER(1)		REFERENCES TIPO_GRUPO
);
 
CREATE TABLE TIPO_GRUPO(
  COD_TP		NUMBER(1)		PRIMARY KEY,
  NOMBRE_TP		VARCHAR2(10)
);

CREATE TABLE JURADOS(
  COD_JU		NUMBER(1)		PRIMARY KEY,
  NOMBRE_JU		VARCHAR2(12)
);
 
CREATE TABLE VOTOS(
  GRUPO_VO		NUMBER(2)		REFERENCES GRUPOS,
  JURADO_VO		NUMBER(1)		REFERENCES JURADOS,
  PUNTOS_VO		NUMBER(2), 
  PRIMARY KEY (GRUPO_VO, JURADO_VO)
);

--------------------------------------------------------------------------------------
-- Pregunta 1 
--------------------------------------------------------------------------------------
-- 1.- Para todos los grupos, mostrar el nombre de cada grupo
-- , el nombre del tipo de agrupación y nombre (apellidos y nombre) del letrista del grupo.

SELECT 
  G.NOMBRE_GR, 
  TG.NOMBRE_TP,
  M.NOMBRE_MI
FROM GRUPOS G 
  JOIN TIPO_GRUPO TG ON G.TIPO_GR = TG.COD_TP 
  JOIN MIEMBROS M ON G.LETRISTA_GR = M.COD_MI;

-- Resultado:
/*
"El grinch de Cadiz"	"CHIRIGOTA"	"Braza Elsheriff, Juan Manuel"
"Que ni las hambre vamos a sentir"	"CHIRIGOTA"	"Garcia Cossio, Selu"
"Los exageraos"	"CHIRIGOTA"	"Villegas Elgueli, Juan Miguel"
"La oveja negra"	"COMPARSA"	"Martines Ares, Antonio"
"Los colgaos"	"COMPARSA"	"Garcia ElChapa, Miguel Angel"
"Los ofendiditos"	"COMPARSA"	"Beardo, Tamara"
"Los coco de Cadiz"	"CUARTETO"	"Aguilera, Javier"
"En mi caseta cabe to el mundo"	"CUARTETO"	"Peinado, Manuel"
"Punk y circo"	"CUARTETO"	"Gago, Angel"
"El gremio"	"CORO"	"Rivas, Antonio"
"Los Luciernagas"	"CORO"	"Pardo, Julio"
"Los iluminaos"	"CORO"	"Remolino, Kike"
"Valiente Principe"	"CALLEJERA"	"Zahara, Alvaro"
"Las sin filtro"	"CALLEJERA"	"Peralta , Miriam"
"Los Bacardi"	"CALLEJERA"	"Andrade Sanchez, Abraham"
"Los becarios del telediario"	"CALLEJERA"	"Jartible, Andrea"
"Annunakis inmortales en la playa de los corrales"	"ROMANCERO"	"Lahierbabuena , Maria"
"Callehero"	"ROMANCERO"	"Martinez, ElCabra"
"Nostagia de hueva"	"ROMANCERO"	"Montes, Andres"
"La IA la gran puta"	"ROMANCERO"	"Elyuyu, Jose Guerrero"
"Los Taquilleros de Vilches"	"COMPARSA"	"Fernandez Vilches , Juanfra"
"El paraiso"	"CORO"	"Pardo, Julio"
*/

--------------------------------------------------------------------------------------
-- Pregunta 2 
--------------------------------------------------------------------------------------
-- 2.- Mostrar para todos los grupos del tipo 'Callejera', nombre del grupo, 
-- nombre de cada miembro (sin apellidos).

SELECT 
    G.NOMBRE_GR AS NOMBRE_DEL_GRUPO, 
    SPLIT_PART(M.NOMBRE_MI, ', ', 2) AS NOMBRE_CADA_MIEMBRO 
FROM 
    GRUPOS G 
    JOIN MIEMBROS M ON G.COD_GR = M.GRUPO_MI 
    JOIN TIPO_GRUPO TG ON G.TIPO_GR = TG.COD_TP 
WHERE 
    TG.NOMBRE_TP = 'CALLEJERA';

-- Resultado:
/*
"Los Bacardi"	"Abraham"
"Valiente Principe"	"Alvaro"
"Valiente Principe"	"Juan Antonio"
"Valiente Principe"	"Umberto"
"Valiente Principe"	"Pascual"
"Valiente Principe"	"Maite"
"Valiente Principe"	"Ernesto"
"Valiente Principe"	"Elena"
"Valiente Principe"	"Enrique"
"Las sin filtro"	"Miriam"
"Los Bacardi"	"Pepe"
"Los becarios del telediario"	"Andrea"
*/

--------------------------------------------------------------------------------------
-- Pregunta 3
--------------------------------------------------------------------------------------
-- 3.- Mostrar para cada 'Comparsa', su nombre en mayúsculas 
-- y el número de total de puntos obtenidos, ordenados por número de puntos descendentemente. 
-- Deben aparecer todas las comparsas.

SELECT 
    UPPER(G.NOMBRE_GR), 
    COALESCE(SUM(V.PUNTOS_VO), 0) AS TOTAL_PUNTOS 
FROM 
    GRUPOS G 
    JOIN TIPO_GRUPO TG ON G.TIPO_GR = TG.COD_TP 
    LEFT JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO 
WHERE 
    TG.NOMBRE_TP = 'COMPARSA' 
GROUP BY 
    G.NOMBRE_GR 
ORDER BY 
    TOTAL_PUNTOS DESC;

-- Resultado:

/*
"LA OVEJA NEGRA"	102
"LOS COLGAOS"	85
"LOS OFENDIDITOS"	78
"LOS TAQUILLEROS DE VILCHES"	0
*/

--------------------------------------------------------------------------------------
-- Pregunta 4
--------------------------------------------------------------------------------------
-- 4.- Mostrar del grupo con más miembros, el nombre y el número de miembros que lo integran.

SELECT 
    G.NOMBRE_GR, 
    COUNT(*) AS NUM_MIEMBROS 

FROM GRUPOS G 
    JOIN MIEMBROS M ON G.COD_GR = M.GRUPO_MI 

GROUP BY G.NOMBRE_GR

HAVING COUNT(*) = (

    SELECT MAX(CNT) FROM (
        SELECT COUNT(*) CNT FROM MIEMBROS GROUP BY GRUPO_MI
    ) AS SUB

);

-- Resultado:

/*
"Valiente Principe"	8
*/

--------------------------------------------------------------------------------------
-- Pregunta 5
--------------------------------------------------------------------------------------
-- 5.- Mostrar, en minúscula con la primera letra en mayúsculas, 
-- el nombre del miembro del jurado que haya dado más puntos en total.

SELECT INITCAP(J.NOMBRE_JU) AS nombre_del_jurado
FROM JURADOS J
JOIN VOTOS V ON J.COD_JU = V.JURADO_VO
GROUP BY J.COD_JU, J.NOMBRE_JU
HAVING SUM(V.PUNTOS_VO) = (
    SELECT MAX(total_puntos)
    FROM (
        SELECT SUM(PUNTOS_VO) AS total_puntos
        FROM VOTOS
        GROUP BY JURADO_VO
    ) AS subqquery
);

-- Resultado:

/*
"Juan Antonio"
*/

--------------------------------------------------------------------------------------
-- Pregunta 6
--------------------------------------------------------------------------------------
-- 6.- Mostrar, para todas las agrupaciones, el resultado de las votaciones: nombre del tipo de grupo, 
-- nombre del grupo y puntos obtenidos, ordenado por tipo de grupo y, descendentemente, puntuación. 

SELECT
    TG.NOMBRE_TP AS TIPO_GRUPO,
    G.NOMBRE_GR AS NOMBRE_DEL_GRUPO,
    COALESCE(SUM(V.PUNTOS_VO), 0) AS PUNTOS_OBTENIDOS
FROM GRUPOS G 
    JOIN TIPO_GRUPO TG ON G.TIPO_GR = TG.COD_TP 
    LEFT JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO 
GROUP BY TG.NOMBRE_TP, G.NOMBRE_GR 
ORDER BY TG.NOMBRE_TP, PUNTOS_OBTENIDOS DESC;

-- Resultado:

/*
"CALLEJERA"	"Las sin filtro"	0
"CALLEJERA"	"Los Bacardi"	0
"CALLEJERA"	"Los becarios del telediario"	0
"CALLEJERA"	"Valiente Principe"	0
"CHIRIGOTA"	"Los exageraos"	144
"CHIRIGOTA"	"El grinch de Cadiz"	111
"CHIRIGOTA"	"Que ni las hambre vamos a sentir"	104
"COMPARSA"	"La oveja negra"	102
"COMPARSA"	"Los colgaos"	85
"COMPARSA"	"Los ofendiditos"	78
"COMPARSA"	"Los Taquilleros de Vilches"	0
"CORO"	"Los iluminaos"	118
"CORO"	"El gremio"	98
"CORO"	"Los Luciernagas"	83
"CORO"	"El paraiso"	0
"CUARTETO"	"Los coco de Cadiz"	122
"CUARTETO"	"En mi caseta cabe to el mundo"	102
"CUARTETO"	"Punk y circo"	98
"ROMANCERO"	"La IA la gran puta"	0
"ROMANCERO"	"Nostagia de hueva"	0
"ROMANCERO"	"Callehero"	0
"ROMANCERO"	"Annunakis inmortales en la playa de los corrales"	0
*/

--------------------------------------------------------------------------------------
-- Pregunta 7 
--------------------------------------------------------------------------------------
-- 7.- Mostrar el nombre del grupo y la suma de puntos del grupo que más puntos ha obtenido.

SELECT G.NOMBRE_GR AS NOMBRE_DEL_GRUPO, 
SUM(V.PUNTOS_VO) AS SUMA_DE_PUNTOS
FROM GRUPOS G
JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO
GROUP BY G.COD_GR, G.NOMBRE_GR
HAVING SUM(V.PUNTOS_VO) = (
    SELECT MAX(TOTAL_DE_PUNTOS)
    FROM (
        SELECT SUM(PUNTOS_VO) AS TOTAL_DE_PUNTOS
        FROM VOTOS
        GROUP BY GRUPO_VO
    )
);

-- Resultado:

/*
"Los exageraos"	144
*/

--------------------------------------------------------------------------------------
-- Pregunta 8
--------------------------------------------------------------------------------------
-- 8.- Mostrar el nombre y apellido junto con el nombre de su grupo, 
-- del miembro más viejo de todos.

SELECT 
    M.NOMBRE_MI AS NOMBRE_Y_APELLIDO, 
    G.NOMBRE_GR AS NOMBRE_GRUPOI
FROM MIEMBROS M 
    JOIN GRUPOS G ON M.GRUPO_MI = G.COD_GR 
WHERE 
    M.FECNAC_MI = (
      SELECT MIN(FECNAC_MI) 
      FROM MIEMBROS
    );

-- Resultado:

/*
"EldelMentidero, Juanelo"	"La IA la gran puta"
*/

--------------------------------------------------------------------------------------
-- Pregunta 9
--------------------------------------------------------------------------------------
-- 9.- Mostrar el nombre y apellido, en este orden, 
-- del miembro con el nombre más corto (longitud de apellidos y nombre).

SELECT 
    SPLIT_PART(NOMBRE_MI, ', ', 2) 
    || ' ' || 
    SPLIT_PART(NOMBRE_MI, ', ', 1) 
    AS NOMBRE_Y_APELLIDO 
FROM MIEMBROS 
WHERE LENGTH(NOMBRE_MI) = (
    SELECT MIN(LENGTH(NOMBRE_MI)) 
    FROM MIEMBROS
);

-- Resultado:

/*
"Paco Alba"
*/

--------------------------------------------------------------------------------------
-- Pregunta 10
--------------------------------------------------------------------------------------
-- 10.- Para cada tipo de agrupación, mostrar su nombre y cuantos grupos se han presentado.

SELECT 
  TG.NOMBRE_TP AS TIPO_DE_AGRUPACION, 
  COUNT(G.COD_GR) AS NUMERO_DE_GRUPOS 
FROM TIPO_GRUPO TG
  LEFT JOIN GRUPOS G ON TG.COD_TP = G.TIPO_GR 
GROUP BY TG.NOMBRE_TP

-- Resultado:

/*
"CHIRIGOTA"	3
"COMPARSA"	4
"CORO"	4
"CALLEJERA"	4
"ROMANCERO"	4
"CUARTETO"	3
*/

--------------------------------------------------------------------------------------
-- Pregunta 11
--------------------------------------------------------------------------------------
-- 11.- Puntos que le han dado cada miembro del jurado 
-- a la agrupación "Que ni las hambre vamos a sentir": nombre del jurado y votos.

SELECT 
  J.NOMBRE_JU AS NOMBRE_JURADO,
  V.PUNTOS_VO AS VOTOS
FROM JURADOS J 
  JOIN VOTOS V ON J.COD_JU = V.JURADO_VO 
  JOIN GRUPOS G ON V.GRUPO_VO = G.COD_GR 
WHERE G.NOMBRE_GR = 'Que ni las hambre vamos a sentir';

-- Resultado:

/*
"JUAN ANTONIO"	23
"MARIA"	40
"JORGE"	10
"JOSE MARIA"	31
*/

--------------------------------------------------------------------------------------
-- Pregunta 12
--------------------------------------------------------------------------------------
-- 12.- Para cada letrista, mostrar su nombre, apellidos y fecha de nacimiento con el siguiente formato:

-- "Antonio Martinez Ares nació el miercoles 8 de febrero de 1967"

SELECT
    INITCAP(SPLIT_PART(M.NOMBRE_MI, ', ', 2))
     || ' ' || 
    INITCAP(SPLIT_PART(M.NOMBRE_MI, ', ', 1)) 
    || ' nació el ' || 
    TO_CHAR(M.FECNAC_MI, 'TMday') 
    || ' ' || 
    TO_CHAR(M.FECNAC_MI, 'DD') 
    || ' de ' || 
    TO_CHAR(M.FECNAC_MI, 'TMmonth') 
    || ' de ' || 
    TO_CHAR(M.FECNAC_MI, 'YYYY') AS INFORMACION_DE_LETRISTAS 
FROM MIEMBROS M
    JOIN GRUPOS G ON M.COD_MI = G.LETRISTA_GR;

-- Resultado:
/*
"Juan Manuel Braza Elsheriff nació el jueves 02 de abril de 1959"
"Selu Garcia Cossio nació el sábado 10 de diciembre de 1966"
"Juan Miguel Villegas Elgueli nació el lunes 06 de diciembre de 1971"
"Antonio Martines Ares nació el lunes 12 de febrero de 1979"
"Miguel Angel Garcia Elchapa nació el viernes 03 de julio de 1987"
"Tamara Beardo nació el sábado 02 de abril de 1977"
"Javier Aguilera nació el lunes 21 de octubre de 1985"
"Manuel Peinado nació el lunes 19 de mayo de 2003"
"Angel Gago nació el lunes 12 de abril de 1982"
"Antonio Rivas nació el jueves 02 de julio de 1953"
"Julio Pardo nació el viernes 22 de mayo de 1970"
"Kike Remolino nació el domingo 22 de abril de 1979"
"Alvaro Zahara nació el martes 02 de abril de 1985"
"Miriam Peralta  nació el lunes 10 de octubre de 1977"
"Abraham Andrade Sanchez nació el domingo 02 de abril de 1989"
"Andrea Jartible nació el martes 11 de noviembre de 1986"
"Maria Lahierbabuena  nació el sábado 11 de agosto de 1990"
"Elcabra Martinez nació el sábado 12 de octubre de 1974"
"Andres Montes nació el sábado 05 de septiembre de 1987"
"Jose Guerrero Elyuyu nació el miércoles 02 de febrero de 1972"
"Juanfra Fernandez Vilches  nació el viernes 01 de febrero de 1980"
"Julio Pardo nació el viernes 22 de mayo de 1970"
*/

--------------------------------------------------------------------------------------
-- Pregunta 13
--------------------------------------------------------------------------------------
-- 13.- Mostrar para cada grupo, su nombre y el número de miembros que lo forman.

SELECT 
    G.NOMBRE_GR AS NOMBRE_CADA_GRUPO, 
    COUNT(M.COD_MI) AS NUMERO_DE_MIEMBROS 
FROM 
    GRUPOS G 
    LEFT JOIN MIEMBROS M ON G.COD_GR = M.GRUPO_MI 
GROUP BY 
    G.NOMBRE_GR;

-- Resultado:

/*
"Los Luciernagas"	4
"Valiente Principe"	8
"El paraiso"	1
"El grinch de Cadiz"	4
"Punk y circo"	3
"En mi caseta cabe to el mundo"	3
"Annunakis inmortales en la playa de los corrales"	1
"Los iluminaos"	3
"Los Taquilleros de Vilches"	1
"Los ofendiditos"	1
"El gremio"	3
"Los Bacardi"	2
"Los becarios del telediario"	1
"Los colgaos"	2
"La oveja negra"	2
"La IA la gran puta"	2
"Nostagia de hueva"	2
"Las sin filtro"	1
"Que ni las hambre vamos a sentir"	3
"Los exageraos"	3
"Callehero"	1
"Los coco de Cadiz"	3
*/

--------------------------------------------------------------------------------------
-- Pregunta 14
--------------------------------------------------------------------------------------
-- 14.- Sacar el nombre de cada grupo, junto con los puntos obtenidos.
-- Si el grupo no ha tenido ningun punto tambien hay que sacarlo.

SELECT
    G.NOMBRE_GR AS NOMBRE_CADA_GRUPO, 
    COALESCE(SUM(V.PUNTOS_VO), 0) AS PUNTOS_OBTENIDOS
FROM 
    GRUPOS G
    LEFT JOIN VOTOS V ON G.COD_GR = V.GRUPO_VO 
GROUP BY 
    G.NOMBRE_GR;

-- Resultado:

/*
"Los Luciernagas"	83
"Valiente Principe"	0
"El paraiso"	0
"El grinch de Cadiz"	111
"Punk y circo"	98
"En mi caseta cabe to el mundo"	102
"Annunakis inmortales en la playa de los corrales"	0
"Los iluminaos"	118
"Los Taquilleros de Vilches"	0
"Los ofendiditos"	78
"El gremio"	98
"Los Bacardi"	0
"Los becarios del telediario"	0
"Los colgaos"	85
"La oveja negra"	102
"La IA la gran puta"	0
"Nostagia de hueva"	0
"Las sin filtro"	0
"Que ni las hambre vamos a sentir"	104
"Los exageraos"	144
"Callehero"	0
"Los coco de Cadiz"	122
*/

--------------------------------------------------------------------------------------
-- Pregunta 15
--------------------------------------------------------------------------------------
-- 15.- Mostrar para cada uno de los miembros de "EL grinch DE Cadiz", apellidos y nombre, 
-- junto con la edad que tienen hoy.

SELECT 
    SPLIT_PART(NOMBRE_MI, ', ', 1) AS APELLIDOS, 
    SPLIT_PART(NOMBRE_MI, ', ', 2) AS NOMBRE, 
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, FECNAC_MI)) AS EDAD 
FROM MIEMBROS 
WHERE GRUPO_MI = (
  SELECT COD_GR 
  FROM GRUPOS 
  WHERE NOMBRE_GR = 'El grinch de Cadiz'
);

-- Resultado:

/*
"Alvarez"	"Antonio (Bizcocho)"	43
"Gutierrez Ellibi"	"Emilio"	66
"Cornejo Cornejo"	"Manuel"	59
"Braza Elsheriff"	"Juan Manuel"	65
*/

--------------------------------------------------------------------------------------
-- Pregunta 16
--------------------------------------------------------------------------------------
-- 16.- Mostrar el nombre (sin apellidos) del miembro más joven de "En mi caseta cabe to el mundo".

SELECT
    SPLIT_PART(NOMBRE_MI, ', ', 2) AS NOMBRE_MIEMBRO_MAS_JOVEN
FROM MIEMBROS
WHERE GRUPO_MI = (
    SELECT COD_GR 
    FROM GRUPOS 
    WHERE NOMBRE_GR = 'En mi caseta cabe to el mundo'
) 
AND FECNAC_MI = (
    SELECT MAX(FECNAC_MI) 
    FROM MIEMBROS 
    WHERE GRUPO_MI = (
        SELECT COD_GR 
        FROM GRUPOS 
        WHERE NOMBRE_GR = 'En mi caseta cabe to el mundo'
    )
);

-- Resultado:

/*
"Alejandro"
*/