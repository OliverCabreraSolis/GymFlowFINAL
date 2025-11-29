-- ============================
-- TABLA: USUARIO
-- ============================
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    correo VARCHAR(200) NOT NULL UNIQUE,
    contrasena VARCHAR(200) NOT NULL,
    rol ENUM('CLIENTE', 'ADMINISTRADOR') NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
    );

-- ============================
-- TABLA: TIPO PRODUCTO
-- ============================
CREATE TABLE IF NOT EXISTS tipo_producto (
    id_tipo INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_tipo VARCHAR(200) NOT NULL,
    descripcion_producto TEXT,
    disponible BOOLEAN DEFAULT TRUE
    );

-- ============================
-- TABLA: PRODUCTO
-- ============================
CREATE TABLE IF NOT EXISTS producto (
    id_producto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_tipo INT,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2),
    disponible BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_tipo FOREIGN KEY (id_tipo) REFERENCES tipo_producto(id_tipo)
    );

-- ============================
-- TABLA: PLAN
-- ============================
CREATE TABLE IF NOT EXISTS plan (
    id_plan INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    duracion VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    descripcion TEXT,
    disponible BOOLEAN DEFAULT TRUE
    );

-- ============================
-- TABLA: MEMBRESIA
-- ============================
CREATE TABLE IF NOT EXISTS membresia (
    id_membresia INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_plan INT NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2),
    estado ENUM('ACTIVA','CANCELADA') DEFAULT 'ACTIVA',
    disponible BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_usuario_membresia FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_plan_membresia FOREIGN KEY (id_plan) REFERENCES plan(id_plan)
    );

-- ============================
-- TABLA: PAGO
-- ============================
CREATE TABLE IF NOT EXISTS pago (
    id_pago INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(100),
    id_usuario INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_usuario_pago FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
    );

-- ============================
-- TABLA: DETALLE PAGO
-- ============================
CREATE TABLE IF NOT EXISTS detalle_pago (
    id_detalle INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pago INT NOT NULL,
    tipo_item ENUM('PRODUCTO', 'PLAN') NOT NULL,
    id_producto INT,
    id_plan INT,
    cantidad INT DEFAULT 1,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(12,2),
    disponible BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_pago_detalle FOREIGN KEY (id_pago) REFERENCES pago(id_pago),
    CONSTRAINT fk_producto_detalle FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    CONSTRAINT fk_plan_detalle FOREIGN KEY (id_plan) REFERENCES plan(id_plan)
    );
