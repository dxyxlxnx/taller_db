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

