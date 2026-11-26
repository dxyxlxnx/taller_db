const express = require('express');
const userController = require('../controllers/user.controller');
const { verifyToken, authorizeRoles } = require('../middleware/auth.middleware');
const { ROLES } = require('../models/user.model');

const router = express.Router();

router.get('/', verifyToken, authorizeRoles(ROLES.ADMINISTRATOR), userController.getUsers);

module.exports = router;
