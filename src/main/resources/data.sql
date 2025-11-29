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
-- MEMBRESIAS HISTÓRICAS PARA MÉTRICAS (Últimos 12 meses)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado) VALUES
    -- Enero 2024
    (11, 1, 'Membresia Ene 1', '2024-01-05', '2024-02-05', 'Plan Básico', 50.00, 'ACTIVA'),
    (12, 2, 'Membresia Ene 2', '2024-01-10', '2024-04-10', 'Plan Premium', 140.00, 'CANCELADA'),
    (13, 1, 'Membresia Ene 3', '2024-01-15', '2024-02-15', 'Plan Básico', 50.00, 'ACTIVA'),

    -- Febrero 2024
    (14, 3, 'Membresia Feb 1', '2024-02-01', '2025-02-01', 'Plan Anual', 500.00, 'ACTIVA'),
    (15, 1, 'Membresia Feb 2', '2024-02-10', '2024-03-10', 'Plan Básico', 50.00, 'CANCELADA'),
    (16, 2, 'Membresia Feb 3', '2024-02-15', '2024-05-15', 'Plan Premium', 140.00, 'ACTIVA'),
    (17, 1, 'Membresia Feb 4', '2024-02-20', '2024-03-20', 'Plan Básico', 50.00, 'ACTIVA'),

    -- Marzo 2024
    (18, 4, 'Membresia Mar 1', '2024-03-05', '2024-04-05', 'Plan Intensivo', 70.00, 'ACTIVA'),
    (19, 1, 'Membresia Mar 2', '2024-03-10', '2024-04-10', 'Plan Básico', 50.00, 'ACTIVA'),
    (20, 2, 'Membresia Mar 3', '2024-03-15', '2024-06-15', 'Plan Premium', 140.00, 'CANCELADA'),
    (1, 1, 'Membresia Mar 4', '2024-03-20', '2024-04-20', 'Plan Básico', 50.00, 'ACTIVA'),
    (2, 5, 'Membresia Mar 5', '2024-03-25', '2024-04-25', 'Plan Yoga', 60.00, 'ACTIVA'),

    -- Abril 2024
    (3, 1, 'Membresia Abr 1', '2024-04-01', '2024-05-01', 'Plan Básico', 50.00, 'ACTIVA'),
    (4, 2, 'Membresia Abr 2', '2024-04-05', '2024-07-05', 'Plan Premium', 140.00, 'ACTIVA'),
    (5, 1, 'Membresia Abr 3', '2024-04-10', '2024-05-10', 'Plan Básico', 50.00, 'CANCELADA'),
    (6, 6, 'Membresia Abr 4', '2024-04-15', '2024-07-15', 'Plan Crossfit', 200.00, 'ACTIVA'),

    -- Mayo 2024
    (7, 1, 'Membresia May 1', '2024-05-01', '2024-06-01', 'Plan Básico', 50.00, 'ACTIVA'),
    (8, 2, 'Membresia May 2', '2024-05-05', '2024-08-05', 'Plan Premium', 140.00, 'ACTIVA'),
    (9, 1, 'Membresia May 3', '2024-05-10', '2024-06-10', 'Plan Básico', 50.00, 'ACTIVA'),
    (10, 7, 'Membresia May 4', '2024-05-15', '2024-06-15', 'Plan Nutrición', 40.00, 'CANCELADA'),

    -- Junio 2024
    (11, 1, 'Membresia Jun 1', '2024-06-01', '2024-07-01', 'Plan Básico', 50.00, 'ACTIVA'),
    (12, 2, 'Membresia Jun 2', '2024-06-05', '2024-09-05', 'Plan Premium', 140.00, 'ACTIVA'),
    (13, 8, 'Membresia Jun 3', '2024-06-10', '2024-12-10', 'Plan Online', 180.00, 'ACTIVA'),

    -- Julio 2024
    (14, 1, 'Membresia Jul 1', '2024-07-01', '2024-08-01', 'Plan Básico', 50.00, 'ACTIVA'),
    (15, 2, 'Membresia Jul 2', '2024-07-05', '2024-10-05', 'Plan Premium', 140.00, 'CANCELADA'),
    (16, 1, 'Membresia Jul 3', '2024-07-10', '2024-08-10', 'Plan Básico', 50.00, 'ACTIVA'),

    -- Agosto 2024
    (17, 9, 'Membresia Ago 1', '2024-08-01', '2025-08-01', 'Plan Familiar', 900.00, 'ACTIVA'),
    (18, 1, 'Membresia Ago 2', '2024-08-05', '2024-09-05', 'Plan Básico', 50.00, 'ACTIVA'),
    (19, 2, 'Membresia Ago 3', '2024-08-10', '2024-11-10', 'Plan Premium', 140.00, 'ACTIVA'),

    -- Septiembre 2024
    (20, 1, 'Membresia Sep 1', '2024-09-01', '2024-10-01', 'Plan Básico', 50.00, 'CANCELADA'),
    (1, 10, 'Membresia Sep 2', '2024-09-05', '2024-10-05', 'Plan Estudiantil', 30.00, 'ACTIVA'),
    (2, 2, 'Membresia Sep 3', '2024-09-10', '2024-12-10', 'Plan Premium', 140.00, 'ACTIVA'),

    -- Octubre 2024
    (3, 1, 'Membresia Oct 1', '2024-10-01', '2024-11-01', 'Plan Básico', 50.00, 'ACTIVA'),
    (4, 2, 'Membresia Oct 2', '2024-10-05', '2025-01-05', 'Plan Premium', 140.00, 'ACTIVA'),
    (5, 1, 'Membresia Oct 3', '2024-10-10', '2024-11-10', 'Plan Básico', 50.00, 'ACTIVA'),

    -- Noviembre 2024
    (6, 3, 'Membresia Nov 1', '2024-11-01', '2025-11-01', 'Plan Anual', 500.00, 'ACTIVA'),
    (7, 1, 'Membresia Nov 2', '2024-11-05', '2024-12-05', 'Plan Básico', 50.00, 'CANCELADA'),
    (8, 2, 'Membresia Nov 3', '2024-11-10', '2025-02-10', 'Plan Premium', 140.00, 'ACTIVA'),

    -- Diciembre 2024
    (9, 1, 'Membresia Dic 1', '2024-12-01', '2025-01-01', 'Plan Básico', 50.00, 'ACTIVA'),
    (10, 4, 'Membresia Dic 2', '2024-12-05', '2025-01-05', 'Plan Intensivo', 70.00, 'ACTIVA'),

    -- Enero 2025
    (11, 1, 'Membresia Ene 2025 1', '2025-01-01', '2025-02-01', 'Plan Básico', 50.00, 'ACTIVA'),
    (12, 2, 'Membresia Ene 2025 2', '2025-01-05', '2025-04-05', 'Plan Premium', 140.00, 'ACTIVA');

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