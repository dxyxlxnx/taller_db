import {
  registerUser,
  loginUser,
  getUserProfile,
} from '../service/auth.service.js';

export async function register(req, res, next) {
  try {
    const result = await registerUser(req.body);
    return res.status(201).json({
      status: 'OK',
      message: 'Usuario registrado exitosamente',
      data: result,
    });
  } catch (error) {
    return next(error);
  }
}

export async function login(req, res, next) {
  try {
    const result = await loginUser(req.body);
    return res.status(200).json({
      status: 'OK',
      message: 'Inicio de sesión exitoso',
      data: result,
    });
  } catch (error) {
    return next(error);
  }
}

export async function me(req, res, next) {
  try {
    const user = await getUserProfile(req.user.sub);
    return res.status(200).json({
      status: 'OK',
      data: { user },
    });
  } catch (error) {
    return next(error);
  }
}
