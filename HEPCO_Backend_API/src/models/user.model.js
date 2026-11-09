const { prisma } = require('../db');

class UserModel {
  static async getAll(page = 1, limit = 50) {
    const offset = (Number(page) - 1) * Number(limit);
    const [total, data] = await Promise.all([
      prisma.users.count(),
      prisma.users.findMany({
        skip: offset,
        take: Number(limit),
        select: {
          id: true,
          username: true,
          role: true,
          created_at: true
        },
        orderBy: { id: 'asc' }
      })
    ]);

    return {
      data,
      meta: {
        total,
        page: Number(page),
        limit: Number(limit),
        totalPages: Math.ceil(total / Number(limit)) || 1
      }
    };
  }

  static async findByUsername(username) {
    return prisma.users.findUnique({ where: { username } });
  }

  static async findById(id) {
    return prisma.users.findUnique({ where: { id: Number(id) } });
  }

  static async create({ username, password, role = 'admin' }) {
    return prisma.users.create({
      data: {
        username,
        password,
        role: role || 'admin'
      },
      select: {
        id: true,
        username: true,
        role: true,
        created_at: true
      }
    });
  }

  static async update(id, { username, password, role }) {
    const updateData = {};
    if (username) updateData.username = username;
    if (password) updateData.password = password;
    if (role) updateData.role = role;

    return prisma.users.update({
      where: { id: Number(id) },
      data: updateData,
      select: {
        id: true,
        username: true,
        role: true,
        created_at: true
      }
    });
  }

  static async delete(id) {
    return prisma.users.delete({
      where: { id: Number(id) },
      select: { id: true, username: true }
    });
  }

  static async setPassword(id, passwordHash) {
    return prisma.users.update({
      where: { id: Number(id) },
      data: { password: passwordHash },
      select: { id: true }
    });
  }
}

module.exports = UserModel;
