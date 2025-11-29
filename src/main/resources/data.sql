-- ============================
-- INSERCIONES COMPLETAS
-- ============================

-- USUARIOS
INSERT INTO usuario (nombre, correo, contrasena, rol) VALUES
      ('Juan Perez', 'juan@email.com', 'password123', 'CLIENTE'),
      ('Maria Garcia', 'maria@email.com', 'password123', 'CLIENTE'),
      ('Carlos Lopez', 'carlos@email.com', 'password123', 'CLIENTE'),
      ('Ana Martinez', 'ana@email.com', 'password123', 'CLIENTE'),
      ('Luis Rodriguez', 'luis@email.com', 'password123', 'CLIENTE'),
      ('Sofia Hernandez', 'sofia@email.com', 'password123', 'CLIENTE'),
      ('Pedro Diaz', 'pedro@email.com', 'password123', 'CLIENTE'),
      ('Lucia Torres', 'lucia@email.com', 'password123', 'CLIENTE'),
      ('David Ramirez', 'david@email.com', 'password123', 'CLIENTE'),
      ('Camila Flores', 'camila@email.com', 'password123', 'CLIENTE'),
      ('Usuario 11', 'user11@email.com', 'password123', 'CLIENTE'),
      ('Usuario 12', 'user12@email.com', 'password123', 'CLIENTE'),
      ('Usuario 13', 'user13@email.com', 'password123', 'CLIENTE'),
      ('Usuario 14', 'user14@email.com', 'password123', 'CLIENTE'),
      ('Usuario 15', 'user15@email.com', 'password123', 'CLIENTE'),
      ('Usuario 16', 'user16@email.com', 'password123', 'CLIENTE'),
      ('Usuario 17', 'user17@email.com', 'password123', 'CLIENTE'),
      ('Usuario 18', 'user18@email.com', 'password123', 'CLIENTE'),
      ('Usuario 19', 'user19@email.com', 'password123', 'CLIENTE'),
      ('Usuario 20', 'user20@email.com', 'password123', 'CLIENTE'),
      ('Admin User', 'admin@gymflow.com', 'admin123', 'ADMINISTRADOR');

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
     ('Plan Básico', '1 mes', 50.00, 'Acceso a área de cardio y pesas'),
     ('Plan Premium', '3 meses', 140.00, 'Incluye clases grupales'),
     ('Plan Anual', '12 meses', 500.00, 'Acceso completo por 1 año'),
     ('Plan Intensivo', '1 mes', 70.00, 'Entrenamiento personalizado'),
     ('Plan Yoga', '1 mes', 60.00, 'Clases de yoga y meditación'),
     ('Plan Crossfit', '3 meses', 200.00, 'Entrenamiento funcional intensivo'),
     ('Plan Nutrición', '1 mes', 40.00, 'Asesoría nutricional'),
     ('Plan Online', '6 meses', 180.00, 'Clases virtuales'),
     ('Plan Familiar', '12 meses', 900.00, 'Para hasta 4 familiares'),
     ('Plan Estudiantil', '1 mes', 30.00, 'Descuento para estudiantes');

-- MEMBRESIAS
-- MEMBRESIAS ACTUALES (2025)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado) VALUES
      (1, 1, 'Membresia Juan', '2025-11-01', '2025-12-01', 'Plan Básico', 50.00, 'ACTIVA'),
      (2, 2, 'Membresia Maria', '2025-11-01', '2026-02-01', 'Plan Premium', 140.00, 'ACTIVA'),
      (3, 3, 'Membresia Carlos', '2025-11-01', '2026-11-01', 'Plan Anual', 500.00, 'ACTIVA'),
      (4, 4, 'Membresia Ana', '2025-11-01', '2025-12-01', 'Plan Intensivo', 70.00, 'ACTIVA'),
      (5, 5, 'Membresia Luis', '2025-11-01', '2025-12-01', 'Plan Yoga', 60.00, 'ACTIVA'),
      (6, 6, 'Membresia Sofia', '2025-11-01', '2026-02-01', 'Plan Crossfit', 200.00, 'ACTIVA'),
      (7, 7, 'Membresia Pedro', '2025-11-01', '2025-12-01', 'Plan Nutrición', 40.00, 'ACTIVA'),
      (8, 8, 'Membresia Lucia', '2025-11-01', '2026-05-01', 'Plan Online', 180.00, 'ACTIVA'),
      (9, 9, 'Membresia David', '2025-11-01', '2026-11-01', 'Plan Familiar', 900.00, 'ACTIVA'),
      (10, 10, 'Membresia Camila', '2025-11-01', '2025-12-01', 'Plan Estudiantil', 30.00, 'ACTIVA');

