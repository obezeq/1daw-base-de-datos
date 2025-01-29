---------------------------------------------------------------------------------------------------
-- Ejercicios para trabajar con funciones de caracteres en PostgreSQL:
---------------------------------------------------------------------------------------------------

------------------------------------------------------------------


-- 1. Concatena cadenas
-- a) Une las cadenas 'Hola', ' ' y 'mundo!' utilizando la función CONCAT.
SELECT CONCAT('Hola', ' ', 'mundo!') AS saludo;Ç

-- b) Usando CONCAT_WS, concatena '2024', '12', y '25' con un guion (-) como separador.
SELECT CONCAT_WS('-', '2024', '12', '25') AS fecha;

-- 2. Subcadena y transformación de texto
-- a) Extrae la palabra 'mundo' de la cadena 'Hola, mundo!' utilizando la función SUBSTRING.
SELECT SUBSTRING('Hola, mundo!' FROM 7 FOR 5) AS palabra;

-- b) Convierte la cadena 'Hola, mundo!' a:
-- Mayúsculas utilizando UPPER.
SELECT UPPER('Hola, mundo!') AS mayusculas;

-- Minúsculas utilizando LOWER.
SELECT LOWER('Hola, mundo!') AS minusculas;

-- Capitalización de cada palabra utilizando INITCAP.
SELECT INITCAP('Hola, mundo!') AS capitalizado;


-- 3. Limpieza de cadenas
-- a) Limpia los caracteres '-' al inicio y final de la cadena '-Hola-mundo-' utilizando las funciones LTRIM y RTRIM.
SELECT LTRIM(RTRIM('-Hola-mundo-', '-'), '-') AS cadena_limpia;

-- b) Elimina todos los espacios al inicio y final de la cadena ' Espacios ' utilizando TRIM.
SELECT TRIM(' Espacios ') AS cadena_sin_espacios;


-- 4. Reemplazo y modificación
-- a) Reemplaza la palabra 'mundo' por 'PostgreSQL' en la cadena 'Hola, mundo!' utilizando REPLACE.
SELECT REPLACE('Hola, mundo!', 'mundo', 'PostgreSQL') AS remplazo;

-- b) Usando OVERLAY, reemplaza la palabra 'es' por 'ha sido' en la cadena 'Esto es una prueba', ajustando la posición inicial y longitud correctamente.
SELECT OVERLAY('Esto es una prueba' PLACING 'ha sido' FROM 6 FOR 2) AS modificada;


-- 5. Substring combinado con Position
-- a) Encuentra la posición de la palabra 'mundo' dentro de la cadena 'Hola, mundo!' utilizando POSITION. Después, utiliza SUBSTRING para extraer la palabra.
SELECT SUBSTRING('Hola, mundo!' FROM POSITION('mundo' IN 'Hola, mundo!') FOR 5) AS palabra_extraida;

-- b) De la cadena 'El lenguaje SQL es poderoso', encuentra la posición de 'SQL' y extrae las siguientes dos palabras ('es poderoso') usando una combinación de POSITION y SUBSTRING.
SELECT SUBSTRING('El lenguaje SQL es poderoso' FROM POSITION('SQL' IN 'El lenguaje SQL es poderoso') + 4) AS palabras_extraidas;


-- 6. Longitud y posición
-- a) Calcula la longitud de la cadena 'Hola, mundo!' usando LENGTH
SELECT LENGTH('Hola, mundo!') AS longitud;

-- b) Encuentra la posición de la palabra 'PostgreSQL' dentro de la cadena 'Aprender PostgreSQL es útil' utilizando las funciones POSITION y STRPOS.
SELECT POSITION('PostgreSQL' IN 'Aprender PostgreSQL es útil') AS posicion;


-- 7. Relleno de cadenas
-- a) Rellena la cadena 'PostgreSQL' con guiones (-) a la izquierda para que tenga una longitud de 15 caracteres utilizando LPAD.
SELECT LPAD('PostgreSQL', 15, '-') AS rellenado_izquierda;

-- b) Rellena la misma cadena con guiones (-) a la derecha para alcanzar una longitud de 15 caracteres utilizando RPAD.
SELECT RPAD('PostgreSQL', 15, '-') AS rellenado_derecha;

-- 8. Códigos y transformaciones avanzadas
-- a) Calcula el código ASCII del carácter 'P' utilizando ASCII.
SELECT ASCII('P') AS codigo_ascii;

-- b) Obtén la longitud en bits de la cadena 'PostgreSQL' utilizando BIT_LENGTH.
SELECT BIT_LENGTH('PostgreSQL') AS longitud_bits;

-- c) Convierte la cadena 'PostgreSQL' a formato Base64 utilizando ENCODE.
SELECT ENCODE('PostgreSQL'::bytea, 'base64') AS base64;

-- 9. Ejercicios con las tablas de Scott/Tiger
-- (Usa la tabla EMP con las siguientes columnas: ENAME (nombre del empleado) y JOB (puesto de trabajo)).

-- a) Une el nombre del empleado (ENAME) y su puesto de trabajo (JOB) con la frase ' trabaja como ' utilizando CONCAT_WS.
-- Ejemplo de salida: Si ENAME = 'SCOTT' y JOB = 'ANALYST', la salida debe ser: 'SCOTT trabaja como ANALYST'.

SELECT CONCAT_WS(' trabaja como ', ENAME, JOB) AS descripcion
FROM EMP;

-- b) Encuentra el código ASCII del primer carácter del nombre de cada empleado (ENAME).
SELECT ENAME, ASCII(SUBSTRING(ENAME FROM 1 FOR 1)) AS codigo_ascii
FROM EMP;

-- c) Extrae los tres primeros caracteres del nombre de cada empleado utilizando SUBSTRING.
SELECT ENAME, SUBSTRING(ENAME FROM 1 FOR 3) AS tres_primeros
FROM EMP;

-- d) Encuentra la posición de la primera aparición de la letra 'A' en los nombres de los empleados (ENAME) y extrae todas las letras desde esa posición hasta el final utilizando SUBSTRING y POSITION.

SELECT ENAME, 
       SUBSTRING(ENAME FROM POSITION('A' IN ENAME)) AS desde_a
FROM EMP
WHERE POSITION('A' IN ENAME) > 0;  -- Solo empleados cuyo nombre contiene 'A'

-- e) Para todos los nombres de los empleados que contienen más de 5 caracteres, recórtalos a los primeros 5 caracteres utilizando SUBSTRING.
SELECT ENAME, SUBSTRING(ENAME FROM 1 FOR 5) AS truncated_name
FROM EMP WHERE LENGTH(ENAME) > 5;

-------------