const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT) || 5432,
  database: process.env.DB_NAME,
});

const testConnection = async () => {
  try {
    const client = await pool.connect();
    console.log(`PostgreSQL connected successfully to database "${process.env.DB_NAME}"`);
    client.release();
  } catch (error) {
    console.error('Error connecting to PostgreSQL:', error.message);
  }
};

module.exports = {
  pool,
  testConnection,
};