-- MEMBRESIAS HISTÓRICAS PARA MÉTRICAS (2024)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado) VALUES
      (11, 1, 'Membresia Histórica 1', '2024-01-15', '2024-02-15', 'Plan Básico', 50.00, 'ACTIVA'),
      (12, 1, 'Membresia Histórica 2', '2024-01-20', '2024-02-20', 'Plan Básico', 50.00, 'CANCELADA'),
      (13, 2, 'Membresia Histórica 3', '2024-02-10', '2024-05-10', 'Plan Premium', 140.00, 'ACTIVA'),
      (14, 1, 'Membresia Histórica 4', '2024-02-15', '2024-03-15', 'Plan Básico', 50.00, 'ACTIVA'),
      (15, 3, 'Membresia Histórica 5', '2024-03-01', '2025-03-01', 'Plan Anual', 500.00, 'ACTIVA'),
      (16, 1, 'Membresia Histórica 6', '2024-03-10', '2024-04-10', 'Plan Básico', 50.00, 'CANCELADA'),
      (17, 2, 'Membresia Histórica 7', '2024-04-05', '2024-07-05', 'Plan Premium', 140.00, 'ACTIVA'),
      (18, 1, 'Membresia Histórica 8', '2024-04-15', '2024-05-15', 'Plan Básico', 50.00, 'ACTIVA'),
      (19, 4, 'Membresia Histórica 9', '2024-05-01', '2024-06-01', 'Plan Intensivo', 70.00, 'ACTIVA'),
      (20, 1, 'Membresia Histórica 10', '2024-05-10', '2024-06-10', 'Plan Básico', 50.00, 'CANCELADA'),
      (1, 2, 'Membresia Histórica 11', '2024-06-01', '2024-09-01', 'Plan Premium', 140.00, 'ACTIVA'),
      (2, 1, 'Membresia Histórica 12', '2024-06-15', '2024-07-15', 'Plan Básico', 50.00, 'ACTIVA'),
      (3, 5, 'Membresia Histórica 13', '2024-07-01', '2024-08-01', 'Plan Yoga', 60.00, 'ACTIVA'),
      (4, 1, 'Membresia Histórica 14', '2024-07-10', '2024-08-10', 'Plan Básico', 50.00, 'CANCELADA'),
      (5, 2, 'Membresia Histórica 15', '2024-08-05', '2024-11-05', 'Plan Premium', 140.00, 'ACTIVA'),
      (6, 1, 'Membresia Histórica 16', '2024-08-15', '2024-09-15', 'Plan Básico', 50.00, 'ACTIVA'),
      (7, 6, 'Membresia Histórica 17', '2024-09-01', '2024-12-01', 'Plan Crossfit', 200.00, 'ACTIVA'),
      (8, 1, 'Membresia Histórica 18', '2024-09-10', '2024-10-10', 'Plan Básico', 50.00, 'CANCELADA'),
      (9, 2, 'Membresia Histórica 19', '2024-10-01', '2025-01-01', 'Plan Premium', 140.00, 'ACTIVA'),
      (10, 1, 'Membresia Histórica 20', '2024-10-15', '2024-11-15', 'Plan Básico', 50.00, 'ACTIVA');

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