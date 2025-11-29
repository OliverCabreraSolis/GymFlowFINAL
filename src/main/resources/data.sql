-- ============================
-- INSERCIONES COMPLETAS
-- ============================

-- USUARIOS
INSERT INTO usuario (nombre, correo, contrasena, rol, disponible) VALUES
    ('Juan Perez', 'juan.perez@email.com', '1234', 'CLIENTE',true),
    ('María Gomez', 'maria.gomez@email.com', '1234', 'CLIENTE',false),
    ('Carlos Ruiz', 'carlos.ruiz@email.com', '1234', 'CLIENTE', true),
    ('Ana Torres', 'ana.torres@email.com', '1234', 'CLIENTE',true),
    ('Luis Castillo', 'luis.castillo@email.com', '1234', 'CLIENTE',true),
    ('Sofia Rojas', 'sofia.rojas@email.com', '1234', 'CLIENTE', true),
    ('Pedro Sanchez', 'pedro.sanchez@email.com', '1234', 'CLIENTE', true),
    ('Lucia Medina', 'lucia.medina@email.com', '1234', 'CLIENTE', true),
    ('Admin 1', 'admin1@email.com', 'admin123', 'ADMINISTRADOR', true ),
    ('Admin 2', 'admin2@email.com', 'admin200758', 'ADMINISTRADOR',true);

-- TIPO PRODUCTO
 INSERT INTO tipo_producto (nombre_tipo, descripcion_producto, disponible) VALUES
    ('Suplemento', 'Vitaminas y suplementos nutricionales', TRUE),
    ('Proteina', 'Polvos de proteína y batidos', TRUE),
    ('Snack', 'Snacks saludables', TRUE),
    ('Bebida', 'Bebidas energéticas y jugos', TRUE),
    ('Ropa Deportiva', 'Camisetas y shorts', TRUE),
    ('Equipo', 'Pesas y mancuernas', TRUE),
    ('Accesorios', 'Bandas elásticas y guantes', TRUE),
    ('Calzado', 'Zapatillas deportivas', TRUE),
    ('Masaje', 'Rodillos y bolas de masaje', FALSE),
    ('Suplemento Vegano', 'Proteínas y vitaminas veganas', TRUE);

-- PRODUCTOS
INSERT INTO producto (id_tipo, nombre, descripcion, precio, disponible) VALUES
    (1, 'Vitaminas C', 'Vitaminas C 500mg', 25.00,true),
    (2, 'Proteina Whey', 'Proteina whey 1kg', 120.00,true),
    (3, 'Barra de Almendra', 'Barra energética', 15.00,true),
    (4, 'Jugo Natural', 'Jugo de frutas 500ml', 10.00, false),
    (5, 'Camiseta Deportiva', 'Camiseta para entrenamiento', 40.00, true),
    (6, 'Mancuernas 5kg', 'Set de mancuernas', 80.00, true),
    (7, 'Banda Elastica', 'Banda de resistencia', 20.00, false),
    (8, 'Zapatillas Run', 'Zapatillas para correr', 150.00,true),
    (9, 'Rodillo Masaje', 'Rodillo para recuperación', 35.00,true),
    (10, 'Proteina Vegana', 'Proteina vegetal 1kg', 130.00, true);

-- PLANES
INSERT INTO plan (nombre, duracion, precio, descripcion) VALUES
    ('Plan Básico', '1 Mes', 50.00, 'Acceso al gimnasio 1 mes'),
    ('Plan Premium', '3 Meses', 140.00, 'Acceso al gimnasio 3 meses + clases'),
    ('Plan Anual', '12 Meses', 500.00, 'Acceso completo anual'),
    ('Plan Intensivo', '1 Mes', 70.00, 'Entrenamiento intensivo'),
    ('Plan Yoga', '1 Mes', 60.00, 'Clases de yoga'),
    ('Plan Crossfit', '3 Meses', 200.00, 'Entrenamiento Crossfit'),
    ('Plan Nutrición', '1 Mes', 40.00, 'Asesoría nutricional'),
    ('Plan Online', '6 Meses', 180.00, 'Entrenamiento online'),
    ('Plan Familiar', '12 Meses', 900.00, 'Gimnasio para 4 miembros'),
    ('Plan Estudiantil', '1 Mes', 30.00, 'Plan económico para estudiantes');

