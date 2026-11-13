
BEGIN;


INSERT INTO role (charge, permission) VALUES
    ('ADMINISTRATOR', 'MANAGE'),
    ('MECHANIC', 'READ_WRITE'),
    ('CUSTOMER', 'READ');


INSERT INTO users (
    role_id, id_card, username, first_name, last_name, 
    password_hash, phone_number, email, state, creation_date, last_access, last_update
) VALUES
    (1, 'V-15890123', 'admin_taller', 'Roberto', 'Méndez', '$2b$12$KIX/x8k1.hashSimuladoAdmin99', '0414-7001122', 'admin@taller.com', 'ACTIVE', NOW() - INTERVAL '30 days', NOW(), NOW() - INTERVAL '30 days'),
    (2, 'V-20456789', 'mecanico_jefe', 'Javier', 'Zambrano', '$2b$12$KIX/x8k1.hashSimuladoMeca88', '0424-7112233', 'j.zambrano@taller.com', 'ACTIVE', NOW() - INTERVAL '25 days', NOW(), NOW() - INTERVAL '30 days'),
    (3, 'V-30112233', 'carlos_perez', 'Carlos', 'Pérez', '$2b$12$KIX/x8k1.hashSimuladoCli01', '0412-5556677', 'carlos.perez@email.com', 'ACTIVE', NOW() - INTERVAL '5 days', NOW() - INTERVAL '1 day', NOW() - INTERVAL '30 days'),
    (3, 'V-28990011', 'elena_gomez', 'Elena', 'Gómez', '$2b$12$KIX/x8k1.hashSimuladoCli02', '0416-8889900', 'elena.gomez@email.com', 'ACTIVE', NOW() - INTERVAL '2 days', NOW(), NOW() - INTERVAL '30 days'),
    (1, 'V-18234567', 'gerencia_taller', 'Marcos', 'Contreras', '$2b$12$KIX/x8k1.hashSimuladoAdmin02', '0414-7223344', 'm.contreras@taller.com', 'ACTIVE', '2026-10-08 08:30:00', '2026-11-04 16:20:15', '2026-11-04 16:20:15'),
    (2, 'V-22345678', 'mecanico_pedro', 'Pedro', 'Ramírez', '$2b$12$KIX/x8k1.hashSimuladoMeca02', '0424-7334455', 'p.ramirez@taller.com', 'ACTIVE', '2026-10-12 07:45:00', '2026-11-04 18:10:00', '2026-11-04 18:10:00'),
    (2, 'V-25112244', 'mecanico_luis', 'Luis', 'Hernández', '$2b$12$KIX/x8k1.hashSimuladoMeca03', '0412-7445566', 'l.hernandez@taller.com', 'ACTIVE', '2026-10-15 08:00:00', '2026-11-04 17:55:30', '2026-11-04 17:55:30'),
    (2, 'V-24667788', 'mecanico_gabriel', 'Gabriel', 'Mora', '$2b$12$KIX/x8k1.hashSimuladoMeca04', '0416-7556677', 'g.mora@taller.com', 'SUSPEND', '2026-10-18 07:50:00', '2026-10-28 14:30:10', '2026-11-01 09:00:00'),
    (3, 'V-19445566', 'mariana_silva', 'Mariana', 'Silva', '$2b$12$KIX/x8k1.hashSimuladoCli03', '0414-7667788', 'mariana.silva@email.com', 'ACTIVE', '2026-10-20 09:15:00', '2026-11-01 11:22:45', '2026-11-01 11:22:45'),
    (3, 'V-21334455', 'diego_morales', 'Diego', 'Morales', '$2b$12$KIX/x8k1.hashSimuladoCli04', '0424-7778899', 'diego.morales@email.com', 'ACTIVE', '2026-10-22 10:40:00', '2026-11-02 15:05:12', '2026-11-02 15:05:12'),
    (3, 'V-27889900', 'valeria_rojas', 'Valeria', 'Rojas', '$2b$12$KIX/x8k1.hashSimuladoCli05', '0412-7889900', 'valeria.rojas@email.com', 'ACTIVE', '2026-10-25 14:10:00', '2026-11-04 09:45:20', '2026-11-04 09:45:20'),
    (3, 'V-16778899', 'fernando_castro', 'Fernando', 'Castro', '$2b$12$KIX/x8k1.hashSimuladoCli06', '0416-7990011', 'f.castro@email.com', 'ACTIVE', '2026-10-27 16:30:00', '2026-10-31 17:12:00', '2026-10-31 17:12:00'),
    (3, 'V-29554433', 'andrea_medina', 'Andrea', 'Medina', '$2b$12$KIX/x8k1.hashSimuladoCli07', '0414-8001122', 'andrea.medina@email.com', 'INACTIVE', '2026-09-15 11:00:00', '2026-09-20 18:40:00', '2026-10-20 12:00:00'),
    (3, 'V-31223344', 'ricardo_vargas', 'Ricardo', 'Vargas', '$2b$12$KIX/x8k1.hashSimuladoCli08', '0424-8112233', 'ricardo.vargas@email.com', 'ACTIVE', '2026-11-01 13:20:00', '2026-11-04 20:15:00', '2026-11-04 20:15:00'),
    (3, 'V-14998877', 'hector_guerrero', 'Héctor', 'Guerrero', '$2b$12$KIX/x8k1.hashSimuladoCli09', '0412-8223344', 'hector.guerrero@email.com', 'BLOCKED', '2026-10-05 15:45:00', '2026-10-12 10:10:00', '2026-10-15 08:30:00'),
    (1, 'V-12345678', 'admin_secundario', 'Carmen', 'Rosa', '$2b$12$KIX/x8k1.hashSimuladoAdmin03', '0414-7118899', 'carmen.rosa@taller.com', 'ACTIVE', NOW() - INTERVAL '20 days', NOW(), NOW() - INTERVAL '20 days'),
    (2, 'V-26789012', 'mecanico_carlos', 'Carlos', 'Silveira', '$2b$12$KIX/x8k1.hashSimuladoMeca05', '0424-7229900', 'c.silveira@taller.com', 'ACTIVE', NOW() - INTERVAL '15 days', NOW(), NOW() - INTERVAL '15 days'),
    (2, 'V-23456789', 'mecanico_jose', 'José', 'Quintero', '$2b$12$KIX/x8k1.hashSimuladoMeca06', '0412-7330011', 'j.quintero@taller.com', 'ACTIVE', NOW() - INTERVAL '10 days', NOW(), NOW() - INTERVAL '10 days'),
    (3, 'V-17890123', 'gabriel_santos', 'Gabriel', 'Santos', '$2b$12$KIX/x8k1.hashSimuladoCli10', '0414-8334455', 'gabriel.santos@email.com', 'ACTIVE', NOW() - INTERVAL '8 days', NOW(), NOW() - INTERVAL '8 days'),
    (3, 'V-22112233', 'sofia_martinez', 'Sofía', 'Martínez', '$2b$12$KIX/x8k1.hashSimuladoCli11', '0424-8445566', 'sofia.martinez@email.com', 'ACTIVE', NOW() - INTERVAL '6 days', NOW(), NOW() - INTERVAL '6 days'),
    (3, 'V-26445566', 'alejandro_torres', 'Alejandro', 'Torres', '$2b$12$KIX/x8k1.hashSimuladoCli12', '0412-8556677', 'alejandro.torres@email.com', 'ACTIVE', NOW() - INTERVAL '4 days', NOW(), NOW() - INTERVAL '4 days');
	
