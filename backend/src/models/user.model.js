/**
 * Reference constants and schema definitions matching database/schema.sql.
 */
const ROLES = {
  ADMINISTRATOR: 'ADMINISTRATOR',
  MECHANIC: 'MECHANIC',
  CUSTOMER: 'CUSTOMER',
};

const DEFAULT_ROLE_ID = 3; // CUSTOMER

const USER_STATES = {
  ACTIVE: 'ACTIVE',
  INACTIVE: 'INACTIVE',
  BLOCKED: 'BLOCKED',
  SUSPEND: 'SUSPEND',
};

const PERMISSIONS = {
  READ: 'READ',
  READ_WRITE: 'READ_WRITE',
  MANAGE: 'MANAGE',
};

module.exports = {
  ROLES,
  DEFAULT_ROLE_ID,
  USER_STATES,
  PERMISSIONS,
};
