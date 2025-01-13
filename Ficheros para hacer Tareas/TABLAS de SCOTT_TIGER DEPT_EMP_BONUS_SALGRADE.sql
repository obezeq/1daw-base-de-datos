-- CON ESTE SCRIPT DE SQL VAMOS A GENERAR LAS TABLAS DEPT, EMP,BONUS Y SALGRADE,
-- QUE NOS SERVIRAN PARA PRACTICAR 


-- Borrar la tabla EMP
DROP TABLE IF EXISTS EMP CASCADE;

-- Borrar la tabla DEPT
DROP TABLE IF EXISTS DEPT CASCADE;

-- Borrar la tabla BONUS
DROP TABLE IF EXISTS BONUS CASCADE;

-- Borrar la tabla SALGRADE
DROP TABLE IF EXISTS SALGRADE CASCADE;

-- Nota:
-- CASCADE asegura que todas las restricciones (como claves foráneas) que dependen de estas tablas también se eliminen.
-- Se verifica si las tablas existen antes de intentar eliminarlas, para evitar errores.


-- Crear la tabla DEPT
CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY,        -- Número de departamento
    DNAME VARCHAR(14),             -- Nombre del departamento
    LOC VARCHAR(13)                -- Ubicación
);

-- Crear la tabla EMP
CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,         -- Número del empleado
    ENAME VARCHAR(10),             -- Nombre del empleado
    JOB VARCHAR(9),                -- Puesto de trabajo
    MGR INT,                       -- Manager (autorreferencia)
    HIREDATE DATE,                 -- Fecha de contratación
    SAL NUMERIC(7, 2),             -- Salario
    COMM NUMERIC(7, 2),            -- Comisión
    DEPTNO INT REFERENCES DEPT     -- Clave foránea a DEPT
);

-- Crear la tabla BONUS
CREATE TABLE BONUS (
    ENAME VARCHAR(10),             -- Nombre del empleado
    JOB VARCHAR(9),                -- Puesto de trabajo
    SAL NUMERIC(7, 2),             -- Salario
    COMM NUMERIC(7, 2)             -- Comisión
);

-- Crear la tabla SALGRADE
CREATE TABLE SALGRADE (
    GRADE INT PRIMARY KEY,         -- Grado de salario
    LOSAL NUMERIC(7, 2),           -- Salario mínimo
    HISAL NUMERIC(7, 2)            -- Salario máximo
);

-- Insertar datos iniciales en DEPT
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- Insertar datos iniciales en EMP
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000, NULL, 20),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

-- Insertar datos iniciales en BONUS
INSERT INTO BONUS (ENAME, JOB, SAL, COMM) VALUES
('ALLEN', 'SALESMAN', 1600, 300),
('WARD', 'SALESMAN', 1250, 500),
('MARTIN', 'SALESMAN', 1250, 1400),
('TURNER', 'SALESMAN', 1500, 0);

-- Insertar datos iniciales en SALGRADE
INSERT INTO SALGRADE (GRADE, LOSAL, HISAL) VALUES
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);
