-- ==========================================================
-- Autoevaluacion 2 - Queries
-- ==========================================================
-- Para crear las tablas y rellenarlas ejecutar los queries en el orden presentados
-- Tabla 'departamentos'
CREATE TABLE
    departamentos (
        id_departamento INT PRIMARY KEY,
        nombre_departamento VARCHAR(100) NOT NULL
    );

-- Tabla 'empleados'
CREATE TABLE
    empleados (
        id_empleado INT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        salario INT,
        id_departamento INT,
        FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento) -- Referencia a tabla 'departamentos' (relacion)
    );

-- Datos para tabla 'departamentos'
INSERT INTO
    departamentos (id_departamento, nombre_departamento)
VALUES
    (1, 'Recursos Humanos'),
    (2, 'Marketing'),
    (3, 'Ventas'),
    (4, 'Desarrollo');

-- Datos para tabla 'empleados'
INSERT INTO
    empleados (
        id_empleado,
        nombre,
        apellido,
        salario,
        id_departamento
    )
VALUES
    (101, 'Juan', 'Pérez', 50000, 4),
    (102, 'Ana', 'García', 60000, 4),
    (103, 'Carlos', 'López', 45000, 3),
    (104, 'Sofía', 'Martínez', 55000, 2),
    (105, 'Luis', 'Fernández', 52000, 3),
    (106, 'María', 'Díaz', 70000, 4),
    (107, 'Pedro', 'Ruíz', 48000, 1);

-- ==========================================================
-- Queries de la autoevaluacion
-- ==========================================================
-- 1
SELECT
    *
FROM
    Empleados
WHERE
    id_empleado = 103;

-- 2
SELECT
    MIN(salario)
FROM
    Empleados;

-- 3
SELECT
    nombre,
    apellido
FROM
    Empleados
WHERE
    salario > 55000;

-- 4
SELECT
    nombre_departamento
FROM
    Departamentos
WHERE
    id_departamento = 4;

-- 5
SELECT
    nombre,
    salario
FROM
    Empleados
ORDER BY
    salario DESC;

-- 6
SELECT
    nombre_departamento
FROM
    Departamentos
ORDER BY
    nombre_departamento ASC;

-- 7
SELECT
    nombre,
    apellido
FROM
    Empleados
ORDER BY
    nombre ASC
LIMIT
    2;

-- 8
SELECT
    nombre,
    apellido
FROM
    Empleados
ORDER BY
    id_empleado ASC
LIMIT
    2
OFFSET
    3;

-- 9
SELECT
    COUNT(*)
FROM
    Empleados;

-- 10
SELECT
    AVG(salario)
FROM
    Empleados
WHERE
    id_departamento = 4;