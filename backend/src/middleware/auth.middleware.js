import { verifyToken } from '../utils/jwt.js';

export function authenticate(req, res, next) {
  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({
      status: 'ERROR',
      message: 'Token de autenticación no proporcionado (formato: Bearer <token>)',
    });
  }

  const token = authHeader.slice(7).trim();

  try {
    const decoded = verifyToken(token);
    req.user = decoded;
    return next();
  } catch (error) {
    const message =
      error.name === 'TokenExpiredError'
        ? 'El token ha expirado, inicie sesión nuevamente'
        : 'Token inválido';

    return res.status(401).json({
      status: 'ERROR',
      message,
    });
  }
}

export function authorize(...allowedCharges) {
  return (req, res, next) => {
    if (!req.user || !allowedCharges.includes(req.user.role)) {
      return res.status(403).json({
        status: 'ERROR',
        message: 'No tienes permisos para acceder a este recurso',
      });
    }

    return next();
  };
}
