/*
Tarea SQL_02
- Curso: 1ºDAW B
- Fecha: 07/02/2025
- Nota: 9,63 + 1 = 10,63
*/

/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */
/* **Tablas SQL_O1 y SQL_02** */
/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */

-- Ejercicio 1: Funciones numéricas
-- Puntuacion: 10
SELECT ABS(146);             -- Resultado: 146
SELECT ABS(-30);             -- Resultado: 30
SELECT CEIL(2);              -- Resultado: 2
SELECT CEIL(1.3);            -- Resultado: 2
SELECT CEIL(-2.3);           -- Resultado: -2
SELECT CEIL(-2);             -- Resultado: -2
SELECT FLOOR(-2);            -- Resultado: -2
SELECT FLOOR(-2.3);          -- Resultado: -3
SELECT FLOOR(2);             -- Resultado: 2
SELECT FLOOR(1.3);           -- Resultado: 1
SELECT MOD(22,23);           -- Resultado: 22
SELECT MOD(10,3);            -- Resultado: 1
SELECT POWER(10,0);          -- Resultado: 1
SELECT POWER(3,2);           -- Resultado: 9
SELECT POWER(3,-1);          -- Resultado: 0.333333...
SELECT ROUND(33.67);         -- Resultado: 34
SELECT ROUND(-33.67,2);      -- Resultado: -33.67
SELECT ROUND(-33.67,-2);     -- Resultado: 0 (o -0)
SELECT ROUND(-33.27,1);      -- Resultado: -33.3
SELECT ROUND(-33.27,-1);     -- Resultado: -30
SELECT TRUNC(67.232);        -- Resultado: 67
SELECT TRUNC(67.232,-2);     -- Resultado: 0
SELECT TRUNC(67.232,2);      -- Resultado: 67.23
SELECT TRUNC(67.58,1);       -- Resultado: 67.5

-- Ejercicio 2: Apellidos que empiezan por 'A' en EMPLE
-- Puntuacion: 10
SELECT COUNT(*) AS total -- COUNT(*) sirve igual que COUNT(APELLIDO), pero al poner * cuenta todas las filas, si espificas la columna contara todas las filas de esa columna y gestionara los nulos.
FROM EMPLE
WHERE APELLIDO ILIKE 'A%';

-- Ejercicio 3: Estadísticas del departamento 30
-- Puntuacion: 6
SELECT
ROUND(AVG(salario), 2) AS sueldo_medio,
COUNT(comision) AS comisiones_no_nulas,
MAX(salario) AS max_salario,
MIN(salario) AS min_salario
FROM EMPLE
WHERE dept_no = 30;

/*Correcion:
SELECT TO_CHAR(AVG(SALARIO), '9G999G999D99'),
        COUNT(COMISION),
        TO_CHAR(MAX(SALARIO), '9G999G999'),
        TO_CHAR(MIN(SALARIO), '9G999G999'),
    FROM EMPLE
    WHERE DEPT_NO = 10;
 */

-- Ejercicio 4: Temas con al menos una 'a' en LIBRERIA
-- Puntuacion: 10
SELECT COUNT(TEMA) AS temas_con_a
FROM LIBRERIA
WHERE TEMA ILIKE '%a%';

-- Ejercicio 5: Temas con más ejemplares y que tengan 'e'
-- Puntuacion: 10
SELECT tema, ejemplares
FROM LIBRERIA
WHERE ejemplares = (SELECT MAX(ejemplares) FROM LIBRERIA WHERE tema ILIKE '%e%')
AND tema ILIKE '%e%';

-- Ejercicio 6: Estantes diferentes en LIBRERIA
-- Puntuacion: 10
SELECT COUNT(DISTINCT estante) AS estantes_distintos
FROM LIBRERIA;

-- Ejercicio 7: Estantes distintos para temas con 'e'
-- Puntuacion: 10
SELECT COUNT(DISTINCT estante) AS estantes_con_e
FROM LIBRERIA
WHERE tema ILIKE '%e%';

-- Ejercicio 8: Formatear títulos de MISTEXTOS
-- Puntuacion: 10
SELECT RPAD(LTRIM(RTRIM(TITULO, '" .'), '" '), 40, '-^-') FROM MISTEXTOS;
-- SELECT RPAD(RTRIM(RTRIM(LTRIM(TITULO, '"'), '"'), '.'), 40, '-^') FROM MISTEXTOS; -- (Forma del profesor)

-- Ejercicio 10: Títulos sin puntos/comillas (dos formas)
-- Puntuacion: 10

-- SELECT LOWER(REPLACE(REPLACE(titulo, '"', ''), '.', '')) AS titulo_limpio
-- FROM MISTEXTOS;
SELECT LOWER(TRANSLATE(titulo, '".', '')) AS titulo_limpio
FROM MISTEXTOS;

