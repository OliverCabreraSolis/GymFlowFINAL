-- ================================================
-- USUARIO
-- ================================================
INSERT INTO usuario (nombre, correo, contrasena, rol) VALUES
('Carlos Pérez', 'carlos.perez@gmail.com', '12345', 'CLIENTE'),
('María Gómez', 'maria.gomez@gmail.com', 'abcde', 'CLIENTE'),
('Admin Flow', 'admin@gymflow.com', 'admin123', 'ADMIN');

-- ================================================
-- TIPO PRODUCTO
-- ================================================
INSERT INTO tipo_producto (nombre_tipo, descripcion_producto) VALUES
('Suplemento', 'Productos nutricionales que ayudan al rendimiento.'),
('Accesorio', 'Elementos de apoyo para el entrenamiento.'),
('Ropa deportiva', 'Prendas diseñadas para comodidad y transpiración.');

-- ================================================
-- PRODUCTO
-- ================================================
INSERT INTO producto (id_tipo, nombre, descripcion, precio) VALUES
(1, 'Proteína Whey', 'Suplemento de proteína de suero de leche (1kg).', 120.50),
(2, 'Cinturón de levantamiento', 'Soporte lumbar para ejercicios de peso.', 80.00),
(3, 'Polo DryFit', 'Polo transpirable con logo de Gym Flow.', 55.00);

-- ================================================
-- PLAN
-- ================================================
INSERT INTO plan (nombre, duracion, precio, descripcion) VALUES
('Plan Mensual', '30 días', 100.00, 'Acceso libre al gimnasio por 1 mes.'),
('Plan Trimestral', '90 días', 270.00, 'Acceso libre por 3 meses con descuento.'),
('Plan Anual', '365 días', 900.00, 'Acceso ilimitado durante todo el año.');

-- ================================================
-- MEMBRESÍA
-- (Cada membresía se asocia a un usuario y a un plan)
-- ================================================
INSERT INTO membresia (id_usuario, id_plan, nombre, fecha_inicio, fecha_fin, descripcion, precio) VALUES
(1, 1, 'Membresía Mensual de Carlos', '2025-11-01', '2025-11-30', 'Acceso total al gimnasio por un mes.', 100.00),
(2, 2, 'Membresía Trimestral de María', '2025-10-15', '2026-01-15', 'Incluye asesoramiento personalizado.', 270.00),
(1, 3, 'Membresía Anual de Carlos', '2025-01-01', '2026-01-01', 'Acceso premium con beneficios anuales.', 900.00);

-- ================================================
-- PAGO
-- (Cada pago pertenece a un usuario)
-- ================================================
INSERT INTO pago (fecha, total, metodo_pago, id_usuario) VALUES
('2025-11-01', 100.00, 'Tarjeta', 1),
('2025-10-15', 350.00, 'Efectivo', 2),
('2025-01-01', 975.00, 'Transferencia', 1);

-- ================================================
-- DETALLE PAGO
-- (Cada detalle puede referirse a un PLAN o un PRODUCTO)
-- ================================================
INSERT INTO detalle_pago (id_pago, tipo_item, id_producto, id_plan, cantidad, precio_unitario, subtotal) VALUES
-- Pago 1: Carlos compra un plan mensual
(1, 'PLAN', NULL, 1, 1, 100.00, 100.00),

-- Pago 2: María compra un plan trimestral + un producto
(2, 'PLAN', NULL, 2, 1, 270.00, 270.00),
(2, 'PRODUCTO', 2, NULL, 1, 80.00, 80.00),

-- Pago 3: Carlos compra un plan anual + una proteína
(3, 'PLAN', NULL, 3, 1, 900.00, 900.00),
(3, 'PRODUCTO', 1, NULL, 1, 75.00, 75.00);
