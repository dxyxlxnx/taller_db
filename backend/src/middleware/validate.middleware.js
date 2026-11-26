export function validateBody(schema) {
  return (req, res, next) => {
    const result = schema.safeParse(req.body);

    if (!result.success) {
      const errors = result.error.issues.map((issue) => ({
        field: issue.path.join('.') || 'body',
        message: issue.message,
      }));

      return res.status(400).json({
        status: 'ERROR',
        message: 'Error de validación en los datos enviados',
        errors,
      });
    }

    req.body = result.data;
    return next();
  };
}
