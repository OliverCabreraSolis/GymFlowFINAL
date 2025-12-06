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
-- Datos desde Enero 2025 hasta Diciembre 2025
-- Algunos usuarios renuevan, otros no (para mostrar variación en la tasa)

-- ========================================
-- ENERO 2025 (Vencidas en Febrero 2025)
-- ========================================
-- Usuario 11: Compra en Enero, vence en Febrero, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (11, 1, 'Membresia Ene 2025 - Usuario 11', '2025-01-05', '2025-02-05', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 12: Compra en Enero, vence en Abril, y SÍ renueva en Abril
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (12, 2, 'Membresia Ene 2025 - Usuario 12', '2025-01-10', '2025-04-10', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 13: Compra en Enero, vence en Febrero, y SÍ renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (13, 1, 'Membresia Ene 2025 - Usuario 13', '2025-01-15', '2025-02-15', 'Plan Básico', 50.00, 'VENCIDA', true);

-- ========================================
-- FEBRERO 2025 (Vencidas en Febrero-Mayo)
-- ========================================
-- Usuario 13: RENOVACIÓN después de vencer en Febrero
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (13, 1, 'Membresia Feb 2025 - Usuario 13 RENUEVA', '2025-02-17', '2025-03-17', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 14: Compra anual, vence en Feb 2026 (aún activa)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (14, 3, 'Membresia Feb 2025 - Usuario 14', '2025-02-01', '2026-02-01', 'Plan Anual', 500.00, 'ACTIVA', true);

-- Usuario 15: Compra y cancela antes de vencer (no cuenta para renovación)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (15, 1, 'Membresia Feb 2025 - Usuario 15', '2025-02-10', '2025-03-10', 'Plan Básico', 50.00, 'CANCELADA', true);

-- Usuario 16: Vence en Mayo, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (16, 2, 'Membresia Feb 2025 - Usuario 16', '2025-02-15', '2025-05-15', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 17: Vence en Marzo, SÍ renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (17, 1, 'Membresia Feb 2025 - Usuario 17', '2025-02-20', '2025-03-20', 'Plan Básico', 50.00, 'VENCIDA', true);

-- ========================================
-- MARZO 2025 (Vencidas en Abril-Junio)
-- ========================================
-- Usuario 17: RENOVACIÓN después de vencer
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (17, 1, 'Membresia Mar 2025 - Usuario 17 RENUEVA', '2025-03-22', '2025-04-22', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 18: Vence en Abril, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (18, 4, 'Membresia Mar 2025 - Usuario 18', '2025-03-05', '2025-04-05', 'Plan Intensivo', 70.00, 'VENCIDA', true);

-- Usuario 19: Vence en Abril, SÍ renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Mar 2025 - Usuario 19', '2025-03-10', '2025-04-10', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 20: Cancelada (no cuenta)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (20, 2, 'Membresia Mar 2025 - Usuario 20', '2025-03-15', '2025-06-15', 'Plan Premium', 140.00, 'CANCELADA', true);

-- Usuario 1: Vence en Abril, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (1, 1, 'Membresia Mar 2025 - Usuario 1', '2025-03-20', '2025-04-20', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 2: Vence en Abril, SÍ renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (2, 5, 'Membresia Mar 2025 - Usuario 2', '2025-03-25', '2025-04-25', 'Plan Yoga', 60.00, 'VENCIDA', true);

-- ========================================
-- ABRIL 2025 (Vencidas en Mayo-Julio)
-- ========================================
-- Usuario 12: RENOVACIÓN después de vencer en Abril
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (12, 2, 'Membresia Abr 2025 - Usuario 12 RENUEVA', '2025-04-12', '2025-07-12', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 19: RENOVACIÓN después de vencer
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Abr 2025 - Usuario 19 RENUEVA', '2025-04-12', '2025-05-12', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 2: RENOVACIÓN después de vencer
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (2, 5, 'Membresia Abr 2025 - Usuario 2 RENUEVA', '2025-04-27', '2025-05-27', 'Plan Yoga', 60.00, 'VENCIDA', true);

-- Usuario 3: Vence en Mayo, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (3, 1, 'Membresia Abr 2025 - Usuario 3', '2025-04-01', '2025-05-01', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 4: Vence en Julio, SÍ renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (4, 2, 'Membresia Abr 2025 - Usuario 4', '2025-04-05', '2025-07-05', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 5: Cancelada
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (5, 1, 'Membresia Abr 2025 - Usuario 5', '2025-04-10', '2025-05-10', 'Plan Básico', 50.00, 'CANCELADA', true);

-- Usuario 6: Vence en Julio, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (6, 6, 'Membresia Abr 2025 - Usuario 6', '2025-04-15', '2025-07-15', 'Plan Crossfit', 200.00, 'VENCIDA', true);

-- ========================================
-- MAYO 2025 (Vencidas en Junio-Agosto)
-- ========================================
-- Usuario 19: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia May 2025 - Usuario 19 RENUEVA', '2025-05-14', '2025-06-14', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 2: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (2, 5, 'Membresia May 2025 - Usuario 2 RENUEVA', '2025-05-29', '2025-06-29', 'Plan Yoga', 60.00, 'VENCIDA', true);

-- Usuario 7: Vence en Junio, SÍ renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia May 2025 - Usuario 7', '2025-05-01', '2025-06-01', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 8: Vence en Agosto, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (8, 2, 'Membresia May 2025 - Usuario 8', '2025-05-05', '2025-08-05', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 9: Vence en Junio, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (9, 1, 'Membresia May 2025 - Usuario 9', '2025-05-10', '2025-06-10', 'Plan Básico', 50.00, 'VENCIDA', false);

-- Usuario 10: Cancelada
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (10, 7, 'Membresia May 2025 - Usuario 10', '2025-05-15', '2025-06-15', 'Plan Nutrición', 40.00, 'CANCELADA', true);

-- ========================================
-- JUNIO 2025 (Vencidas en Julio)
-- ========================================
-- Usuario 7: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia Jun 2025 - Usuario 7 RENUEVA', '2025-06-03', '2025-07-03', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 19: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Jun 2025 - Usuario 19 RENUEVA', '2025-06-16', '2025-07-16', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 2: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (2, 5, 'Membresia Jun 2025 - Usuario 2 RENUEVA', '2025-07-01', '2025-08-01', 'Plan Yoga', 60.00, 'VENCIDA', true);

-- Usuario 11: Vence en Julio, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (11, 1, 'Membresia Jun 2025 - Usuario 11', '2025-06-01', '2025-07-01', 'Plan Básico', 50.00, 'VENCIDA', true);

-- ========================================
-- JULIO 2025 (Vencidas en Agosto-Octubre)
-- ========================================
-- Usuario 4: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (4, 2, 'Membresia Jul 2025 - Usuario 4 RENUEVA', '2025-07-07', '2025-10-07', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 12: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (12, 2, 'Membresia Jul 2025 - Usuario 12 RENUEVA', '2025-07-14', '2025-10-14', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 7: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia Jul 2025 - Usuario 7 RENUEVA', '2025-07-05', '2025-08-05', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 19: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Jul 2025 - Usuario 19 RENUEVA', '2025-07-18', '2025-08-18', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 14: Vence en Agosto, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (20, 1, 'Membresia Jul 2025 - Usuario 21', '2025-07-01', '2025-08-01', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 15: Cancelada
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (15, 2, 'Membresia Jul 2025 - Usuario 15', '2025-07-05', '2025-10-05', 'Plan Premium', 140.00, 'CANCELADA', true);

-- Usuario 16: Vence en Agosto, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (16, 1, 'Membresia Jul 2025 - Usuario 16', '2025-07-10', '2025-08-10', 'Plan Básico', 50.00, 'VENCIDA', true);

-- ========================================
-- AGOSTO 2025 (Vencidas en Septiembre)
-- ========================================
-- Usuario 2: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (2, 5, 'Membresia Ago 2025 - Usuario 2 RENUEVA', '2025-08-03', '2025-09-03', 'Plan Yoga', 60.00, 'VENCIDA', true);

-- Usuario 7: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia Ago 2025 - Usuario 7 RENUEVA', '2025-08-07', '2025-09-07', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 19: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Ago 2025 - Usuario 19 RENUEVA', '2025-08-20', '2025-09-20', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 17: Plan anual, vence en Ago 2026
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (17, 9, 'Membresia Ago 2025 - Usuario 17', '2025-08-01', '2026-08-01', 'Plan Familiar', 900.00, 'ACTIVA', TRUE);

-- Usuario 18: Vence en Sep, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (18, 1, 'Membresia Ago 2025 - Usuario 18', '2025-08-05', '2025-09-05', 'Plan Básico', 50.00, 'VENCIDA', true);

-- ========================================
-- SEPTIEMBRE 2025 (Vencidas en Octubre-Diciembre)
-- ========================================
-- Usuario 2: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (2, 2, 'Membresia Sep 2025 - Usuario 2 RENUEVA', '2025-09-05', '2025-12-05', 'Plan Premium', 140.00, 'VENCIDA', true);

-- Usuario 7: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia Sep 2025 - Usuario 7 RENUEVA', '2025-09-09', '2025-10-09', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 19: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Sep 2025 - Usuario 19 RENUEVA', '2025-09-22', '2025-10-22', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 20: Cancelada
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (20, 1, 'Membresia Sep 2025 - Usuario 20', '2025-09-01', '2025-10-01', 'Plan Básico', 50.00, 'CANCELADA', true);

-- Usuario 1: Vence en Octubre, SÍ renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (1, 10, 'Membresia Sep 2025 - Usuario 1', '2025-09-05', '2025-10-05', 'Plan Estudiantil', 30.00, 'VENCIDA', true);

-- ========================================
-- OCTUBRE 2025 (Vencidas en Noviembre-Enero)
-- ========================================
-- Usuario 1: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (1, 1, 'Membresia Oct 2025 - Usuario 1 RENUEVA', '2025-10-07', '2025-11-07', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 7: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia Oct 2025 - Usuario 7 RENUEVA', '2025-10-11', '2025-11-11', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 19: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Oct 2025 - Usuario 19 RENUEVA', '2025-10-24', '2025-11-24', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 4: RENOVACIÓN (upgrade a Premium)
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (4, 2, 'Membresia Oct 2025 - Usuario 4 RENUEVA', '2025-10-09', '2026-01-09', 'Plan Premium', 140.00, 'ACTIVA', TRUE);

-- Usuario 12: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (12, 2, 'Membresia Oct 2025 - Usuario 12 RENUEVA', '2025-10-16', '2026-01-16', 'Plan Premium', 140.00, 'ACTIVA', TRUE);

-- Usuario 3: Vence en Nov, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (3, 1, 'Membresia Oct 2025 - Usuario 3', '2025-10-01', '2025-11-01', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 5: Vence en Nov, NO renueva
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (5, 1, 'Membresia Oct 2025 - Usuario 5', '2025-10-10', '2025-11-10', 'Plan Básico', 50.00, 'VENCIDA', true);

-- ========================================
-- NOVIEMBRE 2025 (Vencidas en Diciembre-Febrero)
-- ========================================
-- Usuario 1: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (1, 1, 'Membresia Nov 2025 - Usuario 1 RENUEVA', '2025-11-09', '2025-12-09', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 7: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia Nov 2025 - Usuario 7 RENUEVA', '2025-11-13', '2025-12-13', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 19: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Nov 2025 - Usuario 19 RENUEVA', '2025-11-26', '2025-12-26', 'Plan Básico', 50.00, 'VENCIDA', true);

-- Usuario 2: RENOVACIÓN
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (2, 2, 'Membresia Nov 2025 - Usuario 2 RENUEVA', '2025-12-07', '2026-03-07', 'Plan Premium', 140.00, 'ACTIVA', TRUE);

-- Usuario 8: Plan Premium, vence Feb 2026
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (8, 2, 'Membresia Nov 2025 - Usuario 8', '2025-11-10', '2026-02-10', 'Plan Premium', 140.00, 'ACTIVA', TRUE);

-- ========================================
-- DICIEMBRE 2025 (Vencidas en Enero 2026)
-- ========================================
-- Usuario 1: RENOVACIÓN - Ahora activa
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (1, 1, 'Membresia Dic 2025 - Usuario 1 RENUEVA', '2025-12-11', '2026-01-11', 'Plan Básico', 50.00, 'ACTIVA', TRUE);

-- Usuario 7: RENOVACIÓN - Ahora activa
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (7, 1, 'Membresia Dic 2025 - Usuario 7 RENUEVA', '2025-12-15', '2026-01-15', 'Plan Básico', 50.00, 'ACTIVA', TRUE);

-- Usuario 19: RENOVACIÓN - Ahora activa
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (19, 1, 'Membresia Dic 2025 - Usuario 19 RENUEVA', '2025-12-28', '2026-01-28', 'Plan Básico', 50.00, 'ACTIVA', TRUE);

-- Usuario 9: Vence en Enero 2026, aún no sabemos si renovará
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (9, 1, 'Membresia Dic 2025 - Usuario 9', '2025-12-01', '2026-01-01', 'Plan Básico', 50.00, 'ACTIVA', TRUE);

-- Usuario 10: Vence en Enero 2026
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio, estado, disponible) VALUES
    (10, 4, 'Membresia Dic 2025 - Usuario 10', '2025-12-05', '2026-01-05', 'Plan Intensivo', 70.00, 'ACTIVA', TRUE);

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
