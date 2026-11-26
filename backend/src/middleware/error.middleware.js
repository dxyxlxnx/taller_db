import { AppError } from '../utils/AppError.js';

export function notFoundHandler(req, res) {
  return res.status(404).json({
    status: 'ERROR',
    message: `Ruta no encontrada: ${req.method} ${req.originalUrl}`,
  });
}

export function errorHandler(err, req, res, _next) {
  if (err instanceof AppError) {
    return res.status(err.statusCode).json({
      status: 'ERROR',
      message: err.message,
      ...(err.details ? { details: err.details } : {}),
    });
  }

  if (err.type === 'entity.parse.failed') {
    return res.status(400).json({
      status: 'ERROR',
      message: 'El cuerpo de la petición contiene JSON inválido',
    });
  }

  if (err.code === 'P2002') {
    const target = Array.isArray(err.meta?.target)
      ? err.meta.target.join(', ')
      : 'campo único';
    return res.status(409).json({
      status: 'ERROR',
      message: `Ya existe un registro con ese valor en: ${target}`,
    });
  }

  console.error('Error no controlado:', err);
  return res.status(500).json({
    status: 'ERROR',
    message: 'Error interno del servidor',
  });
}
