-- Insertamos 2 categorías
INSERT INTO CATEGORIA (NOMBRE, DESCRIPCION) VALUES ('Electrónica', 'Dispositivos tecnológicos y gadgets');
INSERT INTO CATEGORIA (NOMBRE, DESCRIPCION) VALUES ('Línea Blanca', 'Electrodomésticos para el hogar');

COMMIT;


-- Insertamos 3 clientes
INSERT INTO CLIENTE (NOMBRE, APATERNO, AMATERNO, CORREO, TELEFONO)
VALUES ('Areli', 'Morales', 'Renteria', 'areli.m@inube.com', '7471112233');

INSERT INTO CLIENTE (NOMBRE, APATERNO, AMATERNO, CORREO, TELEFONO)
VALUES ('Juan', 'Pérez', 'García', 'juan.perez@mail.com', '7474445566');

INSERT INTO CLIENTE (NOMBRE, APATERNO, AMATERNO, CORREO, TELEFONO)
VALUES ('Alan', 'Tovar', 'Medina', 'b.luna@proyect.com', '7449998877');

COMMIT;


-- Insertamos 5 productos
INSERT INTO PRODUCTO (NOMBRE, PRECIO, STOCK, ID_CATEGORIA, DESCRIPCION, ESTATUS)
VALUES ('Smartphone Samsung', 8500.00, 20, 1, 'Galaxy A54 128GB', 1);

INSERT INTO PRODUCTO (NOMBRE, PRECIO, STOCK, ID_CATEGORIA, DESCRIPCION, ESTATUS)
VALUES ('Laptop HP', 14200.50, 10, 1, 'Pavilion 15 Core i5', 1);

INSERT INTO PRODUCTO (NOMBRE, PRECIO, STOCK, ID_CATEGORIA, DESCRIPCION, ESTATUS)
VALUES ('Refrigerador LG', 18900.00, 5, 2, 'Inverter Door-in-Door', 1);

INSERT INTO PRODUCTO (NOMBRE, PRECIO, STOCK, ID_CATEGORIA, DESCRIPCION, ESTATUS)
VALUES ('Audífonos Sony', 3200.00, 15, 1, 'Noise Cancelling WH-1000XM4', 1);

INSERT INTO PRODUCTO (NOMBRE, PRECIO, STOCK, ID_CATEGORIA, DESCRIPCION, ESTATUS)
VALUES ('Horno Microondas', 2450.00, 12, 2, 'Espejo 1.1 pies cúbicos', 1);

COMMIT;


-- 1. Areli compra 2 Smartphones
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (1, 1, 2);
COMMIT;

-- 2. Juan compra 1 Laptop
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (2, 2, 1);

-- 3. Brenda compra 1 Refrigerador
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (3, 3, 1);

-- 4. Areli compra 3 Audífonos
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (1, 4, 3);

-- 5. Juan compra 2 Hornos Microondas
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (2, 5, 2);

-- 6. Brenda compra 1 Monitor (ID_PRODUCTO 4 si es electronica)
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (3, 4, 1);

-- 7. Areli compra 1 Laptop
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (1, 2, 1);

-- 8. Juan compra 5 Audífonos
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (2, 4, 5);

-- 9. Brenda compra 2 Smartphones
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (3, 1, 2);

-- 10. Areli compra 1 Refrigerador
INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
VALUES (1, 3, 1);

COMMIT;
