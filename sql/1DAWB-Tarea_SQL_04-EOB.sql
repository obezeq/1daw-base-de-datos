/*
Tarea SQL_04
- Curso: 1ºDAW B
<<<<<<< HEAD
- Fecha: 18/02/2025
- Nombre: Ezequiel Ortega Bravo
=======
- Fecha: 07/02/2025
>>>>>>> 0056fe5c94e0202e2d9368f5af6997ec2848071b
*/

/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */
/* **Ejercicios SQL_04** */
/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */

-- Tarea-SQL 04 (outerjoin, group by, having, minus, intersect....)
-- Para hacer esta relación de ejercicios vuelve a cargar el script datos03.sql

-- 1. Por cada centro y especialidad, número de profesores (incluyendo centros sin profesores)
<<<<<<< HEAD
SELECT
=======
SELECT 
>>>>>>> 0056fe5c94e0202e2d9368f5af6997ec2848071b
    C.COD_CENTRO, 
    C.NOMBRE AS NOMBRE_CENTRO, 
    P.ESPECIALIDAD, 
    COUNT(P.DNI) AS NUM_PROFESORES
FROM CENTROS C
LEFT JOIN PROFESORES P ON C.COD_CENTRO = P.COD_CENTRO
GROUP BY C.COD_CENTRO, C.NOMBRE, P.ESPECIALIDAD
ORDER BY C.COD_CENTRO;

-- 2. Código, nombre y nº de empleados por centro (incluyendo centros sin empleados)
SELECT 
    C.COD_CENTRO, 
    C.NOMBRE AS NOMBRE_CENTRO, 
    COUNT(P.DNI) AS NUM_EMPLEADOS
FROM CENTROS C
LEFT JOIN PERSONAL P ON C.COD_CENTRO = P.COD_CENTRO
GROUP BY C.COD_CENTRO, C.NOMBRE
ORDER BY C.COD_CENTRO;

-- 3. Especialidad con menos profesores
SELECT ESPECIALIDAD, COUNT(*) AS NUM_PROFESORES
FROM PROFESORES
GROUP BY ESPECIALIDAD
HAVING COUNT(*) = (
    SELECT MIN(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM PROFESORES
        GROUP BY ESPECIALIDAD
    ) AS sub
);

-- 4. Nº de empleados por función
SELECT FUNCION, COUNT(*) AS NUM_EMPLEADOS
FROM PERSONAL
GROUP BY FUNCION;

-- 5. Alumnos de ALUM que están en ANTIGUOS o NUEVOS (usando UNION)
SELECT NOMBRE
FROM ALUM
WHERE NOMBRE IN (
    SELECT NOMBRE FROM ANTIGUOS
    UNION
    SELECT NOMBRE FROM NUEVOS
);

-- 6. Otra forma (usando OR con EXISTS)
SELECT DISTINCT A.NOMBRE
FROM ALUM A
WHERE EXISTS (SELECT 1 FROM ANTIGUOS AN WHERE A.NOMBRE = AN.NOMBRE)
    OR EXISTS (SELECT 1 FROM NUEVOS NU WHERE A.NOMBRE = NU.NOMBRE);

-- 7. Alumnos de ALUM que están en ANTIGUOS y NUEVOS (usando INTERSECT)
SELECT NOMBRE
FROM ALUM
WHERE NOMBRE IN (
    SELECT NOMBRE FROM ANTIGUOS
    INTERSECT
    SELECT NOMBRE FROM NUEVOS
);

-- 8. Otra forma (usando AND con EXISTS)
SELECT DISTINCT A.NOMBRE
FROM ALUM A
WHERE EXISTS (SELECT 1 FROM ANTIGUOS AN WHERE A.NOMBRE = AN.NOMBRE)
    AND EXISTS (SELECT 1 FROM NUEVOS NU WHERE A.NOMBRE = NU.NOMBRE);

-- 9. Alumnos de ALUM que no están en ANTIGUOS ni NUEVOS (usando NOT IN)
SELECT NOMBRE
FROM ALUM
WHERE NOMBRE NOT IN (
    SELECT NOMBRE FROM ANTIGUOS
    UNION
    SELECT NOMBRE FROM NUEVOS
);