INSERT INTO brand (name, country_origin) VALUES
    ('Mazda', 'JAPAN'),
    ('Renault', 'FRANCE'),
    ('Ford', 'EEUU'),
    ('Toyota', 'JAPAN'),
    ('Chevrolet', 'EEUU'),
    ('Volkswagen', 'GERMANY'),
    ('Fiat', 'ITALY'),
    ('Peugeot', 'FRANCE');

INSERT INTO model (brand_id, name, category) VALUES
    (1, 'Mazda 6', 'SEDAN'),
    (2, 'Twingo', 'COMPACT'),
    (3, 'Explorer', 'VAN'),
    (4, 'Corolla', 'SEDAN'),
    (4, 'Hilux', 'VAN'),
    (5, 'Cruze', 'SEDAN'),
    (6, 'Golf', 'COMPACT'),
    (7, 'Palio', 'COMPACT'),
    (8, '206', 'COMPACT');


INSERT INTO vehicle (plate, model_id, year, color) VALUES
    ('AB123CD', 1, 2007, 'Plata'),
    ('AA987ZY', 2, 2008, 'Azul'),
    ('AF456GH', 3, 2018, 'Negro'),
    ('BC567EF', 4, 2015, 'Blanco'),
    ('XY789ZZ', 5, 2012, 'Rojo'),
    ('JK345LM', 6, 2020, 'Gris'),
    ('PR901ST', 7, 2005, 'Verde'),
    ('UV234WX', 8, 2009, 'Amarillo');


