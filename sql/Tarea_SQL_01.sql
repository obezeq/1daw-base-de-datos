/*
Tarea SQL_01
*/

/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */
/* **Tablas EMPLE y DEPART***/
/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */

/*1. **Seleccionar de la tabla EMPLE, aquellas filas cuyo APELLIDO empiece por "A" y el OFICIO tenga una "E" en cualquier posición.***/
/*Puntuación: 10*/

SELECT *
FROM EMPLE
WHERE APELLIDO LIKE 'A%' AND OFICIO LIKE '%E%';


/*2. **Seleccionar el APELLIDO, OFICIO y LOCALIDAD de los empleados que son ANALISTAS.***/
/*Puntuación: 10*/

SELECT E.APELLIDO, E.OFICIO, D.LOC
FROM EMPLE E
JOIN DEPART D ON E.DEPT_NO = D.DEPT_NO
WHERE E.OFICIO = 'ANALISTA';


/*3. **Mostrar los empleados (nombre, oficio, salario y fecha de alta) que desempeñen el mismo oficio que "JIMENEZ" o que tengan un salario mayor o igual que "FERNANDEZ".***/
/*Puntuación: 10*/

SELECT APELLIDO, OFICIO, SALARIO, FECHA_ALT
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO FROM EMPLE WHERE APELLIDO = 'JIMENEZ')
   OR SALARIO >= (SELECT SALARIO FROM EMPLE WHERE APELLIDO = 'FERNANDEZ');

/*4. **Mostrar en pantalla el nombre, oficio y salario de los empleados del departamento de "FERNANDEZ" que tengan su mismo salario.***/
/*Puntuación: 10 ???*/

SELECT E.APELLIDO, E.OFICIO, E.SALARIO
FROM EMPLE E
JOIN DEPART D ON E.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NO = (SELECT DEPT_NO FROM EMPLE WHERE APELLIDO = 'FERNANDEZ')
  AND E.SALARIO = (SELECT SALARIO FROM EMPLE WHERE APELLIDO = 'FERNANDEZ');


/*5. **Mostrar los nombres y oficios de los empleados que tienen el mismo trabajo que "JIMENEZ".***/
/*Puntuación: 10*/

SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO FROM EMPLE WHERE APELLIDO = 'JIMENEZ');



/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */
/* **Tabla LIBRERIA***/
/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */

/*6. **Visualizar el tema, estante y ejemplares de las filas de LIBRERIA con ejemplares comprendidos entre 8 y 15.***/
/*Puntuación: 10*/

SELECT TEMA, ESTANTE, EJEMPLARES
FROM LIBRERIA
WHERE EJEMPLARES BETWEEN 8 AND 15;


/*7. **Visualizar las columnas tema, estante y ejemplares de las filas cuyo ESTANTE no esté comprendido entre la "B" y la "D".***/
/*Puntuación: 10*/

SELECT TEMA, ESTANTE, EJEMPLARES
FROM LIBRERIA
WHERE ESTANTE NOT BETWEEN 'B' AND 'D';


/*8. **Visualizar con una única orden SELECT (subconsulta) todos los temas de LIBRERIA cuyo número de ejemplares sea inferior a los que hay en "Medicina".***/
/*Puntuación: 10*/

SELECT TEMA
FROM LIBRERIA
WHERE EJEMPLARES < (SELECT EJEMPLARES FROM LIBRERIA WHERE LOWER(TEMA) = 'medicina');


/*9. **Visualizar los temas de LIBRERIA cuyo número de ejemplares no esté entre 15 y 20, ambos incluidos.***/
/*Puntuación: 10*/

SELECT TEMA
FROM LIBRERIA
WHERE EJEMPLARES NOT BETWEEN 15 AND 20;



/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */
/* ### **Tablas ALUMNOS, ASIGNATURAS y NOTAS***/
/* ─────────────────────────────────────────────────────────────────────────────────────────────────── */

/*10. **Visualizar todas las ASIGNATURAS que contengan tres letras "o" en su nombre y tengan alumnos matriculados en "Madrid".***/
/*Puntuación: 10*/

SELECT A.NOMBRE
FROM ASIGNATURAS A
JOIN NOTAS N ON A.COD = N.COD
JOIN ALUMNOS AL ON N.DNI = AL.DNI
WHERE A.NOMBRE LIKE '%o%o%o%' AND LOWER(AL.POBLA) = 'madrid';


/*11. **Visualizar los nombres de los alumnos que tengan una nota entre 7 y 8 en la asignatura "FOL".***/
/*Puntuación: 10*/

SELECT AL.APENOM
FROM ALUMNOS AL
JOIN NOTAS N ON AL.DNI = N.DNI
JOIN ASIGNATURAS A ON N.COD = A.COD
WHERE A.NOMBRE = 'FOL' AND N.NOTA BETWEEN 7 AND 8;


/*12. **Mostrar los nombres de los alumnos de Madrid que tengan alguna asignatura suspendida.***/
/*Puntuación: 10*/

SELECT DISTINCT AL.APENOM
FROM ALUMNOS AL
JOIN NOTAS N ON AL.DNI = N.DNI
WHERE AL.POBLA = 'Madrid' AND N.NOTA < 5;


/*13. **Mostrar los nombres de las asignaturas que no tengan suspensos.***/
/*Puntuación: 10*/

SELECT A.NOMBRE
FROM ASIGNATURAS A
WHERE A.COD NOT IN (
    SELECT DISTINCT N.COD
    FROM NOTAS N
    WHERE N.NOTA < 5
);


/*14. **Mostrar los nombres de los alumnos que tengan la misma nota que tiene "Diaz Fernandez, Maria" en "FOL" en alguna asignatura.***/
/*Puntuación: 10*/

SELECT DISTINCT AL.APENOM
FROM ALUMNOS AL
JOIN NOTAS N ON AL.DNI = N.DNI
WHERE N.NOTA = (
    SELECT N.NOTA
    FROM NOTAS N
    JOIN ALUMNOS AL ON N.DNI = AL.DNI
    JOIN ASIGNATURAS A ON N.COD = A.COD
    WHERE AL.APENOM = 'Diaz Fernandez, Maria' AND A.NOMBRE = 'FOL'
);