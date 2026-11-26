import prisma from '../config/prisma.js';
import { hashPassword, comparePassword } from '../utils/password.js';
import { signToken } from '../utils/jwt.js';
import { AppError } from '../utils/AppError.js';

function sanitizeUser(user) {
  const { password_hash, ...safeUser } = user;
  return safeUser;
}

function buildTokenPayload(user) {
  return {
    sub: user.id,
    username: user.username,
    email: user.email,
    role: user.role?.charge ?? 'CUSTOMER',
    permission: user.role?.permission ?? 'READ',
  };
}

export async function registerUser({
  id_card,
  username,
  first_name,
  last_name,
  email,
  password,
  phone_number,
}) {
  const existingUser = await prisma.users.findFirst({
    where: {
      OR: [{ email }, { username }, { id_card }],
    },
    select: { email: true, username: true, id_card: true },
  });

  if (existingUser) {
    if (existingUser.email === email) {
      throw new AppError('El correo electrónico ya está registrado', 409);
    }
    if (existingUser.username === username) {
      throw new AppError('El nombre de usuario ya está en uso', 409);
    }
    throw new AppError('La cédula ya está registrada', 409);
  }

  let customerRole = await prisma.role.findFirst({
    where: { charge: 'CUSTOMER' },
  });

  if (!customerRole) {
    customerRole = await prisma.role.create({
      data: { charge: 'CUSTOMER', permission: 'READ' },
    });
  }

  const passwordHash = await hashPassword(password);

  const createdUser = await prisma.users.create({
    data: {
      role_id: customerRole.id,
      id_card,
      username,
      first_name,
      last_name,
      email,
      password_hash: passwordHash,
      phone_number: phone_number ?? null,
      state: 'ACTIVE',
    },
    include: { role: true },
  });

  const token = signToken(buildTokenPayload(createdUser));

  return {
    user: sanitizeUser(createdUser),
    token,
  };
}

export async function loginUser({ identifier, password }) {
  const user = await prisma.users.findFirst({
    where: {
      OR: [
        { email: identifier.toLowerCase() },
        { username: identifier },
      ],
    },
    include: { role: true },
  });

  if (!user) {
    throw new AppError('Credenciales inválidas', 401);
  }

  if (user.state !== 'ACTIVE') {
    throw new AppError(
      `No se puede iniciar sesión porque la cuenta está en estado ${user.state}`,
      403
    );
  }

  const isPasswordValid = await comparePassword(password, user.password_hash);
  if (!isPasswordValid) {
    throw new AppError('Credenciales inválidas', 401);
  }

  const updatedUser = await prisma.users.update({
    where: { id: user.id },
    data: { last_access: new Date() },
    include: { role: true },
  });

  const token = signToken(buildTokenPayload(updatedUser));

  return {
    user: sanitizeUser(updatedUser),
    token,
  };
}

export async function getUserProfile(userId) {
  const user = await prisma.users.findUnique({
    where: { id: Number(userId) },
    include: { role: true },
  });

  if (!user) {
    throw new AppError('Usuario no encontrado', 404);
  }

  return sanitizeUser(user);
}
