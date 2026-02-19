--Creación de tabla CATEGORIA
CREATE TABLE CATEGORIA (
    ID_CATEGORIA NUMBER NOT NULL,
    NOMBRE VARCHAR2(40) NOT NULL,
    DESCRIPCION VARCHAR2(40) NOT NULL,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    CONSTRAINT pk_id_categoria PRIMARY KEY (ID_CATEGORIA)
);
COMMENT ON TABLE CATEGORIA IS 'Tabla que contiene la información de cada Categoria que maneja la empresa.';
COMMENT ON COLUMN CATEGORIA.ID_CATEGORIA IS 'Llave primaria de la tabla Categoria';
COMMENT ON COLUMN CATEGORIA.NOMBRE IS 'Nombre de la Categoria';
COMMENT ON COLUMN CATEGORIA.DESCRIPCION IS 'Descripción de la Categoria';
COMMENT ON COLUMN CATEGORIA.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN CATEGORIA.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';

--Creacion de tabla de Bitacora de CATEGORIA
CREATE TABLE CATEGORIA_BIT (
    ID_CATEGORIA_BIT NUMBER NOT NULL,
    ID_CATEGORIA NUMBER NOT NULL,
    NOMBRE VARCHAR2(40) NOT NULL,
    DESCRIPCION VARCHAR2(40) NOT NULL,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    ACCION VARCHAR2(10) NOT NULL,
    IP VARCHAR2(45) NOT NULL, -- Ampliado para soportar IPv6
    CONSTRAINT pk_id_categoria_bit PRIMARY KEY (ID_CATEGORIA_BIT)
);
COMMENT ON TABLE CATEGORIA_BIT IS 'Tabla de Bitácora que contiene la información de cada Categoria que maneja la empresa.';
COMMENT ON COLUMN CATEGORIA_BIT.ID_CATEGORIA_BIT IS 'Llave primaria de la tabla Categoria';
COMMENT ON COLUMN CATEGORIA_BIT.ID_CATEGORIA IS 'Llave foránea ID_CATEGORIA que hace referencia a la tabla Categoria';
COMMENT ON COLUMN CATEGORIA_BIT.NOMBRE IS 'Nombre de la Categoria';
COMMENT ON COLUMN CATEGORIA_BIT.DESCRIPCION IS 'Descripción de la Categoria';
COMMENT ON COLUMN CATEGORIA_BIT.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN CATEGORIA_BIT.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';
COMMENT ON COLUMN CATEGORIA_BIT.ACCION IS 'Campo de control que indica la Acción en el Registro';
COMMENT ON COLUMN CATEGORIA_BIT.IP is 'Campo de control que indica IP de donde se solicito operación en el registro';

--Creación de tabla PRODUCTO
CREATE TABLE PRODUCTO (
    ID_PRODUCTO NUMBER NOT NULL,
    NOMBRE VARCHAR2(40) NOT NULL,
    PRECIO NUMBER(10, 2) NOT NULL,
    STOCK NUMBER NOT NULL,
    ID_CATEGORIA NUMBER NOT NULL,
    DESCRIPCION VARCHAR2(40) NOT NULL,
    ESTATUS NUMBER(1) DEFAULT 1 NOT NULL,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    CONSTRAINT pk_id_producto PRIMARY KEY (ID_PRODUCTO),
    CONSTRAINT fk_id_categoria FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA (ID_CATEGORIA)
);
COMMENT ON TABLE PRODUCTO IS 'Tabla que contiene la información de cada Producto correspondiente a una Categoria.';
COMMENT ON COLUMN PRODUCTO.ID_PRODUCTO IS 'Llave primaria de la tabla Producto';
COMMENT ON COLUMN PRODUCTO.NOMBRE IS 'Nombre del Producto';
COMMENT ON COLUMN PRODUCTO.PRECIO IS 'Precio del Producto';
COMMENT ON COLUMN PRODUCTO.STOCK IS 'Stock del Producto';
COMMENT ON COLUMN PRODUCTO.ID_CATEGORIA IS 'Llave foránea ID_CATEGORIA que hace referencia a la tabla CATEGORIA';
COMMENT ON COLUMN PRODUCTO.DESCRIPCION IS 'Descripción del Producto';
COMMENT ON COLUMN PRODUCTO.ESTATUS IS 'Estado del Producto';
COMMENT ON COLUMN PRODUCTO.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN PRODUCTO.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';

