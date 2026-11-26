import { z } from 'zod';

export const registerSchema = z.object({
  id_card: z
    .string({ error: 'La cédula (id_card) es obligatoria' })
    .trim()
    .min(5, 'La cédula debe tener al menos 5 caracteres')
    .max(10, 'La cédula no puede superar 10 caracteres')
    .regex(
      /^[VEJGPvejgp]-?\d{4,8}$/,
      'Formato de cédula inválido (ejemplo: V-12345678)'
    )
    .transform((val) => val.toUpperCase()),
  username: z
    .string({ error: 'El nombre de usuario es obligatorio' })
    .trim()
    .min(3, 'El username debe tener al menos 3 caracteres')
    .max(50, 'El username no puede superar 50 caracteres')
    .regex(
      /^[a-zA-Z0-9._-]+$/,
      'El username solo puede contener letras, números, puntos, guiones y guion bajo'
    ),
  first_name: z
    .string({ error: 'El nombre es obligatorio' })
    .trim()
    .min(2, 'El nombre debe tener al menos 2 caracteres')
    .max(30, 'El nombre no puede superar 30 caracteres'),
  last_name: z
    .string({ error: 'El apellido es obligatorio' })
    .trim()
    .min(2, 'El apellido debe tener al menos 2 caracteres')
    .max(30, 'El apellido no puede superar 30 caracteres'),
  email: z
    .string({ error: 'El correo electrónico es obligatorio' })
    .trim()
    .toLowerCase()
    .email('Debe ingresar un correo electrónico válido')
    .max(100, 'El correo no puede superar 100 caracteres'),
  password: z
    .string({ error: 'La contraseña es obligatoria' })
    .min(8, 'La contraseña debe tener al menos 8 caracteres')
    .max(72, 'La contraseña no puede superar 72 caracteres'),
  phone_number: z
    .string()
    .trim()
    .max(15, 'El teléfono no puede superar 15 caracteres')
    .optional()
    .nullable(),
});

export const loginSchema = z
  .object({
    identifier: z.string().trim().min(3).optional(),
    email: z.string().trim().toLowerCase().email('Correo inválido').optional(),
    username: z.string().trim().min(3).optional(),
    password: z
      .string({ error: 'La contraseña es obligatoria' })
      .min(1, 'La contraseña es obligatoria'),
  })
  .refine((data) => Boolean(data.identifier || data.email || data.username), {
    message: 'Debe proporcionar identifier, email o username para iniciar sesión',
    path: ['identifier'],
  })
  .transform((data) => ({
    identifier: (data.identifier || data.email || data.username).trim(),
    password: data.password,
  }));
