import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const { Pool } = pg;

const connectionString = process.env.DATABASE_URL || '';
const useSSL =
  connectionString.includes('sslmode=require') ||
  connectionString.includes('neon.tech');

const pool = new Pool({
  connectionString,
  ssl: useSSL ? { rejectUnauthorized: false } : false,
});

pool.on('connect', () => {
  console.log(
    useSSL
      ? 'Database connection successful to NeonService'
      : 'Database connection successful to local Docker PostgreSQL'
  );
});

export default pool;
