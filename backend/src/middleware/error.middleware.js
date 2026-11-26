/**
 * Centralized error-handling middleware for Express.
 */
const errorHandler = (err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  const response = {
    success: false,
    message: err.message || 'Internal server error',
  };

  if (err.errors) {
    response.errors = err.errors;
  }

  if (process.env.NODE_ENV !== 'production' && statusCode === 500) {
    console.error('[Error]', err);
  }

  res.status(statusCode).json(response);
};

module.exports = {
  errorHandler,
};