INSERT INTO catalog_service (description, reference_price, state_active) VALUES
    ('Diagnóstico computarizado con escáner OBD-II', 25.00, TRUE),
    ('Cambio de aceite 15W-40 y reemplazo de filtro', 45.00, TRUE),
    ('Mantenimiento de cuerpo de aceleración e inyectores', 60.00, TRUE),
    ('Reemplazo de kit de correa de distribución', 120.00, TRUE),
    ('Alineación y balanceo computarizado de 4 ruedas', 30.00, TRUE),
    ('Reemplazo de pastillas de freno delanteras y traseras', 50.00, TRUE),
    ('Reparación y mantenimiento de alternador de arranque', 85.00, TRUE),
    ('Limpieza ultrasónica de inyectores de gasolina', 40.00, TRUE),
    ('Carga de gas refrigerante para aire acondicionado', 65.00, TRUE);


INSERT INTO service (
    tracking_code, id_customer, id_responsible, vehicle_plate, 
    current_state, reason_admission, entry_mileage, entry_date, 
    estimated_delivery_date, delivery_date, confirmed_delivery
) VALUES
    (
        'SRV-2026-0001', 3, 2, 'AB123CD', 
        'IN_REPAIR', 'Falla en mínimo y mantenimiento preventivo de aceite', 145000, 
        NOW() - INTERVAL '3 days', NOW() + INTERVAL '1 day', NULL, FALSE
    ),
    (
        'SRV-2026-0002', 4, 2, 'AA987ZY', 
        'BUDGET_PENDING', 'Ruido en tensor de correa al encender en frío', 182300, 
        NOW() - INTERVAL '1 day', NOW() + INTERVAL '4 days', NULL, FALSE
    ),
    (
        'SRV-2026-0003', 19, 17, 'BC567EF', 
        'RECEIVED', 'Mantenimiento de 100,000 km y revisión general', 98500, 
        NOW() - INTERVAL '2 days', NOW() + INTERVAL '2 days', NULL, FALSE
    ),
    (
        'SRV-2026-0004', 20, 18, 'XY789ZZ', 
        'IN_REPAIR', 'Falla de aceleración y pérdida de potencia en subidas', 134000, 
        NOW() - INTERVAL '4 days', NOW() + INTERVAL '1 day', NULL, FALSE
    ),
    (
        'SRV-2026-0005', 21, 2, 'JK345LM', 
        'FINISHED', 'Cambio de pastillas de freno y rectificación de discos', 45000, 
        NOW() - INTERVAL '6 days', NOW() - INTERVAL '1 day', NOW() - INTERVAL '12 hours', TRUE
    ),
    (
        'SRV-2026-0006', 19, 17, 'PR901ST', 
        'WAITING_FOR_PARTS', 'Revisión del sistema de refrigeración y bote de anticongelante', 210000, 
        NOW() - INTERVAL '5 days', NOW() + INTERVAL '3 days', NULL, FALSE
    ),
    (
        'SRV-2026-0007', 20, 18, 'UV234WX', 
        'DELIVERED', 'Mantenimiento preventivo general y afinación de motor', 115000, 
        NOW() - INTERVAL '10 days', NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days', TRUE
    );


