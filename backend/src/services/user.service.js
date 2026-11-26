const { pool } = require('../config/db');

/**
 * Retrieves all users with their assigned role (excluding password_hash).
 */
const getAllUsers = async () => {
  const query = `
    SELECT
      u.id,
      u.role_id,
      r.charge AS role,
      r.permission,
      u.id_card,
      u.username,
      u.first_name,
      u.last_name,
      u.phone_number,
      u.email,
      u.state,
      u.first_access,
      u.last_access,
      u.last_update
    FROM users u
    LEFT JOIN role r ON u.role_id = r.id
    ORDER BY u.id ASC
  `;

  const { rows } = await pool.query(query);
  return rows;
};

module.exports = {
  getAllUsers,
};
