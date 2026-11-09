-- ============================================================================
-- SCRIPT KHỞI TẠO CƠ SỞ DỮ LIỆU MICROSOFT SQL SERVER CHO HỆ THỐNG HEPCO
-- Phiên bản: 2026 - Tương thích SQL Server 2016 / 2017 / 2019 / 2022 & Azure SQL
-- Mô tả: Chuyên biệt quản lý website, tin tức, thông báo, cổ đông, dịch vụ
-- ============================================================================

-- 1. Tạo cơ sở dữ liệu nếu chưa tồn tại
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'HEPCO_DB')
BEGIN
    CREATE DATABASE HEPCO_DB;
    PRINT 'Đã tạo cơ sở dữ liệu HEPCO_DB thành công.';
END
GO

USE HEPCO_DB;
GO

-- 2. Bảng Users (Tài khoản quản trị viên CMS)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'users')
BEGIN
    CREATE TABLE users (
        id INT IDENTITY(1,1) PRIMARY KEY,
        username NVARCHAR(100) NOT NULL UNIQUE,
        password NVARCHAR(255) NOT NULL,
        role NVARCHAR(50) DEFAULT 'admin',
        created_at DATETIME2 DEFAULT GETDATE()
    );
    
    -- Mặc định tạo tài khoản admin / 123456 (vai trò super_admin)
    INSERT INTO users (username, password, role) 
    VALUES ('admin', '$2b$10$epR30c5eCgnz1yW2.kR6iO6QvEaH3uY4c1eJ.lTzE9yC6W/zE2uIe', 'super_admin');
    PRINT 'Đã tạo bảng users và tài khoản admin.';
END
GO

-- 3. Bảng News (Quản lý Tin tức, Thông báo, Quan hệ cổ đông, Dịch vụ, Giới thiệu)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'news')
BEGIN
    CREATE TABLE news (
        id INT IDENTITY(1,1) PRIMARY KEY,
        title NVARCHAR(500) NOT NULL,
        date NVARCHAR(50) NOT NULL,
        content NVARCHAR(MAX) NULL,
        thumbnail NVARCHAR(500) NULL,
        type NVARCHAR(50) DEFAULT 'news', -- 'news', 'announcement', 'shareholders', 'service', 'about'
        author_id INT NULL,
        metadata NVARCHAR(MAX) NULL, -- JSON lưu trữ chuyên mục, file đính kèm, năm phát hành, trạng thái
        created_at DATETIME2 DEFAULT GETDATE()
    );

    CREATE INDEX idx_news_type ON news(type);
    CREATE INDEX idx_news_created_at ON news(created_at DESC);
    PRINT 'Đã tạo bảng news và các chỉ mục.';
END
GO

-- 4. Bảng Banners (Hình ảnh banner slider trang chủ)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'banners')
BEGIN
    CREATE TABLE banners (
        id INT IDENTITY(1,1) PRIMARY KEY,
        url NVARCHAR(500) NOT NULL,
        title NVARCHAR(255) NULL,
        [order] INT DEFAULT 0
    );
    PRINT 'Đã tạo bảng banners.';
END
GO

-- 5. Bảng HomeShowcase (4 Dự án trọng điểm 2026 & Showcase trang chủ)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'home_showcases')
BEGIN
    CREATE TABLE home_showcases (
        id INT PRIMARY KEY,
        data NVARCHAR(MAX) NOT NULL,
        version INT DEFAULT 1,
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    PRINT 'Đã tạo bảng home_showcases.';
END
GO

-- 6. Bảng HomeSections (Quản lý vị trí, ẩn/hiện các khối trên trang chủ)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'home_sections')
BEGIN
    CREATE TABLE home_sections (
        id NVARCHAR(100) PRIMARY KEY,
        label NVARCHAR(255) NOT NULL,
        [order] INT DEFAULT 0,
        visible BIT DEFAULT 1,
        created_at DATETIME2 DEFAULT GETDATE(),
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    PRINT 'Đã tạo bảng home_sections.';
END
GO

-- 7. Bảng Gallery (Thư viện hình ảnh hoạt động của HEPCO)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'gallery')
BEGIN
    CREATE TABLE gallery (
        id INT IDENTITY(1,1) PRIMARY KEY,
        url NVARCHAR(500) NOT NULL,
        original_url NVARCHAR(500) NULL,
        title NVARCHAR(255) NULL,
        caption NVARCHAR(500) NULL,
        category NVARCHAR(50) DEFAULT 'company', -- 'company', 'event', 'environment', 'equipment', 'project'
        category_label NVARCHAR(100) NULL,
        date NVARCHAR(50) NULL,
        article_id INT NULL,
        created_at DATETIME2 DEFAULT GETDATE()
    );

    CREATE INDEX idx_gallery_category ON gallery(category);
    PRINT 'Đã tạo bảng gallery.';
END
GO

-- 8. Bảng WebConfigs (Cấu hình thông tin trang web: Hero, Thư ngỏ, Giấy phép, Liên hệ)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'web_configs')
BEGIN
    CREATE TABLE web_configs (
        id NVARCHAR(100) PRIMARY KEY,
        value NVARCHAR(MAX) NOT NULL,
        updated_at DATETIME2 DEFAULT GETDATE()
    );
    PRINT 'Đã tạo bảng web_configs.';
END
GO

-- 9. Bảng IpWhitelist (Danh sách IP được phép truy cập)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ip_whitelists')
BEGIN
    CREATE TABLE ip_whitelists (
        id INT IDENTITY(1,1) PRIMARY KEY,
        ip NVARCHAR(100) NOT NULL UNIQUE,
        description NVARCHAR(255) NULL
    );

    INSERT INTO ip_whitelists (ip, description) VALUES ('127.0.0.1', 'Localhost IPv4');
    INSERT INTO ip_whitelists (ip, description) VALUES ('::1', 'Localhost IPv6');
    PRINT 'Đã tạo bảng ip_whitelists.';
END
GO

PRINT '=======================================================';
PRINT 'KHỞI TẠO CSDL SQL SERVER CHO WEBSITE HEPCO HOÀN TẤT!';
PRINT '=======================================================';
