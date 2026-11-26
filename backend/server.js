import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import dotenv from 'dotenv';
import pool from './src/config/db.js';
import authRoutes from './src/routes/auth.routes.js';
import {
  notFoundHandler,
  errorHandler,
} from './src/middleware/error.middleware.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// --- MIDDLEWARES GLOBALES ---
app.use(helmet()); // Cabeceras HTTP de seguridad
app.use(cors()); // Permite peticiones desde tu frontend en React
app.use(morgan('dev')); // Logs de peticiones HTTP en consola
app.use(express.json()); // Parsea el body JSON en req.body

// --- RUTA DE PRUEBA (HEALTH CHECK) ---
app.get('/api/health', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.status(200).json({
      status: 'OK',
      message: 'Servidor y base de datos operativos',
      db_time: result.rows[0].now,
    });
  } catch (error) {
    console.error('Error conectando a la BD:', error);
    res.status(500).json({
      status: 'ERROR',
      message: 'Fallo al conectar con PostgreSQL',
    });
  }
});

// --- RUTAS DE LA API ---
app.use('/api/v1/auth', authRoutes);

// --- MANEJO DE RUTAS NO ENCONTRADAS Y ERRORES ---
app.use(notFoundHandler);
app.use(errorHandler);

// --- ENCENDER SERVIDOR ---
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
