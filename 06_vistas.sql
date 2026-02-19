-- Vista de productos por categoria
CREATE OR REPLACE VIEW V_PRODUCTOS_DETALLE AS
SELECT
    P.ID_PRODUCTO,           -- De la tabla P (Producto)
    P.NOMBRE AS PRODUCTO,    -- Le damos un "Alias" para que se vea mejor
    C.NOMBRE AS CATEGORIA    -- ¡Aquí está el truco! Traemos el nombre de la otra tabla
FROM PRODUCTO P              -- P es el "apodo" de Producto para escribir menos
INNER JOIN CATEGORIA C       -- Unimos con Categoría (apodo C)
    ON P.ID_CATEGORIA = C.ID_CATEGORIA; -- La "llave" que los une

--Vista de ventas con datos de cliente y producto

CREATE OR REPLACE VIEW V_VENTAS_CLI_PRO AS
    SELECT
        V.ID_VENTA,
        C.NOMBRE AS CLIENTE,
        P.NOMBRE AS PRODUCTO
FROM VENTA V
INNER JOIN CLIENTE C ON V.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN PRODUCTO P ON V.ID_PRODUCTO = P.ID_PRODUCTO;

