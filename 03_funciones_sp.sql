-- Funcion para obtener la IP de la Solicitud
-- Para llamar a una funcion
-- SELECT FN_GET_IP() FROM DUAL;

CREATE OR REPLACE FUNCTION FN_GET_IP
RETURN VARCHAR2
IS BEGIN
    --Intento de obtener IP del host que hace conexion
    RETURN NVL(SYS_CONTEXT('USERENV', 'IP_ADDRESS'), SYS_CONTEXT ('USERENV', 'HOST'));
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'LOCALHOST';
END FN_GET_IP;

/

create PROCEDURE SP_REGISTRAR_VENTA (
    p_id_cliente   IN  NUMBER,
    p_id_producto  IN  NUMBER,
    p_cantidad     IN  NUMBER,
    p_resultado    OUT VARCHAR2
) IS
    v_stock_actual NUMBER;
    v_nuevo_id     NUMBER;
    v_existe       NUMBER;
BEGIN

    -- 1. VALIDAR CLIENTE
    SELECT COUNT(*) INTO v_existe
    FROM CLIENTE
    WHERE ID_CLIENTE = p_id_cliente;

    IF v_existe = 0 THEN
        p_resultado := 'ERROR: El cliente no existe.';
        RETURN;
    END IF;

    -- 2. VALIDAR PRODUCTO Y OBTENER STOCK
    BEGIN
        SELECT STOCK INTO v_stock_actual
        FROM PRODUCTO
        WHERE ID_PRODUCTO = p_id_producto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            p_resultado := 'ERROR: El producto no existe.';
            RETURN;
    END;

    -- 3. VALIDAR STOCK
    IF v_stock_actual < p_cantidad THEN
        p_resultado := 'ERROR: Stock insuficiente. Disponible: ' || v_stock_actual;
        RETURN;
    END IF;

    -- 4. REGISTRAR VENTA
    INSERT INTO VENTA (ID_CLIENTE, ID_PRODUCTO, CANTIDAD)
    VALUES (p_id_cliente, p_id_producto, p_cantidad)
    RETURNING ID_VENTA INTO v_nuevo_id;

    -- 5. ACTUALIZAR STOCK
    UPDATE PRODUCTO
    SET STOCK = STOCK - p_cantidad
    WHERE ID_PRODUCTO = p_id_producto;

    COMMIT;

    p_resultado := 'VENTA EXITOSA. Ticket No: ' || v_nuevo_id;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_resultado := 'ERROR GENERAL: ' || SQLERRM;
END;
/

CREATE OR REPLACE FUNCTION FN_CALCULAR_SUBTOTAL (
    p_cantidad IN NUMBER,
    p_precio   IN NUMBER
) RETURN NUMBER IS
    v_subtotal NUMBER(10,2);
BEGIN
    v_subtotal := p_cantidad * p_precio;
    RETURN v_subtotal;
END FN_CALCULAR_SUBTOTAL;

    /

CREATE OR REPLACE FUNCTION FN_CALCULAR_IVA (
    p_subtotal IN NUMBER
) RETURN NUMBER IS
    v_iva NUMBER(10,2);
    v_porcentaje_iva CONSTANT NUMBER := 0.16; -- 16%
BEGIN
    v_iva := p_subtotal * v_porcentaje_iva;
    RETURN v_iva;
END FN_CALCULAR_IVA;

