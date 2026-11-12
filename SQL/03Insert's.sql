
BEGIN;


INSERT INTO role (charge, permission) VALUES
    ('ADMINISTRATOR', 'MANAGE'),
    ('MECHANIC', 'READ_WRITE'),
    ('CUSTOMER', 'READ');


INSERT INTO users (
    role_id, id_card, username, first_name, last_name, 
    password_hash, phone_number, email, state, creation_date, last_access, last_update
) VALUES
    (1, 'V-15890123', 'admin_taller', 'Roberto', 'Méndez', '$2b$12$KIX/x8k1.hashSimuladoAdmin99', '0414-7001122', 'admin@taller.com', 'ACTIVE', NOW() - INTERVAL '30 days', NOW()),
    (2, 'V-20456789', 'mecanico_jefe', 'Javier', 'Zambrano', '$2b$12$KIX/x8k1.hashSimuladoMeca88', '0424-7112233', 'j.zambrano@taller.com', 'ACTIVE', NOW() - INTERVAL '25 days', NOW()),
    (3, 'V-30112233', 'carlos_perez', 'Carlos', 'Pérez', '$2b$12$KIX/x8k1.hashSimuladoCli01', '0412-5556677', 'carlos.perez@email.com', 'ACTIVE', NOW() - INTERVAL '5 days', NOW() - INTERVAL '1 day'),
    (3, 'V-28990011', 'elena_gomez', 'Elena', 'Gómez', '$2b$12$KIX/x8k1.hashSimuladoCli02', '0416-8889900', 'elena.gomez@email.com', 'ACTIVE', NOW() - INTERVAL '2 days', NOW());
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
    (3, 'V-14998877', 'hector_guerrero', 'Héctor', 'Guerrero', '$2b$12$KIX/x8k1.hashSimuladoCli09', '0412-8223344', 'hector.guerrero@email.com', 'BLOCKED', '2026-10-05 15:45:00', '2026-10-12 10:10:00', '2026-10-15 08:30:00');

	
INSERT INTO brand (name, country_origin) VALUES
    ('Mazda', 'JAPAN'),
    ('Renault', 'FRANCE'),
    ('Ford', 'EEUU');

INSERT INTO model (brand_id, name, category) VALUES
    (1, 'Mazda 6', 'SEDAN'),
    (2, 'Twingo', 'COMPACT'),
    (3, 'Explorer', 'VAN');


INSERT INTO vehicle (plate, model_id, year, color) VALUES
    ('AB123CD', 1, 2007, 'Plata'),
    ('AA987ZY', 2, 2008, 'Azul'),
    ('AF456GH', 3, 2018, 'Negro');


INSERT INTO catalog_service (description, reference_price, state_active) VALUES
    ('Diagnóstico computarizado con escáner OBD-II', 25.00, TRUE),
    ('Cambio de aceite 15W-40 y reemplazo de filtro', 45.00, TRUE),
    ('Mantenimiento de cuerpo de aceleración e inyectores', 60.00, TRUE),
    ('Reemplazo de kit de correa de distribución', 120.00, TRUE);


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
    );


INSERT INTO previous_external_work (service_id, workshop_name, description, approximate_date) VALUES
    (1, 'Electroauto Los Andes', 'Cambio de pila de bomba de gasolina', '2026-08-15'),
    (2, 'Taller Mecánico El Rápido', 'Ajuste de tren delantero y cambio de terminales', '2026-06-10');


INSERT INTO record_state (id_service, state, change_date, id_staff, comment) VALUES
    (1, 'RECEIVED', NOW() - INTERVAL '3 days', 1, 'Vehículo recibido sin detalles de carrocería'),
    (1, 'IN_DIAGNOSIS', NOW() - INTERVAL '2 days', 2, 'Escaneo completado: código P0505 (control de ralentí)'),
    (1, 'IN_REPAIR', NOW() - INTERVAL '1 day', 2, 'Presupuesto aprobado por el cliente, iniciando limpieza y cambio de aceite'),
    (2, 'RECEIVED', NOW() - INTERVAL '1 day', 1, 'Ingreso por grúa preventiva'),
    (2, 'BUDGET_PENDING', NOW() - INTERVAL '12 hours', 2, 'Se requiere reemplazo de kit de tiempo completo');


INSERT INTO budget (id_service, version, state, issue_date, response_date, comments) VALUES
    (1, 1, 'APPROVED', NOW() - INTERVAL '2 days', NOW() - INTERVAL '1 day', 'Aprobado vía telefónica y correo'),
    (2, 1, 'SENT', NOW() - INTERVAL '12 hours', NULL, 'Esperando confirmación del cliente para pedir repuestos');

INSERT INTO budget_detail (budget_id, catalog_id, quantity, applied_cost) VALUES
    (1, 1, 1, 25.00),
    (1, 2, 1, 45.00),
    (1, 3, 1, 55.00), -- Descuento de $5 aplicado sobre el precio de referencia ($60)
    (2, 1, 1, 25.00),
    (2, 4, 1, 120.00);


INSERT INTO parts_list (id_service, part_name, specification, quantity, state) VALUES
    (1, 'Filtro de aceite', 'Motorcraft FL-910S / Equivalente 2.3L', 1, 'INSTALLED'),
    (1, 'Aceite mineral 15W-40', 'Cuarto de galón API SP', 5, 'DELIVERED_BY_CUSTOMER'),
    (2, 'Kit de correa de tiempo + tensor', 'Renault D4F 16V Original', 1, 'REQUESTED');

INSERT INTO notification (id_service, type, destination_email, message, sent_date, sent) VALUES
    (1, 'BUDGET_READY', 'carlos.perez@email.com', 'Su presupuesto para el servicio SRV-2026-0001 está listo.', NOW() - INTERVAL '2 days', TRUE),
    (1, 'STATE_CHANGE', 'carlos.perez@email.com', 'Su vehículo Mazda 6 ha pasado a fase de reparación.', NOW() - INTERVAL '1 day', TRUE),
    (2, 'BUDGET_READY', 'elena.gomez@email.com', 'Presupuesto generado para revisión de kit de distribución.', NULL, FALSE);

COMMIT;

/*
select * from USERS --REVISION DE ATRIBUTOS DE CADA INSERT

delete from catalog_service --LIMPIEZA DE LOS REGISTROS DE LA TABLA EN CASO DE SER NECESARIO

ALTER TABLE catalog_service ALTER COLUMN ID RESTART WITH 1; --REINICIO DE CONTADOR DE LOS AUTOINCREMENT POR PROBLEMAS GENERADOS
*/
