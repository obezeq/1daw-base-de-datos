/*
Tarea SQL_03
- Curso: 1ºDAW B
- Fecha: 07/02/2025
- Nota: 9.11
*/

/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */
/* **Tablas SQL_03** */
/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */

-- Tarea-SQL 03 (group by and having)
-- Nota: Las tablas EMPLE y DEPART no existen en el esquema proporcionado. 
-- Se adaptará usando las tablas PERSONAL (como EMPLE) y CENTROS (como DEPART).
-- La tabla LIBRERIA tampoco existe, se intentará inferir con datos disponibles.


-- 1. Departamentos con salario medio mayor o igual que la media de todos los salarios
-- Puntuacion: 10
SELECT DEPT_NO 
FROM EMPLE 
GROUP BY DEPT_NO 
HAVING AVG(SALARIO) >= (SELECT AVG(SALARIO) FROM EMPLE);

-- 2. Número de vendedores en el departamento 'VENTAS'
-- Puntuacion: 10
SELECT COUNT(*) 
FROM EMPLE 
WHERE OFICIO = 'VENDEDOR' 
AND DEPT_NO = (SELECT DEPT_NO FROM DEPART WHERE DNOMBRE = 'VENTAS');

-- 3. Suma de salarios por oficio en el departamento 'VENTAS'
-- Puntuacion: 10
SELECT OFICIO, SUM(SALARIO) AS TOTAL_SALARIO 
FROM EMPLE 
WHERE DEPT_NO = (SELECT DEPT_NO FROM DEPART WHERE DNOMBRE = 'VENTAS') 
GROUP BY OFICIO;

-- 4. Apellidos con salario igual a la media de su departamento
-- Puntuacion: 10
SELECT APELLIDO 
FROM EMPLE e1 
WHERE SALARIO = (SELECT AVG(SALARIO) FROM EMPLE e2 WHERE e1.DEPT_NO = e2.DEPT_NO);

-- 5. Número de empleados por departamento cuyo oficio sea 'EMPLEADO'
-- Puntuacion: 10
SELECT DEPT_NO, COUNT(*) AS NUM_EMPLEADOS 
FROM EMPLE 
WHERE OFICIO = 'EMPLEADO' 
GROUP BY DEPT_NO;

-- 6. Departamento con más empleados cuyo oficio sea 'EMPLEADO'
-- Puntuacion: 6

SELECT DEPT_NO 
FROM EMPLE
WHERE OFICIO = 'EMPLEADO' 
GROUP BY DEPT_NO 
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 7. Código y nombre del departamento con más empleados cuyo oficio sea 'EMPLEADO'
-- Puntuacion: 6

SELECT d.DEPT_NO, d.DNOMBRE 
FROM DEPART d 
JOIN EMPLE e ON d.DEPT_NO = e.DEPT_NO 
WHERE e.OFICIO = 'EMPLEADO' 
GROUP BY d.DEPT_NO, d.DNOMBRE 
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- 8. Departamentos con más de dos empleados en el mismo oficio
-- Puntuacion: 10
SELECT DEPT_NO, OFICIO 
FROM EMPLE 
GROUP BY DEPT_NO, OFICIO 
HAVING COUNT(*) > 2;

-- 9. Suma de ejemplares por estante
-- Puntuacion: 10

SELECT ESTANTE, SUM(EJEMPLARES) AS TOTAL_EJEMPLARES 
FROM LIBRERIA 
GROUP BY ESTANTE;

-- 10. Estante con más ejemplares
-- Puntuacion: 6,5
SELECT ESTANTE 
FROM LIBRERIA 
GROUP BY ESTANTE 
ORDER BY SUM(EJEMPLARES) DESC 
LIMIT 1;

-- 11. Diferentes estantes ordenados descendentemente
-- Puntuacion: 10
SELECT DISTINCT ESTANTE 
FROM LIBRERIA 
ORDER BY ESTANTE DESC;

-- 12. Cuántos temas tiene cada estante
-- Puntuacion: 10
SELECT ESTANTE, COUNT(DISTINCT TEMA) AS NUM_TEMAS 
FROM LIBRERIA 
GROUP BY ESTANTE;

-- 13. Estantes con tres temas
-- Puntuacion: 10
SELECT ESTANTE 
FROM LIBRERIA 
GROUP BY ESTANTE 
HAVING COUNT(DISTINCT TEMA) = 3;
