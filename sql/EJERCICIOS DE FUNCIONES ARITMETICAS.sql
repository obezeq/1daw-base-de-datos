---------------------------------------------------------------------------------------------------
-- Ejercicios de FUNCIONES ARITMETICAS:
---------------------------------------------------------------------------------------------------



------------------------------------------------------------------

-- Funciones Matemáticas de Valores Simples

-- (1) ABS => Determina cuánto se desvía el salario (SAL) de cada empleado respecto a un promedio de 3000. Muestra el valor absoluto de esa diferencia.
SELECT ENAME, ABS(SAL - 3000) AS SALARIO_DESVIADO FROM EMP;

-- (2) CEIL / CEILING => Redondea hacia arriba las comisiones (COMM) de los empleados a números enteros.
SELECT ENAME, CEIL(COALESCE(COMM, 0)) AS rounded_commission
FROM EMP;

-- (3) FLOOR => Redondea hacia abajo los salarios (SAL) de los empleados a números enteros.
SELECT ENAME, FLOOR(COMM) AS SALARIO_REDONDEADO_ABAJO FROM EMP;

-- (4) ROUND => Calcula la bonificación que recibiría cada empleado si esta fuera del 10% de su salario, redondeada a dos decimales.
SELECT ENAME, ROUND(SAL * 0.1, 2) AS BONIFICACION_EMPLEADO_10_SALARIO FROM EMP;

-- (5) POWER => Eleva el salario (SAL) de cada empleado al cuadrado para calcular una métrica ficticia de desempeño.
SELECT ENAME, POWER(SAL, 2) AS SALARIO_AL_CUADRADO FROM EMP;

-- (6) SQRT => Calcula la raíz cuadrada del salario (SAL) de cada empleado para un análisis de distribución salarial.
SELECT ENAME, SQRT(SAL) AS ANALISIS_DISTRIBUCION_SALARIAL FROM EMP;

-- (7) EXP => Usa el salario (SAL) de cada empleado como exponente base para el número e. Interpreta el resultado como un índice de crecimiento hipotético.
SELECT ENAME, EXP(SAL / 1000) AS INDICE_CRECIMIENTO_E_SALARIAL FROM EMP;

-- (8) LN => Calcula el logaritmo natural del salario (SAL) de los empleados que ganan más de 2000.
SELECT ENAME, LN(SAL) AS LOGARITMO_NATURAL_SALARIO FROM EMP WHERE SAL > 2000;

-- (9) LOG => Calcula el logaritmo base 10 de la comisión (COMM) de los empleados, ignorando las comisiones nulas.
SELECT ENAME, LOG(10, COMM) AS LOG_BASE_10_COMISION_EMPLEADO FROM EMP WHERE COMM IS NOT NULL AND COMM != 0;

-- (10) RANDOM => Genera un número aleatorio entre 0 y 1 para cada empleado, representando una probabilidad de obtener una bonificación especial.
SELECT ENAME, RANDOM() AS PROBABILIDAD_BONIFIICACION_ESPECIAL FROM EMP;

-- (11) TRUNC => Trunca los salarios (SAL) de los empleados a un decimal.
SELECT ENAME, RUNC(SAL, 1) AS SALARIO_UN_DECIMAL FROM EMP;


------------------------------------------------------------------

-- Funciones Matemáticas de Grupo de Valores

-- (12) SUM => Calcula el total de salarios (SAL) por departamento.
SELECT DEPTNO, SUM(SAL) AS TOTAL_SALARIO_DEPARTAMENTO FROM EMP GROUP BY DEPTNO;

-- (13) AVG => Encuentra el salario promedio de los empleados por departamento.
SELECT DEPTNO, AVG(SAL) AS SALARIO_PROMEDIO_DEPARTAMENTO FROM EMP GROUP BY DEPTNO;

-- (14) MIN => Determina el salario más bajo de todos los empleados.
SELECT MIN(SAL) AS SALARIO_MINIMO_EMPLEADOS FROM EMP;

-- (15) MAX => Encuentra el salario más alto de todos los empleados.
SELECT MAX(SAL) AS SALARIO_MAXIMO_EMPLEADOS FROM EMP;

-- (16) COUNT => Cuenta cuántos empleados hay en cada departamento.
SELECT DEPTNO, COUNT(SAL) NUMERO_EMPLEADOS_DEPARTAMENTO FROM EMP GROUP BY DEPTNO
-- Profesor: SELECT DEPTNO, COUNT(*) NUMERO_EMPLEADOS_DEPARTAMENTO FROM EMP GROUP BY DEPTNO

-- (17) VARIANCE => Calcula la varianza de los salarios (SAL) de todos los empleados.
SELECT VARIANCE(SAL) AS VARIANZA_SALARIOS_EMPLEADOS FROM EMP;

-- (18) STDDEV => Calcula la desviación estándar de los salarios (SAL) de todos los empleados.
SELECT STDDEV(SAL) AS DESVIACION_ESTANDAR_SALARIOS FROM EMP;

------------------------------------------------------------------

-- Funciones Matemáticas de Listas

-- (19) GREATEST => Determina el valor más alto entre el salario (SAL) y la comisión (COMM) de cada empleado. Si la comisión es nula, reemplázala por 0.
SELECT ENAME, GREATEST(SAL, COALESCE(COMM, 0)) AS VALOR_MAS_ALTO_SALARIO FROM EMP;

-- (20) LEAST => Encuentra el menor valor entre el salario (SAL) y el número de empleados en el departamento del empleado.
SELECT deptno, LEAST(min(sal)) AS Menor_Valor
FROM EMP
GROUP BY DEPTNO;

SELECT ENAME,
LEAST(
    SAL,
    (SELECT COUNT(*)
    FROM EMP
    WHERE EMP.DEPTNO=E.DEPTNO)
) 
AS least_value
FROM EMP E;


------------------------------------------------------------------
