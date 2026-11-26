import jwt from 'jsonwebtoken';

function getJwtSecret() {
  if (process.env.JWT_SECRET) {
    return process.env.JWT_SECRET;
  }

  if (process.env.NODE_ENV === 'production') {
    throw new Error('JWT_SECRET no está definido en las variables de entorno');
  }

  console.warn(
    '[WARN] JWT_SECRET no está definido en .env; usando secreto temporal solo para desarrollo.'
  );
  return 'dev_only_fallback_secret_change_in_env';
}

export function signToken(payload) {
  const expiresIn = process.env.JWT_EXPIRES_IN || '8h';
  return jwt.sign(payload, getJwtSecret(), { expiresIn });
}

export function verifyToken(token) {
  return jwt.verify(token, getJwtSecret());
}
