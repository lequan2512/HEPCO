require('dotenv').config();
if (!process.env.PORT) process.env.PORT = '3000';
if (!process.env.UPLOAD_STORAGE) process.env.UPLOAD_STORAGE = 'local';

const express = require('express');
const cors = require('cors');
const path = require('path');

// Import core CMS & website routes
const healthRoutes = require('./routes/health.routes');
const uploadRoutes = require('./routes/upload.routes');
const newsRoutes = require('./routes/news.routes');
const userRoutes = require('./routes/user.routes');
const authRoutes = require('./routes/auth.routes');
const ipRoutes = require('./routes/ip.routes');
const bannerRoutes = require('./routes/banner.routes');
const showcaseRoutes = require('./routes/showcase.routes');
const galleryRoutes = require('./routes/gallery.routes');

const app = express();
const PORT = process.env.PORT || 3000;

// Trust only explicitly configured proxy addresses or Express proxy ranges.
app.set('trust proxy', process.env.TRUST_PROXY ? process.env.TRUST_PROXY.split(',').map((value) => value.trim()).filter(Boolean) : false);
app.use(cors());
app.use(express.json({ limit: '5mb' }));
app.use(express.urlencoded({ extended: true, limit: '5mb' }));

// Static media and upload paths
app.use('/uploads', express.static(path.join(__dirname, '../uploads'), { setHeaders: (res) => res.setHeader('X-Content-Type-Options', 'nosniff') }));
if (process.env.UPLOAD_STORAGE === 'local' && !process.env.VERCEL && process.env.NODE_ENV !== 'production') {
  app.use('/api/media', express.static(require('./constants/upload').LOCAL_MEDIA_DIRECTORY, { setHeaders: (res) => res.setHeader('X-Content-Type-Options', 'nosniff') }));
}

app.get('/', (req, res) => {
  res.json({
    name: 'HEPCO Website & CMS API',
    version: '2026.1',
    status: 'running',
    health: '/api/health'
  });
});

const { prisma } = require('./db');

// JWT Authentication Middleware
const authMiddleware = require('./middlewares/auth.middleware');

// Public routes (No token required)
app.use('/api', authRoutes); // POST /api/login
app.use('/api/health', healthRoutes);
app.use('/api/showcase', showcaseRoutes);
app.use('/api/gallery', galleryRoutes);
app.use('/api/news', newsRoutes); // Public GET, protected POST/PUT/DELETE
app.use('/api/banner', bannerRoutes); // Public GET, protected POST/DELETE

// Protected routes (Bearer token required)
app.use('/api/users', authMiddleware.verifyToken, userRoutes);
app.use('/api/ip', authMiddleware.verifyToken, ipRoutes);
app.use('/api/upload', authMiddleware.verifyToken, uploadRoutes);

const errorHandler = require('./middlewares/errorHandler');

if (!process.env.VERCEL) prisma.$connect().then(() => {
  console.log('MySQL database connected');
  app.listen(PORT, () => {
    console.log(`HEPCO API Server is running at http://localhost:${PORT}`);
  });
}).catch(err => {
  console.error('Check DATABASE_URL in .env. A reachable MySQL database is required.', err.message);
  process.exitCode = 1;
});

// Error handling middleware MUST be the last middleware
app.use(errorHandler);

module.exports = app;
