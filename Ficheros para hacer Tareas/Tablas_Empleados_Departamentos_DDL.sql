DROP TABLE IF EXISTS empleados CASCADE; 
DROP TABLE IF EXISTS departamentos CASCADE; 

-- Crear tabla empleados
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    salario NUMERIC(10, 2),
    departamento_id INT
);

-- Insertar datos en empleados
INSERT INTO empleados (nombre, salario, departamento_id) VALUES
('Juan', 2500.00, 1),
('Ana', 3200.00, 2),
('Luis', 1800.00, 1),
('Marta', 2700.00, 3),
('Carlos', 3000.00, 2);

-- Crear tabla departamentos
CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    ubicacion VARCHAR(50)
);

-- Insertar datos en departamentos
INSERT INTO departamentos (nombre, ubicacion) VALUES
('Ventas', 'Madrid'),
('Marketing', 'Barcelona'),
('IT', 'Valencia');
