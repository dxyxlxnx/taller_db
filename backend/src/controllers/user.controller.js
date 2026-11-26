const userService = require('../services/user.service');

const getUsers = async (req, res, next) => {
  try {
    const users = await userService.getAllUsers();
    return res.status(200).json({
      success: true,
      count: users.length,
      data: { users },
    });
  } catch (error) {
    return next(error);
  }
};

module.exports = {
  getUsers,
};