-- Ejercicio 11: Autor y apellido en LIBROS
-- Puntuacion: 10
SELECT autor, SPLIT_PART(autor, ',', 1) AS apellido 
FROM LIBROS;

-- Ejercicio 12: Autor y nombre en LIBROS
-- Puntuacion: 10
SELECT autor,
TRIM(SPLIT_PART(autor, ',', 2)) AS nombre
FROM LIBROS;

-- Ejercicio 13: Nombre y apellido concatenados
-- Puntuacion: 10
SELECT
TRIM(SPLIT_PART(autor, ',', 2)) || ' ' || SPLIT_PART(autor, ',', 1) AS nombre_completo
FROM LIBROS;

-- Ejercicio 14: Títulos ordenados por longitud
-- Puntuacion: 10?
SELECT titulo, LENGTH(titulo) AS longitud
FROM LIBROS
ORDER BY longitud;

-- SELECT TITULO FROM LIBROS ORDER BY LENGTH(TITULO); -- Forma del profesor.

-- Ejercicio 15: Fecha formateada en NACIMIENTOS
-- Puntuacion: 8
SELECT nombre, fechanac,
TO_CHAR(fechanac, 'DD "de" Month "de" YYYY') AS fecha_formateada
FROM NACIMIENTOS;

-- Forma correcta con el "Nació el ..."
SELECT NOMBRE, FECHANAC, TO_CHAR(FECHANAC,
    '"Nació el " dd " de "  TMmonth " de " yyyy')
    AS fecha_formateada
FROM NACIMIENTOS;

-- Ejercicio 16: Tema, último carácter y longitud
-- Puntuación: 8
SELECT tema,
RIGHT(TRIM(TRAILING ' ' FROM tema), 1) AS ultimo_caracter,
LENGTH(TRIM(TRAILING ' ' FROM tema)) AS longitud
FROM LIBRERIA
ORDER BY tema;

/*
-- Profesor:
SELECT TEMA,
        SUBSTR(TEMA, LENGTH(RTRIM(TEMA)), 1) "Ultima letra",
        LENGTH(RTRIM(TEMA)) "Longitud",
    FROM LIBRERIA
    ORDER BY TEMA;
*/

-- Ejercicio 17: Nombre y fecha sin espacios
-- Puntuación: 10
SELECT
TRIM(nombre) || ' ' || TO_CHAR(fechanac, 'DD/MM/YYYY') AS resultado
FROM NACIMIENTOS;

-- Ejercicio 18: Convertir cadena a fecha y mes
-- Puntuación: 10
SELECT
TO_CHAR(TO_DATE('01072012', 'DDMMYYYY'), 'MONTH') AS nombre_mes;

-- Ejercicio 19: Ejemplares como 'SEVEN' si son 7
-- Puntuación: 10
SELECT tema, ejemplares,
    CASE 
        WHEN ejemplares = 7 THEN 'SEVEN' 
        ELSE tema 
    END AS codigo
FROM LIBRERIA;

-- Ejercicio 20: Empleados con más de 15 años
-- Puntuación: 10
SELECT apellido
FROM EMPLE
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_alt)) > 15;

-- Ejercicio 21: Empleados en VENTAS con más de 18 años
-- Puntuación: 10
SELECT e.apellido
FROM EMPLE e
JOIN DEPART d ON e.dept_no = d.dept_no
WHERE d.dnombre = 'VENTAS'
AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, e.fecha_alt)) > 18;

-- Ejercicio 22: Empleados con salario máximo por departamento
-- Puntuación: 10
SELECT apellido, salario, dept_no
FROM EMPLE e1
WHERE salario = (SELECT MAX(salario) FROM EMPLE e2 WHERE e2.dept_no = e1.dept_no);

-- Con tuplas (PUNTO EXTRA EN NOTA GLOBAL +1)
SELECT apellido, salario, dept_no
FROM EMPLE e1
WHERE (salario, dept_no) IN (
    SELECT MAX(salario), dept_no
    FROM EMPLE
    GROUP BY dept_no
);

-- Ejercicio 23: Empleados con salario superior a la media de su departamento
-- Puntuación: 10
SELECT apellido, salario, dept_no
FROM EMPLE e1
WHERE salario > (SELECT AVG(salario) FROM EMPLE e2 WHERE e2.dept_no = e1.dept_no);

SELECT apellido, salario, dept_no
FROM EMPLE e1
WHERE (salario, dept_no) IN (
    SELECT AVG(salario)
    FROM EMPLE
    GROUP BY dept_no)

/*
-- Con tuplas
SELECT apellido, salario, dept_no
FROM EMPLE e1
WHERE (salario, dept_no) IN (
    SELECT salario, dept_no
    FROM EMPLE e2
    WHERE salario > (SELECT AVG(salario) FROM EMPLE e3 WHERE e3.dept_no = e2.dept_no)
);
*/