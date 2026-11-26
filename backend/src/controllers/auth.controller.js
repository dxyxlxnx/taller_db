const { z } = require('zod');
const authService = require('../services/auth.service');

const registerSchema = z.object({
  role_id: z.number().int().positive().optional(),
  id_card: z.string().trim().min(1, 'id_card is required').max(10, 'id_card max length is 10'),
  username: z.string().trim().min(3, 'username must be at least 3 characters'),
  first_name: z.string().trim().min(1, 'first_name is required').max(30, 'first_name max length is 30'),
  last_name: z.string().trim().min(1, 'last_name is required').max(30, 'last_name max length is 30'),
  password: z.string().min(6, 'password must be at least 6 characters'),
  phone_number: z.string().trim().max(15, 'phone_number max length is 15').optional().nullable(),
  email: z.string().trim().email('Invalid email format').max(100, 'email max length is 100'),
});

const loginSchema = z.object({
  email: z.string().trim().email('Invalid email format'),
  password: z.string().min(1, 'password is required'),
});

const register = async (req, res, next) => {
  try {
    const parsed = registerSchema.safeParse(req.body);
    if (!parsed.success) {
      return res.status(400).json({
        success: false,
        message: 'Validation error',
        errors: parsed.error.flatten().fieldErrors,
      });
    }

    const user = await authService.registerUser(parsed.data);
    return res.status(201).json({
      success: true,
      message: 'User registered successfully',
      data: { user },
    });
  } catch (error) {
    return next(error);
  }
};

const login = async (req, res, next) => {
  try {
    const parsed = loginSchema.safeParse(req.body);
    if (!parsed.success) {
      return res.status(400).json({
        success: false,
        message: 'Validation error',
        errors: parsed.error.flatten().fieldErrors,
      });
    }

    const result = await authService.loginUser(parsed.data);
    return res.status(200).json({
      success: true,
      message: 'Login successful',
      token: result.token,
      user: result.user,
    });
  } catch (error) {
    return next(error);
  }
};

module.exports = {
  register,
  login,
};
