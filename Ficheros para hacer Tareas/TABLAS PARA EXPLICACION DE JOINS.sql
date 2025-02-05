
DROP TABLE IF EXISTS CLIENTES CASCADE;

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

INSERT INTO clientes (id_cliente, nombre) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');


DROP TABLE IF EXISTS PEDIDOS CASCADE;

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    producto VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL
);

INSERT INTO pedidos (id_pedido, id_cliente, producto, cantidad) VALUES
(1, 1, 'Laptop', 1),
(2, 2, 'Phone', 2),
(3, 3, 'Tablet', 1),
(4, NULL, 'Monitor', 1); -- Un pedido sin cliente asociado

/*

### Descripción de los datos:

1. **Tabla `clientes`:**
   - Contiene información básica de los clientes (`id_cliente`, `nombre`).
   - La cliente `Diana` no tiene ningún pedido asociado.

2. **Tabla `pedidos`:**
   - Contiene los pedidos realizados por los clientes (`id_pedido`, `id_cliente`, `producto`, `cantidad`).
   - Hay un pedido (`Monitor`) que no está asociado a ningún cliente (`id_cliente = NULL`).

### Cómo se relacionan estas tablas:
- La relación entre ambas se establece mediante la clave foránea `id_cliente` en la tabla `pedidos`, 
que referencia a la clave primaria `id_cliente` en la tabla `clientes`.
*/