--Creacion de tabla de Bitacora de PRODUCTO
CREATE TABLE PRODUCTO_BIT (
    ID_PRODUCTO_BIT NUMBER NOT NULL,
    ID_PRODUCTO NUMBER NOT NULL,
    NOMBRE VARCHAR2(40) NOT NULL,
    PRECIO NUMBER(10, 2) NOT NULL,
    STOCK NUMBER NOT NULL,
    ID_CATEGORIA NUMBER NOT NULL,
    DESCRIPCION VARCHAR2(40) NOT NULL,
    ESTATUS NUMBER(1) DEFAULT 1 NOT NULL,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    ACCION VARCHAR2(10) NOT NULL,
    IP VARCHAR2(45) NOT NULL,
    CONSTRAINT pk_id_producto_bit PRIMARY KEY (ID_PRODUCTO_BIT)
);
COMMENT ON TABLE PRODUCTO_BIT IS 'Tabla de Bitácora que contiene la información de cada Producto correspondiente a una Categoria.';
COMMENT ON COLUMN PRODUCTO_BIT.ID_PRODUCTO_BIT IS 'Llave primaria de la tabla Producto';
COMMENT ON COLUMN PRODUCTO_BIT.ID_PRODUCTO IS 'Llave foránea ID_PRODUCTO que hace referencia a la tabla PRODUCTO';
COMMENT ON COLUMN PRODUCTO_BIT.NOMBRE IS 'Nombre del Producto';
COMMENT ON COLUMN PRODUCTO_BIT.PRECIO IS 'Precio del Producto';
COMMENT ON COLUMN PRODUCTO_BIT.STOCK IS 'Stock del Producto';
COMMENT ON COLUMN PRODUCTO_BIT.ID_CATEGORIA IS 'Llave foránea ID_CATEGORIA que hace referencia a la tabla CATEGORIA';
COMMENT ON COLUMN PRODUCTO_BIT.DESCRIPCION IS 'Descripción del Producto';
COMMENT ON COLUMN PRODUCTO_BIT.ESTATUS IS 'Estado del Producto';
COMMENT ON COLUMN PRODUCTO_BIT.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN PRODUCTO_BIT.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';
COMMENT ON COLUMN PRODUCTO_BIT.ACCION IS 'Campo de control que indica la Acción en el Registro';
COMMENT ON COLUMN PRODUCTO_BIT.IP is 'Campo de control que indica IP de done se solicito operación en el registro';

--Creación de tabla CLIENTE
CREATE TABLE CLIENTE (
    ID_CLIENTE NUMBER NOT NULL,
    NOMBRE VARCHAR2(40) NOT NULL,
    APATERNO VARCHAR2(40) NOT NULL,
    AMATERNO VARCHAR2(40) NOT NULL,
    CORREO VARCHAR2(40) NOT NULL,
    TELEFONO VARCHAR2(15),
    FECHA_REGISTRO DATE DEFAULT SYSDATE,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    CONSTRAINT pk_id_cliente PRIMARY KEY (ID_CLIENTE)
);
COMMENT ON TABLE CLIENTE IS 'Tabla que contiene la información del Cliente';
COMMENT ON COLUMN CLIENTE.ID_CLIENTE IS 'Llave primaria de la tabla CLIENTE';
COMMENT ON COLUMN CLIENTE.NOMBRE IS 'Nombre del Cliente';
COMMENT ON COLUMN CLIENTE.APATERNO IS 'Apellido paterno del Cliente';
COMMENT ON COLUMN CLIENTE.AMATERNO IS 'Apellido materno del Cliente';
COMMENT ON COLUMN CLIENTE.CORREO IS 'Correo del Cliente';
COMMENT ON COLUMN CLIENTE.TELEFONO IS 'Numero telefónico del Cliente';
COMMENT ON COLUMN CLIENTE.FECHA_REGISTRO IS 'Campo de control que indica la fecha de Registro del Cliente';
COMMENT ON COLUMN CLIENTE.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN CLIENTE.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';

--Creacion de tabla de Bitacora de CLIENTE
CREATE TABLE CLIENTE_BIT (
    ID_CLIENTE_BIT NUMBER NOT NULL,
    ID_CLIENTE NUMBER NOT NULL,
    NOMBRE VARCHAR2(40) NOT NULL,
    APATERNO VARCHAR2(40) NOT NULL,
    AMATERNO VARCHAR2(40) NOT NULL,
    CORREO VARCHAR2(40) NOT NULL,
    TELEFONO VARCHAR2(15),
    FECHA_REGISTRO DATE DEFAULT SYSDATE,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    ACCION VARCHAR2(10) NOT NULL,
    IP VARCHAR2(45) NOT NULL,
    CONSTRAINT pk_id_cliente_bit PRIMARY KEY (ID_CLIENTE_BIT)
);
COMMENT ON TABLE CLIENTE_BIT IS 'Tabla de Bitácora que contiene la información del Cliente';
COMMENT ON COLUMN CLIENTE_BIT.ID_CLIENTE_BIT IS 'Llave primaria de la tabla CLIENTE_BIT';
COMMENT ON COLUMN CLIENTE_BIT.ID_CLIENTE IS 'Llave foránea ID_CLIENTE que hace referencia a la tabla CLIENTE';
COMMENT ON COLUMN CLIENTE_BIT.NOMBRE IS 'Nombre del Cliente';
COMMENT ON COLUMN CLIENTE_BIT.APATERNO IS 'Apellido paterno del Cliente';
COMMENT ON COLUMN CLIENTE_BIT.AMATERNO IS 'Apellido materno del Cliente';
COMMENT ON COLUMN CLIENTE_BIT.CORREO IS 'Correo del Cliente';
COMMENT ON COLUMN CLIENTE_BIT.TELEFONO IS 'Numero telefónico del Cliente';
COMMENT ON COLUMN CLIENTE_BIT.FECHA_REGISTRO IS 'Campo de control que indica la fecha de Registro del Cliente';
COMMENT ON COLUMN CLIENTE_BIT.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN CLIENTE_BIT.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';
COMMENT ON COLUMN CLIENTE_BIT.ACCION IS 'Campo de control que indica la Acción en el Registro';
COMMENT ON COLUMN CLIENTE_BIT.IP is 'Campo de control que indica IP de done se solicito operación en el registro';

