import { Router } from 'express';
import { register, login, me } from '../controllers/auth.controller.js';
import { validateBody } from '../middleware/validate.middleware.js';
import { authenticate } from '../middleware/auth.middleware.js';
import { registerSchema, loginSchema } from '../models/auth.schema.js';

const router = Router();

router.post('/register', validateBody(registerSchema), register);
router.post('/login', validateBody(loginSchema), login);
router.get('/me', authenticate, me);

export default router;
