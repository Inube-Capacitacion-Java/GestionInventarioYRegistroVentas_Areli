# 🛒 Sistema de Ventas – Unube (Oracle PL/SQL)

## 📌 Descripción del Proyecto

Como administrador del sistema de ventas de Unube, el objetivo de este proyecto es registrar categorías, productos, clientes y ventas, para disponer de un modelo de datos confiable que permita:

- Consultar inventarios
- Validar stock disponible
- Registrar transacciones de venta
- Generar reportes de apoyo a la operación del negocio

El sistema fue desarrollado en Oracle utilizando SQL y PL/SQL, implementando buenas prácticas de modelado, normalización y control transaccional.

---

## 🗄 Modelo de Base de Datos

El modelo está compuesto por tablas principales y tablas de bitácora.

### 📂 Tablas Principales

- CATEGORIA
- PRODUCTO
- CLIENTE
- VENTA

### 📂 Tablas de Bitácora

- CATEGORIA_BIT
- PRODUCTO_BIT
- CLIENTE_BIT
- VENTA_BIT

Las tablas de bitácora registran acciones realizadas sobre las tablas principales (INSERT, UPDATE, DELETE), incluyendo información como acción realizada e IP.

> Nota: Las tablas de bitácora no fueron vinculadas mediante foreign key por decisión de diseño, considerando posibles reglas de negocio futuras.

---

## 🧱 Estructura de Tablas

### CATEGORIA
Contiene la información de cada categoría que maneja la empresa.

Campos principales:
- ID_CATEGORIA (PK)
- NOMBRE
- DESCRIPCION
- FECHA_CREACION
- FECHA_MODIFICACION

---

### PRODUCTO
Contiene la información de cada producto asociado a una categoría.

Campos principales:
- ID_PRODUCTO (PK)
- NOMBRE
- PRECIO
- STOCK
- ID_CATEGORIA (FK)
- DESCRIPCION
- ESTATUS
- FECHA_CREACION
- FECHA_MODIFICACION

---

### CLIENTE
Contiene la información de los clientes registrados.

Campos principales:
- ID_CLIENTE (PK)
- NOMBRE
- APATERNO
- AMATERNO
- CORREO
- TELEFONO
- FECHA_REGISTRO
- FECHA_CREACION
- FECHA_MODIFICACION

---

### VENTA
Registra cada transacción de venta realizada.

Campos principales:
- ID_VENTA (PK)
- ID_CLIENTE (FK)
- ID_PRODUCTO (FK)
- CANTIDAD
- FECHA_VENTA
- USUARIO_REGISTRO
- FECHA_CREACION
- FECHA_MODIFICACION

---

## 🧾 Documentación Interna

Se utilizaron:

- `COMMENT ON TABLE`
- `COMMENT ON COLUMN`

Para documentar el propósito de cada tabla y cada campo dentro de la base de datos.

---

## 👁 Vistas Implementadas

Se crearon dos vistas:

1. Vista de productos con su categoría.
2. Vista de ventas con información de cliente y producto.

Estas vistas facilitan la consulta y generación de reportes.

---

## ⚙ Lógica de Negocio (PL/SQL)

### 📌 Stored Procedure

Se creó un Stored Procedure que:

- Valida existencia del cliente
- Valida existencia del producto
- Verifica stock disponible
- Genera automáticamente el ID de venta
- Registra la venta
- Actualiza el stock del producto

---

### 📌 Funciones

1. Función para calcular el total de la venta:
   - Total = cantidad × precio

2. Segunda función adicional:
   - (Ejemplo: cálculo de IVA / validación de stock / cálculo adicional definido por el desarrollador)

---

## 🧪 Pruebas Unitarias

Se generaron pruebas en SQL que demuestran:

- Inserciones
- Consultas
- Ejecución del Stored Procedure
- Ejecución de ambas funciones
- Validación de actualización de stock

Las pruebas utilizan control transaccional mediante `ROLLBACK` para evitar afectar datos reales.

---

## 📂 Estructura del Repositorio

Los scripts están organizados por orden de ejecución en su nomenclatura:

