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
SELECT ENAME, TO_CHAR(HIREDATE, 'FMDDth Month, YYYY') FROM EMP AS fechas_contratacion_empleados;

-- 5. TO_DATE
-- Convierte la cadena '25-12-2024' (en formato texto) a un valor de tipo fecha, y compárala con las fechas de contratación (HIREDATE) de los empleados para encontrar quiénes fueron contratados antes de esa fecha.
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE < TO_DATE('25-12-2024', 'DD-MM-YYYY');

-- 6. TO_TIMESTAMP
-- Convierte la cadena '2024-12-25 15:30:45' (en formato texto) a un valor de tipo TIMESTAMP, y calcula la diferencia en días entre esa fecha y las fechas de contratación (HIREDATE).
SELECT ENAME, HIREDATE, (TO_TIMESTAMP('2024-12-25 15:30:45', 'YYYY-MM-DD HH24:MI:SS') - HIREDATE) AS diferencia_fecha_en_dias FROM EMP;

-- 7. TO_JSON
-- Convierte el nombre del empleado (ENAME) y su salario (SAL) en un formato JSON donde el nombre sea la clave y el salario el valor.
SELECT TO_JSON(ROW(ENAME, SAL)) AS json_empleado FROM EMP;

-- 8. TO_JSONB
-- Convierte la lista de nombres de empleados (ENAME) en formato JSON binario.
SELECT TO_JSONB(ARRAY(SELECT ENAME FROM EMP)) AS EMP_NAMES_JSONB;

-- 9. ARRAY_TO_STRING
-- Toma una lista de salarios (SAL) de los empleados en el departamento 10 y conviértela en una cadena separada por comas.
SELECT ARRAY_TO_STRING(ARRAY(SELECT SAL FROM EMP WHERE DEPTNO = 10), ', ') AS SALARIES_STRING FROM EMP WHERE DEPTNO = 10;

-- 10. STRING_TO_ARRAY
-- Convierte la cadena '1000,2000,3000' en un array y calcula el promedio de los valores en el array.
SELECT AVG(value::NUMERIC) AS AVERAGE FROM UNNEST(STRING_TO_ARRAY('1000,2000,3000', ',')) AS value;

-- 11. TEXT
-- Convierte el número de empleados (EMPNO) en texto y concaténalo con el año de contratación (HIREDATE), formando una cadena como 'Emp123 hired in 1985'.
SELECT ENPMO,  ENAME || ' hired in ' || EXTRACT(YEAR FROM HIREDATE) AS EMP_HIRE_INFO FROM EMP;

-- 12. NUMERIC
-- Convierte el campo COMM a un valor numérico de alta precisión y calcula el salario total (sumando el salario SAL y la comisión).
SELECT ENAME, SAL + COALESCE(COMM::NUMERIC, 0) AS TOTAL_SALARY FROM EMP;

-- 13. BOOLEAN
-- En base a las comisiones (COMM), clasifica a los empleados como TRUE si tienen comisión y FALSE si no la tienen.
SELECT ENAME, (COMM IS NOT NULL) AS HAS_COMMISSION FROM EMP;

-- 14. DATE_PART
-- Extrae el año de las fechas de contratación (HIREDATE) y calcula cuántos empleados fueron contratados en cada año.
SELECT EXTRACT(YEAR FROM HIREDATE) AS HIRE_YEAR, COUNT(*) AS EMPLOYEE_COUNT FROM EMP GROUP BY HIRE_YEAR ORDER BY HIRE_YEAR;

-- 15. DATE
-- Convierte las fechas de contratación (HIREDATE) a un formato de solo año y mes, ignorando el día.

-- 16. INTEGER
-- Convierte los salarios (SAL) de los empleados a enteros y calcula la suma total.