INSERT INTO previous_external_work (service_id, workshop_name, description, approximate_date) VALUES
    (1, 'Electroauto Los Andes', 'Cambio de pila de bomba de gasolina', '2026-08-15'),
    (2, 'Taller Mecánico El Rápido', 'Ajuste de tren delantero y cambio de terminales', '2026-06-10'),
    (3, 'Talleres Multimarca Central', 'Cambio de aceite previo y revisión de filtros', '2026-09-01'),
    (4, 'Inyección Diesel y Gasolina San Cristóbal', 'Limpieza provisional de cuerpo de aceleración', '2026-08-20'),
    (5, 'Frenos y Embragues El Águila', 'Cambio de líquido de frenos', '2026-07-15'),
    (6, 'Radiadores Táchira', 'Reparación temporal de manguera de agua', '2026-09-10'),
    (7, 'Electricidad Automotriz El Rayo', 'Revisión del sistema eléctrico general', '2026-06-30');


INSERT INTO record_state (id_service, state, change_date, id_staff, comment) VALUES
    (1, 'RECEIVED', NOW() - INTERVAL '3 days', 1, 'Vehículo recibido sin detalles de carrocería'),
    (1, 'IN_DIAGNOSIS', NOW() - INTERVAL '2 days', 2, 'Escaneo completado: código P0505 (control de ralentí)'),
    (1, 'IN_REPAIR', NOW() - INTERVAL '1 day', 2, 'Presupuesto aprobado por el cliente, iniciando limpieza y cambio de aceite'),
    (2, 'RECEIVED', NOW() - INTERVAL '1 day', 1, 'Ingreso por grúa preventiva'),
    (2, 'BUDGET_PENDING', NOW() - INTERVAL '12 hours', 2, 'Se requiere reemplazo de kit de tiempo completo'),
    (3, 'RECEIVED', NOW() - INTERVAL '2 days', 1, 'Ingreso del vehículo para mantenimiento programado'),
    (4, 'RECEIVED', NOW() - INTERVAL '4 days', 1, 'Ingreso por falla de potencia en motor'),
    (4, 'IN_DIAGNOSIS', NOW() - INTERVAL '3 days', 18, 'Diagnóstico: cuerpo de aceleración sucio y bujías desgastadas'),
    (5, 'IN_REPAIR', NOW() - INTERVAL '5 days', 2, 'Iniciando cambio de pastillas de freno'),
    (5, 'FINISHED', NOW() - INTERVAL '12 hours', 2, 'Trabajo completado exitosamente y probado en pista');


INSERT INTO budget (id_service, version, state, issue_date, response_date, comments) VALUES
    (1, 1, 'APPROVED', NOW() - INTERVAL '2 days', NOW() - INTERVAL '1 day', 'Aprobado vía telefónica y correo'),
    (2, 1, 'SENT', NOW() - INTERVAL '12 hours', NULL, 'Esperando confirmación del cliente para pedir repuestos'),
    (3, 1, 'APPROVED', NOW() - INTERVAL '2 days', NOW() - INTERVAL '1 day', 'Presupuesto aprobado por el cliente vía web'),
    (4, 1, 'APPROVED', NOW() - INTERVAL '3 days', NOW() - INTERVAL '2 days', 'Aprobado parcialmente por el cliente'),
    (5, 1, 'APPROVED', NOW() - INTERVAL '6 days', NOW() - INTERVAL '5 days', 'Aprobado de inmediato en mostrador'),
    (6, 1, 'SENT', NOW() - INTERVAL '4 days', NULL, 'Esperando autorización para compra de repuestos'),
    (7, 1, 'APPROVED', NOW() - INTERVAL '9 days', NOW() - INTERVAL '8 days', 'Presupuesto inicial ejecutado y pagado');

