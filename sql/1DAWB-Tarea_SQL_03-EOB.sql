/*
Tarea SQL_03
- Curso: 1ºDAW B
- Fecha: 07/02/2025
*/

/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */
/* **Tablas SQL_03** */
/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */

-- Tarea-SQL 03 (group by and having)
-- Nota: Las tablas EMPLE y DEPART no existen en el esquema proporcionado. 
-- Se adaptará usando las tablas PERSONAL (como EMPLE) y CENTROS (como DEPART).
-- La tabla LIBRERIA tampoco existe, se intentará inferir con datos disponibles.

-- 1. Visualizar los departamentos (centros) donde el salario medio es mayor o igual al promedio general.
SELECT cod_centro, AVG(salario) AS salario_medio
FROM personal
GROUP BY cod_centro
HAVING AVG(salario) >= (SELECT AVG(salario) FROM personal);

-- 2. Nº de 'profesores' en el centro 'IES El Quijote'
SELECT COUNT(*) AS num_profesores
FROM personal 
WHERE funcion = 'PROFESOR' 
  AND cod_centro = (SELECT cod_centro FROM centros WHERE nombre = 'IES El Quijote');

-- 3. Suma de salarios por función en el centro 'IES El Quijote'.
SELECT funcion, SUM(salario) AS total_salarios
FROM personal 
WHERE cod_centro = (SELECT cod_centro FROM centros WHERE nombre = 'IES El Quijote')
GROUP BY funcion;

-- 4. Apellidos cuyo salario coincide con la media de su centro.
SELECT apellidos, salario
FROM personal p
WHERE salario = (
    SELECT AVG(salario) 
    FROM personal 
    WHERE cod_centro = p.cod_centro
);

-- 5. Nº de 'profesores' por centro (asumiendo 'EMPLEADO' como 'PROFESOR').
SELECT cod_centro, COUNT(*) AS num_empleados
FROM personal 
WHERE funcion = 'PROFESOR'
GROUP BY cod_centro;

-- 6. Centro con más 'profesores' (adaptado para oficio 'EMPLEADO').
SELECT cod_centro
FROM personal 
WHERE funcion = 'PROFESOR'
GROUP BY cod_centro
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- 7. Código y nombre del centro con más 'profesores'.
SELECT c.cod_centro, c.nombre
FROM centros c
JOIN (
    SELECT cod_centro, COUNT(*) AS total
    FROM personal 
    WHERE funcion = 'PROFESOR'
    GROUP BY cod_centro
    ORDER BY total DESC 
    LIMIT 1
) AS sub ON c.cod_centro = sub.cod_centro;

-- 8. Centros con más de dos personas en la misma función.
SELECT cod_centro, funcion
FROM personal 
GROUP BY cod_centro, funcion
HAVING COUNT(*) > 2;

-- 9. Suma de ejemplares por estante (asumiendo LIBRERIA como PARALEER y COD_LIBRO como estante).
SELECT cod_libro AS estante, COUNT(*) AS total_ejemplares
FROM paraleer 
GROUP BY cod_libro;

-- 10. Estante (COD_LIBRO) con más libros en PARALEER.
SELECT cod_libro AS estante
FROM paraleer 
GROUP BY cod_libro
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- 11. Estantes ordenados descendentemente.
SELECT DISTINCT cod_libro AS estante
FROM paraleer 
ORDER BY estante DESC;

-- 12. Número de libros (temas) por estante.
SELECT cod_libro AS estante, COUNT(*) AS num_temas
FROM paraleer 
GROUP BY cod_libro;

-- 13. Estantes con exactamente tres temas (no aplicable, se lista vacío por falta de datos).
SELECT cod_libro AS estante
FROM paraleer 
GROUP BY cod_libro
HAVING COUNT(*) = 3;