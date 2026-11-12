CREATE TABLE role (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    charge charges NOT NULL DEFAULT 'CUSTOMER',
    permission permissions NOT NULL DEFAULT 'READ'
);

CREATE TABLE users (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role_id INT REFERENCES role(id) ON DELETE SET NULL,
    id_card VARCHAR(10) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    state users_state NOT NULL DEFAULT 'ACTIVE',
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_access TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE brand (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    country_origin countries NOT NULL DEFAULT 'JAPAN'
);

CREATE TABLE model (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    brand_id INT NOT NULL REFERENCES brand(id) ON DELETE RESTRICT,
    name VARCHAR(50) NOT NULL,
    category vehicle_category NOT NULL DEFAULT 'SEDAN'
);

CREATE TABLE vehicle (
    plate VARCHAR(15) PRIMARY KEY,
    model_id INT NOT NULL REFERENCES model(id) ON DELETE RESTRICT,
    year INT CHECK (year >= 1900 AND year <= 2100),
    color VARCHAR(30)
);

CREATE TABLE catalog_service (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    reference_price NUMERIC(12, 2) NOT NULL CHECK (reference_price >= 0),
    state_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE service (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tracking_code VARCHAR(50) UNIQUE NOT NULL,
    id_customer INT NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    id_responsible INT REFERENCES users(id) ON DELETE SET NULL,
    vehicle_plate VARCHAR(15) NOT NULL REFERENCES vehicle(plate) ON DELETE RESTRICT,
    current_state service_state NOT NULL DEFAULT 'RECEIVED',
    reason_admission VARCHAR(100),
    entry_mileage INT CHECK (entry_mileage >= 0 AND entry_mileage <= 9999999),
    entry_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estimated_delivery_date TIMESTAMP,
    delivery_date TIMESTAMP,
    confirmed_delivery BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE previous_external_work (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    service_id INT NOT NULL REFERENCES service(id) ON DELETE CASCADE,
    workshop_name VARCHAR(100),
    description TEXT NOT NULL,
    approximate_date DATE
);

CREATE TABLE record_state (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_service INT NOT NULL REFERENCES service(id) ON DELETE CASCADE,
    state service_state NOT NULL DEFAULT 'RECEIVED',
    change_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_staff INT REFERENCES users(id) ON DELETE SET NULL,
    comment VARCHAR(100)
);

CREATE TABLE budget (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_service INT NOT NULL REFERENCES service(id) ON DELETE CASCADE,
    version INT NOT NULL DEFAULT 1,
    state budget_state NOT NULL DEFAULT 'DRAFT',
    issue_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    response_date TIMESTAMP,
    comments TEXT
);

CREATE TABLE budget_detail (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    budget_id INT NOT NULL REFERENCES budget(id) ON DELETE CASCADE,
    catalog_id INT NOT NULL REFERENCES catalog_service(id) ON DELETE RESTRICT,
    quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
    applied_cost NUMERIC(12, 2) NOT NULL CHECK (applied_cost >= 0)
);

CREATE TABLE parts_list (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_service INT NOT NULL REFERENCES service(id) ON DELETE CASCADE,
    part_name VARCHAR(100) NOT NULL,
    specification VARCHAR(150),
    quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
    state replacement_state NOT NULL DEFAULT 'REQUESTED'
);

COMMENT ON COLUMN parts_list.specification IS 'Exact model or reference';

CREATE TABLE notification (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_service INT NOT NULL REFERENCES service(id) ON DELETE CASCADE,
    type alert_type NOT NULL,
    destination_email VARCHAR(100) NOT NULL,
    message TEXT,
    sent_date TIMESTAMP,
    sent BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX idx_service_customer ON service(id_customer);
CREATE INDEX idx_service_responsible ON service(id_responsible);
CREATE INDEX idx_service_plate ON service(vehicle_plate);
CREATE INDEX idx_record_state_service ON record_state(id_service);
CREATE INDEX idx_budget_service ON budget(id_service);
CREATE INDEX idx_budget_detail_budget ON budget_detail(budget_id);
CREATE INDEX idx_parts_list_service ON parts_list(id_service);
CREATE INDEX idx_notification_service ON notification(id_service);
