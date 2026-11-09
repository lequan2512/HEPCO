const { prisma } = require('../db');

class HealthModel {
  static async checkDb() {
    return prisma.$queryRaw`SELECT CURRENT_TIMESTAMP as serverTime`;
  }
}

module.exports = HealthModel;
