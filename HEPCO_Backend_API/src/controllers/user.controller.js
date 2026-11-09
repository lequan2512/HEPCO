const UserModel = require('../models/user.model');
const { hashPassword } = require('../utils/password');
const AppError = require('../utils/AppError');

exports.getAllUsers = async (req, res, next) => {
  try {
    const { page = 1, limit = 50 } = req.query;
    const users = await UserModel.getAll(page, limit);
    res.json(users);
  } catch (err) {
    next(new AppError('FETCH_FAILED', 500, err.message));
  }
};

exports.createUser = async (req, res, next) => {
  try {
    const { username, password, role = 'admin' } = req.body || {};
    if (!username || typeof username !== 'string' || !username.trim()) {
      throw new AppError('MISSING_USERNAME', 400, 'Tên đăng nhập không được để trống');
    }
    if (!password || typeof password !== 'string' || password.length < 6) {
      throw new AppError('INVALID_PASSWORD', 400, 'Mật khẩu phải có tối thiểu 6 ký tự');
    }

    const cleanUsername = username.trim().toLowerCase();
    const existing = await UserModel.findByUsername(cleanUsername);
    if (existing) {
      throw new AppError('USERNAME_EXISTS', 400, 'Tên đăng nhập đã tồn tại trên hệ thống');
    }

    const passwordHash = await hashPassword(password);
    const newUser = await UserModel.create({
      username: cleanUsername,
      password: passwordHash,
      role: role === 'super_admin' ? 'super_admin' : (role === 'editor' ? 'editor' : 'admin')
    });

    res.status(201).json({ success: true, data: newUser, message: 'Tạo tài khoản quản trị thành công' });
  } catch (err) {
    next(err);
  }
};

exports.updateUser = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    if (!Number.isSafeInteger(id) || id < 1) {
      throw new AppError('INVALID_ID', 400, 'ID người dùng không hợp lệ');
    }

    const { username, password, role } = req.body || {};
    const targetUser = await UserModel.findById(id);
    if (!targetUser) {
      throw new AppError('USER_NOT_FOUND', 404, 'Không tìm thấy tài khoản');
    }

    const updateData = {};
    if (role) {
      updateData.role = role === 'super_admin' ? 'super_admin' : (role === 'editor' ? 'editor' : 'admin');
    }

    if (username && username.trim().toLowerCase() !== targetUser.username) {
      const cleanUsername = username.trim().toLowerCase();
      const existing = await UserModel.findByUsername(cleanUsername);
      if (existing) {
        throw new AppError('USERNAME_EXISTS', 400, 'Tên đăng nhập đã tồn tại');
      }
      updateData.username = cleanUsername;
    }

    if (password && typeof password === 'string' && password.trim().length >= 6) {
      updateData.password = await hashPassword(password.trim());
    }

    const updated = await UserModel.update(id, updateData);
    res.json({ success: true, data: updated, message: 'Cập nhật tài khoản thành công' });
  } catch (err) {
    next(err);
  }
};

exports.deleteUser = async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    if (!Number.isSafeInteger(id) || id < 1) {
      throw new AppError('INVALID_ID', 400, 'ID người dùng không hợp lệ');
    }

    if (id === req.user.id) {
      throw new AppError('CANNOT_DELETE_SELF', 400, 'Bạn không thể tự xóa tài khoản của chính mình');
    }

    const targetUser = await UserModel.findById(id);
    if (!targetUser) {
      throw new AppError('USER_NOT_FOUND', 404, 'Không tìm thấy tài khoản');
    }

    if (targetUser.username === 'admin' || id === 1) {
      throw new AppError('CANNOT_DELETE_ROOT_ADMIN', 400, 'Không thể xóa tài khoản Quản trị viên tối cao (Root Admin)');
    }

    await UserModel.delete(id);
    res.json({ success: true, id, message: 'Xóa tài khoản thành công' });
  } catch (err) {
    next(err);
  }
};