INSERT INTO budget_detail (budget_id, catalog_id, quantity, applied_cost) VALUES
    (1, 1, 1, 25.00),
    (1, 2, 1, 45.00),
    (1, 3, 1, 55.00), -- Descuento de $5 aplicado sobre el precio de referencia ($60)
    (2, 1, 1, 25.00),
    (2, 4, 1, 120.00),
    (3, 5, 1, 30.00), -- Alineación
    (4, 6, 1, 50.00), -- Pastillas de freno
    (4, 8, 1, 40.00), -- Limpieza de inyectores
    (5, 6, 1, 50.00), -- Pastillas de freno
    (6, 7, 1, 85.00), -- Alternador
    (7, 2, 1, 45.00); -- Cambio de aceite


INSERT INTO parts_list (id_service, part_name, specification, quantity, state) VALUES
    (1, 'Filtro de aceite', 'Motorcraft FL-910S / Equivalente 2.3L', 1, 'INSTALLED'),
    (1, 'Aceite mineral 15W-40', 'Cuarto de galón API SP', 5, 'DELIVERED_BY_CUSTOMER'),
    (2, 'Kit de correa de tiempo + tensor', 'Renault D4F 16V Original', 1, 'REQUESTED'),
    (3, 'Bujías de Iridio', 'NGK Laser Iridio DF6H-11B', 4, 'INSTALLED'),
    (4, 'Filtro de aire', 'Mann-Filter C 27 009', 1, 'DELIVERED_BY_CUSTOMER'),
    (5, 'Pastillas de freno cerámicas', 'Brembo P 85 020N', 1, 'INSTALLED'),
    (6, 'Bomba de agua', 'GMB Water Pump 130-1820', 1, 'REQUESTED'),
    (7, 'Correa auxiliar poly-V', 'Gates 6PK1560', 1, 'INSTALLED');

INSERT INTO notification (id_service, type, destination_email, message, sent_date, sent) VALUES
    (1, 'BUDGET_READY', 'carlos.perez@email.com', 'Su presupuesto para el servicio SRV-2026-0001 está listo.', NOW() - INTERVAL '2 days', TRUE),
    (1, 'STATE_CHANGE', 'carlos.perez@email.com', 'Su vehículo Mazda 6 ha pasado a fase de reparación.', NOW() - INTERVAL '1 day', TRUE),
    (2, 'BUDGET_READY', 'elena.gomez@email.com', 'Presupuesto generado para revisión de kit de distribución.', NULL, FALSE),
    (3, 'BUDGET_READY', 'gabriel.santos@email.com', 'Presupuesto para servicio SRV-2026-0003 disponible.', NOW() - INTERVAL '2 days', TRUE),
    (4, 'STATE_CHANGE', 'sofia.martinez@email.com', 'Su vehículo se encuentra en fase de reparación.', NOW() - INTERVAL '3 days', TRUE),
    (5, 'READY_FOR_PICKUP', 'alejandro.torres@email.com', 'Su vehículo está listo para ser retirado del taller.', NOW() - INTERVAL '12 hours', TRUE),
    (6, 'PART_REQUIRED', 'gabriel.santos@email.com', 'Se requiere la autorización de repuestos para su vehículo.', NOW() - INTERVAL '4 days', TRUE),
    (7, 'DELIVERY_CONFIRMATION', 'sofia.martinez@email.com', 'Confirmación de entrega exitosa de su vehículo.', NOW() - INTERVAL '5 days', TRUE);

COMMIT;

/*
select * from USERS --REVISION DE ATRIBUTOS DE CADA INSERT

delete from catalog_service --LIMPIEZA DE LOS REGISTROS DE LA TABLA EN CASO DE SER NECESARIO

ALTER TABLE catalog_service ALTER COLUMN ID RESTART WITH 1; --REINICIO DE CONTADOR DE LOS AUTOINCREMENT POR PROBLEMAS GENERADOS
*/
