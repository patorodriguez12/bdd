-- ====================================================================
-- Ejercicios de consultas SQL simples
-- ====================================================================
-- Considerar una base de datos que ya tiene las siguientes tablas:
-- ====================================================================
-- Tabla 'clientes'
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);

-- Datos para tabla 'clientes'
INSERT INTO
  clientes (id_cliente, nombre, email)
VALUES
  (1, 'Lautaro Rossi', 'lautaro.rossi@email.com'),
  (
    2,
    'Valentina Morales',
    'valentina.morales@email.com'
  ),
  (3, 'Mateo Benítez', 'mateo.benitez@email.com'),
  (4, 'Camila Herrera', 'camila.herrera@email.com'),
  (5, 'Facundo Castro', 'facundo.castro@email.com');

-- ====================================================================
-- Tabla 'departamentos'
CREATE TABLE departamentos (
  id_departamento INT PRIMARY KEY,
  nombre_departamento VARCHAR(50) NOT NULL
);

-- Datos para tabla 'departamentos'
INSERT INTO
  departamentos (id_departamento, nombre_departamento)
VALUES
  (1, 'Recursos Humanos'),
  (2, 'Ventas'),
  (3, 'Sistemas'),
  (4, 'Marketing'),
  (5, 'Finanzas');

-- ====================================================================
-- Tabla 'empleados'
CREATE TABLE empleados (
  id_empleado INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  salario INT,
  id_departamento INT,
  FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento)
);

-- Datos para tabla 'empleados'
INSERT INTO
  empleados (id_empleado, nombre, salario, id_departamento)
VALUES
  (101, 'Juan Pérez', 450000, 3),
  (102, 'Ana Gómez', 550000, 2),
  (103, 'Carlos López', 380000, 1),
  (104, 'María Rodríguez', 620000, 3),
  (105, 'Lucía Fernández', 490000, 4),
  (106, 'Martín Silva', 350000, 2),
  (107, 'Sofía Romero', 700000, 5);

-- ====================================================================
-- Ejercicio 01: [Mostrar todos los datos de todos los empleados.]
SELECT
  *
FROM
  empleados;

-- Ejercicio 02: [Listar el nombre y el email de todos los clientes.]
SELECT
  nombre,
  email
FROM
  clientes;

-- Ejercicio 03: [Obtener todos los datos del cliente cuyo ID es 1.]
SELECT
  *
FROM
  clientes
WHERE
  id_cliente = 1;

-- Ejercicio 04: [Mostrar los nombres de los empleados que tienen un salario entre 500.000 y 600.000.]
SELECT
  nombre
FROM
  empleados
WHERE
  salario > 500000
  AND salario < 600000;

-- Ejercicio 05: [Listar los empleados cuyo nombre comienza con la letra “M”.]
SELECT
  *
FROM
  empleados
WHERE
  nombre LIKE 'M%';

-- Ejercicio 06: [Mostrar los nombres de los empleados que pertenecen a los departamentos 2 o 3]
SELECT
  nombre
FROM
  empleados
WHERE
  id_departamento = 2
  OR id_departamento = 3;

-- Ejercicio 07: [Listar el nombre y salario de los empleados ordenados por salario de menor a mayor]
SELECT
  nombre,
  salario
FROM
  empleados
ORDER BY
  salario ASC;

-- Ejercicio 08: [Listar el nombre y salario de los empleados ordenados por salario de mayor a menor.]
SELECT
  nombre,
  salario
FROM
  empleados
ORDER BY
  salario DESC;

-- Ejercicio 09: [Mostrar el nombre y salario de los empleados ordenados primero por salario de mayor a 
-- menor y, en caso de empate, por nombre en orden alfabético.]
SELECT
  nombre,
  salario
FROM
  empleados
ORDER BY
  salario DESC,
  nombre ASC;

-- Ejercicio 10: [Mostrar el nombre de los empleados y su salario anual (calculado como salario
-- mensual por 12), ordenados de mayor a menor.]
SELECT
  nombre,
  (salario * 12) AS salario_anual
FROM
  empleados
ORDER BY
  salario_anual DESC;

-- Ejercicio 11: [Listar los nombres de los empleados ordenados por la longitud del nombre, del
-- más largo al más corto.]
SELECT
  nombre
FROM
  empleados
ORDER BY
  LENGTH(nombre) DESC;

-- Ejercicio 11: [Mostrar el nombre y salario de los empleados, ordenando primero los que tienen
-- salario informado (no nulo) de mayor a menor, y dejando al final los que no tienen
-- salario.]
SELECT
  nombre,
  salario
FROM
  empleados
ORDER BY
  salario DESC NULLS LAST;