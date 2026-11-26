# Backend - Sistema de Gestión de Talleres Mecánicos

API REST construida con **Node.js**, **Express** y **PostgreSQL** para la aplicación móvil de gestión de talleres mecánicos en San Cristóbal, Táchira, Venezuela (Lenguaje de Programación III).

## Arquitectura por Capas

```text
backend/
├── src/
│   ├── config/          # Configuración y conexión a PostgreSQL (db.js)
│   ├── controllers/     # Manejo de req/res y validaciones con Zod
│   ├── middleware/      # Seguridad JWT, control de roles y manejo de errores
│   ├── models/          # Constantes y estructuras de referencia del esquema
│   ├── routes/          # Definición de rutas REST (/api/v1/...)
│   ├── services/        # Consultas SQL a PostgreSQL y lógica de negocio
│   ├── utils/           # Utilidades compartidas (uso futuro)
│   └── server.js        # Punto de entrada de Express
├── uploads/             # Almacenamiento de archivos (uso futuro)
├── .env                 # Variables de entorno locales (ignorado en Git)
├── .env.example         # Plantilla de variables de entorno
└── package.json
```

## Roles del Sistema

- `ADMINISTRATOR`: dueño/encargado del taller con gestión total.
- `MECHANIC`: técnico encargado de diagnósticos, reparaciones y actualización de estados.
- `CUSTOMER`: cliente del taller que consulta sus vehículos y aprueba presupuestos.

## Instalación y Ejecución

```bash
cd backend
npm install
npm run dev
```

## Endpoints Disponibles (Primer Avance)

| Método | Ruta | Acceso | Descripción |
| :--- | :--- | :--- | :--- |
| `GET` | `/api/v1/health` | Público | Verifica que la API y Express estén activos. |
| `POST` | `/api/v1/auth/register` | Público | Registra un usuario con contraseña encriptada (`bcrypt`) y `role_id` por defecto `3` (`CUSTOMER`). |
| `POST` | `/api/v1/auth/login` | Público | Autentica por `email` y `password`, valida `state === 'ACTIVE'`, actualiza `last_access` y retorna JWT + usuario. |
| `GET` | `/api/v1/users` | `ADMINISTRATOR` | Lista todos los usuarios con su rol desde PostgreSQL (sin `password_hash`). |
