-- ==========================================
-- 1. TIPOS ENUM
-- ==========================================
CREATE TYPE service_state AS ENUM (
    'RECEIVED',
    'IN_DIAGNOSIS',
    'BUDGET_PENDING',
    'WAITING_FOR_PARTS',
    'IN_REPAIR',
    'FINISHED',
    'DELIVERED'
);

CREATE TYPE budget_state AS ENUM (
    'DRAFT',
    'SENT',
    'APPROVED',
    'REJECTED'
);

CREATE TYPE replacement_state AS ENUM (
    'REQUESTED',
    'DELIVERED_BY_CUSTOMER',
    'INSTALLED'
);

CREATE TYPE alert_type AS ENUM (
    'STATE_CHANGE',
    'BUDGET_READY',
    'PART_REQUIRED',
    'READY_FOR_PICKUP',
    'DELIVERY_CONFIRMATION'
);

CREATE TYPE countries AS ENUM (
    'EEUU',
    'ITALY',
    'JAPAN',
    'GERMANY',
    'FRANCE'
);

CREATE TYPE vehicle_category AS ENUM (
    'SEDAN',
    'SPORT',
    'COMPACT',
    'VAN'
);

CREATE TYPE permissions AS ENUM (
    'READ',
    'READ_WRITE',
    'MANAGE'
);

CREATE TYPE charges AS ENUM (
    'ADMINISTRATOR',
    'CUSTOMER',
    'MECHANIC'
);

CREATE TYPE users_state AS ENUM (
    'ACTIVE',
    'INACTIVE',
    'BLOCKED',
    'SUSPEND'
);

-- ==========================================
-- 2. TABLAS DEL SISTEMA
-- ==========================================
CREATE TABLE role (
    id SERIAL PRIMARY KEY,
    charge charges DEFAULT 'CUSTOMER',
    permission permissions DEFAULT 'READ'
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    role_id INT REFERENCES role(id),
    id_card VARCHAR(10) UNIQUE NOT NULL,
    username VARCHAR UNIQUE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100) NOT NULL,
    state users_state DEFAULT 'ACTIVE',
    first_access TIMESTAMP,
    last_access TIMESTAMP,
    last_update TIMESTAMP
);

CREATE TABLE brand (
    id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    country_origin countries DEFAULT 'JAPAN'
);

CREATE TABLE model (
    id SERIAL PRIMARY KEY,
    brand_id INT NOT NULL REFERENCES brand(id),
    name VARCHAR NOT NULL,
    category vehicle_category DEFAULT 'SEDAN'
);

CREATE TABLE vehicle (
    plate VARCHAR PRIMARY KEY,
    model_id INT NOT NULL REFERENCES model(id),
    year INT,
    color VARCHAR
);

CREATE TABLE service (
    id SERIAL PRIMARY KEY,
    tracking_code VARCHAR UNIQUE NOT NULL,
    id_customer INT NOT NULL REFERENCES users(id),
    id_responsible INT REFERENCES users(id),
    vehicle_plate VARCHAR NOT NULL REFERENCES vehicle(plate),
    current_state service_state DEFAULT 'RECEIVED',
    reason_admission VARCHAR(100),
    entry_mileage INT,
    entry_date TIMESTAMP NOT NULL,
    estimated_delivery_date TIMESTAMP,
    delivery_date TIMESTAMP,
    confirmed_delivery BOOLEAN DEFAULT FALSE
);

CREATE TABLE previous_external_work (
    id SERIAL,
    service_id INT NOT NULL REFERENCES service(id),
    workshop_name VARCHAR,
    description TEXT NOT NULL,
    approximate_date DATE,
    PRIMARY KEY (id, service_id)
);

CREATE TABLE record_state (
    id SERIAL,
    id_service INT NOT NULL REFERENCES service(id),
    state service_state NOT NULL DEFAULT 'DELIVERED',
    change_date TIMESTAMP NOT NULL,
    id_staff INT REFERENCES users(id),
    comment VARCHAR(100),
    PRIMARY KEY (id, id_service)
);

CREATE TABLE catalog_service (
    id SERIAL PRIMARY KEY,
    description VARCHAR NOT NULL,
    reference_price NUMERIC(10, 2) NOT NULL,
    state_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE budget (
    id SERIAL UNIQUE,
    id_service INT NOT NULL REFERENCES service(id),
    version INT DEFAULT 1,
    state budget_state DEFAULT 'DRAFT',
    issue_date TIMESTAMP NOT NULL,
    response_date TIMESTAMP,
    comments TEXT,
    PRIMARY KEY (id, id_service)
);

CREATE TABLE budget_detail (
    id SERIAL,
    budget_id INT NOT NULL REFERENCES budget(id),
    catalog_id INT NOT NULL REFERENCES catalog_service(id),
    quantity INT DEFAULT 1,
    applied_cost NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (id, budget_id)
);

CREATE TABLE parts_list (
    id SERIAL,
    id_service INT NOT NULL REFERENCES service(id),
    part_name VARCHAR NOT NULL,
    specification VARCHAR,
    quantity INT DEFAULT 1,
    state replacement_state DEFAULT 'REQUESTED',
    PRIMARY KEY (id, id_service)
);

CREATE TABLE notification (
    id SERIAL,
    id_service INT NOT NULL REFERENCES service(id),
    type alert_type NOT NULL,
    destination_email VARCHAR NOT NULL,
    message TEXT,
    sent_date TIMESTAMP,
    sent BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id, id_service)
);

-- ==========================================
-- 3. ROLES BASE DE REFERENCIA
-- ==========================================
INSERT INTO role (charge, permission) VALUES
('ADMINISTRATOR', 'MANAGE'),
('MECHANIC', 'READ_WRITE'),
('CUSTOMER', 'READ');