--Creación de tabla VENTA
CREATE TABLE VENTA (
    ID_VENTA NUMBER NOT NULL,
    ID_CLIENTE NUMBER NOT NULL,
    ID_PRODUCTO NUMBER NOT NULL,
    CANTIDAD NUMBER NOT NULL,
    FECHA_VENTA DATE DEFAULT SYSDATE,
    USUARIO_REGISTRO VARCHAR2(100) DEFAULT USER,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    CONSTRAINT pk_id_venta PRIMARY KEY (ID_VENTA),
    CONSTRAINT fk_id_cliente_venta FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE),
    CONSTRAINT fk_id_producto_venta FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO)
);
COMMENT ON TABLE VENTA IS 'Tabla que contiene la información de cada Venta registrada en la BD.';
COMMENT ON COLUMN VENTA.ID_VENTA IS 'Llave primaria de la tabla VENTA';
COMMENT ON COLUMN VENTA.ID_CLIENTE IS 'Llave foránea ID_CLIENTE que hace referencia a la tabla CLIENTE';
COMMENT ON COLUMN VENTA.ID_PRODUCTO IS 'Llave foránea ID_PRODUCTO que hace referencia a la tabla PRODUCTOS';
COMMENT ON COLUMN VENTA.CANTIDAD IS 'Cantidad de Productos registrados en la Venta';
COMMENT ON COLUMN VENTA.FECHA_VENTA IS 'Campo de control que indica la fecha de en la que se levanto la Venta';
COMMENT ON COLUMN VENTA.USUARIO_REGISTRO IS 'Campo de control que indica el usuario que registro la venta';
COMMENT ON COLUMN VENTA.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN VENTA.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';

--Creacion de tabla de Bitacora de VENTA
CREATE TABLE VENTA_BIT (
    ID_VENTA_BIT NUMBER NOT NULL,
    ID_VENTA NUMBER NOT NULL,
    ID_CLIENTE NUMBER NOT NULL,
    ID_PRODUCTO NUMBER NOT NULL,
    CANTIDAD NUMBER NOT NULL,
    FECHA_VENTA DATE DEFAULT SYSDATE,
    USUARIO_REGISTRO VARCHAR2(100) DEFAULT USER,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE DEFAULT SYSDATE,
    ACCION VARCHAR2(10) NOT NULL,
    IP VARCHAR2(45) NOT NULL,
    CONSTRAINT pk_id_venta_bit PRIMARY KEY (ID_VENTA_BIT)
);
COMMENT ON TABLE VENTA_BIT IS 'Tabla de Bitácora que contiene la información de cada Venta registrada en la BD.';
COMMENT ON COLUMN VENTA_BIT.ID_VENTA_BIT IS 'Llave primaria de la tabla VENTA_BIT';
COMMENT ON COLUMN VENTA_BIT.ID_VENTA IS 'Llave foránea ID_VENTA que hace referencia a la tabla VENTA';
COMMENT ON COLUMN VENTA_BIT.ID_CLIENTE IS 'Llave foránea ID_CLIENTE que hace referencia a la tabla CLIENTE';
COMMENT ON COLUMN VENTA_BIT.ID_PRODUCTO IS 'Llave foránea ID_PRODUCTO que hace referencia a la tabla PRODUCTO';
COMMENT ON COLUMN VENTA_BIT.CANTIDAD IS 'Cantidad de Productos registrados en la Venta';
COMMENT ON COLUMN VENTA_BIT.FECHA_VENTA IS 'Campo de control que indica la fecha de en la que se levanto la Venta';
COMMENT ON COLUMN VENTA_BIT.USUARIO_REGISTRO IS 'Campo de control que indica el usuario que registro la venta';
COMMENT ON COLUMN VENTA_BIT.FECHA_CREACION IS 'Campo de control que indica la Fecha de Creación en la BD';
COMMENT ON COLUMN VENTA_BIT.FECHA_MODIFICACION IS 'Campo de control que indica la Fecha de Modificación en la BD';
COMMENT ON COLUMN VENTA_BIT.ACCION IS 'Campo de control que indica la Acción en el Registro';
COMMENT ON COLUMN VENTA_BIT.IP is 'Campo de control que indica IP de done se solicito operación en el registro';

