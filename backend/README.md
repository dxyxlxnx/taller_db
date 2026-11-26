# Backend - Taller Mecánico (`taller_db`)

API REST construida con **Node.js**, **Express 5**, **Prisma ORM**, **PostgreSQL** (Docker local o Neon), **Zod**, **bcryptjs** y **JWT**.

## Requisitos previos
- Node.js 20+
- Docker y Docker Compose (para la base de datos local)

## Instalación rápida (después de clonar)

```bash
cd backend
npm install
```

### 1. Configurar variables de entorno
Copia `.env.example` a `.env`:

- **Linux / macOS:**
  ```bash
  cp .env.example .env
  ```
- **Windows (PowerShell):**
  ```powershell
  Copy-Item .env.example .env
  ```

Cambia `JWT_SECRET` por una clave secreta larga. Para trabajar con Docker local, `DATABASE_URL` ya viene configurada por defecto.

### 2. Levantar PostgreSQL en Docker
```bash
npm run db:up
```
Al iniciar por primera vez, Docker ejecuta automáticamente los scripts en `database/` (`01DataTypes.sql`, `02Tables.sql`, `03Insert's.sql`).

### 3. Generar Prisma Client y arrancar el servidor
```bash
npm run prisma:generate
npm run dev
```

El servidor quedará disponible en `http://localhost:3000`.

## Endpoints actuales

| Método | Ruta | Auth | Descripción |
| :--- | :--- | :--- | :--- |
| `GET` | `/api/health` | No | Verifica servidor y conexión a PostgreSQL |
| `POST` | `/api/v1/auth/register` | No | Registra cliente (rol `CUSTOMER`) y devuelve JWT |
| `POST` | `/api/v1/auth/login` | No | Inicia sesión con `email`, `username` o `identifier` y devuelve JWT |
| `GET` | `/api/v1/auth/me` | Bearer JWT | Devuelve el perfil del usuario autenticado |

## Pruebas en Postman
Importa el archivo `postman_collection.json` directamente en Postman (**Import** → seleccionar archivo). Las peticiones de **Register** y **Login** guardan automáticamente el JWT en la variable `{{token}}` para probar `/me`.
