const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { pool } = require('../config/db');
const { DEFAULT_ROLE_ID, USER_STATES } = require('../models/user.model');

const SALT_ROUNDS = 10;

const createHttpError = (statusCode, message) => {
  const error = new Error(message);
  error.statusCode = statusCode;
  return error;
};

/**
 * Registers a new user in PostgreSQL with a hashed password.
 */
const registerUser = async ({
  role_id,
  id_card,
  username,
  first_name,
  last_name,
  password,
  phone_number,
  email,
}) => {
  const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);
  const assignedRoleId = role_id ?? DEFAULT_ROLE_ID;

  const query = `
    INSERT INTO users (
      role_id,
      id_card,
      username,
      first_name,
      last_name,
      password_hash,
      phone_number,
      email,
      state,
      first_access
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, NOW())
    RETURNING
      id,
      role_id,
      id_card,
      username,
      first_name,
      last_name,
      phone_number,
      email,
      state,
      first_access,
      last_access,
      last_update
  `;

  const values = [
    assignedRoleId,
    id_card,
    username,
    first_name,
    last_name,
    passwordHash,
    phone_number || null,
    email,
    USER_STATES.ACTIVE,
  ];

  try {
    const { rows } = await pool.query(query, values);
    return rows[0];
  } catch (error) {
    if (error.code === '23505') {
      throw createHttpError(409, 'User with this id_card or username already exists.');
    }
    if (error.code === '23503') {
      throw createHttpError(400, 'Invalid role_id provided.');
    }
    throw error;
  }
};

/**
 * Authenticates a user by email and password, updates last_access, and issues a JWT.
 */
const loginUser = async ({ email, password }) => {
  const query = `
    SELECT
      u.id,
      u.role_id,
      u.id_card,
      u.username,
      u.first_name,
      u.last_name,
      u.password_hash,
      u.phone_number,
      u.email,
      u.state,
      u.first_access,
      u.last_access,
      u.last_update,
      r.charge AS role,
      r.permission
    FROM users u
    INNER JOIN role r ON u.role_id = r.id
    WHERE u.email = $1
    LIMIT 1
  `;

  const { rows } = await pool.query(query, [email]);
  const userRecord = rows[0];

  if (!userRecord) {
    throw createHttpError(401, 'Invalid email or password.');
  }

  if (userRecord.state !== USER_STATES.ACTIVE) {
    throw createHttpError(403, `Account is not active (current state: ${userRecord.state}).`);
  }

  const isPasswordValid = await bcrypt.compare(password, userRecord.password_hash);
  if (!isPasswordValid) {
    throw createHttpError(401, 'Invalid email or password.');
  }

  const { rows: updatedRows } = await pool.query(
    'UPDATE users SET last_access = NOW() WHERE id = $1 RETURNING last_access',
    [userRecord.id]
  );

  const tokenPayload = {
    id: userRecord.id,
    username: userRecord.username,
    role: userRecord.role,
  };

  const token = jwt.sign(tokenPayload, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN || '8h',
  });

  const { password_hash, ...userWithoutPassword } = userRecord;
  userWithoutPassword.last_access = updatedRows[0]?.last_access || userWithoutPassword.last_access;

  return {
    token,
    user: userWithoutPassword,
  };
};

module.exports = {
  registerUser,
  loginUser,
};