-- MEMBRESIAS
-- Datos históricos para las métricas (últimos 12 meses)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado) VALUES
-- 2024
    (1, 1, 'Membresia Histórica 1', '2024-01-15', '2024-02-15', 'Plan Básico', 50.00, 'ACTIVA'),
    (2, 1, 'Membresia Histórica 2', '2024-01-20', '2024-02-20', 'Plan Básico', 50.00, 'CANCELADA'),
    (3, 2, 'Membresia Histórica 3', '2024-02-10', '2024-05-10', 'Plan Premium', 140.00, 'ACTIVA'),
    (4, 1, 'Membresia Histórica 4', '2024-02-15', '2024-03-15', 'Plan Básico', 50.00, 'ACTIVA'),
    (5, 3, 'Membresia Histórica 5', '2024-03-01', '2025-03-01', 'Plan Anual', 500.00, 'ACTIVA'),
    (6, 1, 'Membresia Histórica 6', '2024-03-10', '2024-04-10', 'Plan Básico', 50.00, 'CANCELADA'),
    (7, 2, 'Membresia Histórica 7', '2024-04-05', '2024-07-05', 'Plan Premium', 140.00, 'ACTIVA'),
    (8, 1, 'Membresia Histórica 8', '2024-04-15', '2024-05-15', 'Plan Básico', 50.00, 'ACTIVA'),
    (9, 4, 'Membresia Histórica 9', '2024-05-01', '2024-06-01', 'Plan Intensivo', 70.00, 'ACTIVA'),
    (10, 1, 'Membresia Histórica 10', '2024-05-10', '2024-06-10', 'Plan Básico', 50.00, 'CANCELADA'),
    (11, 2, 'Membresia Histórica 11', '2024-06-01', '2024-09-01', 'Plan Premium', 140.00, 'ACTIVA'),
    (12, 1, 'Membresia Histórica 12', '2024-06-15', '2024-07-15', 'Plan Básico', 50.00, 'ACTIVA'),
    (13, 5, 'Membresia Histórica 13', '2024-07-01', '2024-08-01', 'Plan Yoga', 60.00, 'ACTIVA'),
    (14, 1, 'Membresia Histórica 14', '2024-07-10', '2024-08-10', 'Plan Básico', 50.00, 'CANCELADA'),
    (15, 2, 'Membresia Histórica 15', '2024-08-05', '2024-11-05', 'Plan Premium', 140.00, 'ACTIVA'),
    (16, 1, 'Membresia Histórica 16', '2024-08-15', '2024-09-15', 'Plan Básico', 50.00, 'ACTIVA'),
    (17, 6, 'Membresia Histórica 17', '2024-09-01', '2024-12-01', 'Plan Crossfit', 200.00, 'ACTIVA'),
    (18, 1, 'Membresia Histórica 18', '2024-09-10', '2024-10-10', 'Plan Básico', 50.00, 'CANCELADA'),
    (19, 2, 'Membresia Histórica 19', '2024-10-01', '2025-01-01', 'Plan Premium', 140.00, 'ACTIVA'),
    (20, 1, 'Membresia Histórica 20', '2024-10-15', '2024-11-15', 'Plan Básico', 50.00, 'ACTIVA');

-- PAGOS
INSERT INTO pago (total, metodo_pago, id_usuario) VALUES
    (50.00, 'TARJETA', 1),
    (140.00, 'YAPE', 2),
    (500.00, 'TARJETA', 3),
    (70.00, 'EFECTIVO', 4),
    (60.00, 'TARJETA', 5),
    (200.00, 'YAPE', 6),
    (40.00, 'EFECTIVO', 7),
    (180.00, 'TARJETA', 8),
    (900.00, 'PLIN', 9),
    (30.00, 'EFECTIVO', 10);

-- DETALLE PAGO
INSERT INTO detalle_pago (id_pago, tipo_item, id_producto, id_plan, cantidad, precio_unitario, subtotal) VALUES
    (1, 'PLAN', NULL, 1, 1, 50.00, 50.00),
    (2, 'PLAN', NULL, 2, 1, 140.00, 140.00),
    (3, 'PLAN', NULL, 3, 1, 500.00, 500.00),
    (4, 'PLAN', NULL, 4, 1, 70.00, 70.00),
    (5, 'PLAN', NULL, 5, 1, 60.00, 60.00),
    (6, 'PLAN', NULL, 6, 1, 200.00, 200.00),
    (7, 'PLAN', NULL, 7, 1, 40.00, 40.00),
    (8, 'PLAN', NULL, 8, 1, 180.00, 180.00),
    (9, 'PLAN', NULL, 9, 1, 900.00, 900.00),
    (10, 'PLAN', NULL, 10, 1, 30.00, 30.00);