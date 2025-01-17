---------------------------------------------------------------------------------------------------
-- Ejercicios para trabajar con funciones de fechas en PostgreSQL:
---------------------------------------------------------------------------------------------------

------------------------------------------------------------------

-- 1. CAST
-- Convierte la columna COMM de la tabla EMP (actualmente en formato texto) a un tipo de dato numérico, y calcula la suma total de las comisiones.
SELECT SUM(CAST(COMM AS NUMERIC)) AS total_commissions FROM EMP;

-- 2. Operador ::
-- Convierte el valor del número de empleados (EMPNO) en la tabla EMP a texto, y concaténalo con el nombre del empleado (ENAME) en un campo llamado employee_info.
SELECT EMPNO::TEXT || ' ' || ENAME FROM EMP AS employee_info;

-- 3. TO_NUMBER
-- En un sistema externo, las comisiones (COMM) de los empleados fueron guardadas como texto con el formato '1,234.56'. Usa TO_NUMBER para convertir estas cadenas en valores numéricos y calcula la comisión promedio.
SELECT AVG(COMM) AS media_comision FROM EMP WHERE COMM IS NOT NULL;

-- 4. TO_CHAR
-- Muestra las fechas de contratación (HIREDATE) de los empleados en un formato legible como '25th December, 2024'.

-- 5. TO_DATE
-- Convierte la cadena '25-12-2024' (en formato texto) a un valor de tipo fecha, y compárala con las fechas de contratación (HIREDATE) de los empleados para encontrar quiénes fueron contratados antes de esa fecha.

-- 6. TO_TIMESTAMP
-- Convierte la cadena '2024-12-25 15:30:45' (en formato texto) a un valor de tipo TIMESTAMP, y calcula la diferencia en días entre esa fecha y las fechas de contratación (HIREDATE).

-- 7. TO_JSON
-- Convierte el nombre del empleado (ENAME) y su salario (SAL) en un formato JSON donde el nombre sea la clave y el salario el valor.

-- 8. TO_JSONB
-- Convierte la lista de nombres de empleados (ENAME) en formato JSON binario.

-- 9. ARRAY_TO_STRING
-- Toma una lista de salarios (SAL) de los empleados en el departamento 10 y conviértela en una cadena separada por comas.

-- 10. STRING_TO_ARRAY
-- Convierte la cadena '1000,2000,3000' en un array y calcula el promedio de los valores en el array.

-- 11. TEXT
-- Convierte el número de empleados (EMPNO) en texto y concaténalo con el año de contratación (HIREDATE), formando una cadena como 'Emp123 hired in 1985'.

-- 12. NUMERIC
-- Convierte el campo COMM a un valor numérico de alta precisión y calcula el salario total (sumando el salario SAL y la comisión).

-- 13. BOOLEAN
-- En base a las comisiones (COMM), clasifica a los empleados como TRUE si tienen comisión y FALSE si no la tienen.

-- 14. DATE_PART
-- Extrae el año de las fechas de contratación (HIREDATE) y calcula cuántos empleados fueron contratados en cada año.

-- 15. DATE
-- Convierte las fechas de contratación (HIREDATE) a un formato de solo año y mes, ignorando el día.

-- 16. INTEGER
-- Convierte los salarios (SAL) de los empleados a enteros y calcula la suma total.