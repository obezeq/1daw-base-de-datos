---------------------------------------------------------------------------------------------------
-- Ejercicios para trabajar con funciones de fechas en PostgreSQL:
---------------------------------------------------------------------------------------------------

------------------------------------------------------------------

-- 1. Fecha actual
-- a) Obtén la fecha actual sin incluir la hora. 
SELECT CURRENT_DATE;

-- b) Muestra la hora actual sin incluir la fecha.
SELECT CURRENT_TIME;

-- c) Devuelve la fecha y hora actuales con precisión de microsegundos.
SELECT CURRENT_TIMESTAMP;

-- 2. Diferencias entre fechas
-- a) Calcula cuántos años, meses y días hay entre el 1 de enero de 2000 y el 25 de diciembre de 2024 usando la función adecuada.
SELECT AGE('2025-12-12'::DATE, '2000-01-01'::DATE); -- OTRA OPCIÓN: SELECT AGE('2025-12-12', '2000-01-01');

-- b) Calcula la diferencia en días entre las fechas 1 de enero de 2022 y 15 de marzo de 2023.
SELECT '2023-03-15'::DATE - '2022-01-01'::DATE;

-- 3. Extraer partes específicas de una fecha

-- a) Extrae el año actual de la fecha CURRENT_DATE.
SELECT EXTRACT(YEAR FROM CURRENT_DATE);

-- b) Obtén el trimestre del año correspondiente a la fecha 2024-12-25.
SELECT EXTRACT(QUARTER FROM '2024-12-25'::DATE);

-- c) Extrae el día de la semana de la fecha actual.
SELECT EXTRACT(DOW FROM CURRENT_DATE);

-- 4. Manipulación de fechas
-- a) Añade 3 meses a la fecha actual usando una función de intervalos.
SELECT CURRENT_DATE + INTERVAL '3 months';

-- b) Ajusta un intervalo de 400 días para que se represente en años, meses y días.
SELECT JUSTIFY_DAYS(INTERVAL '400 days');

-- c) Suma 49 horas a la hora actual y ajusta el resultado para mostrarlo en días y horas.
SELECT CURRENT_DATE + INTERVAL '1 month';	

-- 5. Truncar fechas
-- a) Trunca la fecha actual al inicio del mes.
SELECT DATE_TRUNC('month', CURRENT_DATE);

-- b) Trunca la fecha 2024-12-25 al inicio del año.
SELECT DATE_TRUNC('year', DATE '2024-12-25');


-- 6. Conversión de texto a fecha y viceversa
-- a) Convierte la cadena '25-12-2024' al formato fecha.
SELECT TO_DATE('25-12-2024', 'DD-MM-YYYY');

-- b) Convierte la fecha actual a texto con el formato 'Day, DD Month YYYY'.
SELECT TO_CHAR(CURRENT_DATE, 'Day, DD Month, YYYY');

-- c) Convierte la marca de tiempo '2024-12-25 15:30:00' a texto con el formato 'YYYY/MM/DD HH24:MI:SS'.
SELECT TO_CHAR('2024-12-25 15:30:00'::DATE, 'YYYY/MM/DD HH24:MI:SS');

-- 7. Diferencia de tiempo en zonas horarias
-- a) Convierte la fecha y hora actual a la zona horaria 'America/New_York'.
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'America/New_York';

-- b) Muestra la fecha actual con precisión y en la zona horaria 'Europe/Madrid'.
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Madrid';

-- 8. Validación de fechas
-- a) Comprueba si la fecha '2024-12-25' es finita.
SELECT ISFINITE('2024-12-25'::DATE);

-- b) Verifica si la fecha 'infinity' es válida usando la función adecuada.
SELECT 'infinity'::DATE IS NOT NULL;