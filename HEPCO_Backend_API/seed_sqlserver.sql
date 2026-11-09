-- ============================================================================
-- DỮ LIỆU MẪU ĐẦY ĐỦ CHO HỆ THỐNG HEPCO TRÊN MICROSOFT SQL SERVER
-- Tự động sinh từ migratedData.json (Tin tức, Thông báo, Cổ đông, Dịch vụ, Gallery, Banners)
-- ============================================================================

USE HEPCO_DB;
GO

SET NOCOUNT ON;
PRINT 'Đang nạp dữ liệu mẫu vào SQL Server...';

-- 1. Banners mặc định
IF NOT EXISTS (SELECT 1 FROM banners)
BEGIN
    INSERT INTO banners (url, title, [order]) VALUES 
    ('/images/cover.png', N'HEPCO - Gần 50 năm đồng hành cùng Cố đô Huế', 1),
    ('/images/news_cleanup.png', N'Ngày Chủ Nhật Xanh - Vì một Huế xanh sạch sáng', 2),
    ('/images/news_trucks.png', N'Dàn xe chuyên dụng thế hệ mới tiêu chuẩn Euro 5', 3),
    ('/images/news_planting.png', N'Trồng hoa và cây xanh Đại Nội', 4),
    ('/images/services/thu-gom-rac-1.jpg', N'Dịch vụ Thu gom & Vận chuyển Chất thải', 5),
    ('/images/services/ve-sinh-cong-cong-1.jpg', N'Dịch vụ Vệ sinh Đô thị & Đường phố', 6),
    ('/images/services/cay-xanh-cong-vien-1.jpg', N'Dịch vụ Chăm sóc Công viên Cây xanh', 7),
    ('/images/services/chieu-sang-do-thi-1.jpg', N'Hệ thống Chiếu sáng Công cộng', 8);
    PRINT 'Đã nạp 8 banners mẫu.';
END
GO

-- 2. Thư viện ảnh đầy đủ (Gallery)
PRINT 'Đang nạp danh sách thư viện ảnh hoạt động...';

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/TongQuan_6a06c09d.jpg', N'/uploads/images/TongQuan_6a06c09d.jpg', N'Tổng quan hoạt động Công ty Cổ phần Môi trường và Công trình Đô thị Huế (HEPCO)', N'Tổng quan hoạt động Công ty Cổ phần Môi trường và Công trình Đô thị Huế (HEPCO)', N'company', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/HL-2_a07c11d6.jpg', N'/uploads/images/HL-2_a07c11d6.jpg', N'Hoạt động duy tu cảnh quan và vệ sinh môi trường đô thị Huế', N'Hoạt động duy tu cảnh quan và vệ sinh môi trường đô thị Huế', N'environment', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/HL-5_c7b60f77.jpg', N'/uploads/images/HL-5_c7b60f77.jpg', N'Đội ngũ cán bộ công nhân viên HEPCO ra quân làm sạch đẹp phố phường', N'Đội ngũ cán bộ công nhân viên HEPCO ra quân làm sạch đẹp phố phường', N'environment', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/11_1_969c9fc1.jpg', N'/uploads/images/11_1_969c9fc1.jpg', N'Hoạt động điều hành và sản xuất kinh doanh tại HEPCO', N'Hoạt động điều hành và sản xuất kinh doanh tại HEPCO', N'company', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/HEPCO_3eb49d00.jpg', N'/uploads/images/HEPCO_3eb49d00.jpg', N'Trụ sở và tập thể Công ty Cổ phần Môi trường và Công trình Đô thị Huế', N'Trụ sở và tập thể Công ty Cổ phần Môi trường và Công trình Đô thị Huế', N'company', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/347259211_1399570530865033_4467954850211736613_n_87ec943d.jpg', N'/uploads/images/347259211_1399570530865033_4467954850211736613_n_87ec943d.jpg', N'Sự kiện tiêu biểu và phong trào thi đua tại HEPCO', N'Sự kiện tiêu biểu và phong trào thi đua tại HEPCO', N'event', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/m_20190816_khanhthanh2_338d5070.jpg', N'/uploads/images/m_20190816_khanhthanh2_338d5070.jpg', N'Lễ khánh thành và đưa vào vận hành công trình trọng điểm của HEPCO', N'Lễ khánh thành và đưa vào vận hành công trình trọng điểm của HEPCO', N'project', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/nucongnhan_831e2753.jpg', N'/uploads/images/nucongnhan_831e2753.jpg', N'Tôn vinh nữ công nhân viên lao động tiêu biểu của HEPCO', N'Tôn vinh nữ công nhân viên lao động tiêu biểu của HEPCO', N'event', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/12-05_b2d6ee9d.png', N'/uploads/images/12-05_b2d6ee9d.png', N'Hoạt động kiểm tra, vận hành phương tiện và thiết bị chuyên dụng', N'Hoạt động kiểm tra, vận hành phương tiện và thiết bị chuyên dụng', N'equipment', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/29-11-2020_76475528.png', N'/uploads/images/29-11-2020_76475528.png', N'Hội nghị tổng kết và triển khai nhiệm vụ kế hoạch của HEPCO', N'Hội nghị tổng kết và triển khai nhiệm vụ kế hoạch của HEPCO', N'event', N'Hoạt động công ty', N'2025');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398891/hepco_news/cjvihyz2gychrt5f2z5q.jpg', N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398891/hepco_news/cjvihyz2gychrt5f2z5q.jpg', N'HEPCO TỔ CHỨC HUẤN LUYỆN AN TOÀN, VỆ SINH LAO ĐỘNG NĂM 2026', N'HEPCO TỔ CHỨC HUẤN LUYỆN AN TOÀN, VỆ SINH LAO ĐỘNG NĂM 2026', N'company', N'Hoạt động công ty', N'18/06/2026');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/RacThai_42b22196.jpg', N'/uploads/images/RacThai_42b22196.jpg', N'Lịch trình thu gom rác trên địa bàn Nam sông Hương', N'Lịch trình thu gom rác trên địa bàn Nam sông Hương', N'environment', N'Hoạt động công ty', N'14/06/2026 14:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785399133/hepco_news/m8bhc4ngw19jodva2fcx.jpg', N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785399133/hepco_news/m8bhc4ngw19jodva2fcx.jpg', N'HEPCO THĂM VÀ CHÚC MỪNG CÁC CƠ QUAN BÁO CHÍ NHÂN KỶ NIỆM 101 NĂM NGÀY BÁO CHÍ CÁCH MẠNG VIỆT NAM', N'HEPCO THĂM VÀ CHÚC MỪNG CÁC CƠ QUAN BÁO CHÍ NHÂN KỶ NIỆM 101 NĂM NGÀY BÁO CHÍ CÁCH MẠNG VIỆT NAM', N'event', N'Hoạt động công ty', N'14/06/2026');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398685/hepco_news/x7d02gexxmpgad8povto.jpg', N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398685/hepco_news/x7d02gexxmpgad8povto.jpg', N'VUI TẾT THIẾU NHI 1/6 VÀ TRAO THƯỞNG CHO CON CBCNV ĐẠT THÀNH TÍCH XUẤT SẮC TRONG HỌC TẬP VÀ RÈN LUYỆN 🎉🌸', N'VUI TẾT THIẾU NHI 1/6 VÀ TRAO THƯỞNG CHO CON CBCNV ĐẠT THÀNH TÍCH XUẤT SẮC TRONG HỌC TẬP VÀ RÈN LUYỆN 🎉🌸', N'event', N'Hoạt động công ty', N'10/06/2026');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398910/hepco_news/xcuzby8c8hzjkv6ozgid.jpg', N'https://res.cloudinary.com/doy7sp8ah/image/upload/v1785398910/hepco_news/xcuzby8c8hzjkv6ozgid.jpg', N'CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ TỔ CHỨC ĐẠI HỘI ĐỒNG CỔ ĐÔNG PHIÊN THƯỜNG NIÊN NĂM 2026', N'CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ TỔ CHỨC ĐẠI HỘI ĐỒNG CỔ ĐÔNG PHIÊN THƯỜNG NIÊN NĂM 2026', N'project', N'Hoạt động công ty', N'28/05/2026');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/550890908_1143279728011115_7045182749757454781_n_bdf76f9f.jpg', N'/uploads/images/550890908_1143279728011115_7045182749757454781_n_bdf76f9f.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'project', N'Hoạt động công ty', N'24/09/2025 10:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/553329492_1143279904677764_7285603826408923520_n_3c27677e.jpg', N'/uploads/images/553329492_1143279904677764_7285603826408923520_n_3c27677e.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'project', N'Hoạt động công ty', N'24/09/2025 10:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/550779041_1143282601344161_4812772918363100506_n_9ca9773b.jpg', N'/uploads/images/550779041_1143282601344161_4812772918363100506_n_9ca9773b.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'project', N'Hoạt động công ty', N'24/09/2025 10:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/550762501_1143282408010847_1745543314763991634_n_bedfcb82.jpg', N'/uploads/images/550762501_1143282408010847_1745543314763991634_n_bedfcb82.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'project', N'Hoạt động công ty', N'24/09/2025 10:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/550890908_1143279728011115_7045182749757454781_n_1_538ecbad.jpg', N'/uploads/images/550890908_1143279728011115_7045182749757454781_n_1_538ecbad.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'project', N'Hoạt động công ty', N'24/09/2025 10:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/513757499_1069568008715621_7947783751689158757_n_176d5413.jpg', N'/uploads/images/513757499_1069568008715621_7947783751689158757_n_176d5413.jpg', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'project', N'Hoạt động công ty', N'25/06/2025 15:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/510969764_1069567272049028_3715436291418750596_n_e548a772.jpg', N'/uploads/images/510969764_1069567272049028_3715436291418750596_n_e548a772.jpg', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'project', N'Hoạt động công ty', N'25/06/2025 15:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/511105287_1069567495382339_7710228098528574656_n_aca4b08a.jpg', N'/uploads/images/511105287_1069567495382339_7710228098528574656_n_aca4b08a.jpg', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'project', N'Hoạt động công ty', N'25/06/2025 15:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/511139690_1069567488715673_2197607098186667507_n_7a5d63e1.jpg', N'/uploads/images/511139690_1069567488715673_2197607098186667507_n_7a5d63e1.jpg', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'project', N'Hoạt động công ty', N'25/06/2025 15:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/511156984_1069567285382360_8120984872115208490_n_092c9809.jpg', N'/uploads/images/511156984_1069567285382360_8120984872115208490_n_092c9809.jpg', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'project', N'Hoạt động công ty', N'25/06/2025 15:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/8_80dc1c6c.jpg', N'/uploads/images/8_80dc1c6c.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1_4ef2d242.jpg', N'/uploads/images/1_4ef2d242.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/10_e3f1a0d4.jpg', N'/uploads/images/10_e3f1a0d4.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/11_2_bc34daf0.jpg', N'/uploads/images/11_2_bc34daf0.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13_b4742687.jpg', N'/uploads/images/13_b4742687.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/14_e0d8d5ad.jpg', N'/uploads/images/14_e0d8d5ad.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/15_7c50f0b9.jpg', N'/uploads/images/15_7c50f0b9.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/16_4175a010.jpg', N'/uploads/images/16_4175a010.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/6_e6055beb.jpg', N'/uploads/images/6_e6055beb.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/5_a7465ae4.jpg', N'/uploads/images/5_a7465ae4.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/4_b99c4929.jpg', N'/uploads/images/4_b99c4929.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/2_b2364cc4.jpg', N'/uploads/images/2_b2364cc4.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/9_63de2fd3.jpg', N'/uploads/images/9_63de2fd3.jpg', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'project', N'Hoạt động công ty', N'02/12/2023 15:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/DaoLe_acd473fa.jpg', N'/uploads/images/DaoLe_acd473fa.jpg', N'QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT', N'QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT', N'company', N'Hoạt động công ty', N'14/08/2023 14:35');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f4cd_39eb22f1.png', N'/uploads/images/1f4cd_39eb22f1.png', N'QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT', N'QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT', N'company', N'Hoạt động công ty', N'14/08/2023 14:35');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/260e_d55227fb.png', N'/uploads/images/260e_d55227fb.png', N'QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT', N'QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT', N'company', N'Hoạt động công ty', N'14/08/2023 14:35');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f60d_04c03081.png', N'/uploads/images/1f60d_04c03081.png', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'environment', N'Hoạt động công ty', N'14/05/2023 14:27');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/346937471_810039673401151_3983513850142061894_n_cadc5d87.jpg', N'/uploads/images/346937471_810039673401151_3983513850142061894_n_cadc5d87.jpg', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'environment', N'Hoạt động công ty', N'14/05/2023 14:27');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/346977078_1266289100653250_8830184759971648733_n_e0f2ed98.jpg', N'/uploads/images/346977078_1266289100653250_8830184759971648733_n_e0f2ed98.jpg', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'environment', N'Hoạt động công ty', N'14/05/2023 14:27');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/347118351_753519226519538_3321457128392345595_n_24589652.jpg', N'/uploads/images/347118351_753519226519538_3321457128392345595_n_24589652.jpg', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'environment', N'Hoạt động công ty', N'14/05/2023 14:27');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/347379780_259788799881356_7984439537715342922_n_1054e758.jpg', N'/uploads/images/347379780_259788799881356_7984439537715342922_n_1054e758.jpg', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'environment', N'Hoạt động công ty', N'14/05/2023 14:27');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/341593787_1420565075373855_1851262930945795000_n_056e837d.jpg', N'/uploads/images/341593787_1420565075373855_1851262930945795000_n_056e837d.jpg', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'environment', N'Hoạt động công ty', N'24/04/2023 14:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f449_1d40687d.png', N'/uploads/images/1f449_1d40687d.png', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'environment', N'Hoạt động công ty', N'24/04/2023 14:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f525_3f5cc1e8.png', N'/uploads/images/1f525_3f5cc1e8.png', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'environment', N'Hoạt động công ty', N'24/04/2023 14:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/274c_40771bc3.png', N'/uploads/images/274c_40771bc3.png', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'environment', N'Hoạt động công ty', N'24/04/2023 14:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-04_546dff3a.jpg', N'/uploads/images/24-04_546dff3a.jpg', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'company', N'Hoạt động công ty', N'23/04/2022 13:53');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-04_4_f048f630.jpg', N'/uploads/images/24-04_4_f048f630.jpg', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'company', N'Hoạt động công ty', N'23/04/2022 13:53');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-04_3_da0064a8.jpg', N'/uploads/images/24-04_3_da0064a8.jpg', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'company', N'Hoạt động công ty', N'23/04/2022 13:53');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-04_2_5effa95a.jpg', N'/uploads/images/24-04_2_5effa95a.jpg', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'company', N'Hoạt động công ty', N'23/04/2022 13:53');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-04_1_3451b138.jpg', N'/uploads/images/24-04_1_3451b138.jpg', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'company', N'Hoạt động công ty', N'23/04/2022 13:53');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-04_18b6a965.jpg', N'/uploads/images/23-04_18b6a965.jpg', N'Ngày hội đổi rác lấy quà 23/4/2022', N'Ngày hội đổi rác lấy quà 23/4/2022', N'company', N'Hoạt động công ty', N'23/04/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/267b_ae23a641.png', N'/uploads/images/267b_ae23a641.png', N'Ngày hội đổi rác lấy quà 23/4/2022', N'Ngày hội đổi rác lấy quà 23/4/2022', N'company', N'Hoạt động công ty', N'23/04/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f33a_5e2ab1b6.png', N'/uploads/images/1f33a_5e2ab1b6.png', N'Ngày hội đổi rác lấy quà 23/4/2022', N'Ngày hội đổi rác lấy quà 23/4/2022', N'company', N'Hoạt động công ty', N'23/04/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f331_da1a4156.png', N'/uploads/images/1f331_da1a4156.png', N'Ngày hội đổi rác lấy quà 23/4/2022', N'Ngày hội đổi rác lấy quà 23/4/2022', N'company', N'Hoạt động công ty', N'23/04/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f4e2_46c0ecf7.png', N'/uploads/images/1f4e2_46c0ecf7.png', N'Ngày hội đổi rác lấy quà 23/4/2022', N'Ngày hội đổi rác lấy quà 23/4/2022', N'company', N'Hoạt động công ty', N'23/04/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f4e3_f02f6a83.png', N'/uploads/images/1f4e3_f02f6a83.png', N'Ngày hội đổi rác lấy quà 23/4/2022', N'Ngày hội đổi rác lấy quà 23/4/2022', N'company', N'Hoạt động công ty', N'23/04/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1fab4_17fa8ad3.png', N'/uploads/images/1fab4_17fa8ad3.png', N'Ngày hội đổi rác lấy quà 23/4/2022', N'Ngày hội đổi rác lấy quà 23/4/2022', N'company', N'Hoạt động công ty', N'23/04/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-04_2_u_01a7d116.jpg', N'/uploads/images/22-04_2_u_01a7d116.jpg', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'environment', N'Hoạt động công ty', N'22/04/2022 08:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f33f_a9cdc5d6.png', N'/uploads/images/1f33f_a9cdc5d6.png', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'environment', N'Hoạt động công ty', N'22/04/2022 08:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-04_c089d744.jpg', N'/uploads/images/22-04_c089d744.jpg', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'environment', N'Hoạt động công ty', N'22/04/2022 08:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-04_2_u_27057e0f.jpg', N'/uploads/images/22-04_2_u_27057e0f.jpg', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'environment', N'Hoạt động công ty', N'22/04/2022 08:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-04_1_4ee3f048.jpg', N'/uploads/images/22-04_1_4ee3f048.jpg', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'environment', N'Hoạt động công ty', N'22/04/2022 08:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-04_1be4cf23.jpg', N'/uploads/images/21-04_1be4cf23.jpg', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'project', N'Hoạt động công ty', N'21/04/2022 10:23');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-04_1_7ce7d358.jpg', N'/uploads/images/21-04_1_7ce7d358.jpg', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'project', N'Hoạt động công ty', N'21/04/2022 10:23');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-04_2_f714dffd.jpg', N'/uploads/images/21-04_2_f714dffd.jpg', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'project', N'Hoạt động công ty', N'21/04/2022 10:23');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-04_3_f415bcd3.jpg', N'/uploads/images/21-04_3_f415bcd3.jpg', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'project', N'Hoạt động công ty', N'21/04/2022 10:23');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-04_4_2075cde2.jpg', N'/uploads/images/21-04_4_2075cde2.jpg', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'project', N'Hoạt động công ty', N'21/04/2022 10:23');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_11_d008e4b7.jpg', N'/uploads/images/18-03_11_d008e4b7.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_4ba13f1d.jpg', N'/uploads/images/18-03_4ba13f1d.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_9_bbf11eb5.jpg', N'/uploads/images/18-03_9_bbf11eb5.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_8_e557863a.jpg', N'/uploads/images/18-03_8_e557863a.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_7_d879e7ae.jpg', N'/uploads/images/18-03_7_d879e7ae.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_6_7cd1a877.jpg', N'/uploads/images/18-03_6_7cd1a877.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_5_c05385dd.jpg', N'/uploads/images/18-03_5_c05385dd.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_4_995bfddc.jpg', N'/uploads/images/18-03_4_995bfddc.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_3_21d557dc.jpg', N'/uploads/images/18-03_3_21d557dc.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_10_493c1019.jpg', N'/uploads/images/18-03_10_493c1019.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-03_1_e65613ca.jpg', N'/uploads/images/18-03_1_e65613ca.jpg', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'18/03/2022 15:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/17-03_9de6e521.jpg', N'/uploads/images/17-03_9de6e521.jpg', N'Mô hình Đại Nội Huế được làm từ nắp chai nhựa.', N'Mô hình Đại Nội Huế được làm từ nắp chai nhựa.', N'company', N'Hoạt động công ty', N'15/03/2022 11:02');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/15-03_e049b2f5.jpg', N'/uploads/images/15-03_e049b2f5.jpg', N'CHÀO MỪNG ĐẠI HỘI ĐOÀN TNCS HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'CHÀO MỪNG ĐẠI HỘI ĐOÀN TNCS HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'project', N'Hoạt động công ty', N'15/03/2022 10:23');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/14-02-22_cd2bbfd1.jpg', N'/uploads/images/14-02-22_cd2bbfd1.jpg', N'Sẽ không “cào bằng” trong thu phí rác thải theo cách mới', N'Sẽ không “cào bằng” trong thu phí rác thải theo cách mới', N'company', N'Hoạt động công ty', N'14/03/2022 15:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-03-22_00018ab0.jpg', N'/uploads/images/09-03-22_00018ab0.jpg', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'environment', N'Hoạt động công ty', N'09/03/2022 10:57');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/31_20e3_cb8bc688.png', N'/uploads/images/31_20e3_cb8bc688.png', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'environment', N'Hoạt động công ty', N'09/03/2022 10:57');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/32_20e3_26198460.png', N'/uploads/images/32_20e3_26198460.png', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'environment', N'Hoạt động công ty', N'09/03/2022 10:57');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/33_20e3_1ce0cd88.png', N'/uploads/images/33_20e3_1ce0cd88.png', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'environment', N'Hoạt động công ty', N'09/03/2022 10:57');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-03-22_1_6cda8566.jpg', N'/uploads/images/09-03-22_1_6cda8566.jpg', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'environment', N'Hoạt động công ty', N'09/03/2022 10:57');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-03-22_2_1b82df02.jpg', N'/uploads/images/09-03-22_2_1b82df02.jpg', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'environment', N'Hoạt động công ty', N'09/03/2022 10:57');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-03-22_3_74796d1f.jpg', N'/uploads/images/09-03-22_3_74796d1f.jpg', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'environment', N'Hoạt động công ty', N'09/03/2022 10:57');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/17-02_dc927bc5.jpg', N'/uploads/images/17-02_dc927bc5.jpg', N'Nhặt nhẫn kim cương và trả lại – hành động đẹp đáng để trân trọng và lan tỏa của công nhân HEPCO.', N'Nhặt nhẫn kim cương và trả lại – hành động đẹp đáng để trân trọng và lan tỏa của công nhân HEPCO.', N'company', N'Hoạt động công ty', N'17/02/2022 13:49');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/9-2_3_560da726.jpg', N'/uploads/images/9-2_3_560da726.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'09/02/2022 11:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/9-2_31cf5d6a.jpg', N'/uploads/images/9-2_31cf5d6a.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'09/02/2022 11:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/9-2_1_411b0bc0.jpg', N'/uploads/images/9-2_1_411b0bc0.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'09/02/2022 11:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/9-2_2_3ccaed1e.jpg', N'/uploads/images/9-2_2_3ccaed1e.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'09/02/2022 11:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/9-2_4_053d3fd0.jpg', N'/uploads/images/9-2_4_053d3fd0.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'09/02/2022 11:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/9-2_5_c9fd136f.jpg', N'/uploads/images/9-2_5_c9fd136f.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'09/02/2022 11:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/2747_adb421ca.png', N'/uploads/images/2747_adb421ca.png', N'Thông báo tăng cường  thời gian và tần suất thu gom dịp Tết Nhâm Dần 2022', N'Thông báo tăng cường  thời gian và tần suất thu gom dịp Tết Nhâm Dần 2022', N'event', N'Hoạt động công ty', N'28/01/2022 10:36');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f49a_073a9c78.png', N'/uploads/images/1f49a_073a9c78.png', N'Thông báo tăng cường  thời gian và tần suất thu gom dịp Tết Nhâm Dần 2022', N'Thông báo tăng cường  thời gian và tần suất thu gom dịp Tết Nhâm Dần 2022', N'event', N'Hoạt động công ty', N'28/01/2022 10:36');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-01-22_c4764de0.jpg', N'/uploads/images/26-01-22_c4764de0.jpg', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'company', N'Hoạt động công ty', N'26/01/2022 14:05');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-01-22_1_e0fafbf6.jpg', N'/uploads/images/26-01-22_1_e0fafbf6.jpg', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'company', N'Hoạt động công ty', N'26/01/2022 14:05');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-01-22_3_b1bb7857.jpg', N'/uploads/images/26-01-22_3_b1bb7857.jpg', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'company', N'Hoạt động công ty', N'26/01/2022 14:05');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/272049155_4724859867601301_1270059735264857752_n_0e7ce123.jpg', N'/uploads/images/272049155_4724859867601301_1270059735264857752_n_0e7ce123.jpg', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'company', N'Hoạt động công ty', N'26/01/2022 14:05');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-01-22_11_eef26820.jpg', N'/uploads/images/24-01-22_11_eef26820.jpg', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'environment', N'Hoạt động công ty', N'24/01/2022 15:44');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f33b_f7c67245.png', N'/uploads/images/1f33b_f7c67245.png', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'environment', N'Hoạt động công ty', N'24/01/2022 15:44');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f338_f7d4690c.png', N'/uploads/images/1f338_f7d4690c.png', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'environment', N'Hoạt động công ty', N'24/01/2022 15:44');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f31f_11a6192f.png', N'/uploads/images/1f31f_11a6192f.png', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'environment', N'Hoạt động công ty', N'24/01/2022 15:44');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f33c_06318be2.png', N'/uploads/images/1f33c_06318be2.png', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'environment', N'Hoạt động công ty', N'24/01/2022 15:44');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f3b6_49771645.png', N'/uploads/images/1f3b6_49771645.png', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'Lịch thu gom rác Tết Nhâm Dần 2022', N'environment', N'Hoạt động công ty', N'24/01/2022 15:44');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-01-22_5_aa9d89e6.jpg', N'/uploads/images/24-01-22_5_aa9d89e6.jpg', N'Cùng ý thức để công nhân môi trường được đón tết sớm', N'Cùng ý thức để công nhân môi trường được đón tết sớm', N'environment', N'Hoạt động công ty', N'24/01/2022 13:25');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-01-22_aa1f169b.jpg', N'/uploads/images/24-01-22_aa1f169b.jpg', N'Trao quà cho công nhân dịp Tết đến xuân về', N'Trao quà cho công nhân dịp Tết đến xuân về', N'event', N'Hoạt động công ty', N'24/01/2022 10:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-01-22_1_b3eac48a.jpg', N'/uploads/images/24-01-22_1_b3eac48a.jpg', N'Trao quà cho công nhân dịp Tết đến xuân về', N'Trao quà cho công nhân dịp Tết đến xuân về', N'event', N'Hoạt động công ty', N'24/01/2022 10:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-01-22_2_4ecb5699.jpg', N'/uploads/images/24-01-22_2_4ecb5699.jpg', N'Trao quà cho công nhân dịp Tết đến xuân về', N'Trao quà cho công nhân dịp Tết đến xuân về', N'event', N'Hoạt động công ty', N'24/01/2022 10:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-01-22_3_8e2f147a.jpg', N'/uploads/images/24-01-22_3_8e2f147a.jpg', N'Trao quà cho công nhân dịp Tết đến xuân về', N'Trao quà cho công nhân dịp Tết đến xuân về', N'event', N'Hoạt động công ty', N'24/01/2022 10:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-01-22_4_e63edc67.jpg', N'/uploads/images/24-01-22_4_e63edc67.jpg', N'Trao quà cho công nhân dịp Tết đến xuân về', N'Trao quà cho công nhân dịp Tết đến xuân về', N'event', N'Hoạt động công ty', N'24/01/2022 10:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_4_cc1d3728.jpg', N'/uploads/images/22-01-22_4_cc1d3728.jpg', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'event', N'Hoạt động công ty', N'22/01/2022 22:39');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_9_ef03bf06.jpg', N'/uploads/images/22-01-22_9_ef03bf06.jpg', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'event', N'Hoạt động công ty', N'22/01/2022 22:39');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_8_237295b4.jpg', N'/uploads/images/22-01-22_8_237295b4.jpg', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'event', N'Hoạt động công ty', N'22/01/2022 22:39');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_7_8b6b5c7d.jpg', N'/uploads/images/22-01-22_7_8b6b5c7d.jpg', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'event', N'Hoạt động công ty', N'22/01/2022 22:39');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_6_c0da260d.jpg', N'/uploads/images/22-01-22_6_c0da260d.jpg', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'event', N'Hoạt động công ty', N'22/01/2022 22:39');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_5_571b973d.jpg', N'/uploads/images/22-01-22_5_571b973d.jpg', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'event', N'Hoạt động công ty', N'22/01/2022 22:39');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_1_5e95340b.jpg', N'/uploads/images/22-01-22_1_5e95340b.jpg', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'environment', N'Hoạt động công ty', N'22/01/2022 10:01');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_f01bdc9b.jpg', N'/uploads/images/22-01-22_f01bdc9b.jpg', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'environment', N'Hoạt động công ty', N'22/01/2022 10:01');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_2_08b76edf.jpg', N'/uploads/images/22-01-22_2_08b76edf.jpg', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'environment', N'Hoạt động công ty', N'22/01/2022 10:01');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-01-22_3_0ecee48f.jpg', N'/uploads/images/22-01-22_3_0ecee48f.jpg', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'environment', N'Hoạt động công ty', N'22/01/2022 10:01');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-01-22_3_88f75ed9.jpg', N'/uploads/images/21-01-22_3_88f75ed9.jpg', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'company', N'Hoạt động công ty', N'21/01/2022 21:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/20-01-22_1_c47674f6.jpg', N'/uploads/images/20-01-22_1_c47674f6.jpg', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'company', N'Hoạt động công ty', N'21/01/2022 21:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-01-22_863b3534.jpg', N'/uploads/images/21-01-22_863b3534.jpg', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'company', N'Hoạt động công ty', N'21/01/2022 21:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/21-01-22_2_4776e7da.jpg', N'/uploads/images/21-01-22_2_4776e7da.jpg', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'company', N'Hoạt động công ty', N'21/01/2022 21:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/20-01-2022_9516a172.jpg', N'/uploads/images/20-01-2022_9516a172.jpg', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'project', N'Hoạt động công ty', N'18/01/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/20-01-2022_2_68c7016f.jpg', N'/uploads/images/20-01-2022_2_68c7016f.jpg', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'project', N'Hoạt động công ty', N'18/01/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/20-01-2022_1_55b70087.jpg', N'/uploads/images/20-01-2022_1_55b70087.jpg', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'project', N'Hoạt động công ty', N'18/01/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/20-01-2022_3_cae50b18.jpg', N'/uploads/images/20-01-2022_3_cae50b18.jpg', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'project', N'Hoạt động công ty', N'18/01/2022 10:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-01_2_2ebdf8c7.jpg', N'/uploads/images/09-01_2_2ebdf8c7.jpg', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'company', N'Hoạt động công ty', N'09/01/2022 08:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-01_6_d944933b.jpg', N'/uploads/images/09-01_6_d944933b.jpg', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'company', N'Hoạt động công ty', N'09/01/2022 08:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-01_3_b5af3075.jpg', N'/uploads/images/09-01_3_b5af3075.jpg', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'company', N'Hoạt động công ty', N'09/01/2022 08:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-01_7_cf3152e6.jpg', N'/uploads/images/09-01_7_cf3152e6.jpg', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'company', N'Hoạt động công ty', N'09/01/2022 08:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-01_1_eddea7ce.jpg', N'/uploads/images/09-01_1_eddea7ce.jpg', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'company', N'Hoạt động công ty', N'09/01/2022 08:51');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-01_a3b74cc4.jpg', N'/uploads/images/02-01_a3b74cc4.jpg', N'Bài thơ gửi các đồng nghiệp', N'Bài thơ gửi các đồng nghiệp', N'company', N'Hoạt động công ty', N'07/01/2022 09:44');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-01_5_0437c389.jpg', N'/uploads/images/01-01_5_0437c389.jpg', N'Huế những ngày đầu năm 2022', N'Huế những ngày đầu năm 2022', N'company', N'Hoạt động công ty', N'05/01/2022 08:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-01_1_127547a1.jpg', N'/uploads/images/02-01_1_127547a1.jpg', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'environment', N'Hoạt động công ty', N'02/01/2022 10:42');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-01_3_0bcbd58b.jpg', N'/uploads/images/02-01_3_0bcbd58b.jpg', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'environment', N'Hoạt động công ty', N'02/01/2022 10:42');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-01_4_a8cb2969.jpg', N'/uploads/images/02-01_4_a8cb2969.jpg', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'environment', N'Hoạt động công ty', N'02/01/2022 10:42');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-01_5_86bf6af4.jpg', N'/uploads/images/02-01_5_86bf6af4.jpg', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'environment', N'Hoạt động công ty', N'02/01/2022 10:42');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-01_6_43f470de.jpg', N'/uploads/images/02-01_6_43f470de.jpg', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'environment', N'Hoạt động công ty', N'02/01/2022 10:42');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-01_1_5561de73.jpg', N'/uploads/images/01-01_1_5561de73.jpg', N'Thay đổi nhận diện đồng phục', N'Thay đổi nhận diện đồng phục', N'company', N'Hoạt động công ty', N'01/01/2022 10:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-01_2_98e736f5.jpg', N'/uploads/images/01-01_2_98e736f5.jpg', N'Thay đổi nhận diện đồng phục', N'Thay đổi nhận diện đồng phục', N'company', N'Hoạt động công ty', N'01/01/2022 10:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-01_3_d35825fa.jpg', N'/uploads/images/01-01_3_d35825fa.jpg', N'Thay đổi nhận diện đồng phục', N'Thay đổi nhận diện đồng phục', N'company', N'Hoạt động công ty', N'01/01/2022 10:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-01_ec377728.jpg', N'/uploads/images/01-01_ec377728.jpg', N'Thay đổi nhận diện đồng phục', N'Thay đổi nhận diện đồng phục', N'company', N'Hoạt động công ty', N'01/01/2022 10:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/27-11_c8be806f.png', N'/uploads/images/27-11_c8be806f.png', N'Thừa Thiên Huế triển khai nhiều hoạt động giảm thiểu rác thải nhựa', N'Thừa Thiên Huế triển khai nhiều hoạt động giảm thiểu rác thải nhựa', N'company', N'Hoạt động công ty', N'27/11/2021 10:30');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/25-11_31463b2b.jpg', N'/uploads/images/25-11_31463b2b.jpg', N'3 phương thức thanh toán tiền dịch vụ vệ sinh môi trường an toàn, nhanh chóng trong mùa dịch', N'3 phương thức thanh toán tiền dịch vụ vệ sinh môi trường an toàn, nhanh chóng trong mùa dịch', N'environment', N'Hoạt động công ty', N'25/11/2021 08:00');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-11_5_cb71aa17.jpg', N'/uploads/images/24-11_5_cb71aa17.jpg', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'company', N'Hoạt động công ty', N'24/11/2021 09:54');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-11_7449acf1.jpg', N'/uploads/images/24-11_7449acf1.jpg', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'company', N'Hoạt động công ty', N'24/11/2021 09:54');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-11_1_b1e58b55.jpg', N'/uploads/images/24-11_1_b1e58b55.jpg', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'company', N'Hoạt động công ty', N'24/11/2021 09:54');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-11_2_3042ed27.jpg', N'/uploads/images/24-11_2_3042ed27.jpg', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'company', N'Hoạt động công ty', N'24/11/2021 09:54');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-11_3_17b25011.jpg', N'/uploads/images/24-11_3_17b25011.jpg', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'company', N'Hoạt động công ty', N'24/11/2021 09:54');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/24-11_4_0b390326.jpg', N'/uploads/images/24-11_4_0b390326.jpg', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'company', N'Hoạt động công ty', N'24/11/2021 09:54');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/thu-gom_e3c5c1a0.jpg', N'/uploads/images/thu-gom_e3c5c1a0.jpg', N'Thu gom rác COVID-19 tại các khu phong tỏa', N'Thu gom rác COVID-19 tại các khu phong tỏa', N'environment', N'Hoạt động công ty', N'22/11/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/7-11_163862b3.jpg', N'/uploads/images/7-11_163862b3.jpg', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'environment', N'Hoạt động công ty', N'07/11/2021 10:11');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/7-11_1_591debc6.jpg', N'/uploads/images/7-11_1_591debc6.jpg', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'environment', N'Hoạt động công ty', N'07/11/2021 10:11');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/7-11_2_08bc6235.jpg', N'/uploads/images/7-11_2_08bc6235.jpg', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'environment', N'Hoạt động công ty', N'07/11/2021 10:11');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/7-11_3_ffbb88b2.jpg', N'/uploads/images/7-11_3_ffbb88b2.jpg', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'environment', N'Hoạt động công ty', N'07/11/2021 10:11');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/31-10_ac93a25f.jpg', N'/uploads/images/31-10_ac93a25f.jpg', N'Thông báo nhắc lại giờ thu gom rác ban đêm vào mùa đông', N'Thông báo nhắc lại giờ thu gom rác ban đêm vào mùa đông', N'environment', N'Hoạt động công ty', N'31/10/2021 08:50');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/chu_dong_51e9d841.jpg', N'/uploads/images/chu_dong_51e9d841.jpg', N'Chủ động xử lý thoát nước, vệ sinh, chiếu sáng mùa bão lụt', N'Chủ động xử lý thoát nước, vệ sinh, chiếu sáng mùa bão lụt', N'project', N'Hoạt động công ty', N'29/10/2021 10:22');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-09_1_7848bc1e.jpg', N'/uploads/images/22-09_1_7848bc1e.jpg', N'Nâng cao nhận thức, thay đổi hành vi cộng đồng về phân loại rác', N'Nâng cao nhận thức, thay đổi hành vi cộng đồng về phân loại rác', N'environment', N'Hoạt động công ty', N'23/09/2021 08:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/22-09_86b574df.jpg', N'/uploads/images/22-09_86b574df.jpg', N'Những công việc thầm lặng thời COVID-19!', N'Những công việc thầm lặng thời COVID-19!', N'company', N'Hoạt động công ty', N'22/09/2021 10:52');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/16-09_436a8f87.jpg', N'/uploads/images/16-09_436a8f87.jpg', N'Vứt rác khẩu trang bừa bãi dễ lây lan dịch bệnh', N'Vứt rác khẩu trang bừa bãi dễ lây lan dịch bệnh', N'company', N'Hoạt động công ty', N'16/09/2021 10:28');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1_c53537c7.png', N'/uploads/images/1_c53537c7.png', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/203c_f6646ade.png', N'/uploads/images/203c_f6646ade.png', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_7_15e63247.jpg', N'/uploads/images/26-08_7_15e63247.jpg', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_1_1_0ca1a555.jpg', N'/uploads/images/26-08_1_1_0ca1a555.jpg', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_2_1_33dccb55.jpg', N'/uploads/images/26-08_2_1_33dccb55.jpg', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_3_1_0b767b1a.jpg', N'/uploads/images/26-08_3_1_0b767b1a.jpg', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_4_8f89cb58.jpg', N'/uploads/images/26-08_4_8f89cb58.jpg', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_5_99e42617.jpg', N'/uploads/images/26-08_5_99e42617.jpg', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_6_c0268a9c.jpg', N'/uploads/images/26-08_6_c0268a9c.jpg', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/27a1_19c1caa2.png', N'/uploads/images/27a1_19c1caa2.png', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'company', N'Hoạt động công ty', N'26/08/2021 07:55');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_dd86707f.jpg', N'/uploads/images/26-08_dd86707f.jpg', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'environment', N'Hoạt động công ty', N'26/08/2021 07:49');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_1_c3b323e2.jpg', N'/uploads/images/26-08_1_c3b323e2.jpg', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'environment', N'Hoạt động công ty', N'26/08/2021 07:49');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_2_3f482f52.jpg', N'/uploads/images/26-08_2_3f482f52.jpg', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'environment', N'Hoạt động công ty', N'26/08/2021 07:49');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-08_3_8b0f39c7.jpg', N'/uploads/images/26-08_3_8b0f39c7.jpg', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'environment', N'Hoạt động công ty', N'26/08/2021 07:49');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_3_1f0ac932.jpg', N'/uploads/images/23-08_3_1f0ac932.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_5ae0baf4.jpg', N'/uploads/images/23-08_5ae0baf4.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_1_d7d64c8f.jpg', N'/uploads/images/23-08_1_d7d64c8f.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_2_6e911878.jpg', N'/uploads/images/23-08_2_6e911878.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_4_cefc2757.jpg', N'/uploads/images/23-08_4_cefc2757.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_5_0d16ccce.jpg', N'/uploads/images/23-08_5_0d16ccce.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_6_671f7d97.jpg', N'/uploads/images/23-08_6_671f7d97.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_7_c0f00fad.jpg', N'/uploads/images/23-08_7_c0f00fad.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/23-08_8_c703de3c.jpg', N'/uploads/images/23-08_8_c703de3c.jpg', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'environment', N'Hoạt động công ty', N'23/08/2021 09:38');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/VTV1_74661369.png', N'/uploads/images/VTV1_74661369.png', N'Việt Nam thức giấc | #VTV1 Những công nhân vệ sinh môi trường thu gom rác thải trong khu cách ly', N'Việt Nam thức giấc | #VTV1 Những công nhân vệ sinh môi trường thu gom rác thải trong khu cách ly', N'environment', N'Hoạt động công ty', N'16/08/2021 10:09');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-08_4_7953f306.jpg', N'/uploads/images/13-08_4_7953f306.jpg', N'Chủ Nhật Xanh 8/8/2021', N'Chủ Nhật Xanh 8/8/2021', N'environment', N'Hoạt động công ty', N'13/08/2021 10:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-08_cb063314.jpg', N'/uploads/images/13-08_cb063314.jpg', N'Chủ Nhật Xanh 8/8/2021', N'Chủ Nhật Xanh 8/8/2021', N'environment', N'Hoạt động công ty', N'13/08/2021 10:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-08_1_44eef829.jpg', N'/uploads/images/13-08_1_44eef829.jpg', N'Chủ Nhật Xanh 8/8/2021', N'Chủ Nhật Xanh 8/8/2021', N'environment', N'Hoạt động công ty', N'13/08/2021 10:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-08_2_3a73116f.jpg', N'/uploads/images/13-08_2_3a73116f.jpg', N'Chủ Nhật Xanh 8/8/2021', N'Chủ Nhật Xanh 8/8/2021', N'environment', N'Hoạt động công ty', N'13/08/2021 10:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-08_3_dc780302.jpg', N'/uploads/images/13-08_3_dc780302.jpg', N'Chủ Nhật Xanh 8/8/2021', N'Chủ Nhật Xanh 8/8/2021', N'environment', N'Hoạt động công ty', N'13/08/2021 10:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-08_5_dbd218a3.jpg', N'/uploads/images/13-08_5_dbd218a3.jpg', N'Chủ Nhật Xanh 8/8/2021', N'Chủ Nhật Xanh 8/8/2021', N'environment', N'Hoạt động công ty', N'13/08/2021 10:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-08_8_11cfe87b.jpg', N'/uploads/images/13-08_8_11cfe87b.jpg', N'Chủ Nhật Xanh 8/8/2021', N'Chủ Nhật Xanh 8/8/2021', N'environment', N'Hoạt động công ty', N'13/08/2021 10:03');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/12-08_5357212d.jpg', N'/uploads/images/12-08_5357212d.jpg', N'Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO', N'Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO', N'environment', N'Hoạt động công ty', N'12/08/2021 15:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/image-20210812153107-13_243750a6.png', N'/uploads/images/image-20210812153107-13_243750a6.png', N'Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO', N'Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO', N'environment', N'Hoạt động công ty', N'12/08/2021 15:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/12-08_1_b06ee9af.jpg', N'/uploads/images/12-08_1_b06ee9af.jpg', N'Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO', N'Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO', N'environment', N'Hoạt động công ty', N'12/08/2021 15:29');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-08_0ebacd86.jpg', N'/uploads/images/01-08_0ebacd86.jpg', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'company', N'Hoạt động công ty', N'01/08/2021 09:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-08_1_c6c246df.jpg', N'/uploads/images/01-08_1_c6c246df.jpg', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'company', N'Hoạt động công ty', N'01/08/2021 09:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-08_2_2ea44dae.jpg', N'/uploads/images/01-08_2_2ea44dae.jpg', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'company', N'Hoạt động công ty', N'01/08/2021 09:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-08_3_fd609593.jpg', N'/uploads/images/01-08_3_fd609593.jpg', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'company', N'Hoạt động công ty', N'01/08/2021 09:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-08_4_6a5081a3.jpg', N'/uploads/images/01-08_4_6a5081a3.jpg', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'company', N'Hoạt động công ty', N'01/08/2021 09:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-08_7_32c3edf5.jpg', N'/uploads/images/01-08_7_32c3edf5.jpg', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'company', N'Hoạt động công ty', N'01/08/2021 09:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-08_9_a2b5fc0a.jpg', N'/uploads/images/01-08_9_a2b5fc0a.jpg', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'company', N'Hoạt động công ty', N'01/08/2021 09:56');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/31-07_66f0c15a.jpg', N'/uploads/images/31-07_66f0c15a.jpg', N'CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19', N'CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19', N'company', N'Hoạt động công ty', N'31/07/2021 20:58');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/31-07_1_9e738e69.jpg', N'/uploads/images/31-07_1_9e738e69.jpg', N'CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19', N'CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19', N'company', N'Hoạt động công ty', N'31/07/2021 20:58');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/31-07_2_0e4d7e86.jpg', N'/uploads/images/31-07_2_0e4d7e86.jpg', N'CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19', N'CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19', N'company', N'Hoạt động công ty', N'31/07/2021 20:58');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/30-07_8af46121.jpg', N'/uploads/images/30-07_8af46121.jpg', N'Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.', N'Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.', N'company', N'Hoạt động công ty', N'30/07/2021 09:58');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/30-07_3_fe22b918.jpg', N'/uploads/images/30-07_3_fe22b918.jpg', N'Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.', N'Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.', N'company', N'Hoạt động công ty', N'30/07/2021 09:58');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/30-07_2_66abe1d7.jpg', N'/uploads/images/30-07_2_66abe1d7.jpg', N'Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.', N'Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.', N'company', N'Hoạt động công ty', N'30/07/2021 09:58');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/28-07_2b5357e2.jpg', N'/uploads/images/28-07_2b5357e2.jpg', N'An toàn thu gom và xử lý rác tại các khu cách ly', N'An toàn thu gom và xử lý rác tại các khu cách ly', N'company', N'Hoạt động công ty', N'28/07/2021 14:33');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-06_2_9938b050.jpg', N'/uploads/images/02-06_2_9938b050.jpg', N'Nhặt rác bằng xe đạp điện trợ lực', N'Nhặt rác bằng xe đạp điện trợ lực', N'equipment', N'Hoạt động công ty', N'25/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-05_2_24c0bce9.jpg', N'/uploads/images/13-05_2_24c0bce9.jpg', N'Công ty Cổ phần Môi trường và Công trình Đô Thị Huế thực hiện thu gom, vận chuyển và xử lý rác thải tại các khu vực cách ly trên địa bàn', N'Công ty Cổ phần Môi trường và Công trình Đô Thị Huế thực hiện thu gom, vận chuyển và xử lý rác thải tại các khu vực cách ly trên địa bàn', N'project', N'Hoạt động công ty', N'19/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-06_7a53513e.jpg', N'/uploads/images/18-06_7a53513e.jpg', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'project', N'Hoạt động công ty', N'18/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-06_2_ba7bb76e.jpg', N'/uploads/images/18-06_2_ba7bb76e.jpg', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'project', N'Hoạt động công ty', N'18/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-06_3_75b3d04f.jpg', N'/uploads/images/18-06_3_75b3d04f.jpg', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'project', N'Hoạt động công ty', N'18/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/18-06_4_4d762bce.jpg', N'/uploads/images/18-06_4_4d762bce.jpg', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'project', N'Hoạt động công ty', N'18/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/10-06_4d4f4a9c.jpg', N'/uploads/images/10-06_4d4f4a9c.jpg', N'Hạn chế đồ dùng nhựa một lần: Biện pháp nào thay thế?', N'Hạn chế đồ dùng nhựa một lần: Biện pháp nào thay thế?', N'company', N'Hoạt động công ty', N'10/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/03-06_1_e0c26be1.jpg', N'/uploads/images/03-06_1_e0c26be1.jpg', N'Ngày môi trường thế giới 05/06/2021: Phục hồi hệ sinh thái', N'Ngày môi trường thế giới 05/06/2021: Phục hồi hệ sinh thái', N'environment', N'Hoạt động công ty', N'03/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-06_1_c10dfc9d.jpg', N'/uploads/images/02-06_1_c10dfc9d.jpg', N'Thu gom rác bằng xe đạp thân thiện với môi trường', N'Thu gom rác bằng xe đạp thân thiện với môi trường', N'equipment', N'Hoạt động công ty', N'02/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-06_707fc492.jpg', N'/uploads/images/02-06_707fc492.jpg', N'Thu gom rác bằng xe đạp thân thiện với môi trường', N'Thu gom rác bằng xe đạp thân thiện với môi trường', N'equipment', N'Hoạt động công ty', N'02/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-06_3_15a99cb0.jpg', N'/uploads/images/02-06_3_15a99cb0.jpg', N'Thu gom rác bằng xe đạp thân thiện với môi trường', N'Thu gom rác bằng xe đạp thân thiện với môi trường', N'equipment', N'Hoạt động công ty', N'02/06/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/29-05_bc978c80.jpg', N'/uploads/images/29-05_bc978c80.jpg', N'Thừa Thiên – Huế: Gần 15 tỷ đồng đầu tư mở rộng bãi chôn lấp rác Thủy Phương (Tin bài: Báo Xây dựng)', N'Thừa Thiên – Huế: Gần 15 tỷ đồng đầu tư mở rộng bãi chôn lấp rác Thủy Phương (Tin bài: Báo Xây dựng)', N'project', N'Hoạt động công ty', N'29/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/28-05_47076f87.jpg', N'/uploads/images/28-05_47076f87.jpg', N'Khởi công công trình "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương". Giải pháp trong tình thế cấp bách.', N'Khởi công công trình "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương". Giải pháp trong tình thế cấp bách.', N'project', N'Hoạt động công ty', N'28/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/27-05_bc8b1c17.jpg', N'/uploads/images/27-05_bc8b1c17.jpg', N'Cán bộ CNV-NLĐ Công ty Cổ phần Môi trường và Công Trình Đô thị Huế (HEPCO) chung tay đẩy lùi Covid-19.', N'Cán bộ CNV-NLĐ Công ty Cổ phần Môi trường và Công Trình Đô thị Huế (HEPCO) chung tay đẩy lùi Covid-19.', N'project', N'Hoạt động công ty', N'27/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/27-05_2_3011d9e4.jpg', N'/uploads/images/27-05_2_3011d9e4.jpg', N'Cán bộ CNV-NLĐ Công ty Cổ phần Môi trường và Công Trình Đô thị Huế (HEPCO) chung tay đẩy lùi Covid-19.', N'Cán bộ CNV-NLĐ Công ty Cổ phần Môi trường và Công Trình Đô thị Huế (HEPCO) chung tay đẩy lùi Covid-19.', N'project', N'Hoạt động công ty', N'27/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/25-06_2_683b1a79.jpg', N'/uploads/images/25-06_2_683b1a79.jpg', N'Thông tin dự án khởi công: Dự án mở rộng, cải tạo bãi chôn lấp chất thải rắn Thủy Phương', N'Thông tin dự án khởi công: Dự án mở rộng, cải tạo bãi chôn lấp chất thải rắn Thủy Phương', N'project', N'Hoạt động công ty', N'26/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/25-06_1_658af737.jpg', N'/uploads/images/25-06_1_658af737.jpg', N'Khởi công công trình "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương" (Tin bài: Báo Thừa Thiên Huế)', N'Khởi công công trình "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương" (Tin bài: Báo Thừa Thiên Huế)', N'project', N'Hoạt động công ty', N'26/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/25-06_499b6738.jpg', N'/uploads/images/25-06_499b6738.jpg', N'Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương, nhu cầu bức thiết', N'Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương, nhu cầu bức thiết', N'project', N'Hoạt động công ty', N'26/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/SunmiV2_980db08b.jpeg', N'/uploads/images/SunmiV2_980db08b.jpeg', N'Thông báo thay đổi hình thức thanh toán tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phố Huế', N'Thông báo thay đổi hình thức thanh toán tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phố Huế', N'equipment', N'Hoạt động công ty', N'20/05/2021 11:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/MauBNTTT_e5990325.jpg', N'/uploads/images/MauBNTTT_e5990325.jpg', N'Thông báo thay đổi hình thức thanh toán tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phố Huế', N'Thông báo thay đổi hình thức thanh toán tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phố Huế', N'company', N'Hoạt động công ty', N'20/05/2021 11:20');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/17-05_9a1bbb0e.jpg', N'/uploads/images/17-05_9a1bbb0e.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'17/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/17-05_1_a940ba52.jpg', N'/uploads/images/17-05_1_a940ba52.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'17/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/17-05_2_07937dba.jpg', N'/uploads/images/17-05_2_07937dba.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'17/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/17-05_3_8d4e1dc7.jpg', N'/uploads/images/17-05_3_8d4e1dc7.jpg', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'company', N'Hoạt động công ty', N'17/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/15-05_1_ea772d5e.jpg', N'/uploads/images/15-05_1_ea772d5e.jpg', N'Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường', N'Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường', N'environment', N'Hoạt động công ty', N'15/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/15-05_8314373c.jpg', N'/uploads/images/15-05_8314373c.jpg', N'Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường', N'Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường', N'environment', N'Hoạt động công ty', N'15/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/15-05_2_c30540e9.jpg', N'/uploads/images/15-05_2_c30540e9.jpg', N'Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường', N'Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường', N'environment', N'Hoạt động công ty', N'15/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-05_edf2f4f8.jpg', N'/uploads/images/13-05_edf2f4f8.jpg', N'Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2', N'Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2', N'company', N'Hoạt động công ty', N'13/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-05_1_aa573a31.jpg', N'/uploads/images/13-05_1_aa573a31.jpg', N'Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2', N'Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2', N'company', N'Hoạt động công ty', N'13/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-05_3_4a7e550e.jpg', N'/uploads/images/13-05_3_4a7e550e.jpg', N'Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2', N'Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2', N'company', N'Hoạt động công ty', N'13/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/12-05_f285e6ec.png', N'/uploads/images/12-05_f285e6ec.png', N'Chủ tịch UBND tỉnh Phan Ngọc Thọ động viên cán bộ, công nhân HEPCO lên đường đi phun khử khuẩn, chống Covid-19', N'Chủ tịch UBND tỉnh Phan Ngọc Thọ động viên cán bộ, công nhân HEPCO lên đường đi phun khử khuẩn, chống Covid-19', N'company', N'Hoạt động công ty', N'12/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/Thu_gom_rac_2b546803.jpg', N'/uploads/images/Thu_gom_rac_2b546803.jpg', N'Lịch trình vệ sinh, thu gom rác tại các phường thuộc địa bàn thành phố Huế', N'Lịch trình vệ sinh, thu gom rác tại các phường thuộc địa bàn thành phố Huế', N'environment', N'Hoạt động công ty', N'11/05/2021 10:25');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/05-05_bd773c7b.jpg', N'/uploads/images/05-05_bd773c7b.jpg', N'8 Cách bảo vệ môi trường sống vì sức khỏe cộng đồng', N'8 Cách bảo vệ môi trường sống vì sức khỏe cộng đồng', N'environment', N'Hoạt động công ty', N'05/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-05_c1e08bdb.png', N'/uploads/images/02-05_c1e08bdb.png', N'Thế giới nỗ lực bảo vệ môi trường', N'Thế giới nỗ lực bảo vệ môi trường', N'environment', N'Hoạt động công ty', N'02/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f91d_5551bf03.png', N'/uploads/images/1f91d_5551bf03.png', N'Thế giới nỗ lực bảo vệ môi trường', N'Thế giới nỗ lực bảo vệ môi trường', N'environment', N'Hoạt động công ty', N'02/05/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/28-04_d1533931.jpg', N'/uploads/images/28-04_d1533931.jpg', N'Đốt vàng mã đúng quy định', N'Đốt vàng mã đúng quy định', N'company', N'Hoạt động công ty', N'28/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/2705_dadb541d.png', N'/uploads/images/2705_dadb541d.png', N'Đốt vàng mã đúng quy định', N'Đốt vàng mã đúng quy định', N'company', N'Hoạt động công ty', N'28/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/203c_2305dd69.png', N'/uploads/images/203c_2305dd69.png', N'Đốt vàng mã đúng quy định', N'Đốt vàng mã đúng quy định', N'company', N'Hoạt động công ty', N'28/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/2757_b7bb5c39.png', N'/uploads/images/2757_b7bb5c39.png', N'Đốt vàng mã đúng quy định', N'Đốt vàng mã đúng quy định', N'company', N'Hoạt động công ty', N'28/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-04_4_63140469.jpg', N'/uploads/images/26-04_4_63140469.jpg', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'environment', N'Hoạt động công ty', N'26/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-04_9053ad4b.jpg', N'/uploads/images/26-04_9053ad4b.jpg', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'environment', N'Hoạt động công ty', N'26/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-04_1_0bb7c974.jpg', N'/uploads/images/26-04_1_0bb7c974.jpg', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'environment', N'Hoạt động công ty', N'26/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-04_2_2222de4a.jpg', N'/uploads/images/26-04_2_2222de4a.jpg', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'environment', N'Hoạt động công ty', N'26/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/26-04_3_1d8aa0c9.jpg', N'/uploads/images/26-04_3_1d8aa0c9.jpg', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'environment', N'Hoạt động công ty', N'26/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/16-04_8455efe6.jpg', N'/uploads/images/16-04_8455efe6.jpg', N'Hiệu quả thiết thực từ mô hình "Thùng rác phân loại rác thải" của các em học sinh', N'Hiệu quả thiết thực từ mô hình "Thùng rác phân loại rác thải" của các em học sinh', N'environment', N'Hoạt động công ty', N'16/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/05-04_8983d2aa.jpg', N'/uploads/images/05-04_8983d2aa.jpg', N'Thanh toán "Tiền dịch vụ vệ sinh môi trường" qua ví điện tử VNPT Pay và MOMO Pay', N'Thanh toán "Tiền dịch vụ vệ sinh môi trường" qua ví điện tử VNPT Pay và MOMO Pay', N'environment', N'Hoạt động công ty', N'15/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f343_aac18327.png', N'/uploads/images/1f343_aac18327.png', N'Thanh toán "Tiền dịch vụ vệ sinh môi trường" qua ví điện tử VNPT Pay và MOMO Pay', N'Thanh toán "Tiền dịch vụ vệ sinh môi trường" qua ví điện tử VNPT Pay và MOMO Pay', N'environment', N'Hoạt động công ty', N'15/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/14-04_f35b5808.jpg', N'/uploads/images/14-04_f35b5808.jpg', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'company', N'Hoạt động công ty', N'14/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f4cc_a22adde5.png', N'/uploads/images/1f4cc_a22adde5.png', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'company', N'Hoạt động công ty', N'14/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f340_8e83c694.png', N'/uploads/images/1f340_8e83c694.png', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'company', N'Hoạt động công ty', N'14/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/14-04_1_8a7a15af.jpg', N'/uploads/images/14-04_1_8a7a15af.jpg', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'company', N'Hoạt động công ty', N'14/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/14-04_2_16346f89.jpg', N'/uploads/images/14-04_2_16346f89.jpg', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'company', N'Hoạt động công ty', N'14/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-04_1_ebbca493.jpg', N'/uploads/images/13-04_1_ebbca493.jpg', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'company', N'Hoạt động công ty', N'13/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-04_b9825b15.jpg', N'/uploads/images/13-04_b9825b15.jpg', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'company', N'Hoạt động công ty', N'13/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-04_2_793e5774.jpg', N'/uploads/images/13-04_2_793e5774.jpg', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'company', N'Hoạt động công ty', N'13/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-04_3_c18e2249.jpg', N'/uploads/images/13-04_3_c18e2249.jpg', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'company', N'Hoạt động công ty', N'13/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/13-04_4_4ebbad81.jpg', N'/uploads/images/13-04_4_4ebbad81.jpg', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'company', N'Hoạt động công ty', N'13/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/10-04_4b0c4aac.jpg', N'/uploads/images/10-04_4b0c4aac.jpg', N'Phân loại rác thủy tinh', N'Phân loại rác thủy tinh', N'environment', N'Hoạt động công ty', N'10/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-04_2c840142.jpg', N'/uploads/images/09-04_2c840142.jpg', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'environment', N'Hoạt động công ty', N'09/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-04_1_6d0fe28f.jpg', N'/uploads/images/09-04_1_6d0fe28f.jpg', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'environment', N'Hoạt động công ty', N'09/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-04_2_1a62f60a.jpg', N'/uploads/images/09-04_2_1a62f60a.jpg', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'environment', N'Hoạt động công ty', N'09/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-04_3_a311c046.jpg', N'/uploads/images/09-04_3_a311c046.jpg', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'environment', N'Hoạt động công ty', N'09/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-04_4_177bc6f7.jpg', N'/uploads/images/09-04_4_177bc6f7.jpg', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'environment', N'Hoạt động công ty', N'09/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-04_5_d0d20f1b.jpg', N'/uploads/images/09-04_5_d0d20f1b.jpg', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'environment', N'Hoạt động công ty', N'09/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/09-04_6_c36e8662.jpg', N'/uploads/images/09-04_6_c36e8662.jpg', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'environment', N'Hoạt động công ty', N'09/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/08-04_c19546de.jpg', N'/uploads/images/08-04_c19546de.jpg', N'"Hố rác di động tại gia đình" - Mô hình nhỏ, hiệu quả lớn', N'"Hố rác di động tại gia đình" - Mô hình nhỏ, hiệu quả lớn', N'company', N'Hoạt động công ty', N'08/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/2796_a0d47021.png', N'/uploads/images/2796_a0d47021.png', N'"Hố rác di động tại gia đình" - Mô hình nhỏ, hiệu quả lớn', N'"Hố rác di động tại gia đình" - Mô hình nhỏ, hiệu quả lớn', N'company', N'Hoạt động công ty', N'08/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/27a1_781d9839.png', N'/uploads/images/27a1_781d9839.png', N'"Hố rác di động tại gia đình" - Mô hình nhỏ, hiệu quả lớn', N'"Hố rác di động tại gia đình" - Mô hình nhỏ, hiệu quả lớn', N'company', N'Hoạt động công ty', N'08/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/07-04_c5b94dc1.jpg', N'/uploads/images/07-04_c5b94dc1.jpg', N'Phân loại chất thải rắn sinh hoạt tại nguồn đem lại những lợi ích gì?', N'Phân loại chất thải rắn sinh hoạt tại nguồn đem lại những lợi ích gì?', N'company', N'Hoạt động công ty', N'07/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f4a5_c2efe1e5.png', N'/uploads/images/1f4a5_c2efe1e5.png', N'Phân loại chất thải rắn sinh hoạt tại nguồn đem lại những lợi ích gì?', N'Phân loại chất thải rắn sinh hoạt tại nguồn đem lại những lợi ích gì?', N'company', N'Hoạt động công ty', N'07/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/25b6_4a9bc092.png', N'/uploads/images/25b6_4a9bc092.png', N'Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay', N'Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay', N'environment', N'Hoạt động công ty', N'05/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/2734_751b7b41.png', N'/uploads/images/2734_751b7b41.png', N'Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay', N'Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay', N'environment', N'Hoạt động công ty', N'05/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f4b3_1a98db45.png', N'/uploads/images/1f4b3_1a98db45.png', N'Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay', N'Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay', N'environment', N'Hoạt động công ty', N'05/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/03-04_5_b37d8ec0.jpg', N'/uploads/images/03-04_5_b37d8ec0.jpg', N'"Tiếng chổi tre" trong đêm', N'"Tiếng chổi tre" trong đêm', N'company', N'Hoạt động công ty', N'03/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/03-04_2_32608c9b.jpg', N'/uploads/images/03-04_2_32608c9b.jpg', N'"Tiếng chổi tre" trong đêm', N'"Tiếng chổi tre" trong đêm', N'company', N'Hoạt động công ty', N'03/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/03-04_625df6b9.jpg', N'/uploads/images/03-04_625df6b9.jpg', N'"Tiếng chổi tre" trong đêm', N'"Tiếng chổi tre" trong đêm', N'company', N'Hoạt động công ty', N'03/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/03-04_3_f7f8bdd8.jpg', N'/uploads/images/03-04_3_f7f8bdd8.jpg', N'"Tiếng chổi tre" trong đêm', N'"Tiếng chổi tre" trong đêm', N'company', N'Hoạt động công ty', N'03/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/03-04_4_d4cf5b39.jpg', N'/uploads/images/03-04_4_d4cf5b39.jpg', N'"Tiếng chổi tre" trong đêm', N'"Tiếng chổi tre" trong đêm', N'company', N'Hoạt động công ty', N'03/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/02-04_dff1f4dd.png', N'/uploads/images/02-04_dff1f4dd.png', N'Rác thải hàng ngày mất bao lâu mới phân hủy?', N'Rác thải hàng ngày mất bao lâu mới phân hủy?', N'company', N'Hoạt động công ty', N'02/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/270d_336a60aa.png', N'/uploads/images/270d_336a60aa.png', N'Rác thải hàng ngày mất bao lâu mới phân hủy?', N'Rác thải hàng ngày mất bao lâu mới phân hủy?', N'company', N'Hoạt động công ty', N'02/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_3_b1fb0637.png', N'/uploads/images/01-04_3_b1fb0637.png', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'company', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/2753_8a5e252e.png', N'/uploads/images/2753_8a5e252e.png', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'company', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_4_93ca6d1b.png', N'/uploads/images/01-04_4_93ca6d1b.png', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'company', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_5_3f5b1217.png', N'/uploads/images/01-04_5_3f5b1217.png', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'company', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_6_93cd6ca6.png', N'/uploads/images/01-04_6_93cd6ca6.png', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'company', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_7_240ee61e.png', N'/uploads/images/01-04_7_240ee61e.png', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'company', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_8_ecfbc702.png', N'/uploads/images/01-04_8_ecfbc702.png', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'company', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_2_a2446d78.png', N'/uploads/images/01-04_2_a2446d78.png', N'Quy trình phân loại rác ở Nhật Bản', N'Quy trình phân loại rác ở Nhật Bản', N'environment', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/01-04_5e00b72a.png', N'/uploads/images/01-04_5e00b72a.png', N'Quy trình phân loại rác ở Nhật Bản', N'Quy trình phân loại rác ở Nhật Bản', N'environment', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/1f4aa_2a2635a1.png', N'/uploads/images/1f4aa_2a2635a1.png', N'Quy trình phân loại rác ở Nhật Bản', N'Quy trình phân loại rác ở Nhật Bản', N'environment', N'Hoạt động công ty', N'01/04/2021');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/hepcohue-1_ef6fcd84.jpg', N'/uploads/images/hepcohue-1_ef6fcd84.jpg', N'HEPCO Khánh thành trung tâm giám sát thông minh', N'HEPCO Khánh thành trung tâm giám sát thông minh', N'equipment', N'Hoạt động công ty', N'23/10/2020 07:50');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/uploads/images/m_20190816_khanhthanh3_4c46ed23.jpg', N'/uploads/images/m_20190816_khanhthanh3_4c46ed23.jpg', N'HEPCO Khánh thành trung tâm giám sát thông minh', N'HEPCO Khánh thành trung tâm giám sát thông minh', N'equipment', N'Hoạt động công ty', N'23/10/2020 07:50');

INSERT INTO gallery (url, original_url, title, caption, category, category_label, date)
VALUES (N'/images/cover.png', N'/images/cover.png', N'Thu gom, vận chuyển và xử lý rác', N'Thu gom, vận chuyển và xử lý rác', N'company', N'Hoạt động công ty', N'01/01/2021');

PRINT 'Đã nạp xong thư viện hình ảnh.';
GO

-- 3. Nạp dữ liệu bài viết (News, Announcements, Shareholders, Services, About)
PRINT 'Đang nạp danh sách tin tức, thông báo, tài liệu cổ đông, dịch vụ...';

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Lịch trình thu gom rác trên địa bàn Nam sông Hương', N'14/06/2026 14:00', N'<p><a href="/Public/Upload/files/Tintuc/NSH/LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf" target="_blank">Lịch trình thu gom rác trên địa bàn NSH</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf" target="_blank">Lịch thu gom rác trên địa bàn NSH</a></p>', N'/uploads/images/RacThai.jpg', N'news', N'{"category":"environment","publishYear":2026,"attachments":[{"title":"Lịch trình thu gom rác trên địa bàn NSH","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf","fileName":"LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf"},{"title":"Lịch thu gom rác trên địa bàn NSH","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf","fileName":"LICH%20TRINH%20THU%20GOM%20RAC%20THU%20CONG%202025%20-NSH.pdf"}],"images":[],"summary":"Lịch trình thu gom rác trên địa bàn Nam sông Hương","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Giấy phép môi trường số 48/GPMT-BTNMT ngày 22 tháng 08 năm 2023', N'30/03/2026 9:27', N'<p><a href="/Public/Upload/files/GiayPhep/7.%2048-GP-UBND_Signed%20(TTH).pdf" target="_blank">Giấy phép môi trường số 48/GPMT-BTNMT ngày 22 tháng 08 năm 2023</a></p>', N'/uploads/images/GPMT.png', N'news', N'{"category":"environment","publishYear":2026,"attachments":[{"title":"Giấy phép môi trường số 48/GPMT-BTNMT ngày 22 tháng 08 năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/7.%2048-GP-UBND_Signed%20(TTH).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/7.%2048-GP-UBND_Signed%20(TTH).pdf","fileName":"7.%2048-GP-UBND_Signed%20(TTH).pdf"}],"images":[],"summary":"Giấy phép môi trường số 48/GPMT-BTNMT ngày 22 tháng 08 năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Giấy phép môi trường số 317/GPMT-BTNMT ngày 25 tháng 11 năm 2022', N'30/03/2026 9:25', N'<p><a href="/Public/Upload/files/GiayPhep/7.%20317-gp-btnmt_Signed.pdf" target="_blank">Giấy phép môi trường số 317/GPMT-BTNMT ngày 25 tháng 11 năm 2022</a></p>', N'/uploads/images/GPMT.png', N'news', N'{"category":"environment","publishYear":2026,"attachments":[{"title":"Giấy phép môi trường số 317/GPMT-BTNMT ngày 25 tháng 11 năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/7.%20317-gp-btnmt_Signed.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/7.%20317-gp-btnmt_Signed.pdf","fileName":"7.%20317-gp-btnmt_Signed.pdf"}],"images":[],"summary":"Giấy phép môi trường số 317/GPMT-BTNMT ngày 25 tháng 11 năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Kết quả phân tích nước thải, khí thải Quý IV 2025 và Thông báo của sở NN và MT', N'30/03/2026 9:22', N'<p><a href="/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20n%C6%B0%E1%BB%9Bc%20th%E1%BA%A3i%20Q4.pdf" target="_blank">Kết quả phân tích nước thải quý IV - 2025</a></p>

<p><a href="/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20th%E1%BA%A3i%20Q4.pdf" target="_blank">Kết quả phân tích khí thải quý IV - 2025</a></p>

<p><a href="/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20%20th%E1%BA%A3i%20S%E1%BB%9F%20NNMT%20T02.2026.pdf" target="_blank">Thông báo của sở NN và MT TP Huế về Kết quả phân tích mẫu khí thải tại Lò đốt chất thải nguy hại</a></p>', N'/uploads/images/images.png', N'announcement', N'{"category":"announcement","publishYear":2026,"attachments":[{"title":"Kết quả phân tích nước thải quý IV - 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20n%C6%B0%E1%BB%9Bc%20th%E1%BA%A3i%20Q4.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20n%C6%B0%E1%BB%9Bc%20th%E1%BA%A3i%20Q4.pdf","fileName":"K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20n%C6%B0%E1%BB%9Bc%20th%E1%BA%A3i%20Q4.pdf"},{"title":"Kết quả phân tích khí thải quý IV - 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20th%E1%BA%A3i%20Q4.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20th%E1%BA%A3i%20Q4.pdf","fileName":"K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20th%E1%BA%A3i%20Q4.pdf"},{"title":"Thông báo của sở NN và MT TP Huế về Kết quả phân tích mẫu khí thải tại Lò đốt chất thải nguy hại","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20%20th%E1%BA%A3i%20S%E1%BB%9F%20NNMT%20T02.2026.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20%20th%E1%BA%A3i%20S%E1%BB%9F%20NNMT%20T02.2026.pdf","fileName":"K%E1%BA%BFt%20qu%E1%BA%A3%20ph%C3%A2n%20t%C3%ADch%20kh%C3%AD%20%20th%E1%BA%A3i%20S%E1%BB%9F%20NNMT%20T02.2026.pdf"}],"images":[],"summary":"Kết quả phân tích nước thải, khí thải Quý IV 2025 và Thông báo của sở NN và MT","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Quyết định: Ban hành kế hoạch phòng ngừa và ứng phó sự cố môi trường', N'30/03/2026 09:18', N'<p><a href="/Public/Upload/files/GiayPhep/KH%20PNUP%20s%E1%BB%B1%20c%E1%BB%91%20134qd_2024_0001.pdf" target="_blank">Quyết định: Ban hành kế hoạch phòng ngừa và ứng phó sự cố môi trường</a></p>', N'/uploads/images/QuyetDinh.jpg', N'news', N'{"category":"environment","publishYear":2026,"attachments":[{"title":"Quyết định: Ban hành kế hoạch phòng ngừa và ứng phó sự cố môi trường","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/KH%20PNUP%20s%E1%BB%B1%20c%E1%BB%91%20134qd_2024_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/GiayPhep/KH%20PNUP%20s%E1%BB%B1%20c%E1%BB%91%20134qd_2024_0001.pdf","fileName":"KH%20PNUP%20s%E1%BB%B1%20c%E1%BB%91%20134qd_2024_0001.pdf"}],"images":[],"summary":"Quyết định: Ban hành kế hoạch phòng ngừa và ứng phó sự cố môi trường","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030', N'24/09/2025 10:51', N'<p style="text-align:justify">Trong không khí thi đua sôi nổi của tuổi trẻ toàn thành phố chào mừng Đại hội Đoàn các cấp, ngày 11/9/2025, được sự thống nhất của Đảng Ủy Công ty và BTV Đoàn phường Thuận Hóa, Đoàn Thanh niên Công ty Cổ phần Môi trường và Công trình Đô thị Huế đã long trọng tổ chức Đại hội Đoàn Thanh niên Công ty nhiệm kỳ 2025 – 2030.</p>

<p style="text-align:justify">Đại hội vinh dự được đón tiếp và nhận sự chỉ đạo trực tiếp của đồng chí Trần Quốc Khánh – Phó Bí thư Đảng bộ, Tổng Giám đốc Công ty, cùng sự tham dự của đồng chí Nguyễn Hồng Vinh – Bí thư Đoàn phường Thuận Hóa và các đại diện các đồng chí trong Đảng Ủy, lãnh đạo các phòng, ban, đơn vị trực thuộc, và bí thư đoàn qua các nhiệm kỳ.</p>

<p style="text-align:justify">Trong nhiệm kỳ 2022 – 2027 giai đoạn 2022-2025 vừa qua, dưới sự quan tâm chỉ đạo sâu sát của Đảng Ủy công ty, dưới sự hướng dẫn của đoàn các cấp, công tác Đoàn và phong trào thanh niên Công ty đã đạt được nhiều kết quả nổi bật: các phong trào hành động gắn với nhiệm vụ chính trị và sản xuất – kinh doanh được triển khai đồng bộ, hiệu quả; tuổi trẻ Công ty luôn phát huy tinh thần xung kích, sáng tạo, tích cực tham gia các phong trào “Ngày Chủ nhật Xanh”, “Đổi rác lấy quà”, tuyên truyền phân loại rác tại nguồn, đồng hành cùng người lao động trong phong trào thi đua lao động sản xuất, giữ gìn và phát huy hình ảnh Huế “Xanh – Sạch – Sáng”. Về kết quả thi đua, trong nhiệm kỳ vừa qua, Đoàn Thanh niên Công ty đã 02 năm nhận bằng khen TW Đoàn cho tập thể có thành tích xuất sắc trong công tác Đoàn và phong trào thanh thiếu nhi, 01 năm nhận bằng khen Tỉnh đoàn, 02 năm liên tục dẫn đơn vị dẫn đầu thi đua khối cơ quan doanh nghiệp thuộc Thành đoàn, Công tác giáo dục chính trị, tư tưởng, đạo đức, lối sống cho đoàn viên được tăng cường, phương thức sinh hoạt Đoàn có nhiều đổi mới, gắn với ứng dụng công nghệ số.</p>

<p style="text-align:justify">Bước vào nhiệm kỳ 2025 – 2030, Đại hội đã đề ra phương hướng: tiếp tục phát huy tinh thần xung kích – tiên phong – sáng tạo của tuổi trẻ, khẳng định vai trò của đoàn viên thanh niên trong công tác bảo vệ môi trường, chỉnh trang đô thị, xây dựng nếp sống văn minh đô thị; đẩy mạnh ứng dụng công nghệ số và AI trong công tác Đoàn; đồng thời chú trọng đào tạo, bồi dưỡng đoàn viên vừa giỏi chuyên môn vừa vững vàng bản lĩnh chính trị, góp phần thực hiện thắng lợi Nghị quyết đại hội Đảng Bộ Công ty lần thứ VI, hoàn thành nhiệm vụ sản xuất kinh doanh và chiến lược phát triển bền vững của Công ty.</p>

<p style="text-align:justify">Đại hội đã tiến hành bầu cử Ban Chấp hành Đoàn Thanh niên Công ty nhiệm kỳ 2025 – 2030 gồm 7 đồng chí tiêu biểu về phẩm chất, năng lực, nhiệt huyết, đáp ứng yêu cầu nhiệm vụ trong giai đoạn mới. Đồng thời, Đại hội cũng đã bầu ra Đoàn đại biểu dự Đại hội Đoàn phường Thuận Hóa lần thứ I.</p>

<p style="text-align:justify">Với khẩu hiệu hành động “Tuổi trẻ HEPCO – Tiên phong, đoàn kết, sáng tạo, xung kích vì Huế xanh – sạch – sáng”, Đại hội Đoàn Thanh niên Công ty Cổ phần Môi trường và Công trình Đô thị Huế nhiệm kỳ 2025 – 2030 đã thành công tốt đẹp, mở ra một giai đoạn mới đầy tin tưởng và kỳ vọng.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/553329492_1143279904677764_7285603826408923520_n.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/550779041_1143282601344161_4812772918363100506_n.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/550762501_1143282408010847_1745543314763991634_n.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/550890908_1143279728011115_7045182749757454781_n%20(1).jpg" style="height:534px; width:800px" /></p>', N'/uploads/images/550890908_1143279728011115_7045182749757454781_n.jpg', N'news', N'{"category":"environment","publishYear":2025,"attachments":[],"images":[],"summary":"ĐẠI HỘI ĐOÀN THANH NIÊN CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2025 – 2030","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'25/06/2025 15:00', N'<p>Đảng bộ Công ty Cổ phần Môi trường và Công trình đô thị Huế đã tổ chức thành công Đại hội lần thứ VI, nhiệm kỳ 2025–2030, trong hai ngày 23-24/06/2025. Đại hội diễn ra trong không khí trang nghiêm dân chủ, đoàn kết và trách nhiệm. Đây là sự kiện chính trị trọng đại của toàn Đảng bộ, là dấu mốc quan trọng trong quá trình xây dựng và phát triển của Công ty; thể hiện quyết tâm đổi mới phương thức lãnh đạo, nâng cao năng lực quản trị, hướng đến mục tiêu xây dựng đô thị Huế ngày càng xanh – sạch – sáng – đẹp – văn minh – hiện đại.</p>

<p>Đại hội vinh dự chào đón đồng chí Nguyễn Đình Bách - Phó Bí thư Quận uỷ - Quyền Chủ tịch UBND quận Thuận Hóa cùng các đồng chí diện Ủy ban Kiểm tra và Văn phòng Quận ủy Thuận Hóa. Về phía Công ty có đồng chí Phan Lê Hiến – Quận ủy viên, Bí thư Đảng ủy - Chủ tịch Hội đồng Quản trị cùng toàn thể Ban Chấp hành và 89 đảng viên. tham dự đại hội.</p>

<p>Nhiệm kỳ 2020–2025, trong bối cảnh đối diện nhiều khó khăn, thử thách như đại dịch COVID-19, thiên tai, biến động chính sách, nhưng dưới sự chỉ đạo sâu sát của Quận ủy, sự đồng hành của các ban ngành, cùng với sự đoàn kết, nỗ lực và tinh thần trách nhiệm cao của toàn thể cán bộ, đảng viên và người lao động, Đảng bộ Công ty đã hoàn thành tốt các mục tiêu mà Nghị quyết Đại hội lần thứ V đã đề ra. Đảng ủy Công ty đã phát huy vai trò lãnh đạo hệ thống chính quyền và các đoàn thể hoàn thành cơ bản các chỉ tiêu; duy trì ổn định hoạt đông sản xuất kinh doanh. Đảng bộ nhiều năm liền được công nhận “Hoàn thành xuất sắc nhiệm vụ” .</p>

<p>Đại hội đã bầu Ban Chấp hành Đảng bộ nhiệm kỳ 2025 - 2030 gồm 11 đồng chí. Tại phiên họp đầu tiên của Ban Chấp hành đã bầu Ban Thường vụ gồm 3 đồng chí. Đồng chí Phan Lê Hiến tiếp tục được tín nhiệm giữ chức vụ Bí thư Đảng ủy; đồng chí Trần Quốc Khánh được tín nhiệm bầu làm Phó Bí thư Đảng ủy. Đại hội đã tiến hành bầu Ủy ban kiểm tra (UBKT) Đảng ủy gồm 3 đồng chí, bầu chức danh Chủ nhiệm UBKT.</p>

<p>Đại hội đã thống nhất thông qua Nghị quyết Đại hội Đảng bộ Công ty lần thứ VI, nhiệm kỳ 2025–2030, thể hiện quyết tâm chính trị cao của toàn Đảng bộ trong việc nâng cao năng lực lãnh đạo, xây dựng tổ chức Đảng trong sạch, vững mạnh và đưa Công ty phát triển lên tầm cao mới. Với phương châm “Đổi mới – Phát triển”, Đảng bộ xác định tiếp tục phát huy vai trò lãnh đạo toàn diện, định hướng Công ty phát triển bền vững, đa dạng hóa dịch vụ, mở rộng thị trường, nâng cao năng lực cạnh tranh. Đồng thời, chú trọng đẩy mạnh chuyển đổi số, ứng dụng trí tuệ nhân tạo, nâng cao chất lượng nguồn nhân lực, tối ưu chi phí và cải thiện thu nhập người lao động, phấn đấu hoàn thành các chỉ tiêu tăng trưởng ổn định và hiệu quả.</p>

<p>Thành công của Đại hội lần thứ VI là bước khởi đầu thuận lợi, tạo động lực mới để toàn Đảng bộ tiếp tục nỗ lực xây dựng Công ty trở thành đơn vị tiên phong trong lĩnh vực môi trường đô thị, đóng góp tích cực cho công tác bảo vệ môi trường, chỉnh trang đô thị và nâng cao chất lượng cuộc sống nhân dân thành phố Huế.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/510969764_1069567272049028_3715436291418750596_n.jpg" style="height:531px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/511105287_1069567495382339_7710228098528574656_n.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/511139690_1069567488715673_2197607098186667507_n.jpg" style="height:600px; width:400px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/511156984_1069567285382360_8120984872115208490_n.jpg" style="height:450px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/513757499_1069568008715621_7947783751689158757_n.jpg" style="height:534px; width:800px" /></p>', N'/uploads/images/513757499_1069568008715621_7947783751689158757_n.jpg', N'news', N'{"category":"environment","publishYear":2025,"attachments":[],"images":[],"summary":"ĐẠI HỘI ĐẢNG BỘ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thư mời chào giá gói mua sắm: Pin lithium-ion và các vật tư cho xe điện 3 bánh', N'19/02/2025 14:34', N'<p>Công ty Cổ phần Môi trường và Công trình Đô thị Huế có nhu cầu mua vật tư phụ tùng thay thế cho xe điện 3 bánh thu gom rác năm 2025.</p>

<p>Nội dung chính gói mua sắm: Pin lithium-ion và các vật tư phục vụ công tác thường xuyên cho xe điện 3 bánh.</p>

<p><a href="/Public/Upload/files/Tintuc/Th%C6%B0%20m%E1%BB%9Di%20ch%C3%A0o%20gi%C3%A1%20-%20V%E1%BA%ADt%20t%C6%B0%20xe%20%C4%91i%E1%BB%87n%203%20l%E1%BB%91p.pdf" target="_blank">Thư mời chào giá gói mua sắm: Pin lithium-ion và các vật tư cho xe điện 3 bánh</a></p>', N'/uploads/images/images.png', N'announcement', N'{"category":"announcement","publishYear":2025,"attachments":[{"title":"Thư mời chào giá gói mua sắm: Pin lithium-ion và các vật tư cho xe điện 3 bánh","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/Th%C6%B0%20m%E1%BB%9Di%20ch%C3%A0o%20gi%C3%A1%20-%20V%E1%BA%ADt%20t%C6%B0%20xe%20%C4%91i%E1%BB%87n%203%20l%E1%BB%91p.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/Th%C6%B0%20m%E1%BB%9Di%20ch%C3%A0o%20gi%C3%A1%20-%20V%E1%BA%ADt%20t%C6%B0%20xe%20%C4%91i%E1%BB%87n%203%20l%E1%BB%91p.pdf","fileName":"Th%C6%B0%20m%E1%BB%9Di%20ch%C3%A0o%20gi%C3%A1%20-%20V%E1%BA%ADt%20t%C6%B0%20xe%20%C4%91i%E1%BB%87n%203%20l%E1%BB%91p.pdf"}],"images":[],"summary":"Thư mời chào giá gói mua sắm: Pin lithium-ion và các vật tư cho xe điện 3 bánh","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Lịch trình thu gom rác thải sinh hoạt khu vực thị xã Quảng Điền', N'27/12/2024 14:30', N'<p><a href="/Public/Upload/files/Tintuc/QuangDien.LichThuGom2025.pdf" target="_blank">Lịch trình thu gom rác thải sinh hoạt khu vực thị xã Quảng Điền</a></p>', N'/uploads/images/images.png', N'news', N'{"category":"environment","publishYear":2024,"attachments":[{"title":"Lịch trình thu gom rác thải sinh hoạt khu vực thị xã Quảng Điền","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/QuangDien.LichThuGom2025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/QuangDien.LichThuGom2025.pdf","fileName":"QuangDien.LichThuGom2025.pdf"}],"images":[],"summary":"Lịch trình thu gom rác thải sinh hoạt khu vực thị xã Quảng Điền","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'THÔNG TIN VÀ THÔNG BÁO VỀ VIỆC ĐĂNG KÝ ĐẤU NỐI CẤP NƯỚC TẠI KHU DÂN CƯ XUNG QUANH NGHĨA TRANG PHÍA NAM (MỚI), THÔN 1B, XÃ THỦY PHÙ, THỊ XÃ HƯƠNG THỦY', N'23/08/2024 15:43', N'<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">Công ty Cổ phần Môi trường và Công trình Đô thị Huế (Hepco) </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">là đơn vị được giao chủ đầu tư dự án Nghĩa trang nhân dân phía Nam (mới)</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">, trong đó bao gồm hạng mục hệ thống cấp nước sạch cho các hộ dân tái định cư và cư dân sống lân cận khu vực Nghĩa trang. Quy mô hạng mục</span></span> <span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">cấp nước bao gồm:</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> tuyến ống HDPE D160x11,8mm dài 3.911,15m; tuyến ống HDPE D110x8,1mm dài 1.792,76m; tuyến ống HDPE D50x3,7mm dài 1.134,9m</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">UBND tỉnh Thừa Thiên Huế đã giao cho UBND thị xã Hương Thủy tiếp nhận và quản lý </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">hạng mục công trình cấp nước sạch</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> sau khi hoàn thành.  Đến nay hệ thống này đã hoàn thành và đã được đấu nối vào mạng lưới cấp nước của Công ty Cổ phần Cấp nước Thừa Thiên Huế, sẵn sàng cung cấp nước sạch. Tuy nhiên, do UBND thị xã Hương Thủy không có </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">đơn vị quản lý sự nghiệp công lập có chức năng cấp nước sạch</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> nên kiến nghị UBND Tỉnh chuyển giao hệ thống cho Công ty Cổ phần Cấp nước Thừa Thiên Huế (Huewaco) quản lý.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">Hiện tại, the</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">o</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> Nghị định 43/2022/NĐ-CP </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">ngày 24/6/2022 của Chính phủ về việc quy định quản lý, sử dụng và khai thác tài sản kết cấu hạ tầng cấp nước sạch do Nhà nước đầu tư</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> quản lý, </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">việc bàn giao hệ thống cấp nước của các dự án </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">gặp nhiều vướng</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> mắc, </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">khó khăn.</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> Để sớm có phương án cấp nước sạch cho các hộ dân, Hepco đã tiến hành làm việc với UBND thị xã Hương Thủy, Huewaco</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">. Trong thời gian chờ UBND Tỉnh chỉ đạo đơn vị tiếp nhận chính thức, Hepco sẽ tạm thời quản lý hệ thống này và ký hợp đồng tạm thời với Huewaco để đảm bảo việc cung cấp nước sạch cho các hộ dân có nhu cầu trong phạm vị hệ thống.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">Công ty Cổ phần Môi trường và Công trình Đô thị Huế</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif"> kính thông báo tới các hộ dân sống xung quanh Nghĩa trang Nhân dân Phía Nam (mới) tại thôn 1B, xã Thủy Phù, thị xã Hương Thủy, có  nhu cầu đấu nối nước sạch, vui lòng liên hệ qua số điện thoại hotline: 02343 997799</span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">, </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">hoặc đến văn phòng Ban Quản lý Nghĩa trang tại thôn 1B, xã Thủy Phù để được hỗ trợ nhanh chóng và </span></span><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">giải quyết sớm nhất.</span></span></span></span></p>

<p style="text-align:justify"><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:14.0pt"><span style="font-family:"Times New Roman",serif">Trân trọng thông báo./</span></span></span></span></p>

<p style="text-align:center"> </p>', N'/uploads/images/images.png', N'announcement', N'{"category":"announcement","publishYear":2024,"attachments":[],"images":[],"summary":"THÔNG TIN VÀ THÔNG BÁO VỀ VIỆC ĐĂNG KÝ ĐẤU NỐI CẤP NƯỚC TẠI KHU DÂN CƯ XUNG QUANH NGHĨA TRANG PHÍA NAM (MỚI), THÔN 1B, XÃ THỦY PHÙ, THỊ XÃ HƯƠNG THỦY","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.', N'02/12/2023 15:30', N'<p>ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.</p>

<p>Ngày 1/12/2023, Công ty Cổ phần Môi trường và Công trình Đô thị Huế (HEPCO) đã tổ chức Đại hội đồng cổ đông bất thường, nội dung chính tập trung vào miễn nhiệm thành viên HĐQT, bầu thành viên HĐQT mới và bầu chức danh Chủ tịch HĐQT Công ty thay ông Nguyễn Hồng Sơn đã nghỉ hưu theo chế độ từ ngày 1/10/2023. Trước đó, ngày 12/10/2023, UBND tỉnh Thừa Thiên Huế đã có Quyết định số 2412/QĐ-UBND về việc điều động và cử ông Phan Lê Hiến, Phó Chánh Văn phòng UBND Tỉnh là người đại diện phần vốn nhà nước tại Công ty Cổ phần Môi trường và Công trình Đô thị Huế; giới thiệu để Đại hội đồng Cổ đông Công ty bầu vào HĐQT và bầu giữ chức vụ Chủ tịch HĐQT Công ty. Ông Phan Lê Hiến là người có phẩm chất, đạo đức, bản lĩnh chính trị tốt và trình độ chuyên môn vững vàng ; đã kinh qua nhiều vị trí công tác và có nhiều kinh nghiệm trong công tác quản lý điều hành. Đại hội đồng Cổ đông đã bầu ông Phan Lê Hiến bổ sung thành viên Hội đồng quản trị, Hội đồng quản trị đã bầu ông Phan Lê Hiến giữ chức danh Chủ tịch HĐQT công ty nhiệm kỳ 2020-2025 từ ngày 1/12/2023 cho đến khi ĐHCĐ nhiệm kỳ mới 2025-2030, đại diện cho 60%/51% vốn nhà nước.</p>

<p>Đến tham dự đại hội, có ông Hoàng Hải Minh, Tỉnh ủy viên, Phó Chủ tịch UBND tỉnh Thừa Thiên Huế; ông Võ Lê Nhật, Tỉnh ủy viên, Phó Bí thư Thành ủy Huế, Chủ tịch UBND thành phố Huế; ông Trần Hữu Thùy Giang, Chánh Văn phòng UBND tỉnh Thừa Thiên Huế; ông Nguyễn Quốc Cường, Phó Giám đốc Sở Tài chính tỉnh Thừa Thiên Huế; ông Nguyễn Văn Minh, Phó Giám đốc Sở Nội vụ tỉnh Thừa Thiên Huế cùng lãnh đạo các sở ban ngành và các cổ đông.</p>

<p>Phát biểu tại Đại hội, ông Hoàng Hải Minh, Tỉnh Ủy Viên- Phó Chủ tịch UBND tỉnh Thừa Thiên Huế đánh giá cao vai trò, ghi nhận thành tích mà cá nhân ông Nguyễn Hồng Sơn đã có nhiều đóng góp cho lĩnh vực môi trường của tỉnh Thừa Thiên Huế. Trong suốt thời gian là người đại diện phần vốn nhà nước từ khi Công ty đi vào hoạt động theo mô hình Công ty Cổ phần đến nay, ông đã luôn hoàn thành xuất sắc nhiệm vụ được giao; đã lãnh đạo Tập thể Cán bộ Công nhân viên - người lao động Công ty đoàn kết, thực hiện thắng lợi mọi nhiệm vụ, mọi kế hoạch đề ra.</p>

<p>Lãnh đạo tỉnh cũng đã bày tỏ rất tin tưởng ông Phan Lê Hiến ở cương vị mới với vai trò mới sẽ kế thừa truyền thống của Công ty qua các thời kỳ, xây dựng Công ty luôn là một tập thể đoàn kết- vững mạnh; hoàn thành xuất sắc mọi nhiệm vụ trong thời kỳ mới, nỗ lực xây dựng Thừa Thiên Huế luôn Xanh – Sạch – Sáng và đẹp hơn, cùng góp phần hoàn thành mục tiêu đưa Thừa Thiên Huế trở thành thành phố trực thuộc Trung ương trước năm 2025, hướng tới thành phố vườn, đô thị “di sản, văn hóa, sinh thái, cảnh quan và thân thiện với môi trường” theo Nghị quyết 54-NQ/TW của Bộ Chính trị.</p>

<p>Phát biểu nhận nhiệm vụ, ông Phan Lê Hiến - tân Chủ tịch HĐQT Công ty đã cám ơn Đại hội đồng Cổ đông, HĐQT, Ban TGĐ và toàn thể NLĐ công ty đã dành sự tin tưởng, tín nhiệm ông trong cương vị mới; đồng thời đã bày tỏ sự cảm ơn sâu sắc và tiếp thu lĩnh hội những ý kiến quan tâm chỉ đạo tâm huyết của lãnh đạo tỉnh dành cho cá nhân ông và công ty. Với nhiệm vụ mới được giao là người đại diện phần vốn nhà nước cũng là chủ tịch HĐQT Công ty, ông Phan Lê Hiến cam kết sẽ tiếp tục nỗ lực và phát huy những thành quả của Công ty đã đạt được, tiếp tục phấn đấu hết mình với tinh thần đổi mới sáng tạo hoàn thành tốt mọi chức trách nhiệm vụ được giao; làm việc với tinh thần trách nhiệm cao nhất, đoàn kết cùng với HĐQT, ban TGĐ và tập thể NLĐ xây dựng và phát triển doanh nghiệp thực hiện tốt chức năng sứ mệnh của đơn vị đáp ứng yêu cầu và kỳ vọng của UBND tỉnh và quý cổ đông. Từ đó góp phần tích cực vào sự phát triển của tỉnh nhà trong thời kỳ mới.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/1.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/10.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/11(2).jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/14.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/15.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/16.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/6.jpg" style="height:533px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/5.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/4.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/2.jpg" style="height:534px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/9.jpg" style="height:534px; width:800px" /></p>', N'/uploads/images/8.jpg', N'news', N'{"category":"environment","publishYear":2023,"attachments":[],"images":[],"summary":"ÔNG PHAN LÊ HIẾN GIỮ CHỨC CHỦ TỊCH HỘI ĐỒNG QUẢN TRỊ CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2020-2025.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT', N'14/08/2023 14:35', N'<p>Vỉa hẻ, thoát nước đô thị là bộ phận của hệ thống hạ tầng kỹ thuật đô thị do Nhà nước thống nhất quản lý và có phân cấp quản lý. Công ty Cổ phần Môi trường và Công trình đô thị Huế (HEPCO) đang được UBND thành phố Huế đặt hàng quản lý vận hành hệ thống thoát nước lề đường thuộc hệ thống hạ tầng kỹ thuật đô thị thành phố, là đơn vị trung gian tiếp nhận hồ sơ cấp phép tử UBND thành phố Huế.</p>

<p>Khi chuẩn bị tiến hành thi công công trình về đào lề, vỉa hè để lắp đặt (sửa chữa), đục mương, đục hố ga và gửi nước thải sinh hoạt, chủ đơn vị thi công phải tiến hành làm thủ tục cấp phép của cơ quan có thẩm quyền, có giải pháp để bảo đảm không ảnh hưởng đến trật tự an toàn giao thông, vệ sinh môi trường và mỹ quan đô thị. Đồng thời có cam kết bảo đảm thực hiện đúng thời hạn và bảo đảm chất lượng về việc hoàn trả lại đoạn đường đã đào.</p>

<p>Khách hàng có nhu cầu muốn đăng ký cấp phép về đào về đục mương hố ga, gửi nước thải sinh hoạt vui lòng liên hệ theo số hotline 0234 3823896 - 0234 3997799; hoặc trực tiếp đăng ký tại Bộ phận Giao dịch tại 46 Trần Phú, phường Vĩnh Ninh, thành phố Huế để được tư vấn và giải quyết một cách nhanh chóng nhất.HEPCO - Công ty Cổ phần Môi trường và Công trình đô thị Huế</p>

<p><img alt="📍" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t2d/1/16/1f4cd.png" style="height:16px; width:16px" /> 46 Trần Phú - Thành phố Huế</p>

<p><img alt="☎️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t22/1/16/260e.png" style="height:16px; width:16px" /> Hotline - 02343 997799</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Dichvu/DaoLe.jpg" style="height:600px; width:480px" /></p>', N'/uploads/images/DaoLe.jpg', N'news', N'{"category":"environment","publishYear":2023,"attachments":[],"images":[],"summary":"QUY TRÌNH CẤP PHÉP ĐÀO LỀ, ĐỤC MƯƠNG, ĐỤC HỐ GA, GỬI NƯỚC THẢI SINH HOẠT","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️', N'14/05/2023 14:27', N'<p>Sáng ngày 14 tháng 5 năm 2023 – tại Trung tâm Thông tin Môi trường (46 Trần Phú, TP Huế), Dự án Huế - Đô thị giảm nhựa ở miền Trung Việt Nam (được tài trợ bởi Tổ chức quốc tế về Bảo tồn thiên nhiên (WWF) tại Việt Nam thông qua WWF-Nauy) và Công ty Cổ phần Môi trường và Công trình Đô thị Huế (HEPCO) tổ chức sự kiện Ngày hội tái chế Huế 2023.</p>

<p>Hoạt động thu hút sự tham gia của gần 200 học sinh, phụ huynh và giáo viên của 07 trường học trên địa bàn thành phố Huế bao gồm các trường: Trường Tiểu học Phú Tân, Trường Tiểu học Phú Bình, Trường Tiểu học số 1 An Đông, Trường Tiểu học số 1 Thuận An, Trường Tiểu học số 2 Thuận An, Trường Tiểu học Vỹ Dạ. và Trường THCS Trần Cao Vân.</p>

<p>Sự kiện với nhiều hoạt động nâng cao kiến thức và kỹ năng thực hiện tái sử dụng, tái chế, của các em học sinh, đặc biệt chú trọng tái chế sản phẩm nhựa, thay thế việc sử dụng bao bì ni lông trong các hoạt động Nghề truyền thống tại Huế như: Trải nghiệm làm hoa giấy, trải nghiệm gói bánh truyền thống từ giấy, trải nghiệm làm giấy từ rơm.</p>

<p>Ngoài ra các em học sinh còn được tham quan Trung tâm Thông tin Môi trường, tham gia các trò chơi về phân loại rác, giảm thiểu rác thải nhựa và biểu diễn các tiết mục văn nghệ với chủ đề về môi trường.</p>

<p>Hoạt động được tổ chức nhằm tạo sân chơi cho các bạn học sinh tại Huế, nâng cao ý thức bảo vệ môi trường, giảm thiểu rác nhựa, góp phần xây dựng Huế trở thành đô thị giảm nhựa ở miền Trung Việt Nam.</p>

<p>Cùng đón chờ sự kiện ngày hội tái chế tiếp theo trong năm 2023 bạn nha <img alt="😍" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t2/1/16/1f60d.png" style="height:16px; width:16px" /></p>

<p>Nguồn: <a href="https://www.facebook.com/HuePlasticSmartCity?__cft__[0]=AZWIPTXHQOTpHfDWe0WukRXIku7DkwGg5qkAutJkbXFbbsYOZm7xpIF9ijCni5TMHJvN1nsLJZHdodv7Mvyl9A7KV83Xly4JF5baehC6wnvhAAF10NuhJTfqJ72n8FcvBUXxGf3di04W0zVoicLAHbQ-QGbBqHjxnGkiqd7F2mI-hSZTFENvRoJkw9lXgv6yh1c&__tn__=-]K-R" tabindex="0">Dự án Huế - Đô thị Giảm Nhựa ở miền Trung Việt Nam</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/347259211_1399570530865033_4467954850211736613_n.jpg" style="height:267px; width:400px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/346937471_810039673401151_3983513850142061894_n.jpg" style="height:267px; width:400px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/346977078_1266289100653250_8830184759971648733_n.jpg" style="height:267px; width:400px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/346977078_1266289100653250_8830184759971648733_n.jpg" style="height:267px; width:400px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/347118351_753519226519538_3321457128392345595_n.jpg" style="height:267px; width:400px" /></p>

<p style="text-align:center"> </p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/347379780_259788799881356_7984439537715342922_n.jpg" style="height:267px; width:400px" /></p>', N'/uploads/images/347259211_1399570530865033_4467954850211736613_n.jpg', N'news', N'{"category":"company_activity","publishYear":2023,"attachments":[],"images":[],"summary":"TƯNG BỪNG NGÀY HỘI TÁI CHẾ - HUẾ 2023 ♻️♻️","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'LAN TOẢ THÔNG ĐIỆP BẢO VỆ MÔI TRƯỜNG TRONG GIẢI CHẠY QUY MÔ HƠN 10.000 NGƯỜI THAM DỰ TẠI HUẾ', N'24/4/2023 14:15', N'<p>Hưởng ứng tinh thần thể dục thể thao nâng cao sức khoẻ và gắn kết sức mạnh, tăng tính đoàn kết trong tập thể, tại giải chạy VnExpress Marathon Imperial Huế hơn 40 cán bộ nhân viên Hepco đã tham gia nhiệt tình. Những thông điệp "Nhặt một cọng rác bạn đã làm cho Huế sạch hơn" "Hãy phân loại rác tại nguồn" " Chung tay giữ gìn Huế Xanh - Sạch - Sáng" được lan toả ở các cự ly 5km-10km dưới những cung đường chạy xanh sạch đẹp đẹp của Huế.</p>

<p>Giải chạy VnExpress Marathon Imperial Huế được tổ chức nhằm góp phần phát triển phong trào tập luyện thể dục thể thao và rèn luyện sức khỏe; đồng thời quảng bá các danh lam thắng cảnh đẹp của Huế, thúc đẩy phát triển du lịch của địa phương.</p>

<p>-------</p>

<p><a href="https://www.facebook.com/hashtag/hepco?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#hepco</a> <a href="https://www.facebook.com/hashtag/hepco2022?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#hepco2022</a> <a href="https://www.facebook.com/hashtag/hu%E1%BA%BF?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#huế</a> <a href="https://www.facebook.com/hashtag/m%C3%B4itr%C6%B0%E1%BB%9Dng?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#môitrường</a> <a href="https://www.facebook.com/hashtag/tuy%C3%AAntruy%E1%BB%81n?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#tuyêntruyền</a> <a href="https://www.facebook.com/hashtag/socialmedia?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#socialmedia</a> <a href="https://www.facebook.com/hashtag/r%C3%A1cth%E1%BA%A3inh%E1%BB%B1a?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#rácthảinhựa</a> <a href="https://www.facebook.com/hashtag/truy%E1%BB%81nth%C3%B4ng?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#truyềnthông</a> <a href="https://www.facebook.com/hashtag/c%C3%B4ngtym%C3%B4itr%C6%B0%E1%BB%9Dng?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#côngtymôitrường</a> <a href="https://www.facebook.com/hashtag/hepcohue?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#hepcohue</a> <a href="https://www.facebook.com/hashtag/v%E1%BB%87sinhm%C3%B4itr%C6%B0%E1%BB%9Dng?__eep__=6&__cft__[0]=AZVlqmKP94juwKFDB5N4shBT8qdWvf4Hsk-LawsOddwvcAP-TjkK8xPkdNJu9gCbM96MhAaABhcKMbjqA-Gys-01Pi_8dYNuCYgpNgxZ2g9BP4SC0_hHnncUwen0zh9IuDffxwBwEd6uMuelpnbpjmHWbqDIRfJLeEHAJyg3AePuLGY1zFrJMubl_IcWZuBMBPk&__tn__=*NK-R" tabindex="0">#vệsinhmôitrường</a></p>

<p>Công ty Cổ phần Môi trường và Công trình đô thị Huế</p>

<p>46 Trần Phú</p>

<p>02343 997799</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/HEPCO.jpg" style="height:600px; width:800px" /></p>', N'/uploads/images/HEPCO.jpg', N'news', N'{"category":"environment","publishYear":2023,"attachments":[],"images":[],"summary":"LAN TOẢ THÔNG ĐIỆP BẢO VỆ MÔI TRƯỜNG TRONG GIẢI CHẠY QUY MÔ HƠN 10.000 NGƯỜI THAM DỰ TẠI HUẾ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04', N'24/04/2023 14:00', N'<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Chỉ cần ngồi ở nhà là có thể thanh toán tiền dịch vụ vệ sinh môi trường từ xa một cách nhanh chóng, gọn lẹ, tiết kiệm thời gian và công sức với ứng dụng Hue-S.</p>

<p><img alt="🔥" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t50/1/16/1f525.png" style="height:16px; width:16px" /> Đặc biệt giảm ngay 20% tối đa 30k khi thanh toán đến hết ngày 30/04</p>

<p><img alt="❌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tdd/1/16/274c.png" style="height:16px; width:16px" /> Số lượng ưu đãi có hạn</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Nhanh tay thanh toán ngay ứng dụng Hue-S</p>

<p>------------------------------</p>

<p>Cài đặt ví điện tử tại: <a href="https://huecity.vn/?fbclid=IwAR3yudJF_q4i0XPkVei1OtFaruVhBzaPSI3HxQkOv9VjfSG1BZnkqs-u5ik" rel="nofollow noopener" tabindex="0" target="_blank">https://huecity.vn</a></p>

<p>Tổng đài hỗ trợ: 19001075</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/341593787_1420565075373855_1851262930945795000_n.jpg" style="height:526px; width:526px" /></p>', N'/uploads/images/341593787_1420565075373855_1851262930945795000_n.jpg', N'news', N'{"category":"environment","publishYear":2023,"attachments":[],"images":[],"summary":"  THANH TOÁN PHÍ VỆ SINH MÔI TRƯỜNG BAO TIỆN VỚI HUE-S GIẢM NGAY 20% TỐI ĐA 30K ĐẾN HẾT NGÀY 30/04","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ"', N'23/04/2022 13:53', N'<p>"MẸ ƠI Ở ĐÂY VUI VÀ ĐẸP QUÁ, LẦN SAU CHO CON ĐẾN TIẾP NHÉ MẸ" là lời bạn nhỏ hào hứng nói với mẹ sau khi được đến tham quan Trung Tâm Thông Tin Môi trường tại Hepco 46 Trần Phú.</p>

<p>Trung tâm thông tin môi trường được phối hợp xây dựng và vận hành bởi Công ty Cổ phần Môi trường và Công trình Đô thị Huế (HEPCO) và Tổ chức Quốc tế về Bảo tồn Thiên nhiên (WWF - VIỆT NAM) nhằm mục đích nâng cao nhận thức về bảo vệ môi trường, truyền thông về phân loại rác tại nguồn phục vụ chương trình phân loại rác tại nguồn do UBND thành phố Huế thực hiện vào khoảng cuối quý II/2022.</p>

<p>Dự kiến 20/5/2022 Trung tâm sẽ chính thức khánh thành đi vào hoạt động và mở cửa đón khách. Tuy nhiên ngày 23/4 vừa qua nằm trong khuôn khổ chương trình "Đổi rác lấy quà", con em cán bộ nhân viên và NLĐ Hepco đã được tham quan trải nghiệm tại trung tâm. Hợp tác hướng dẫn khách đến tham quan trung tâm là các bạn TNV sinh viên đến từ khoa Môi trường Đại học Khoa học Huế.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/24-04.jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/24-04(4).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/24-04(3).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/24-04(2).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/24-04(1).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:right"><em>*Nguồn: Facebook HEPCO</em></p>', N'/uploads/images/24-04.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"\"Mẹ ơi ở đây vui và đẹp quá, lần sau cho con đến tiếp nhé mẹ\"","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Ngày hội đổi rác lấy quà 23/4/2022', N'23/04/2022 10:33', N'<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Đổi rác tái chế lấy quà</p>

<p><img alt="🌺" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t99/1/16/1f33a.png" style="height:16px; width:16px" /> Tham gia trò chơi tái chế, phân loại rác</p>

<p><img alt="🌱" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t69/1/16/1f331.png" style="height:16px; width:16px" /> Tham quan khám phá trung tâm thông tin môi trường</p>

<p><a href="https://www.facebook.com/hashtag/th%C3%B4ng_%C4%91i%E1%BB%87p_lan_to%E1%BA%A3?__eep__=6&__cft__[0]=AZUPm2gcR0aEXUD9PWrm58ZLyipF6eN2wRoSX8Ve8T0HWwrcj9hPSj-10mAuUas3Z7AT3xcLA3K2bkaCqhxaPxWqPiSR8Te2DVGhkVxi3oA-V-z-Ntc-ZfZmheOengF_LRKsjNtb-aC_XYPZwJTREvhc0wwVset0nzEVpn71X4YPsQ&__tn__=*NK-R" tabindex="0">#Thông_điệp_lan_toả</a> : Hãy phân loại rác tại nguồn, rác là tài nguyên khi được phân loại và tái chế đúng cách.</p>

<p><img alt="📢" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t39/1/16/1f4e2.png" style="height:16px; width:16px" /> Chương trình hôm nay danh riêng cho cán bộ, nhân viên, người lao động Hepco với mong muốn chính họ sẽ là những người tiên phong, gương mẫu, tạo lập thói quen phân loại rác tại nguồn, tất cả cùng đồng lòng đồng sức sẵn sàng cho chương trình phân loại rác của UBND thành phố Huế.</p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Bạn đã sẵn sàng tham gia chương trình •Ngày Hội Đổi Rác Lấy Qua lần tiếp theo chưa ạ? Dự kiến tháng 5 sẽ tiếp tục chương trình dành cho cộng đồng. Cùng nhau tập thói quen phân loại từ bây giờ nhé <img alt="📣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tba/1/16/1f4e3.png" style="height:16px; width:16px" /><img alt="📣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tba/1/16/1f4e3.png" style="height:16px; width:16px" /></p>

<p><img alt="🪴" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tcb/1/16/1fab4.png" style="height:16px; width:16px" /> Chương trình được tổ chức bởi Hepco - Đoàn Thanh Niên Hepco và đồng hành tài trợ bởi PRO Việt Nam (Liên minh Tái chế bao bì Việt Nam) và Hiệp hội Môi trường Đô thị và Khu công nghiệp Việt Nam (VUREIA)</p>

<p style="text-align:center"><iframe align="middle" frameborder="0" height="250" scrolling="no" src="https://www.youtube.com/embed/XizmRri6GHg" title="YouTube video player" width="470"></iframe></p>

<p style="text-align:center"> </p>', N'/uploads/images/23-04.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Ngày hội đổi rác lấy quà 23/4/2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố', N'22/04/2022 08:29', N'<p><img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Công ty thu hồi các thùng rác công cộng và đặt bổ sung các thùng rác bộ hành để phục vụ cho hoạt động phố đêm. 𝐘𝐞̂𝐮 𝐜𝐚̂̀𝐮 𝐜𝐚́𝐜 𝐡𝐨̣̂ 𝐠𝐢𝐚 đ𝐢̀𝐧𝐡/𝐜𝐨̛ 𝐪𝐮𝐚𝐧 𝐤𝐡𝐨̂𝐧𝐠 đ𝐮̛𝐨̛̣𝐜 đ𝐮̛𝐚 𝐫𝐚́𝐜 𝐯𝐚̀𝐨 𝐜𝐚́𝐜 𝐭𝐡𝐮̀𝐧𝐠 𝐫𝐚́𝐜 𝐛𝐨̣̂ 𝐡𝐚̀𝐧𝐡.</p>

<p><img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Kể từ ngày 18/04/2022, Công ty thực hiện công tác thu gom rác sinh hoạt trực tiếp bằng xe gom. Cụ thể như sau:</p>

<p>- Các ngày thứ 6 và thứ 7 (ngày diễn ra hoạt động phố đêm): 𝐭𝐡𝐮̛̣𝐜 𝐡𝐢𝐞̣̂𝐧 𝐭𝐮̛̀ 𝟏𝟔𝐡𝟑𝟎 – 𝟏𝟖𝐡𝟎𝟎 𝐜𝐚́𝐜 𝐡𝐨̣̂ 𝐠𝐢𝐚 đ𝐢̀𝐧𝐡/𝐜𝐨̛ 𝐪𝐮𝐚𝐧 đ𝐮̛𝐚 𝐫𝐚́𝐜 𝐭𝐫𝐮̛̣𝐜 𝐭𝐢𝐞̂́𝐩 𝐫𝐚 𝐱𝐞 𝐭𝐡𝐮 𝐠𝐨𝐦.</p>

<p>- Các ngày còn lại trong tuần (từ chủ nhật – thứ 5): 𝐜𝐨̂𝐧𝐠 𝐭𝐚́𝐜 𝐭𝐡𝐮 𝐠𝐨𝐦 𝐭𝐡𝐮̛̣𝐜 𝐡𝐢𝐞̣̂𝐧 𝐭𝐮̛̀ 𝟏𝟖𝐡𝟎𝟎 – 𝟏𝟗𝐡𝟑𝟎 𝐯𝐚̀ 𝐜𝐨̂𝐧𝐠 𝐭𝐚́𝐜 𝐪𝐮𝐞́𝐭 đ𝐮̛𝐨̛̀𝐧𝐠 𝐩𝐡𝐨̂́ 𝐭𝐮̛̀ 𝟐𝟎𝐡𝟑𝟎 – 𝟐𝟐𝐡𝟎𝟎.</p>

<p>Công ty kính đề nghị các hộ gia đình/cơ quan lưu ý thực hiện: lưu trữ rác đúng cách, đưa rác ra đúng lịch trình, thời gian Công ty đang thực hiện để đảm bảo vệ sinh môi trường và mỹ quan đô thị.</p>

<p>Trân trọng ./.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-04.jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-04(2)%C6%B0.jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-04(1).jpg" style="height:600px; width:450px" /></p>', N'/uploads/images/22-04_2__.jpg', N'announcement', N'{"category":"announcement","publishYear":2022,"attachments":[],"images":[],"summary":"Thông báo về việc thay đổi phương thức thu gom rác trên tuyến đường Lê Huân - Đặng Thái Thân - Ông Ích Khiêm - 23/8 ( tuyến đường nằm trong đề án phố","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công trình phần việc thanh niên " khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế"', N'21/04/2022 10:23', N'<p>Một trong những khẩu hiệu hành động của ĐTN Hepco nhiệm kỳ 2022-2027 đó là lấy chuyên môn làm hành động, xung kích, tình nguyện, sáng tạo để đồng hành cùng Thừa Thiên Huế Xanh - Sạch - Sáng. Với phương châm, nhận thức hành động đó, được sự đồng ý của Đảng uỷ Công ty, Đoàn Thanh Niên Hepco đã đảm nhận phần việc thanh niên, tổ chức thực hiện chuỗi khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương phục vụ cho dự án của công ty Vietnam Waste Planning (VWP).</p>

<p>Chương trình khảo sát thu thập dữ liệu về hành vi xả rác của người dân tại các điểm chợ Bến Ngự, An Cựu, Nam Phổ; khảo sát hành vi, khối lượng, cách thức bỏ rác của người dân sinh sống xung quanh các khu vực chợ gần sông, khảo sát các điểm thu gom rác ven sông có thùng chứa và không có thùng chứa..quanh các khu vực sông Hương và các nhánh sông trên địa bàn thành phố Huế và các vùng lân cận..</p>

<p>Thông qua chương trình này, các ĐVTN Hepco cùng NLĐ Hepco có cơ hội được tập huấn kĩ năng, tìm hiểu tiếp cận được các dữ liệu vừa nâng cao trình độ chuyên môn nghiệp vụ, vừa được thực tế quan sát được hành vi xả rác của người dân từ đó rút ra kinh nghiệm, bài học nhằm nâng cao chất lượng công tác tuyên truyền về ý thức của người dân về bảo vệ môi trường, nếp sông văn minh đô thị. Đồng thời số liệu sau khi phân tích sẽ được phía dự án phục vụ cho các hoạch định trong tương lai về chất thải đặc biệt chất thải nhựa.</p>

<p>Trong thời gian đến, ĐTN Hepco sẽ tiếp tục cố gắng phấn đấu là lực lượng tiên phong trong công tác tuyên truyền về bảo vệ môi trường, phân loại rác tại nguồn góp phần cùng các tổ chức chính trị, HĐQT, Ban lãnh đạo, cán bộ, nhân viên, người lao động trong công ty xây dựng Hepco ngày càng vững mạnh, phát triển.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/21-04.jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/21-04(1).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/21-04(2).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/21-04(3).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/21-04(4).jpg" style="height:600px; width:450px" /></p>', N'/uploads/images/21-04.jpg', N'news', N'{"category":"union_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Công trình phần việc thanh niên \" khảo sát thu thập dữ liệu nhằm phân tích dòng chất thải nhựa ra đại dương trên địa bàn tỉnh Thừa Thiên Huế\"","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'18/03/2022 15:02', N'<p>Sáng ngày 18/3/2022 tại Hội trường HEPCO 46 Trần Phú đã diễn ra chương trình Đại hội Đoàn Thanh Niên CS HCM Công ty nhiệm kỳ 2022-2027. Đến tham dự chỉ đạo Đại Hội về phía Thành đoàn Huế có đồng chí Hồ Quốc Huy – Thành Ủy Viên – Bí Thư thành đoàn Huế cùng các chuyên viên Thành đoàn Huế; Về phía Công ty có đồng chí Trần Trung Khánh – Phó bí thư Đảng Ủy, chủ tịch CĐCS, phó TGĐ Công ty cùng với các đồng chí trong Đảng Ủy, HĐQT, Ban TGĐ Công ty.</p>

<p>Đại Hội được diễn ra trong không khí trang nghiêm với sự có mặt của 41 đại biểu, đại hội đã đánh giá kết quả thực hiện Nghị quyết Đại hội Đoàn nhiệm kỳ 2017-2022, đưa ra những tồn tại, hạn chế, rút ra bài học kinh nghiệm; đồng thời xác định phương hướng, nhiệm vụ, giải pháp công tác đoàn và phong trào thanh niên nhiệm kỳ 2022-2027; Đại Hội cũng đã tiếp thu ghi nhận một cách nghiêm túc ý kiến phát biểu chỉ đạo của Đảng Ủy Công ty, của Ban thường vụ Thành Đoàn Huế và các ý kiến tham luận tại đại hội, từ đó sẽ bổ sung đưa vào chương trình hoạt động nhiệm kỳ 2022 -2027. Đại hội đã biểu quyết nhất trí cao với những nội dung cơ bản của Dự thảo Báo cáo trình Đại hội, các đại biểu đã nhất trí thông qua Nghị quyết Đại hội, thể hiện ý chí quyết tâm đưa công tác Đoàn và phong trào thanh niên Công ty ngày càng phát triển mạnh mẽ.</p>

<p>Với tinh thần đoàn kết, thống nhất cao, Đại hội đã tiến hành bầu Ban Chấp hành nhiệm kỳ 2022-2027 và bầu Bí thư, phó bí thư trực tiếp tại Đại hội. Kết quả, Ban Chấp hành Đoàn Công ty gồm 7 đồng chí; đồng chí Trần Thị Ngọc Liên giữ chức vụ Bí thư, đồng chí Văn Bảo Lân giữ chức vụ Phó Bí thư ĐTN Công ty nhiệm kỳ 2022-2027. Đồng thời, Đại hội cũng bầu ra 02 đại biểu chính thức, 01 đại biểu dự khuyết tham gia dự đoàn đại biểu Đại hội Đoàn TNCS Hồ Chí Minh thành phố Huế lần thứ XII nhiệm kỳ 2022-2027. Cũng tại đại hội,03 đồng chí BCH nhiệm kỳ 2017-2022 đã thôi nhiệm.</p>

<p>Nhiệm kỳ 2022-2027 với nhiều những thuận lợi, thời cơ cũng như thách thức mới, đoàn viên thanh niên của Công ty với khẩu hiệu hành động “Tuổi trẻ HEPCO tiên phong – đoàn kết – sáng tạo – phát triển vì mục tiêu xây dựng Thừa Thiên Huế Xanh – Sạch –Sáng” và phương châm thẳng thắn nhìn nhận những tồn tại, hạn chế sẽ hợp sức cùng với Đảng bộ, chính quyền, các tổ chức đoàn thể, cán bộ và người lao động công ty xây dựng HEPCO ngày càng nâng tầm giá trị, khẳng định vị thế góp phần thực hiện thắng lợi Nghị quyết Đại hội Đảng bộ Công ty và Nghị quyết Đại hội Đoàn các cấp đề ra.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03.jpg" style="height:399px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(9).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(8).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(7).jpg" style="height:1067px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(6).jpg" style="height:1067px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(5).jpg" style="height:1067px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(4).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(3).jpg" style="height:1067px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(11).jpg" style="height:514px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-03(10).jpg" style="height:600px; width:800px" /><img alt="" src="/Public/Upload/images/Tintuc/18-03(1).jpg" style="height:600px; width:800px" /></p>', N'/uploads/images/18-03_11_.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"ĐẠI HỘI ĐOÀN THANH NIÊN CỘNG SẢN HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Mô hình Đại Nội Huế được làm từ nắp chai nhựa.', N'15/03/2022 11:02', N'<p>Đây là 1 sản phẩm trong Trung tâm Thông tin Môi trường tại 46 Trần Phú - Hepco.</p>

<p>Trung tâm được Công ty Cổ phần Môi trường và công trình đô thị Huế phối hợp thực hiện cùng tổ chức WWF trong khuôn khổ dự án " Huế - Đô thị Giảm Nhựa ở miền Trung Việt Nam". Đây là nơi phục vụ thông tin cho chương trình Phân loại rác tại nguồn sắp được triển khai tại Huế.</p>

<p>Dự kiến thời gian trung tâm đi vào hoạt động vào cuối tháng 3/2022.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/17-03.jpg" style="height:1200px; width:900px" /></p>', N'/uploads/images/17-03.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Mô hình Đại Nội Huế được làm từ nắp chai nhựa.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'CHÀO MỪNG ĐẠI HỘI ĐOÀN TNCS HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027', N'15/03/2022 10:23', N'<p>Thời gian tổ chức đại hội : 7h30 sáng 18/03/2022<br />
Số lượng đại biểu: 50 đại biểu.<br />
Địa điểm: Hội trường Hepco 46 Trần Phú.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/15-03.jpg" style="height:655px; width:1012px" /><br />
 </p>', N'/uploads/images/15-03.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"CHÀO MỪNG ĐẠI HỘI ĐOÀN TNCS HỒ CHÍ MINH CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ NHIỆM KỲ 2022-2027","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Sẽ không “cào bằng” trong thu phí rác thải theo cách mới', N'14/03/2022 15:20', N'<p> </p>

<p>Theo Luật Bảo vệ môi trường (BVMT) năm 2020 có hiệu lực kể từ ngày 1/1/2022 quy định việc thu phí rác thải dựa trên khối lượng, thể tích thay cho việc tính bình quân theo hộ gia đình hoặc đầu người như lâu nay. Để làm rõ hơn vấn đề này, trao đổi trên Thừa Thiên Huế Cuối tuần, ông Trần Quốc Khánh, Tổng Giám đốc Công ty CP Môi trường và Công trình đô thị Huế (HEPCO) cho biết:</p>

<p>Đọc thêm tại: <a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fbaothuathienhue.vn%2Fse-khong-cao-bang-trong-thu-phi-rac-thai-theo-cach-moi-a110188.html%3Fzarsrc%3D30%26utm_source%3Dzalo%26utm_medium%3Dzalo%26utm_campaign%3Dzalo%26fbclid%3DIwAR3ubH5X2ewVqnxs7ekf6qjwlTVhqsZFUVea7HPdsK8pvXyj4fLyxuhcgrE&h=AT3LIavxzkz6nID_oHf9QDRYbnq_r9pCSGP3_nDCQDyak7S-eT3gfdbNVrdU_MFVx8irlA92VyJXTjoad2hdfYP6ebe1zkW5jNvJi30sKVHTzNwQf6XdDAiTMBBzFC3PlCrb&__tn__=-UK-R&c[0]=AT1pdKRMa6Psv2a2AibavClAG9VFQg99FCAeB2hyXv5tRHoQ0M7wCcHyZ5J7reWbzr_wyhkHMU5ejBcTnKkhFfqoDx2GnRJs1XBHVX5gMP4YViF1ilKOS7vBwTkxvxUqMb-Q0d7NaRft6JLjgTqPtm_cRuYRDCdlScjSASP1HE35UZU" rel="nofollow noopener" tabindex="0" target="_blank">https://baothuathienhue.vn/se-khong-cao-bang-trong-thu...</a></p>

<p> </p>

<div class="ddict_btn" style="left:436.266px; top:88px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/14-02-22.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Sẽ không “cào bằng” trong thu phí rác thải theo cách mới","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng', N'09/03/2022 10:57', N'<p>THANH TOÁN PHÍ DỊCH VỤ VỆ SINH MÔI TRƯỜNG NHANH CHÓNG, ĐƠN GIẢN VÀ DỄ DÀNG</p>

<p>CHỈ 1 phút, bạn đã có thể thanh toán nhanh chóng với một chiếc điện thoại thông minh.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Đáp ứng nhu cầu của khách hàng không có thời gian di chuyển, ngại chờ đợi, HEPCO thông báo đến quý khách hàng 3 cách thanh toán cực kì đơn giản và nhanh chóng!</p>

<p><img alt="1️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t7a/1/16/31_20e3.png" style="height:16px; width:16px" /> Thanh toán qua VNPT Pay, “quét sạch” hóa đơn vệ sinh môi trường nhanh chóng</p>

<p><img alt="2️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t99/1/16/32_20e3.png" style="height:16px; width:16px" /> Tiện lợi, phổ biến với việc thanh toán bằng ứng dụng ví Momo</p>

<p><img alt="3️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb8/1/16/33_20e3.png" style="height:16px; width:16px" /> Thanh toán đơn giản với Viettel pay</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Không cần ra khỏi nhà, chỉ với vài thao tác, thanh toán phí dịch vụ vệ sinh môi trường đơn giản và dễ dàng hơn rất nhiều!</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Bạn đã thử chưa?</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-03-22.jpg" style="height:536px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-03-22(1).jpg" style="height:600px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-03-22(2).jpg" style="height:600px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-03-22(3).jpg" style="height:600px; width:600px" /></p>', N'/uploads/images/09-03-22.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Thanh toán phí dịch vụ vệ sinh môi trường nhanh chóng, đơn giản, dễ dàng","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nhặt nhẫn kim cương và trả lại – hành động đẹp đáng để trân trọng và lan tỏa của công nhân HEPCO.', N'17/02/2022 13:49', N'<p>Anh Trần Phương Lộc – công nhân xí nghiệp môi trường Nam Sông Hương là người được nhắc trên nhiều bài viết ở các trang mạng xã hội từ tối ngày 16/2 sau khi nhặt được chiếc nhẫn kim cương và trả lại cho chủ nhân – chị Hà Hoàng Oanh. Là cơ duyên, là hy hữu, là niềm vui sướng hân hoan của chủ nhân chiếc nhẫn, đó cũng chính là niềm tự hào, hạnh phúc của anh Lộc và những người công nhân HEPCO bởi một hình ảnh công nhân áo xanh rất thật thà “anh lượm được trong lúc quét đường, anh đâu biết của ai đâu, giờ người mất tìm anh trả lại”. Đây không phải là lần đầu công nhân Hepco có hành động cao đẹp này, rất nhiều lần trong khi công tác các Anh Chị nhặt được ví, điện thoại, những đồ có giá trị đều được trao về tay chủ nhân.<br />
<br />
Trong cuộc sống thường nhật luôn tràn đầy những điều tốt đẹp nhưng cũng đầy rẫy những điều khiến con người dần đánh mất niềm tin, việc làm tử tế như anh Lộc đã đánh thức và gieo cho mọi người về “niềm tin, tình người,”. Nét đẹp “ nhặt được của rơi trả lại” vẫn luôn cần được được gìn giữ và phát huy, xứng đáng để cho mỗi chúng ta noi theo, học tập và cần lan tỏa rộng rãi trong cuộc sống cộng đồng.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/17-02.jpg" style="height:600px; width:450px" /></p>', N'/uploads/images/17-02.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Nhặt nhẫn kim cương và trả lại – hành động đẹp đáng để trân trọng và lan tỏa của công nhân HEPCO.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'09/02/2022 11:03', N'<p>Hình ảnh màu áo HEPCO quá quen thuộc với những người làm công tác thu gom rác mà ai cũng có thể bắt gặp trên đường mỗi ngày. Nhưng vẫn là màu áo HEPCO ấy, có thể bạn chưa biết họ cũng là công nhân của HEPCO, nhưng không phải đi thu gom rác trên đường vỉa hè mà là những người chuyên đi thu gom rác dưới cống rãnh, thường gọi họ là công nhân thoát nước.</p>

<p>Công việc thường nhật của những người công nhân thoát nước là dầm mình dưới lòng cống, nạo vét, thu gom bùn, rác.. với mùi hôi thối đến ngạt thở. Dưới lòng cống đen ngòm với bao nhiêu loại bùn rác do con người xả xuống, rồi những loại hóa chất độc hại, dầu mỡ chưa qua xử lý của những hàng quán kinh doanh, rồi phế thải của những người không có ý thức xả trộm xuống cống...”Nhiều người không ý thức cữ nghĩ cống thoát nước là thùng rác, cái gì người ta cũng vứt xuống đây cả” a Định công nhân Xí nghiệp Thoát nước cho hay.</p>

<p>Bùn ngập ngang cổ, mùi hôi thối bốc lên những người đi đường còn né tránh ái ngại, vậy mà những người công nhân thoát nước vẫn cần mẫn công việc hàng ngày. Họ nghĩ rằng “Ai cũng chọn việc nhẹ nhàng, gian khổ biết dành phần ai”, công việc là do sự phân công của xã hội và là nghề họ đã chọn nên họ làm việc với sự yêu nghề và niềm tự hào bản thân. Có những người gắn bó với nghề từ lúc thanh niên cho đến khi tóc đã muối tiêu hai màu vẫn nhiệt huyết trách nhiệm. Dù cực nhọc đó, nguy hiểm đó, độc hại đó nhưng bản chất công việc làm sạch đẹp cho đời nên họ không quản ngại gian khổ, họ chỉ có mong muốn giản đơn “ Xin mọi người dân hãy ý thức hơn, đừng vứt rác bừa bãi, đừng xả thải xuống cống, tuân thủ quy định về vệ sinh môi trường để chúng tôi bớt vất vả”.</p>

<p>Mỗi mùa mưa bão gần đến, công việc của họ lại gian khổ lên bội lần nhằm đảm bảo thành phố hạn chế bị ngập úng, hệ thống thoát nước được vận hành trơn tru, dòng chảy được thông suốt. Họ cứ thế, c�� thầm lặng thực hiện công việc với những mong ước giản đơn. Vậy tại sao chúng ta không hiện thực hóa mong ước của họ bằng những hành động thiết thực để vừa giúp họ, vừa bảo vệ chính chúng ta, vừa bảo vệ môi trường “Xanh – Sạch – Đẹp”.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/9-2.jpg" style="height:480px; width:360px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/9-2(1).jpg" style="height:480px; width:360px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/9-2(2).jpg" style="height:480px; width:360px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/9-2(3).jpg" style="height:480px; width:360px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/9-2(4).jpg" style="height:480px; width:360px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/9-2(5).jpg" style="height:270px; width:360px" /></p>', N'/uploads/images/9-2_3_.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo tăng cường  thời gian và tần suất thu gom dịp Tết Nhâm Dần 2022', N'28/01/2022 10:36', N'<p>Lượng rác những ngày này tăng gấp 1,4 lần so với ngày thường, đặc biệt ngày giao thừa tăng hơn 4 lần so với ngày thường. Nhằm giảm tải lượng rác vào ngày giao thừa và đảm bảo công tác vệ sinh môi trường, TỪ NGÀY MAI 27,28 ÂM LỊCH HEPCO TĂNG CƯỜNG THU GOM</p>

<p><img alt="❇️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb1/1/16/2747.png" style="height:16px; width:16px" /> Đối với địa bàn thu gom ban đêm: vào ca sớm từ 14h chiều.</p>

<p><img alt="❇️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb1/1/16/2747.png" style="height:16px; width:16px" /> Đối với địa bàn thu gom ngày: tăng tần suất cả ngày.</p>

<p>RIÊNG ĐỐI VỚI NGÀY GIAO THỪA 29 ÂM LỊCH: vào ca từ 7h sáng.</p>

<p>Kính mong bà con theo dõi lịch thu gom chi tiết tại đây: <a href="https://fb.watch/aP7epRAHTG/?fbclid=IwAR118ZnzJwV2vq_dUQYFVv1i-rvahzi1nLn_NBzVyoB4FRI-p12saUPHyqU" rel="nofollow noopener" tabindex="0" target="_blank">https://fb.watch/aP7epRAHTG/</a></p>

<p>Trân trọng <img alt="💚" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t94/1/16/1f49a.png" style="height:16px; width:16px" /></p>

<p style="text-align:center"><iframe align="middle" frameborder="0" height="300" scrolling="no" src="https://www.youtube.com/embed/E3UcDqpEi9Q" title="YouTube video player" width="450"></iframe></p>

<p> </p>', N'/uploads/images/11_1_.jpg', N'announcement', N'{"category":"announcement","publishYear":2022,"attachments":[],"images":[],"summary":"Thông báo tăng cường  thời gian và tần suất thu gom dịp Tết Nhâm Dần 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Màu áo xanh Hepco phủ trên khắp nẻo đường', N'26/01/2022 14:05', N'<p>24 THÁNG CHẠP</p>

<p>Màu áo xanh Hepco phủ khắp mọi nẻo đường - tất bật làm sạch đẹp đường phố phục vụ Tết Nguyên Đán Nhâm Dần 2022 <img alt="💚" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t94/1/16/1f49a.png" style="height:16px; width:16px" /></p>

<p>Đừng quên lịch thu gom rác tết Nguyên Đán bạn nhé, chi tiết ngay đây: <a href="https://fb.watch/aMDXgwKzK3/?fbclid=IwAR2S6YFfEfDVmF5vUvv1W5kyWgccr_8RkqN2AUgeSVDS5MfksU26kBY4Dg4" rel="nofollow noopener" tabindex="0" target="_blank">https://fb.watch/aMDXgwKzK3/</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-01-22.jpg" style="height:533px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-01-22(1).jpg" style="height:533px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-01-22(3).jpg" style="height:533px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/272049155_4724859867601301_1270059735264857752_n.jpg" style="height:534px; width:800px" /></p>', N'/uploads/images/26-01-22.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Màu áo xanh Hepco phủ trên khắp nẻo đường","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Cùng ý thức để công nhân môi trường được đón tết sớm', N'24/01/2022 13:25', N'<p>Sau ngày cúng ông Công ông Táo, cúng tất niên hay việc thu dọn nhà cửa đón tết của người dân... thường là cảnh tượng "rác thờ", đồ dùng hư hỏng ở khắp ngã ba, ngã tư; túi ni lông nổi trên sông, hồ... làm xấu cảnh quan, môi trường. Để không còn là nỗi ám ảnh, nhọc nhằn của những công nhân vệ sinh môi trường trong những ngày cuối năm, rất cần mỗi người cùng đồng thuận, ý thức trong việc vệ sinh, bỏ rác, đốt rải vàng mã đúng quy định.</p>

<p>Đọc thêm tại: <a href="https://baothuathienhue.vn/cung-y-thuc-de-cong-nhan-moi-truong-duoc-don-tet-som-a109264.html?fbclid=IwAR01nLz1lbV6zjNY4nzQ061ItO54Qd3_ETG7kDtE4jEW07Kar68kOdNYHto" rel="nofollow noopener" tabindex="0" target="_blank">https://baothuathienhue.vn/cung-y-thuc-de-cong-nhan-moi...</a></p>', N'/uploads/images/24-01-22_5_.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Cùng ý thức để công nhân môi trường được đón tết sớm","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Lịch thu gom rác Tết Nhâm Dần 2022', N'24/01/2022 15:44', N'<p> Lịch thu gom rác Tết Nhâm Dần 2022 <img alt="🌻" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1a/1/16/1f33b.png" style="height:16px; width:16px" /><img alt="🌸" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/1/16/1f338.png" style="height:16px; width:16px" /></p>

<p>Kính mong bà con cùng chung tay với HEPCO, lưu ý thực hiện góp phần giữ gìn đô thị luôn khang trang sạch đẹp vào năm mới <img alt="🌟" src="https://static.xx.fbcdn.net/images/emoji.php/v9/te0/1/16/1f31f.png" style="height:16px; width:16px" /></p>

<p>Mọi thắc mắc liên hệ với chúng tôi qua HOTLINE HEPCO: 02343 997799 <img alt="🌼" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t9b/1/16/1f33c.png" style="height:16px; width:16px" /><img alt="🎶" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1f/1/16/1f3b6.png" style="height:16px; width:16px" /></p>

<p style="text-align:center"><iframe frameborder="0" height="300" scrolling="no" src="https://www.youtube.com/embed/dYZazSDf1to" title="YouTube video player" width="600"></iframe></p>

<p style="text-align:center"> </p>', N'/uploads/images/24-01-22_11_.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Lịch thu gom rác Tết Nhâm Dần 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Trao quà cho công nhân dịp Tết đến xuân về', N'24/01/2022 10:20', N'<p>Sáng ngày 24/1/2022 tại Công ty Cổ phần Môi trường và Công trình Đô thị Huế, Đảng uỷ - Công Đoàn cơ sở - Hội đồng Quản trị - Ban Tổng giám đốc công ty đã tổ chức trao 109 suất quà với tổng giá trị 85 triệu đồng gồm tiền mặt, hiện vật cho công nhân có hoàn cảnh khó khăn, công nhân F0 có hoàn cảnh khó khăn, công nhân ở địa bàn thành phố mới mở rộng đang công tác tại các đơn vị, xí nghiệp trực thuộc công ty.</p>

<p>Đây là một hoạt động thường niên của công ty thể hiện sự chăm lo sẻ chia đối với các công nhân mỗi dịp Tết đến Xuân về. Thay mặt Đảng uỷ - HĐQT công ty, đồng chí Nguyễn Hồng Sơn - Thành uỷ viên - Bí thư Đảng bộ- CTHĐQT công ty đã có những lời chia sẻ động viên và khích lệ tinh thần với mong muốn các công nhân có một cái tết đầm ấm, thật nhiều sức khoẻ, vượt qua những khó khăn, đảm bảo an toàn trước dịch Covid-19 để hoàn thành tốt nhiệm vụ được giao trong dịp Tết Nguyên Đán, góp phần hoàn thành nhiệm vụ chung của Công ty.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-01-22.jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-01-22(1).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-01-22(2).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-01-22(3).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-01-22(4).jpg" style="height:600px; width:800px" /></p>', N'/uploads/images/24-01-22.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Trao quà cho công nhân dịp Tết đến xuân về","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.', N'22/01/2022 22:39', N'<p>Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(9).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(8).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(7).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(6).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(5).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(4).jpg" style="height:600px; width:800px" /></p>', N'/uploads/images/22-01-22_4_.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Một số hình ảnh công nhân Hepco thực hiện công tác xịt rửa đường, vỉa hè phục vụ Tết Nhâm Dần 2022.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn', N'22/01/2022 10:01', N'<p>Dịp cuối năm cận Tết Nguyên Đán là thời gian cực kì bận rộn của những người công nhân vệ sinh môi trường vốn dĩ đã vất vả quanh năm, các anh chị em phải tăng ca tăng kíp thực hiện tổng vệ sinh tăng cường để làm đẹp cho bộ mặt thành phố, giữ gìn cho mọi những con đường ngõ xóm luôn sạch đẹp. Một trong những động lực to lớn nuôi dưỡng sự yêu nghề, trách nhiệm với nghề đó là sự quan tâm, hỗ trợ từ lãnh đạo các cấp chính quyền, từ các tổ chức ban ngành đoàn thể đã luôn sâu sát động viên ủng hộ vật chất lẫn tinh thần cũng như việc chăm lo chu đáo đời sống tinh thần vật chất từ ban lãnh đạo hội đồng quản trị Hepco.</p>

<p>Trong dịp Tết Nhâm Dần 2022, Hepco vinh dự có Chị Trần Thị Nhàn công nhân xí nghiệp Môi trường Hương Trà được đồng chí Phan Văn Anh - Phó Chủ tịch Tổng Liên đoàn Lao động Việt Nam trao quà. Cũng trong dịp này, lãnh đạo Liên đoàn Lao Động thành phố đã trao hơn 20 suất quà cho các công nhân vệ sinh môi trường Hepco đang thực hiện nhiệm vụ ở hiện trường.</p>

<p>Việc được nhận những phần quà đầy ý nghĩa từ Tổng Liên đoàn Lao Động Việt Nam, Liên đoàn Lao Động Tỉnh và Thành Phố là nguồn động viên tinh thần lẫn vật chất to lớn giúp anh chị em công nhân an tâm hoàn thành tốt nhiệm vụ được giao góp phần mang lại bộ mặt sáng xanh sạch đẹp cho thành phố trong dịp tết Nhâm Dần. Mỗi một người công nhân vệ sinh là một bông hoa góp phần tô điểm rực rỡ cho thành phố trong mỗi dịp Tết đến Xuân về.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22.jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(1).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(2).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/22-01-22(3).jpg" style="height:450px; width:600px" /></p>', N'/uploads/images/22-01-22_1_.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Tổng liên đoàn lao động Việt Nam, Liên đoàn lao động Tỉnh, Thành phố trao quà cho công nhận vệ sinh môi trường HEPCO có hoàn cảnh khó khăn","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.', N'21/01/2022 21:30', N'<p>Tiếp nối thành công vang dội từ hai lần tổ chức, tối ngày 21/1/2022 tại Hội trường Công ty Môi trường Đô thị Hà Nội và các điểm cầu khu vực miền Trung, Miền Nam đã diễn ra lễ trao giải Chương trình “Cây chổi vàng” – lần thứ ba -2021 do Tạp chí Môi trường và Đô thị Việt Nam khởi xướng. Chương trình được tổ chức nhằm tôn vinh những người lao động trực tiếp tham gia công việc quét rác, thu gom, vận chuyển và xử lý rác thải, từ đó tuyên truyền để xã hội hiểu và quan tâm hơn đến ngành nghề vệ sinh môi trường.</p>

<p>Với hơn 126 bộ hồ sơ của các ứng viên từ các đơn vị, doanh nghiệp làm công tác vệ sinh môi trường trên cả nước, ban tổ chức đã chọn ra 29 gương mặt tiêu biểu để trao 29 giải thưởng gồm 16 Giải Đồng, 06 Giải Bạc, 06 Giải Vàng và 01 Giải Kim Cương . Mỗi một ứng viên đều có những hoàn cảnh sống, những điều kiện khác nhau về công việc, nhưng tất cả các anh chị đều có một điểm chung đó là sự tận tuỵ với nghề, tận tâm với công việc, không quản ngại khó khăn, mỗi ngày, mỗi giờ góp sức mình vào sự nghiệp bảo vệ môi trường luôn sáng – xanh - sạch - đẹp.</p>

<p>Tham dự chương trình, tại điểm cầu Hà Nội có ông Nguyễn Trường Giang - Phó Chủ nhiệm Uỷ ban Pháp luật của Quốc hội khóa XV, Phó Tổng thư ký Quốc hội; GS.TSKH Nguyễn Văn Liên, Nguyên Thứ trưởng thường trực Bộ Xây dựng, Chủ tịch Hiệp hội Môi trường, đô thị và Khu công nghiệp Việt Nam; Ông Trần Hướng Dương, Phó Cục trưởng Cục nghệ thuật biểu diễn, Bộ Văn hóa, Thể thao và Du lịch; TS. Trần Văn Lượng, Chủ tịch Hiệp hội Công nghiệp môi trường Việt Nam; Ông Nguyễn Hữu Tiến – Phó Chủ tịch thường trực Hiệp hội Môi trường Đô thị và Khu công nghiệp Việt Nam – Tổng Giám đốc Công ty TNHH Một thành viên Môi trường đô thị Hà Nội; Ông Hồ Chí Hưng, Tổng thư ký VURIEA; TS.LS Đồng Xuân Thụ, Tổng Biên tập Tạp chí Môi trường và Đô thị Việt Nam, Trưởng Ban tổ chức. Tại điểm cầu thành phố Cần Thơ có ông Lưu Việt Chiến; Phó Chủ tịch Hội Môi trường đô thị và Khu công nghiệp Khu vực miền Nam; Chủ tịch HĐQT Công ty CP đô thị Cần Thơ</p>

<p>Tại điểm cầu miền Trung được tổ chức tại Công ty Cổ phần Môi trường và Công trình Đô thị Huế (HEPCO), Ông Nguyễn Hồng Sơn - Chủ tịch Hội Môi trường đô thị và Khu Công nghiệp Khu vực miền Trung –Tây Nguyên, CT HĐQT Công ty CP Môi trường và Công trình đô thị Huế đã đại diện trao 04 giải cho các gương mặt tiêu biểu tại miền Trung. Trong đó 02 giải Bạc được trao cho Chị Lê Thị Hồng Lương – Công ty Cổ phần Môi trường và Công trình Đô thị Hà Tĩnh và Chị Lê Thị Huệ - Công ty Cổ phần Môi trường và Công trình Đô thị Đông Hà. Công ty Cổ Phần Môi trường và Công trình Đô thị Huế có Chị Bùi Thị Kim Hoa vinh dự được trao giải Vàng cùng với Chị Võ Thị Nga đến từ Công ty Cổ phần Môi trường Bình Định.</p>

<p>Các giải thưởng còn lại được trao tại điểm cầu Hà Nội và Cân Thơ, đặc biệt giải Kim Cương đã thuộc về chị Nguyễn Thị Thu Oanh đang công tác tại Tổ Môi trường số 8 – Chi nhánh Ba Đình, Công ty TNHH MTV Môi trường Đô thị Hà Nội. Ngoài ra, với tinh thần tương thân tương ái Ban tổ chức đã vận động 02 căn nhà tình nghĩa và trao cho công nhân vệ sinh môi trường có hoàn cảnh đặc biệt khó khăn tại Quảng Nam và Hà Giang.</p>

<p>Chương trình trao giải khép lại thật ấn tượng với những nụ cười, giọt nước mắt và nhiều giá trị ghi lại dấu ấn khó phai, dù có giải hay không nhưng mỗi một anh chị công nhân vệ sinh môi trường là một ngôi sao sáng xứng đáng được tôn vinh trong bất cứ hoàn cảnh nào. Từ nông thôn đến thành thị trên khắp 63 tỉnh thành của đất nước Việt Nam không một ngày nào có thể thiếu bóng dáng của những con người cần mẫn, thầm lặng tô điểm làm đẹp cho đời. Chương trình “Cây chổi vàng” của Tạp chí Môi trường và Đô thị Việt Nam là một sản phẩm mang tính nhân văn, là món quà giá trị vật chất lẫn tinh thần cho những “cây chổi” không biết mệt mõi ngày đêm giữ gìn môi trường Xanh – Sạch –Sáng.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/20-01-22(1).jpg" style="height:626px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/21-01-22.jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/21-01-22(2).jpg" style="height:600px; width:800px" /></p>', N'/uploads/images/21-01-22_3_.jpg', N'news', N'{"category":"event","publishYear":2022,"attachments":[],"images":[],"summary":"Lễ trao giải chương trình “ CÂY CHỔI VÀNG”- đêm tôn vinh những cây chổi lặng lẽ tô điểm cho đời.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'HEPCO - Một trong những đối tác chính của dự án " Huế đô thị giảm nhựa ở miền Trung - Việt Nam"', N'18/01/2022 10:33', N'<p>Nằm trong khuôn khổ dự án “Huế - Đô thị Giảm nhựa ở Miền Trung Việt nam”, nhằm xây dựng kế hoạch cho giai đoạn II (2022-2024) đại diện WWF Bà Nguyễn Thị Diệu Thúy – Giám đốc Chương trình Giảm nhựa cùng các thành viên của dự án đã có buổi làm việc với HEPCO – Công ty Cổ phần Môi trường và Công trình đô thị Huế vào sáng ngày 18/1/2021.</p>

<p>Giai đoạn 1 khởi động của dự án đang được triển khai, cùng với đó trong giai đoạn 2 (2022-2024) sẽ đi vào triển khai chi tiết, thực hiện vận hành Trung tâm thông tin Môi trường, triển khai chương trình Phân loại rác tại nguồn, xây dựng trạm tái chế (MRF), thu gom rác tại các điểm nóng ô nhiễm…Thông qua các chương trình triển khai của dự án với mục tiêu của đến năm 2024, Huế trở thành Đô thị Giảm Nhựa với 70% chất thải rắn được phân loại tại nguồn, thu gom và xử lý, đồng thời rác tái chế từ bãi chôn lấp được đẩy mạnh thu hồi và đưa Huế trở thành một điểm đến không rác nhựa vào năm 2030.</p>

<p>Tại buổi làm việc, ông Nguyễn Hồng Sơn – Chủ tịch HĐQT Hepco đã đưa ra những định hướng, kế hoạch đồng hành cùng WWF trong các chương trình hành động của dự án, đặc biệt chú trọng đến công tác phân loại rác tại nguồn cần phải thực hiện sớm bởi tính cấp thiết theo luật môi trường 2020. Về nhân lực, cơ sở vật chất Hepco cũng sẵn sàng hỗ trợ cùng WWF trong việc xây dựng Trung tâm Thông tin Môi trường dự kiến đưa vào hoạt động vào quý II/2022, hỗ trợ truyền thông, đồng hành thực hiện các chương trình của khuôn khổ dự án để cùng lan tỏa giá trị và mục đích dự án muốn hướng đến.</p>

<p>Không chỉ thực hiện tại Thừa Thiên Huế, hiện WWF cũng đang thực hiện dự án tại nhiều tỉnh thành khác với thông điệp:“Giảm rác thải nhựa là việc cần làm ngay của chính mỗi người, vì sức khỏe của bản thân, của những người thân yêu và vì thiên nhiên trong sạch”.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/20-01-2022.jpg" style="height:514px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/20-01-2022(2).jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/20-01-2022(1).jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/20-01-2022(3).jpg" style="height:600px; width:450px" /></p>', N'/uploads/images/20-01-2022.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"HEPCO - Một trong những đối tác chính của dự án \" Huế đô thị giảm nhựa ở miền Trung - Việt Nam\"","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân', N'09/01/2022 8:51', N'<p>Những dịp cuối năm đặc biệt dịp Tết Nguyên Đán cận kề, là thời gian mà các công nhân tổ vệ sinh thùng thuộc hai xí nghiệp môi trường Nam Sông Hương và Bắc Sông Hương ở Hepco thường xót xa vì phải chứng kiến cảnh tượng những chiếc thùng rác bị cháy móp méo, bị lủng do rác có mồi lửa của người dân đổ ra.</p>

<p>" Vào mỗi dịp rằm hay mùng 1, người dân thường đốt giấy tiền vàng mã rồi đem tro còn mồi lửa đổ vào thùng rác khiến thùng rác cháy rất nhiều, khi chúng tôi đi vệ sinh phát hiện thì thùng đã cháy lủng, không những thiệt hại tài sản mà còn gây nguy hiểm đến môi trường và công tác phòng chống cháy nổ . Trong dịp Tết Nguyên Đán năm 2021 có hơn 10 chiêc thùng rác ở bờ Bắc nơi tôi làm bị hư hỏng, tôi mong rằng mọi người dân hãy nâng cao ý thức, thực hiện đốt vàng mã đúng cách và lưu ý không đổ rác còn mồi lửa vào thùng rác." Là lời tâm sự của anh H công nhân muốn nhắn gởi đến tất cả mọi người dân.</p>

<p>Xin hãy cùng nâng cao nếp sống văn minh đô thị, nâng cao ý thức bảo vệ môi trường, nhắc nhở đến mọi người thân xung quanh mình hoặc có thể báo với cơ quan chức năng ở địa phương hoặc thông qua trang <a href="https://www.facebook.com/HueIOC?__cft__[0]=AZW4CJxjdGIL3ZMZ9sKj2-fRcBMUrR78YVF90wnfEHqTGQPUk-y-fr2FF0OaqCgFU-lOkZ8S8MlCaxcFaHtYqqyx2nvBqFFIlv06wTNQqiZ0AXvSF7gXfAFMVGVsFnIYFYnrIBx6uJ2ZDPYAyZwvTEzJ&__tn__=-]K-R" tabindex="0">Trung tâm Giám sát, điều hành đô thị thông minh tỉnh Thừa Thiên Huế</a> để lên án các hành vi đổ rác không đúng quy định nhằm góp phần giữ gìn bảo vệ môi trường luôn xanh sạch sáng.Tất cả mọi hành vi vi phạm về quy định bảo vệ môi trường đều bị xử phạt hành chính theo Nghị Định 155/2016/NĐ-CP và Nghị định 55/2021/NĐ-CP về QUY ĐỊNH VỀ XỬ PHẠT VI PHẠM HÀNH CHÍNH TRONG LĨNH VỰC BẢO VỆ MÔI TRƯỜNG.</p>

<p>Mong rằng những chiếc thùng rác sẽ được phát huy hết tác dụng góp phần giữ đẹp cảnh quan, vệ sinh môi trường và không còn cảnh tượng những chiếc thùng rác bị tàn phá do những mồi lửa vô ý thức phá hỏng xuất hiện trên đường phố. <img alt="💚" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t94/1/16/1f49a.png" style="height:16px; width:16px" /></p>

<p>  <img alt="" src="/Public/Upload/images/Tintuc/09-01(6).jpg" style="height:320px; width:240px" />  <img alt="" src="/Public/Upload/images/Tintuc/09-01(2).jpg" style="height:320px; width:240px" /> </p>

<p><img alt="" src="/Public/Upload/images/Tintuc/09-01(3).jpg" style="height:320px; width:240px" />     <img alt="" src="/Public/Upload/images/Tintuc/09-01(7).jpg" style="height:320px; width:240px" /></p>

<p> <img alt="" src="/Public/Upload/images/Tintuc/09-01(1).jpg" style="float:left; height:320px; width:240px" /><img alt="" src="/Public/Upload/images/Tintuc/09-01(6).jpg" style="height:320px; width:240px" />  </p>', N'/uploads/images/09-01_2_.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Những chiếc thùng rác bị hư hỏng vì ý thức của một bộ phần người dân","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Bài thơ gửi các đồng nghiệp', N'07/01/2022 9:44', N'<p>Một bài thơ do anh Lê Quang sáng tác và gởi đến các đồng nghiệp yêu dấu với lời chúc mừng bên thềm năm mới.</p>

<p>Mấy ai biết được tên em.</p>

<p>Hàng cây chen lá,màng đêm đồng hành</p>

<p>Áo màu phản chiếu long lanh</p>

<p>Phố phường tấp nập mình em lặng thầm</p>

<p>Mùa đông giá rét lạnh căm.</p>

<p>Hạ vàng ướt đẫm nhọc nhằn mặn môi.</p>

<p>Bóng đêm đưa mảnh trăng côi.</p>

<p>Sương giăng xào xạc lá rơi lạnh đầy.</p>

<p>Nhịp đều tiếng chổi trên tay.</p>

<p>Đêm khuya yên ắng chìm say giấc nồng.</p>

<p>Xuân về lẳng lặng bên sông.</p>

<p>Như nghe rạo rực trong lòng xuân ơi.</p>

<p>Trong đêm em vẫn rạng ngời.</p>

<p>Viết bài lục bát vạn lời thiết tha</p>

<p>Cảm ơn....đem những vinh hoa.</p>

<p>Huế _xanh _sạch _sáng ,xuân ca sum vầy.</p>

<p>Tác giả Lê Quang - Công nhân Công ty Cổ phần Môi trường và Công trình Đô thị Huế</p>', N'/uploads/images/02-01.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Bài thơ gửi các đồng nghiệp","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Huế những ngày đầu năm 2022', N'05/01/2022 8:38', N'<p>Huế những ngày đầu năm 2022.</p>

<p>Hàng cây cổ thụ dọc tuyến đường Lê Lợi đang dần thay lá. Đâu đó tiếng chổi tre xào xạc xen lẫn tiếng lá khô, bên góc lề đường thấp thoáng bóng dáng người công nhân cần mẫn dưới tiết trời se lạnh mưa phùn rơi của những ngày đông còn sót lại trước khi mùa xuân rực rỡ sắp đến.</p>

<p>Huế mùa nào cũng thơ, cũng rất đỗi bình yên, trầm lắng và đẹp thật đẹp như bao lâu đã từng.</p>

<p>Và càng đẹp thật nhiều hơn khi chúng ta cùng chung tay giữ gìn cho những con đường luôn Xanh – Sạch – Sáng.</p>

<p style="text-align:center"><iframe frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/X334EjPAnhs" title="YouTube video player" width="250"></iframe></p>', N'/uploads/images/01-01_5_.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Huế những ngày đầu năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Chủ Nhật Xanh đầu tiên của năm 2022 ', N'02/01/2022 10:42', N'<p>Chủ Nhật Xanh đầu tiên của năm 2022 <img alt="💚" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t94/1/16/1f49a.png" style="height:16px; width:16px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-01(1).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-01(3).jpg" style="height:601px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-01(4).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-01(5).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-01(6).jpg" style="height:601px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-01.jpg" style="height:600px; width:450px" /></p>', N'/uploads/images/02-01.jpg', N'news', N'{"category":"environment","publishYear":2022,"attachments":[],"images":[],"summary":"Chủ Nhật Xanh đầu tiên của năm 2022 ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thay đổi nhận diện đồng phục', N'01/01/2022 10:38', N'<p>Một màu xanh xanh nhận diện đồng phục mới của Hepco trên khắp nẻo đường thành phố Huế ngày đầu năm mới 2022 <img alt="💚" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t94/1/16/1f49a.png" style="height:16px; width:16px" /></p>

<p>Chúng tôi vẫn đang miệt mài lặng thầm từng ngày từng ngày làm sạch đẹp cho quê hương, mong rằng tất cả mọi người cùng chung tay nâng cao ý thức giữ gìn vệ sinh môi trường, đổ rác đúng nơi, đúng giờ và đúng quy định để Huế ngày càng Xanh - Sạch - Sáng!</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-01(1).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-01(2).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-01(3).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-01.jpg" style="height:600px; width:450px" /></p>', N'/uploads/images/01-01_1_.jpg', N'news', N'{"category":"company_activity","publishYear":2022,"attachments":[],"images":[],"summary":"Thay đổi nhận diện đồng phục","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thừa Thiên Huế triển khai nhiều hoạt động giảm thiểu rác thải nhựa', N'27/11/2021 10:30', N'<p>Thói quen sử dụng rác thải nhựa và túi ni long khó phân hủy khiến môi trường đứng trước nguy cơ ô nhiễm nghiêm trọng. Cùng với các thành phố khác tại Việt Nam, Thừa Thiên Huế cũng đang có nhiều hoạt động thiết thực trong phong trào giảm thiểu rác thải nhựa.</p>

<p>Ngày 02/03/2021, UBND tỉnh Thừa Thiên Huế đã ban hành Chỉ thị số 09/CT-UBND về tăng cường quản lý và giảm thiểu chất thải nhựa trên địa bàn tỉnh Thừa Thiên Huế. Chỉ thị yêu cầu giám đốc, thủ trưởng các sở ban ngành, các tổ chức, đoàn thể chính trị xã hội cấp tỉnh, UBND các huyện, thị xã và thành phố Huế xây dựng kế hoạch, kế hoạch tự kiểm tra về giảm thiểu, phân loại, thu gom, tái sử dụng, tái chế và xử lý chất thải nhựa trong đơn vị, đơn vị trực thuộc và thực hiện một số các hoạt động cụ thể như sau: Tiếp tục phát huy, lan tỏa phong trào "Ngày Chủ nhật xanh”, "Nói không với túi ni lông và sản phẩm nhựa sử dụng một lần” theo nội dung tại Kế hoạch số 34/KH-UBND ngày 26/02/2019 về việc thực hiện phong trào "Nói không với túi ni lông sử dụng một lần”; Kế hoạch số 41/KH-UBND ngày 04/3/2019 về việc tổ chức, triển khai thực hiện Đề án Ngày Chủ nhật xanh "Hãy hành động để Thừa Thiên Huế thêm Xanh - Sạch - Sáng”;</p>

<p>Ngày 11 tháng 11 năm 2021, tỉnh Thừa Thiên Huế và Tổ chức Quốc tế về bảo tồn thiên nhiên (WWF) – Việt Nam đã tổ chức lễ công bố và Hội thảo Khởi động Dự án Dự án "Huế - Đô thị giảm nhựa ở miền Trung Việt Nam”. Đây là một trong những hoạt động cụ thể thực hiện Chỉ thị 09. Dự án nhằm mục tiêu hỗ trợ TP. Huế bảo vệ các dòng sông và hệ sinh thái các vùng đất ngập nước và ven biển không bị ô nhiễm bởi rác thải nhựa, thông qua một loạt các biện pháp can thiệp với sự tham gia của các bên liên quan bao gồm các khối công tư, các tổ chức xã hội dân sự và cộng đồng địa phương. Kết quả mong đợi là đến năm 2024, Huế trở thành Đô thị giảm nhựa với 70% chất thải rắn được phân loại tại nguồn, thu gom và xử lý, đồng thời rác tái chế từ bãi chôn lấp được đẩy mạnh thu hồi.</p>

<p>Hiện tại giữa PRO Việt Nam và Công ty Môi trường và Công trình Đô thị Huế (HEPCO) đang triển khai chương trình truyền thông "Nâng cao nhận thức, thay đổi hành vi của cộng đồng trong việc phân loại, tái sử dụng và tái chế rác thải nhằm thúc đẩy mô hình kinh tế tuần hoàn hướng đến phát triển bền vững”.</p>

<p>Tại TP Huế, Chương trình sẽ thực hiện các hoạt động truyền thông trực tiếp tới các hộ gia đình, cơ quan, trường học và truyền thông gián tiếp qua các tin bài đăng trên truyền hình, website, fanpage, báo in, báo điện tử, đồng bộ với chương trình kế hoạch phân loại chất thải rắn tại nguồn trên địa bàn của UBND Thành phố Huế.</p>

<p>𝑿𝒆𝒎 𝒕𝒉𝒆̂𝒎 𝒕𝒂̣𝒊: <a href="https://l.facebook.com/l.php?u=http%3A%2F%2Fquanly.moitruongvadothi.vn%2F29%2F12834%2FThua-Thien-Hue-trien-khai-nhieu-hoat-dong-giam-thieu-rac-thai-nhua.aspx%3Ffbclid%3DIwAR3CwJ8LSDGAEor8dlc75s_c0Jw5fMDmS2PdUjNStgBt7AeP_qRGEMt0-BQ&h=AT3e0kKerB6Clyy4jkegwtX__WEnwMOG3ZR4C8YRorcDkxuyj74pwSmJ8kqtwH7w9J7LEBnV5f2F4I0WXHroOFZAws58Q2KWD_kBzcJDTbMw4W6Gzp-zKRs5bAdCUPm1uWzj&__tn__=-UK-R&c[0]=AT3EEb0hkJbCGz2lnZk445t7tUkWaWm1hN-Y4_SequdSWK6LZlFi0YDqkVUBh3TnVeA1pUun5fdbCx1XtzKLH7OYxOZb0ELgjMwiCz3nlVmbqhRfwcgw0hluEdjm1yO5_tcktOP11xxPqrXAf7UZHmnUAv_NwXMfwwnPcp_Os1wg3SE" rel="nofollow noopener" tabindex="0" target="_blank">http://quanly.moitruongvadothi.vn/.../Thua-Thien-Hue...</a></p>', N'/uploads/images/27-11.png', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thừa Thiên Huế triển khai nhiều hoạt động giảm thiểu rác thải nhựa","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'3 phương thức thanh toán tiền dịch vụ vệ sinh môi trường an toàn, nhanh chóng trong mùa dịch', N'25/11/2021 8:00', N'<p>Nhằm bảo đảm an toàn cho khách hàng trong mùa dịch, lại vừa tiết kiệm được thời gian thanh toán, Hepco xin gửi đến Quý khách hàng 3 phương thức thanh toán toán đã được công ty Cổ phần Môi trường Đô thị Huế (HEPCO) thực hiện để tối ưu nhất cho khách hàng.</p>

<p><img alt="1️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t7a/1/16/31_20e3.png" style="height:16px; width:16px" /> Thanh toán qua VNPT Pay (chi tiết xem tại: <a href="https://www.facebook.com/VNPTPay/posts/1635368949988234?__cft__[0]=AZX18sgZSitthFQHduU9HoQjHasnIMvkCcb3X72DnKxq8lX7nXeR1vABLrTjWI9rAoFcm_SnslofFkYsHLUziESC1JPn0e3R8GgW0m8MWxVl84RVRljT0ExI4KFeeIvyuGVBSgZsOYWBb1ccLSKpXsl6&__tn__=-UK-R" tabindex="0">https://www.facebook.com/VNPTPay/posts/1635368949988234</a>)</p>

<p><img alt="2️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t99/1/16/32_20e3.png" style="height:16px; width:16px" /> Thanh toán qua bằng ví điện tử Momo (chi tiết xem tại: <a href="https://www.facebook.com/hepco.com.vn/posts/1590505591138564?__cft__[0]=AZX18sgZSitthFQHduU9HoQjHasnIMvkCcb3X72DnKxq8lX7nXeR1vABLrTjWI9rAoFcm_SnslofFkYsHLUziESC1JPn0e3R8GgW0m8MWxVl84RVRljT0ExI4KFeeIvyuGVBSgZsOYWBb1ccLSKpXsl6&__tn__=-UK-R" tabindex="0">https://www.facebook.com/hepco.com.vn/posts/1590505591138564</a></p>

<p><img alt="3️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb8/1/16/33_20e3.png" style="height:16px; width:16px" /> Thanh toán qua Viettel Pay (chi tiết xem tại: <a href="https://www.facebook.com/hepco.com.vn/posts/1689920744530381?__cft__[0]=AZX18sgZSitthFQHduU9HoQjHasnIMvkCcb3X72DnKxq8lX7nXeR1vABLrTjWI9rAoFcm_SnslofFkYsHLUziESC1JPn0e3R8GgW0m8MWxVl84RVRljT0ExI4KFeeIvyuGVBSgZsOYWBb1ccLSKpXsl6&__tn__=-UK-R" tabindex="0">https://www.facebook.com/hepco.com.vn/posts/1689920744530381</a> )</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Không cần ra khỏi nhà, chỉ với vài thao tác, thanh toán phí dịch vụ vệ sinh môi trường đơn giản và dễ dàng hơn rất nhiều!</p>', N'/uploads/images/25-11.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"3 phương thức thanh toán tiền dịch vụ vệ sinh môi trường an toàn, nhanh chóng trong mùa dịch","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Lan tỏa hành động đẹp, hẹn ngày chiến thắng', N'24/11/2021 9:54', N'<p>Công ty Cổ phần Môi trường và Công trình Đô thị Huế (Hepco) chân thành cảm ơn tấm lòng của Ngân hàng Thương mại Cổ phần Á Châu tại thành phố Hồ Chí Minh đã trao tặng 1000 bộ quần áo y tế đến cán bộ, nhân viên của Hepco.</p>

<p>Đồng hành cùng với các lực lượng tham gia phòng, chống dịch bệnh Covid -19, đội ngũ nhân viên của Hepco cũng đang ngày đêm thực hiện công tác thu gom, xử lý rác thải y tế có nguy cơ lây nhiễm dịch bệnh cho tất cả các bệnh viện, các khu cách ly y tế tập trung, các khu vực bị phong tỏa cách ly trên địa bàn tỉnh Thừa Thiên Huế.</p>

<p>Món quà là 1000 bộ quần áo y tế bảo hộ chính là động lực to lớn giúp đội ngũ nhân viên Hepco không ngừng cố gắng thực hiện công việc tốt hơn mỗi ngày.</p>

<p>Một lần nữa, Hepco cảm ơn sự sẻ chia của Ngân hàng Thương mại Cổ phần Á Châu tại thành phố Hồ Chí Minh!</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-11.jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-11(1).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-11(2).jpg" style="height:450px; width:638px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-11(3).jpg" style="height:400px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/24-11(4).jpg" style="height:437px; width:640px" /></p>', N'/uploads/images/24-11_5_.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Lan tỏa hành động đẹp, hẹn ngày chiến thắng","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thu gom rác COVID-19 tại các khu phong tỏa', N'11/22/2021 7:55', N'<p><a href="https://baothuathienhue.vn/thu-gom-rac-covid-19-tai-cac-khu-phong-toa-a106924.html?fbclid=IwAR1gjy58-_RLKvcl63HnA0Jj74ZQT91IpolpAqHCFoS4IDt50cgTcnohLlo" target="_blank">Thu gom rác COVID-19 tại các khu phong tỏa</a></p>', N'/uploads/images/thu-gom.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thu gom rác COVID-19 tại các khu phong tỏa","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ', N'07/11/2021 10:11', N'<p>Hiện tại khu vực Cồn Hến - phường Vỹ Dạ đang thực hiện phương án phong toả tạm thời với dân số gần 5.000 người dân để khoanh vùng, truy vết và khống chế ổ dịch do có các ca nhiễm covid-19. Trước tình hình đó, công tác thu gom rác tại khu vực này được kích hoạt ngay bằng phương án thu gom rác covid-19 đã được Hepco xây dựng sẵn kế hoạch ứng phó khi tình hình covid-19 diễn ra phức tạp.</p>

<p>Hepco sử dụng nhân lực tại chỗ là công nhân đang sống trên địa bàn khu vực ( không phải là F1, F2) được trang bị đầy đủ bảo hộ y tế chuyên dụng thực hiện công tác thu gom. Tại đây 30 thùng rác chuyên biệt dùng để chứa rác covid được đặt dọc tuyến đường Ưng Bình sẽ được thu gom vận chuyển bằng xe điện đến điểm tập kết thùng. Ngay chân cầu Phú Lưu khu vực chốt phong toả , xe chuyên dụng chuyên chở rác Covid của Hepco với công nhân được trang bị đầy đủ bảo hộ y tế, dụng cụ xịt khử khuẩn sẽ thao tác lấy rác và vận chuyển đến khu vực xử lý. Rác có nguy cơ chứa virus SARS-cov-2 sẽ được xử lý theo đúng quy trình theo quy định. Toàn bộ các khâu trong quy trình thu gom, vận chuyển, xử lý đều được khun khử khuẩn tại mỗi giai đoạn nhằm đảm bảo an toàn tuyệt đối cho công nhân và môi trường.</p>

<p>Từ năm 2020 khi dịch Covid-19 bùng phát trên địa bàn tỉnh Thừa Thiên Huế, Hepco là đơn vị chuyên thu gom vận chuyển và xử lý rác có liên quan đến Covid-19, bên cạnh đó phải đảm bảo tốt công tác thường xuyên thu gom vận chuyển xử lý rác sinh hoạt trên địa bàn thành phố Huế và các huyện, thị xã trên địa bàn tỉnh Thừa Thiên Huế. Với sự quan tâm động viên chỉ đạo của các cấp chính quyền, sự nỗ lực bền bỉ xuyên suốt của tập thể cán bộ người lao động Hepco thì mọi khó khăn, mọi nhiệm vụ đều sẽ vượt qua và hoàn thành với sự quyết tâm cao nhất.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/7-11.jpg" style="height:425px; width:900px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/7-11(1).jpg" style="height:425px; width:900px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/7-11(2).jpg" style="height:425px; width:900px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/7-11(3).jpg" style="height:1200px; width:900px" /></p>', N'/uploads/images/7-11.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Kích hoạt phương án thu gom rác COVID-19 tại khu phong tỏa Cồn Hến - Phường Vỹ Dạ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo nhắc lại giờ thu gom rác ban đêm vào mùa đông', N'31/10/2021 08:50', N'<p>Chi tiết lịch trình thu gom tại: <a href="http://www.hepco.com.vn/Tintuc/Lich-trinh-ve-sinh-thu-gom-rac-tai-cac-phuong-thuoc-ia-ban-thanh-pho-Hue_22?fbclid=IwAR1LkFwwlUWI_OsX1J48knvr2YCVltoQ2Oq4NfBOlziQBvEF1x-E8H6Jb0I" rel="nofollow noopener" tabindex="0" target="_blank">http://www.hepco.com.vn/.../Lich-trinh-ve-sinh-thu-gom...</a></p>

<p><img alt="" src="/Public/Upload/images/Tintuc/31-10.jpg" style="height:512px; width:800px" /></p>', N'/uploads/images/31-10.jpg', N'announcement', N'{"category":"announcement","publishYear":2021,"attachments":[],"images":[],"summary":"Thông báo nhắc lại giờ thu gom rác ban đêm vào mùa đông","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Chủ động xử lý thoát nước, vệ sinh, chiếu sáng mùa bão lụt', N'29/10/2021 10:22', N'<p><a href="https://baothuathienhue.vn/chu-dong-xu-ly-thoat-nuoc-ve-sinh-chieu-sang-mua-bao-lut-a106148.html?zarsrc=30&utm_source=zalo&utm_medium=zalo&utm_campaign=zalo&fbclid=IwAR0fY1hkcx2E_mC7rOLM7qO5h7hxKIusmfV58SCwIJr4dTPGksHn_nczNYo">Chủ động xử lý thoát nước, vệ sinh, chiếu sáng mùa bão lụt</a></p>', N'/uploads/images/chu_dong.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Chủ động xử lý thoát nước, vệ sinh, chiếu sáng mùa bão lụt","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nâng cao nhận thức, thay đổi hành vi cộng đồng về phân loại rác', N'23/09/2021 8:56', N'<p>Hiệp hội Môi trường đô thị và Khu công nghiệp Việt Nam, Tạp chí Môi trường và Đô thị Việt Nam và Liên minh tái chế bao bì Việt Nam (PRO Việt Nam) đang phối hợp triển khai Chương trình truyền thông "Nâng cao nhận thức, thay đổi hành vi của cộng đồng trong việc phân loại, tái sử dụng và tái chế rác thải nhằm thúc đẩy mô hình kinh tế tuần hoàn hướng đến phát triển bền vững”.</p>

<p><a href="http://quanly.moitruongvadothi.vn/29/12498/Nang_cao_nhan_thuc_thay_doi_hanh_vi_cong_dong_ve_phan_loai_rac.aspx?fbclid=IwAR3jHE3IFofoVnjt78p0x3r0WPFiIdwJI6H1fuNHhGtr9TiJtdGn5OsM_FM" target="_blank">quanly.moitruongvadothi.vn/Nang_cao_nhan_thuc_thay_doi_hanh_vi_cong_dong_ve_phan_loai_rac</a></p>', N'/uploads/images/22-09_1_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Nâng cao nhận thức, thay đổi hành vi cộng đồng về phân loại rác","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Những công việc thầm lặng thời COVID-19!', N'22/09/2021 10:52', N'<p>Những công việc thầm lặng thời COVID-19!</p>

<p><a href="https://baotainguyenmoitruong.vn/thua-thien-hue-nhung-cong-viec-tham-lang-thoi-covid-19-331107.html" target="_blank">https://baotainguyenmoitruong.vn/thua-thien-hue-nhung-cong-viec-tham-lang-thoi-covid-19</a></p>', N'/uploads/images/22-09.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Những công việc thầm lặng thời COVID-19!","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Vứt rác khẩu trang bừa bãi dễ lây lan dịch bệnh', N'16/09/2021 10:28', N'<p>Dịch COVID-19 ngày càng phức tạp, nguy cơ lây nhiễm càng cao. Trong khi đó, tình trạng khẩu trang vứt bừa bãi khắp nơi không những gây hình ảnh phản cảm, mất mỹ quan mà còn có nguy cơ cao lây lan dịch bệnh vì vậy ngoài tuân thủ quy định “5K” (khẩu trang, khử khuẩn, không tụ tập, khai báo y tế, khoảng cách) và các biện pháp phòng, chống dịch theo quy định, mỗi người dân cần ý thức bỏ rác khẩu trang đúng nơi quy định và trước khi bỏ vào thùng rác cần được bọc kín, tránh nguy cơ lây lan dịch bệnh ra cộng đồng.</p>

<p>Nguồn: <a href="https://baothuathienhue.vn/vut-rac-khau-trang-bua-bai-de-lay-lan-dich-benh-a103830.html?fbclid=IwAR3qANj_md-KXXSKWZGqTU2I0pxIWdsmRFnqwdh1M0fyb2SQoayPmEQUbsQ" rel="nofollow" target="_blank">https://baothuathienhue.vn/vut-rac-khau-trang-bua-bai-de-la…</a></p>', N'/uploads/images/16-09.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Vứt rác khẩu trang bừa bãi dễ lây lan dịch bệnh","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay', N'26/08/2021 7:55', N'<p><a href="https://www.facebook.com/hashtag/nhanh_ch%C3%B3ng_ti%E1%BB%87n_l%E1%BB%A3i?__eep__=6&__cft__[0]=AZU6Kd5J28GHei8Up5NQPrGRENjyBSP3LMT2Fl8gJ9hoA03fbh6W0KZZP1bRgOySpmDBwHK9TDZD19U4bU_7KY3Pc_u8z1yGGO7YNcK5sY25nRj2PjplWpxqw7ADcQqY_kbPKt9-GuKCv6d0CiBo3ZTN&__tn__=*NK-R" tabindex="0">#NHANH_CHÓNG_TIỆN_LỢI</a> với dịch vụ thu hộ qua ứng dụng <a href="https://www.facebook.com/hashtag/viettelpay?__eep__=6&__cft__[0]=AZU6Kd5J28GHei8Up5NQPrGRENjyBSP3LMT2Fl8gJ9hoA03fbh6W0KZZP1bRgOySpmDBwHK9TDZD19U4bU_7KY3Pc_u8z1yGGO7YNcK5sY25nRj2PjplWpxqw7ADcQqY_kbPKt9-GuKCv6d0CiBo3ZTN&__tn__=*NK-R" tabindex="0">#viettelpay</a> <img alt="‼️" src="https://www.facebook.com/images/emoji.php/v9/t77/1/16/203c.png" style="height:16px; width:16px" /> Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng chỉ mất chưa đến 1 phút đã hoàn thành.</p>

<p>Từ 4/8 Hepco đã triển khai việc thu hộ tiền dịch vụ thu gom, vận chuyển rác qua ứng dụng VIETTELPAY bên cạnh 2 ứng dụng VNPTPAY và MOMO đã triển khai trước đó.</p>

<p>Cùng xem hướng dẫn các bước thực hiện thanh toán trên ứng dụng Viettelpay nhé!</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(7).jpg" style="height:600px; width:277px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(1)(1).jpg" style="height:600px; width:277px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(2)(1).jpg" style="height:600px; width:277px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(3)(1).jpg" style="height:600px; width:277px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(4).jpg" style="height:600px; width:277px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(5).jpg" style="height:600px; width:277px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(6).jpg" style="height:600px; width:277px" /></p>

<p style="text-align:center"> </p>

<p>Hướng dẫn thanh toán momopay <img alt="➡️" src="https://www.facebook.com/images/emoji.php/v9/t9e/1/16/27a1.png" style="height:16px; width:16px" /> <a href="https://www.facebook.com/hepco.com.vn/posts/1615938821928574?__cft__[0]=AZU6Kd5J28GHei8Up5NQPrGRENjyBSP3LMT2Fl8gJ9hoA03fbh6W0KZZP1bRgOySpmDBwHK9TDZD19U4bU_7KY3Pc_u8z1yGGO7YNcK5sY25nRj2PjplWpxqw7ADcQqY_kbPKt9-GuKCv6d0CiBo3ZTN&__tn__=-UK-R" tabindex="0">https://www.facebook.com/109024345953370/posts/1615938821928574/?d=n</a></p>

<p>Hướng dẫn thanh toán vnptpay <img alt="➡️" src="https://www.facebook.com/images/emoji.php/v9/t9e/1/16/27a1.png" style="height:16px; width:16px" /> <a href="https://fb.watch/7BPUKkxUMg/?fbclid=IwAR2a7gp7jjB4TWlE7xbYaVNyT-xPn-pLjBGUauIxSwF4iq6xS9IIOmMpOEs" rel="nofollow noopener" tabindex="0" target="_blank">https://fb.watch/7BPUKkxUMg/</a></p>

<p> </p>

<p> </p>', N'/uploads/images/1.png', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thanh toán tiền dịch vụ thu gom vận chuyển rác nhanh chóng với Viettelpay","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)', N'26/08/2021 7:49', N'<p>Nhằm san sẻ, động viên tinh thần và một phần vật chất nhỏ bé đến cán bộ công nhân viên, người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco), vừa qua Công ty Cổ phần Môi trường và Công trình Đô thị Huế ( Hepco) đã chia sẻ đến đơn vị bạn 3 tấn gạo và 200 thùng mì tôm trị giá hơn 55.000.000 triệu đồng.</p>

<p>Trong tình hình dịch bệnh diễn biến căng thẳng, phức tạp các đơn vị thực hiện công tác thu gom vận chuyển xử lý rác sinh hoạt và rác liên quan đến covid-19 đều đang phải dồn hết nhân lực thiết bị hết sức căng mình thực hiện công việc nhằm hoàn thành nhiệm vụ đảm bảo an toàn phòng chống dịch bệnh. Hy vọng với sự san sẻ, đồng cảm của Hepco sẽ tiếp thêm sức mạnh cho công nhân viên người lao động Citenco có thêm tinh thần, an tâm công tác và vững vàng hơn để vượt qua dịch bệnh hoàn thành tốt nhiệm vụ được giao.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(1).jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(2).jpg" style="height:351px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-08(3).jpg" style="height:768px; width:960px" /></p>', N'/uploads/images/26-08.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"HEPCO chia sẻ khó khăn với người lao động công ty TNHH MTV Môi trường Đô thị Thành phố Hồ Chí Minh ( Citenco)","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly', N'23/08/2021 9:38', N'<p>Công tác tổng vệ sinh quanh khu vực bên ngoài các khu cách ly nhằm đảm bảo vệ sinh môi trường vẫn được duy trì hàng tuần bên cạnh công tác tổng vệ sinh trên địa bàn toàn thành phố ngày Chủ Nhật Xanh 23/8/2021</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08.jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(1).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(2).jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(3).jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(4).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(5).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(6).jpg" style="height:600px; width:450px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(7).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/23-08(8).jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"> </p>', N'/uploads/images/23-08_3_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Đảm bảo vệ sinh môi trường  khu vực bên ngoài các khu cách ly","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Việt Nam thức giấc | #VTV1 Những công nhân vệ sinh môi trường thu gom rác thải trong khu cách ly', N'16/08/2021 10:09', N'<p>Công việc thu gom rác thải trong các khu cách ly diễn ra như thế nào? Cùng theo dõi phóng sự sau để thấu hiểu, đồng cảm, và sẻ chia với các công nhân HEPCO các bạn nhé!</p>

<p style="text-align:center"><iframe align="middle" frameborder="0" height="320" scrolling="no" src="https://www.youtube.com/embed/KQ06Q21cMeQ" title="YouTube video player" width="600"></iframe></p>

<p> </p>', N'/uploads/images/VTV1.png', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Việt Nam thức giấc | #VTV1 Những công nhân vệ sinh môi trường thu gom rác thải trong khu cách ly","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Chủ Nhật Xanh 8/8/2021', N'13/08/2021 10:03', N'<p>Công tác tổng vệ sinh quanh khu vực bên ngoài các khu cách ly nhằm đảm bảo vệ sinh môi trường, ra quân tổng vệ sinh trên địa bàn toàn thành phố ngày Chủ Nhật Xanh 8/8/2021</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-08.jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-08(1).jpg" style="height:800px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-08(2).jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-08(3).jpg" style="height:800px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-08(5).jpg" style="height:800px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-08(8).jpg" style="height:800px; width:600px" /></p>

<p style="text-align:center"> </p>', N'/uploads/images/13-08_4_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Chủ Nhật Xanh 8/8/2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO', N'12/08/2021 15:29', N'<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Thanh toán tiền vệ sinh môi trường qua MOMO nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn trong mùa dịch tiện lợi, an toàn, nhanh chóng!</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Tặng riêng cho khách hàng nhận thông báo trên app MoMo combo 3 thẻ quà tổng 40.000đ thanh toán nhiều loại hóa đơn. Có MoMo vừa tiện, vừa lợi, quét hóa đơn thôi!</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Thời gian diễn ra chương trình: Từ 09/08/2021 đến 09/09/2021.</span></span></span></span></p>

<p><img src="/Public/Upload/images/image-20210812153107-13.png" style="height:16px; width:16px" /><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Đối tượng tham gia: Dành riêng cho khách hàng CHƯA TỪNG thanh toán hóa đơn và nhận được thông báo chương trình qua ứng dụng MoMo.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Chi tiết combo thẻ quà:</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Thẻ quà 20.000đ khi lần đầu thanh toán hóa đơn Điện/ Nước.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Thẻ quà 10.000đ khi lần đầu thanh toán hóa đơn Internet/Truyền hình/Điện thoại</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">trả sau/Chung cư/Học phí/Tiền vệ sinh môi trường.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Thẻ quà 10.000đ cho lần thanh toán hóa đơn bất kỳ tiếp theo vào tháng sau (Thẻ</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">quà có hiệu lực sau 25 ngày nhận combo quà).</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Điều kiện và điều khoản</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Chương trình áp dụng cho khách hàng đang liên kết Ví MoMo với tài khoản ngân hàng và đã xác thực/định danh tài khoản ví điện tử.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Chương trình áp dụng cho khách hàng chưa từng thanh toán hóa đơn trên MoMo.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Trường hợp giá trị thanh toán không sử dụng hết giá trị thẻ quà, Ví MoMo sẽ không</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">hoàn lại tiền chênh lệch.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Mỗi thẻ quà không được chuyển nhượng và không áp dụng đồng thời với các thẻ</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">quà tặng khác.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Mỗi thẻ quà tặng chỉ áp dụng cho 01 lần, không có giá trị quy đổi thành tiền mặt.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● Ví MoMo có quyền thu hồi các thẻ quà đối với các trường hợp có dấu hiệu gian lận</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">hoặc lợi dụng chương trình khuyến mại để trục lợi.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">● (*) Số lượng thẻ quà có hạn. Chương trình có thể kết thúc trước thời hạn nếu hết ngân sách.</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Mọi thắc mắc về việc thanh toán, người dùng có thể liên hệ qua:</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Hotline: 1900 545441 (1.000đ/phút).</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Trung tâm Trợ Giúp: Đăng nhập MoMo >> Ví của tôi >> Trợ giúp hoặc nhập từ khóa "trợ giúp" vào ô tìm kiếm (Miễn phí).</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif">Email: hotro@momo.vn (Miễn phí).</span></span></span></span></p>

<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif"><img alt="" src="/Public/Upload/images/Tintuc/12-08.jpg" style="height:206px; width:420px" /></span></span></span></span></p>

<p style="text-align:center"><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="font-size:12.0pt"><span style="font-family:"inherit",serif"><img alt="" src="/Public/Upload/images/Tintuc/12-08(1).jpg" style="height:900px; width:600px" /></span></span></span></span></p>', N'/uploads/images/12-08.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Nhận ngay thẻ quà giảm 40K “nhẹ gánh” hóa đơn vệ sinh môi trường trong mùa dịch qua MOMO","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc', N'01/08/2021 09:56', N'<p>Chốt y tế số 4, thị trấn Lăng Cô huyện Phú Lộc là địa điểm kiểm soát người và phương tiện ô tô, xe chở khách đi ngang qua địa bàn tỉnh hoặc đi vào tỉnh Thừa Thiên Huế. Trong những ngày qua, khu vực này tập trung hàng nghìn lượt người đợi để làm các thủ tục để được đi vào hoặc đi qua địa bàn.</p>

<p>Nhằm đảm bảo vệ sinh môi trường, tránh lây lan dịch bệnh đảm bảo an toàn phòng chống dịch ngày 1/8/2021 Hepco đã huy động 20 công nhân được trang bị đầy đủ áo quần phòng chống dịch, dung dịch phun khử khuẩn cùng các phương tiện thiết bị tiến hành tổng vệ sinh tại chốt y tế số 4. Nhóm công nhân được bố trí xe riêng, xịt phun khử khuẩn toàn thân sau khi thực hiện nhiệm vụ, việc đảm bảo an toàn cho người lao động là tôn chỉ được đặt lên hàng đầu.</p>

<p>Bên cạnh thực hiện các nhiệm vụ thường xuyên nhằm đảo bảo vệ sinh trên địa bàn thành phố Huế, thời gian qua Hepco đã liên tục bố trí phương tiện thiết bị và lao động tăng ca tăng kip 24/7 liên tục căng mình thực hiện công tác thu gom vận chuyển và xử lý rác có nguy cơ chứa virut Sars-nCov tại các điểm cách ly, chốt kiểm soát trên địa bàn với số lượng lên tới 49 điểm.</p>

<p>Tình hình dịch diễn biến ngày mỗi phức tạp, hãy Cùng chung tay phòng chống dịch Covid -19, nghiêm chỉnh thực hiện "5K: Khẩu trang – Khử khuẩn – Khoảng cách – Không tập trung – Khai báo y tế" để giữ an toàn cho Bạn và Chúng ta trước đại dịch COVID-19</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-08(1).jpg" style="height:600px; width:511px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-08(2).jpg" style="height:500px; width:667px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-08(3).jpg" style="height:400px; width:533px" /></p>

<p style="text-align:center"><img alt="" src="00-08" /><img alt="" src="/Public/Upload/images/Tintuc/01-08(4).jpg" style="height:450px; width:613px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-08(7).jpg" style="height:600px; width:800px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-08(9).jpg" style="height:600px; width:800px" /></p>', N'/uploads/images/01-08.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Công tác tổng vệ sinh tại chốt kiểm tra y tế huyện Phú Lộc","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19', N'31/07/2021 20:58', N'<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/31-07.jpg" style="height:960px; width:646px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/31-07(1).jpg" style="height:960px; width:638px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/31-07(2).jpg" style="height:960px; width:618px" /></p>', N'/uploads/images/31-07.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"CÔNG ĐIỆN của Thủ tướng Chính phủ về phòng chống dịch COVID-19","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.', N'30/07/2021 09:58', N'<p>Trong những ngày vừa qua, công dân trở về từ vùng dịch ngày mỗi tăng và các khu cách ly được mở rộng trên địa bàn toàn tỉnh. Công tác chuẩn bị từ cơ sở vật chất đến các yếu tố đảm bảo các yêu cầu phòng chống dịch tại các khu cách ly được chú trọng, đặc biệt công tác vệ sinh, thu gom rác đảm bảo an toàn được đặt lên hàng đầu. Hiện tại Hepco đang tiến hành đặt thùng rác chuyên dụng riêng biệt, thu gom, vận chuyển, xử lý rác có nguy cơ tại 19 điểm chốt và khu cách ly trên địa bàn toàn tỉnh và đang tiếp tục tăng lên 39 điểm trong ngày 29/7.</p>

<p>Cùng với các lực lượng khác đang căng mình chống dịch và dập dịch, lực lượng cán bộ công nhân viên của Hepco đang ngày đêm không ngại khó khăn cố gắng hoàn thành nhiệm vụ mong dịch bệnh sớm đẩy lùi, bình an sớm đến với tất cả mọi người.</p>

<p>Cùng chung tay phòng chống dịch Covid -19, nghiêm chỉnh thực hiện "5K: Khẩu trang – Khử khuẩn – Khoảng cách – Không tập trung – Khai báo y tế" để giữ an toàn cho Bạn và Chúng ta trước đại dịch COVID-19.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/30-07(3).jpg" style="height:300px; width:225px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/30-07(2).jpg" style="height:250px; width:334px" /></p>', N'/uploads/images/30-07.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Công tác thu gom vận chuyển và xử lý chất thải có nguy cơ chứa Sars-CoV-2 tại các khu cách ly trên địa bàn tỉnh Thừa Thiên Huế.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'An toàn thu gom và xử lý rác tại các khu cách ly', N'28/07/2021 14:33', N'<p>Công tác thu gom vận chuyển xử lý rác thải tại các khu cách ly. Cơ sở y tế đang được HEPCO căng mình thực hiện.</p>

<p><a href="https://baothuathienhue.vn/an-toan-thu-gom-va-xu-ly-rac-tai-cac-khu-cach-ly-a102525.html?fbclid=IwAR1VqZvehpExioJifA_ewHlElYUv3GtX-MEtmj4An2BPuxgFvLPnEXMQJg4" target="_blank">An toàn thu gom và xử lý rác tại các khu cách ly</a></p>

<p><em>Nguồn: Báo Thừa Thiên Huế</em></p>', N'/uploads/images/28-07.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"An toàn thu gom và xử lý rác tại các khu cách ly","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nhặt rác bằng xe đạp điện trợ lực', N'25/06/2021', N'<pre style="text-align:center">

<iframe frameborder="0" height="474" scrolling="no" src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fhepco.com.vn%2Fvideos%2F1104470516743568%2F&width=500&show_text=true&appId=1103931966641749&height=474" style="border:none;overflow:hidden" width="500"></iframe></pre>

<p>Những con đường ở Huế có sạch, đẹp hơn là có một phần công sức của người công nhân vệ sinh môi trường. Phần còn lại rất kính mong toàn thể mọi người dân chấp hành đổ rác đúng giờ - đúng nơi quy định và tuân thủ các quy định về bảo vệ môi trường. Tất cả chúng ta hãy cùng nổ lực vì một Huế luôn Xanh - Sạch - Sáng!</p>

<p><a href="https://laodong.vn/video/theo-chan-biet-doi-nhat-rac-bang-xe-dap-918481.ldo?zarsrc=31&utm_source=zalo&utm_medium=zalo&utm_campaign=zalo&fbclid=IwAR1aM2VunR12YZV7tIxY0vvm2vR1ce3hjtwb6jHdtvMmPhSz6eeMY_Z1x0w" rel="nofollow noopener" tabindex="0" target="_blank">https://laodong.vn/.../theo-chan-biet-doi-nhat-rac-bang...</a></p>', N'/uploads/images/02-06_2_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Nhặt rác bằng xe đạp điện trợ lực","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công ty Cổ phần Môi trường và Công trình Đô Thị Huế thực hiện thu gom, vận chuyển và xử lý rác thải tại các khu vực cách ly trên địa bàn', N'19/06/2021', N'<p style="text-align:center"><iframe frameborder="0" height="282" scrolling="no" src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FTRT.COM.VN%2Fvideos%2F820405748914719%2F&width=500&show_text=false&appId=1103931966641749&height=282" style="border:none;overflow:hidden" width="500"></iframe></p>

<p>Nhằm ngăn chặn sự lây lan của dịch bệnh Covid -19, tỉnh TT Huế đã lập một số điểm cách ly tập trung cũng như cách ly tại nơi cư trú đối với một số trường hợp. Để đảm bảo an toàn, không để phát tán mầm bệnh, Cty cổ phần môi trường và công trình đô thị Huế ( Hepco) đã thực hiện thu gom, vận chuyển và xử lý rác thải tại các khu vực cách ly trên địa bàn theo quy trình nghiêm ngặt của Bộ Y tế.</p>

<p><em>Nguồn: <a href="https://www.facebook.com/TRT.COM.VN/videos/820405748914719" target="_blank">Đài Phát thanh và Truyền hình Thừa Thiên Huế - TRT</a></em></p>', N'/uploads/images/13-05_2_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Công ty Cổ phần Môi trường và Công trình Đô Thị Huế thực hiện thu gom, vận chuyển và xử lý rác thải tại các khu vực cách ly trên địa bàn","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.', N'18/06/2021', N'<p>Nhằm phát huy truyền thống tốt đẹp của dân tộc Việt Nam, tinh thần tương thân tương ái, tạo sức mạnh đại đoàn kết dân tộc để chiến thắng dịch bệnh và chia sẻ cùng cộng đồng, công ty Cổ phần Môi trường và Công trình Đô thị Huế đã trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.</p>

<p>Cùng với các lực lượng tuyến đầu phòng chống dịch, Hepco đã đang thực hiện công tác thu gom vận chuyển xử lý rác thải liên quan đến dịch bệnh covid -19 góp phần đảm bảo an toàn trong việc phòng chống dịch bệnh. Với sự lãnh đạo quyết liệt của Đảng, Nhà nước và sự đồng lòng quyết tâm của toàn bộ tầng lớp Nhân dân, dịch bệnh sẽ sớm đẩy lùi và được dập tan, cuộc sống người dân sẽ sớm được trở lại bình thường.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-06.jpg" style="height:559px; width:420px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-06(2).jpg" style="height:559px; width:420px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-06(3).jpg" style="height:315px; width:420px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/18-06(4).jpg" style="height:560px; width:420px" /></p>', N'/uploads/images/18-06.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Công ty Cổ phần Môi trường và Công trình Đô thị Huế trao 30.000.000 triệu đồng ủng hộ phòng, chống Covid-19 tại UBMT TQ Việt Nam thành phố Huế.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Hạn chế đồ dùng nhựa một lần: Biện pháp nào thay thế?', N'10/06/2021', N'<p>Vật liệu nhựa mang lại sự tiện lợi nhưng cũng kèm theo đó là muôn vàn nguy hiểm đối với sức khỏe và môi trường. Theo nhiều nghiên cứu đã chứng minh: "Phải mất đến 100 - 1000 năm rải thải nhựa mới có thể phân hủy hoàn toàn"</p>

<p>Trong quá trình phân hủy, rác thải nhựa làm mất cân bằng hệ sinh thái, ô nhiễm môi trường, ảnh hưởng đến sự sống và tồn tại của nhiều loài sinh vật. khi chôn lấp làm lòng đất không giữ được nước, gây ra lũ lụt, xói mòn. Ngoài ra vật liệu nhựa tạo ra dioxin và furan làm giảm khả năng miễn dịch, rối loạn nội tiết tố, ung thư,...</p>

<p><img alt="♻" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Năm 2019, Thủ tướng Chính phủ đã phát động phong trào chống chất thải nhựa trên toàn quốc, nhiều cơ quan, tổ chức, địa phương, doanh nghiệp và các cá nhân đã có nhiều hành động thiết thực, ý nghĩa, hiệu quả để chống, giảm thiểu chất thải nhựa.</p>

<p>Vậy biện pháp nào giúp hạn chế tối đa việc sử dụng các đồ dùng nhựa, cùng HEPCO liệt kê và chia sẻ rộng rãi hơn để toàn dân được biết và áp dụng vào đời sống các bạn nhé!</p>

<p>1. Sử dụng các dụng cụ ăn uống bằng gỗ (thìa, đũa, dĩa...)</p>

<p>2. Sử dụng các sản phẩm hộp đựng thân thiện với môi trường</p>

<p>3. Nói KHÔNG với túi Ni-lông</p>

<p>4. Mang theo túi đựng riêng khi đi mua sắm (túi vải, cói...)</p>

<p>5. Hạn chế sử dụng sản phẩm nhựa dùng một lần (ống hút, chai nhựa...)</p>

<p>6. Phân loại rác thải tại nguồn</p>

<p>Hành động nhỏ góp phần chung tay bảo vệ môi trường, gìn giữ hệ sinh thái. Hãy cùng chung tay vì môi trường Xanh - Sạch - Đẹp ngay hôm nay!</p>

<p>Nguồn tham khảo: <a href="http://baochinhphu.vn/?fbclid=IwAR2RWhv0OTpLJkJh95jcqq3OMOAg87l07dvrLtyVDCG-xeUPbmJdfVPI-VY" rel="nofollow noopener" tabindex="0" target="_blank">http://baochinhphu.vn/</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/10-06.jpg" style="height:322px; width:480px" /></p>', N'/uploads/images/10-06.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Hạn chế đồ dùng nhựa một lần: Biện pháp nào thay thế?","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thừa Thiên – Huế: Gần 15 tỷ đồng đầu tư mở rộng bãi chôn lấp rác Thủy Phương (Tin bài: Báo Xây dựng)', N'29/05/2021', N'<p><a href="https://baoxaydung.com.vn/thua-thien-hue-gan-15-ty-dong-dau-tu-mo-rong-bai-chon-lap-rac-thuy-phuong-306659.html" target="_blank">Thừa Thiên – Huế: Gần 15 tỷ đồng đầu tư mở rộng bãi chôn lấp rác Thủy Phương</a></p>

<p><em>Nguồn: Báo xây dựng</em></p>', N'/uploads/images/29-05.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thừa Thiên – Huế: Gần 15 tỷ đồng đầu tư mở rộng bãi chôn lấp rác Thủy Phương (Tin bài: Báo Xây dựng)","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông tin dự án khởi công: Dự án mở rộng, cải tạo bãi chôn lấp chất thải rắn Thủy Phương', N'26/05/2021', N'<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Sáng ngày 24 tháng 5 năm 2021, Công ty Cổ phần Môi trường và Công trình Đô thị Huế </span></span><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">(HEPCO)</span></span><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif"> đã tiến hành khởi công công trình Bãi chôn lấp rác số 3 Thủy Phương thuộc công trình thuộc Dự án "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương"</span></span></span></p>

<p style="text-align:center"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif"><img alt="" src="/Public/Upload/images/Tintuc/25-06(2).jpg" style="height:509px; width:620px" /></span></span></span></p>

<p style="text-align:center"><span style="color:#000000"><strong><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">THÔNG TIN CHUNG VỀ DỰ ÁN</span></span></strong></span></p>

<p style="text-align:justify"><span style="color:#000000"><strong><em><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">1. Sự cần thiết phải đầu tư</span></span></em></strong></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Hiện nay, lượng rác thải sinh hoạt trên địa bàn thành phố Huế, thị xã Hương Thủy, thị xã Hương Trà, huyện Phú Lộc và huyện Phú Vang có khối lượng bình quân khoảng gần 500 tấn/ngày, chiếm hơn 80% tổng lượng rác toàn tỉnh. Toàn bộ lượng rác trên được xử lý 100% bằng hình thức chôn lấp hợp vệ sinh tại Bãi chôn lấp rác thải Khu xử lý chất thải rắn Thủy Phương (TX. Hương Thủy). Sau khi Ô chôn lấp số 2, Bãi chôn lấp rác Thủy Phương lấp đầy, trên địa bàn tỉnh Thừa Thiên Huế chưa có cơ sở xử lý rác nào đủ điều kiện để tiếp nhận và xử lý rác đảm bảo tiêu chuẩn quy định.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Trước tình thế bức bách trên, để không bị gián đoạn việc xử lý gần 500 tấn</span></span><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif"> rác/ngày trên địa bàn, đảm bảo vệ sinh môi trường, từ quý II/2020 thực hiện ý kiến chỉ đạo của UBND tỉnh, UBND thành phố đã giao HEPCO làm chủ đầu tư thực hiện Dự án Mở rộng, cải tạo Bãi chôn lấp rác Thủy Phương, đồng thời yêu cầu phối hợp với các đơn vị liên quan khẩn trương lập các thủ tục đầu tư và tổ chức triển khai thực hiện dự án theo quy định. Dự án Mở rộng, cải tạo Bãi chôn lấp rác Thủy Phương nằm trong Khu xử lý chất thải rắn Thuỷ Phương đã được xác định trong quy hoạch chung tổng thể thành phố Huế đến năm 2030 đã được Thủ tướng Chính phủ phê duyệt.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><strong><em><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">2. Căn cứ pháp lý</span></span></em></strong></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Thông báo số 211/TB-UBND ngày 05/6/2020 của UBND Tỉnh về Kết luận của Chủ tịch UBND tỉnh tại cuộc họp ngày 01/6/2020</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Công văn số 7396/UBND-XDCB ngày 17/8/2020 của UBND Tỉnh về việc bổ sung ngân sách thành phố Huế để triển khai thực hiện Mở rộng bãi rác Thủy Phương</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Công văn số 4012/UBND-XD Ngày 21/8/2020 của UBND thành phố Huế về việc thực hiện dự án Mở rộng bãi chôn lấp rác Thủy Phương</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Nghị quyết số 71/NQ-HĐND ngày 29/12/2020 của HĐND thành phố Huế về việc thống nhất chủ trương đầu tư dự án Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Thông báo thu hồi đất để thực hiện dự án Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương ngày 05/3/2021 của UBND Thị xã Hương Thủy</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Quyết định số 146/QĐ-STNMT ngày 14/4/2021 của Sở Tài nguyên và Môi trường tỉnh Thừa Thiên Huế về việc phê duyệt Báo cáo đánh giá tác động môi trường dự án Mở rộng bãi chôn lấp rác Thủy Phương</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Quyết định phê duyệt hệ số điều chỉnh giá đất để tính tiền bồi thường khi nhà nước thu hồi đất thực hiện dự án Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương trong năm 2021 trên địa bàn thị xã Hương Thủy ngày 19/4/2021 của UBND Tỉnh</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Quyết định số 2934/QĐ-UBND ngày 19/5/2021 của UBND thành phố Huế về việc phê duyệt Báo cáo Kinh tế kỹ thuật và Kế hoạch lựa chọn nhà thầu của dự án Mở rộng bãi chôn lấp rác Thủy Phương</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><strong><em><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">3. Quy mô đầu tư</span></span></em></strong></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">+ Diện tích bãi chôn lấp rác: 3,44 ha,dung tích bãi dự kiến 250.000 m<sup>3</sup>, được sử dụng chôn lấp rác thải trong thời gian khoảng 2 năm.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">+ Dự án nâng cấp, cải tạo Bãi chôn lấp rác Thủy Phương được thiết kế theo phương pháp kết hợp, có diện tích đáy ô chôn lấp 10.316 m<sup>2</sup> và mặt ô chôn lấp 19.360 m<sup>2</sup>. Đáy Bãi chôn lấp được phủ lớp chống thấm HDPE dày 1,5mm, tầng lọc bằng đá dăm dày 30cm. Quanh Bãi chôn lấp được xây dựng các đê con phân chia ô rác và ngăn nước rác chảy vào hệ thống thoát nước mưa. Ngoài ra còn có các hạng mục quan trọng khác như: đường giao thông, hệ thống thoát nước mặt, thoát nước ngầm đáy bãi, hệ thống thoát nước rỉ rác, trạm bơm nước rỉ rác, điện chiếu sáng...</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">+ Tổng mức đầu tư dự án: 14,9 tỷ đồng.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><strong><em><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">4. Xử lý nước rỉ rác</span></span></em></strong></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Bên cạnh Dự án Mở rộng, cải tạo Bãi chôn lấp rác Thủy Phương, để nâng cao chất lượng xử lý nước rỉ rác cho bãi chôn lấp rác cũ và bãi rác mở rộng đảm bảo quy chuẩn, tiêu chuẩn về môi trường, UBND Tỉnh đã thống nhất cho đầu tư nâng cấp hệ thống xử lý nước rỉ rác. Ngày 13/11/2020, HĐND Tỉnh đã thống nhất điều chỉnh chủ trương đầu tư dự án Cải tạo bãi chôn lấp Thủy Phương, trong đó có hạng mục xử lý nước rỉ rác với quy mô đầu tư như sau:</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">+ Công suất xử lý nước rỉ rác: 215m3/ngày đêm.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">+ Công nghệ xử lý: xử lý hóa lý kết hợp công nghệ RO, nước sau xử lý đạt cột A QCVN 40:2011/BTNMT và cột A QCVN 25:2009/BTNMT.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">+ Tổng mức đầu tư của hạng mục 26,3 tỷ đồng.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Công ty Cổ phần Môi trường và Công trình Đô thị Huế đang tập trung mọi nguồn lực để triển khai Dự án "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương", </span></span><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">phấn đấu hoàn thành đưa vào sử dụng trong năm 2021 để kịp gối đầu khi Bãi rác số 2 lấp đầy nhằm đảm bảo công tác xử lý rác liên tục của Tỉnh. Việc thực hiện dự án Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương cùng với việc nâng cấp hệ thống xử lý nước rỉ rác khi hoàn thành sẽ giải quyết được nhu cầu cấp bách cho công tác xử lý rác trên địa bàn Tỉnh, đảm bảo các yêu cầu về môi trường.</span></span></span></p>

<p style="text-align:right"><span style="color:#000000"><strong><span style="font-size:9pt"><span style="font-family:Verdana,sans-serif">Tin bài: HEPCO</span></span></strong></span></p>', N'/uploads/images/25-06_2_.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Thông tin dự án khởi công: Dự án mở rộng, cải tạo bãi chôn lấp chất thải rắn Thủy Phương","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Khởi công công trình "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương" (Tin bài: Báo Thừa Thiên Huế)', N'26/05/2021', N'<p><a href="https://baothuathienhue.vn/khoi-cong-cong-trinh-mo-rong-cai-tao-bai-chon-lap-rac-thuy-phuong-a100313.html" target="_blank">Khởi công công trình "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương"</a></p>', N'/uploads/images/25-06_1_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Khởi công công trình \"Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương\" (Tin bài: Báo Thừa Thiên Huế)","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương, nhu cầu bức thiết', N'26/05/2021', N'<p style="text-align:center"><iframe frameborder="0" height="480" scrolling="no" src="https://www.youtube.com/embed/7n0damDrwIw" title="Mở rộng bãi rác Thủy Phương" width="600"></iframe></p>

<p style="text-align:center">Nguồn: <a href="https://www.youtube.com/watch?v=7n0damDrwIw"> Truyền hình Thừa Thiên Huế TRT</a></p>', N'/uploads/images/25-06.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương, nhu cầu bức thiết","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Mở rộng bãi chôn lấp rác Thủy Phương: Giải pháp trong tình thế cấp bách', N'26/05/2021', N'<p><a href="https://baothuathienhue.vn/giai-phap-trong-tinh-the-cap-bach-a99676.html" target="_blank">Mở rộng bãi chôn lấp rác Thủy Phương: Giải pháp trong tình thế cấp bách</a></p>

<p><em>Nguồn: TRT</em></p>', N'/uploads/images/25-06.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Mở rộng bãi chôn lấp rác Thủy Phương: Giải pháp trong tình thế cấp bách","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thu gom rác bằng xe đạp thân thiện với môi trường', N'02/06/2021', N'<p>Ra quân thực hiện công tác thu nhặt rác ban ngày tại các tuyến đường trung tâm thành phố kết hợp tăng cường công tác tuyên truyền.</p>

<p>Từ 1/6/2021, Hepco tiến thành triển khai thí điểm mô hình thu nhặt rác ban ngày tại các tuyến đường trung tâm thành phố bằng xe đạp điện trợ lực kết hợp tăng cường công tác tuyên truyền bằng các hình thức: khẩu hiệu truyên truyền được gắn trên xe đạp, mỗi người công nhân là một tuyên truyền viên..</p>

<p>Chiến dịch " mưa dầm thấm lâu" bằng hình ảnh trực quan và hành động thiết thực này với mong muốn sẽ nâng cao được ý thức của người dân về bảo vệ môi trường và góp phần nâng cao chất lượng công tác vệ sinh đường phố để Huế luôn Xanh - Sạch - Sáng.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-06.jpg" style="height:375px; width:500px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-06(1).jpg" style="height:375px; width:500px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-06(2).jpg" style="height:667px; width:500px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-06(3).jpg" style="height:667px; width:500px" /></p>', N'/uploads/images/02-06_1_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thu gom rác bằng xe đạp thân thiện với môi trường","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Ngày môi trường thế giới 05/06/2021: Phục hồi hệ sinh thái', N'03/06/2021', N'<p>Năm 2021, Chương trình Môi trường Liên hợp quốc (UNEP) đã lựa chọn Chủ đề của Ngày Môi trường Thế Giới là 𝗘𝗰𝗼𝘀𝘆𝘀𝘁𝗲𝗺 𝗥𝗲𝘀𝘁𝗼𝗿𝗮𝘁𝗶𝗼𝗻 (tạm dịch: Phục hồi Hệ sinh thái).</p>

<p>“Phục hồi hệ sinh thái”, đó là một cụm từ được các nhà khoa học, quan chức và các nhà hoạt động môi trường nhắc đến rất nhiều trong thời gian gần đây. Năm nay, Ngày Môi trường Thế giới, ngày 5 tháng 6, đánh dấu sự khởi động chính thức của Thập kỷ Phục hồi Hệ sinh thái của Liên hợp quốc, một nỗ lực kéo dài 10 năm để ngăn chặn và đảo ngược sự suy giảm của thế giới tự nhiên. Đó chính là các hệ sinh thái: Đất nông nghiệp; Rừng; Hồ và sông; Đồng cỏ và thảo nguyên; Núi; Đại dương và bờ biển; Đất than bùn; Khu vực thành thị.</p>

<p>Để bảo vệ môi trường, góp phần phục hồi hệ sinh thái, chúng ta hãy cùng nhau chung tay để thực hiện bằng những hành động đơn giản sau:</p>

<p>1. Giảm dùng, tái sử dụng, tái chế</p>

<p>2. Hạn chế sử dụng sức nóng và điều hòa nhiệt độ</p>

<p>3. Sử dụng bóng đèn thân thiện môi trường</p>

<p>4. Mua những đồ tiết kiệm điện năng</p>

<p>5. Hạn chế sử dụng nước nóng</p>

<p>6. Chú ý công tắc “tắt/bật”</p>

<p>7. Trồng cây</p>

<p>8. Khuyến khích người khác cùng bảo vệ</p>

<p><img alt="♻" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Hành động nhỏ góp phần</p>

<p>chung tay bảo vệ môi trường, gìn giữ hệ sinh thái. Hãy cùng bảo vệ môi trường, góp phần phục hồi hệ sinh thái bằng những hoạt động kể trên các bạn nhé!</p>

<p>Nguồn tham khảo:</p>

<p>1. <a href="https://monremedia.vn/tin-tuc-su-kien/ngay-moi-truong-the-gioi-nam-05-6-2021-phuc-hoi-he-sinh-thai-1462.html?fbclid=IwAR2IfKskfJyDPcuyMkk6N4DJcujAdRik06avCExjgz8ESGi6z2XOZANGiY0" rel="nofollow noopener" tabindex="0" target="_blank">http://monremedia.vn/.../ngay-moi-truong-the-gioi-nam-05...</a></p>

<p>2. <a href="http://www.vacne.org.vn/10-hanh-dong-bao-ve-moi-truong-don-gian/25335.html?fbclid=IwAR2Ue_hu12QzeWluuonS9uFa-uXGXu6aQB9_OyTLOwOXHocliwZcjV0gVLs" rel="nofollow noopener" tabindex="0" target="_blank">http://www.vacne.org.vn/10-hanh-dong-bao-ve.../25335.html</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/03-06(1).jpg" style="height:1000px; width:750px" /></p>', N'/uploads/images/03-06_1_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Ngày môi trường thế giới 05/06/2021: Phục hồi hệ sinh thái","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Khởi công công trình "Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương". Giải pháp trong tình thế cấp bách.', N'28/05/2021', N'<p><a href="https://baothuathienhue.vn/khoi-cong-cong-trinh-mo-rong-cai-tao-bai-chon-lap-rac-thuy-phuong-a100313.html?fbclid=IwAR1izbgMG9_x_trcTWSZw6m_x88pKAiKlEQnnBUyaJ8PR8ZPzf4na_yUSq4">https://baothuathienhue.vn/khoi-cong-cong-trinh-mo-rong-cai-tao-bai-chon-lap-rac-thuy-phuong-a100313.html?fbclid=IwAR1izbgMG9_x_trcTWSZw6m_x88pKAiKlEQnnBUyaJ8PR8ZPzf4na_yUSq4</a></p>', N'/uploads/images/28-05.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Khởi công công trình \"Mở rộng, cải tạo bãi chôn lấp rác Thủy Phương\". Giải pháp trong tình thế cấp bách.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Cán bộ CNV-NLĐ Công ty Cổ phần Môi trường và Công Trình Đô thị Huế (HEPCO) chung tay đẩy lùi Covid-19.', N'27/05/2021', N'<p>Trong thời gian dịch bệnh Covid-19 đang diễn biến phức tạp, Hepco thường xuyên thực hiện công tác thu gom vận chuyển xử lý rác có nguy cơ chứa virut Sars-Cov2 từ các khu cách ly tập trung, khu vực phong tỏa cách ly tạm thời, các cơ sở y tế… Ngoài ra, công tác xịt phun khử khuẩn tại các khu vực cách ly phong tỏa tạm thời như huyện Phong Điền, huyện Phú Lộc cũng được Công ty thực hiện kịp thời.</p>

<p>Trước tình hình đó, việc đảm bảo an toàn cho NLĐ luôn được đặt lên hàng đầu. Hepco đã tăng cường trang cấp bảo hộ lao động như : áo quần bảo hộ sử dụng 1 lần, khẩu trang y tế, găng tay, màn che chống giọt bắn…nhằm để NLĐ yên tâm thực hiện nhiệm vụ tại hiện trường. Trong đó, tuổi trẻ Hepco đã phát huy tinh thần tuổi trẻ hành động – sáng tạo góp phần chung tay cùng toàn thể CB CNV NLĐ Hepco đẩy lùi dịch bệnh Covid-19.</p>

<p>Cùng chung tay phòng chống dịch Covid -19, nghiêm chỉnh thực hiện "5K: Khẩu trang – Khử khuẩn – Khoảng cách – Không tập trung – Khai báo y tế" để giữ an toàn cho Bạn và Chúng ta trước đại dịch COVID-19</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/27-05.jpg" style="height:384px; width:512px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/27-05(2).jpg" style="height:344px; width:512px" /></p>', N'/uploads/images/27-05.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Cán bộ CNV-NLĐ Công ty Cổ phần Môi trường và Công Trình Đô thị Huế (HEPCO) chung tay đẩy lùi Covid-19.","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời', N'17/05/2021', N'<p>Hình ảnh màu áo HEPCO quá quen thuộc với những người làm công tác thu gom rác mà ai cũng có thể bắt gặp trên đường mỗi ngày. Nhưng vẫn là màu áo HEPCO ấy, có thể bạn chưa biết họ cũng là công nhân của HEPCO, nhưng không phải đi thu gom rác trên đường vỉa hè mà là những người chuyên đi thu gom rác dưới cống rãnh, thường gọi họ là công nhân thoát nước.</p>

<p>Công việc thường nhật của những người công nhân thoát nước là dầm mình dưới lòng cống, nạo vét, thu gom bùn, rác.. với mùi hôi thối đến ngạt thở. Dưới lòng cống đen ngòm với bao nhiêu loại bùn rác do con người xả xuống, rồi những loại hóa chất độc hại, dầu mỡ chưa qua xử lý của những hàng quán kinh doanh, rồi phế thải của những người không có ý thức xả trộm xuống cống...”Nhiều người không ý thức cữ nghĩ cống thoát nước là thùng rác, cái gì người ta cũng vứt xuống đây cả” a Định công nhân Xí nghiệp Thoát nước cho hay.</p>

<p>Bùn ngập ngang cổ, mùi hôi thối bốc lên những người đi đường còn né tránh ái ngại, vậy mà những người công nhân thoát nước vẫn cần mẫn công việc hàng ngày. Họ nghĩ rằng “Ai cũng chọn việc nhẹ nhàng, gian khổ biết dành phần ai”, công việc là do sự phân công của xã hội và là nghề họ đã chọn nên họ làm việc với sự yêu nghề và niềm tự hào bản thân. Có những người gắn bó với nghề từ lúc thanh niên cho đến khi tóc đã muối tiêu hai màu vẫn nhiệt huyết trách nhiệm. Dù cực nhọc đó, nguy hiểm đó, độc hại đó nhưng bản chất công việc làm sạch đẹp cho đời nên họ không quản ngại gian khổ, họ chỉ có mong muốn giản đơn “ Xin mọi người dân hãy ý thức hơn, đừng vứt rác bừa bãi, đừng xả thải xuống cống, tuân thủ quy định về vệ sinh môi trường để chúng tôi bớt vất vả”.</p>

<p>Mỗi mùa mưa bão gần đến, công việc của họ lại gian khổ lên bội lần nhằm đảm bảo thành phố hạn chế bị ngập úng, hệ thống thoát nước được vận hành trơn tru, dòng chảy được thông suốt. Họ cứ thế, cứ th��m lặng thực hiện công việc với những mong ước giản đơn. Vậy tại sao chúng ta không hiện thực hóa mong ước của họ bằng những hành động thiết thực để vừa giúp họ, vừa bảo vệ chính chúng ta, vừa bảo vệ môi trường “Xanh – Sạch – Đẹp”.</p>

<p>Ảnh, bài: Hepco</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/17-05.jpg" style="height:480px; width:593px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/17-05(1).jpg" style="height:334px; width:512px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/17-05(2).jpg" style="height:987px; width:500px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/17-05(3).jpg" style="height:288px; width:450px" /></p>

<p> </p>', N'/uploads/images/17-05.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Công nhân thoát nước - những người thầm lặng làm sạch đẹp cho đời","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường', N'15/05/2021', N'<p>Thay mặt Hội, Ông Nguyễn Hồng Sơn - Phó chủ tịch Hiệp hội Môi trường Đô Thị và Khu công nghiệp Việt Nam - Chủ tịch Hội Môi trường Đô thị và khu Công nghiệp khu vực miền Trung Tây Nguyên - Chủ tịch HĐQT Công ty CP Môi trường và Công trình Đô thị Huế đã trao 60.000.000 đồng cho Anh Võ Đắc Quang - công nhân xí nghiệp MT Nam Sông Hương trực thuộc Công ty CP Môi trường và Công trình đô thị Huế . Anh Quang có thâm niên công tác tại công ty hơn 26 năm, vợ đi làm phụ việc tại quán cà phê, hai con đang trong độ tuổi đến trường, hoàn cảnh khó khăn có nhà bị ảnh hưởng nặng tốc mái trong đợt bão lụt năm 2020.</p>

<p>Cùng với Anh Quang là trường hợp Chị Nguyễn Thị Phượng công nhân Trung tâm MTĐT huyện Hải Lăng; Anh Nguyễn Thế Quang công nhân Công ty CP Môi trường Đô thị Quảng Nam là ba công nhân được được ủng hộ 60.000.000 đồng/ trường hợp để trang trải kinh phí sửa chữa nhà trong đợt này.</p>

<p>Với tinh thần “Lá lành đùm lá rách”, truyền thống đoàn kết tương trợ, Hiệp Hội Môi trường Đô thị và Khu Công nghiệp Việt Nam; Hội Miền Nam; Hội Miền Bắc; các đơn vị Hội viên Hội Khu vực; các đơn vị khách hàng- đối tác, cá nhân hảo tâm trong và ngoài Hội… đã chung tay chia sẻ, hỗ trợ, giúp đỡ vật chất và động viên tinh thần các đơn vị Hội viên và CBCNV trong ngành bị thiệt hại do lũ lụt tiếp tục nỗ lực khắc phục khó khăn sớm ổn định trong hoạt động sản xuất. Đây là một trong những hoạt động thường niên và có ý nghĩa của Hiệp hội Môi trường đô thị và Khu Công nghiệp Việt Nam trong việc quan tâm chăm lo đời sống cho cán bộ công nhân viên của các đơn vị hội viên trực thuộc.</p>

<p>Bài, Ảnh: Hepco</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/15-05.jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/15-05(1).jpg" style="height:467px; width:600px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/15-05(2).jpg" style="height:344px; width:450px" /></p>', N'/uploads/images/15-05_1_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Hiệp hội môi trường đô thị và khu công nghiệp Việt Nam ủng hộ kinh phí sửa chữa nhà hư hỏng do bão lụt năm 2020 dành cho công nhân môi trường","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2', N'13/05/2021', N'<p>Trong thời gian dịch Covid-19 đang diễn biến phức tạp, Công ty Cổ phần Môi trường và Công trình đô thị Huế ngoài thực hiện nhiệm vụ thường xuyên thu gom vận chuyển xử lý rác thải sinh hoạt, công ty đang ngày đêm thực hiện công tác đặc biệt: thu gom, vận chuyển xử lý rác thải sinh hoạt trong khu cách ly tập trung, khu vực phong tỏa cách ly tạm thời; thu gom vận chuyển xử lý rác có nguy cơ chứa SARS- CoV-2 .</p>

<p>Với mức độ độc hại nguy hiểm cao, công tác đảm bảo an toàn, sức khỏe cho người lao động được đặt lên hàng đầu. Công ty tăng cường trang cấp đầy đủ bảo hộ lao động an toàn trong phòng chống dịch, quy trình thu gom vận chuyển xử lý thực hiện cẩn trọng theo quy định, thường xuyên khử khuẩn phương tiện, phun hóa chất đảm bảo an toàn, sắp xếp bố trí lao động theo nhóm công việc.</p>

<p>Cùng với các lực lượng khác đang căng mình chống dịch và dập dịch, lực lượng cán bộ công nhân viên của Hepco đang ngày đêm không ngại khó khăn cố gắng hoàn thành nhiệm vụ mong dịch bệnh sớm đẩy lùi, bình an sớm đến với tất cả mọi người.</p>

<p>Cùng chung tay phòng chống dịch Covid -19, nghiêm chỉnh thực hiện "5K: Khẩu trang – Khử khuẩn – Khoảng cách – Không tập trung – Khai báo y tế" để giữ an toàn cho Bạn và Chúng ta trước đại dịch COVID-19!</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-05.jpg" style="height:510px; width:340px" /></p>

<p style="text-align:center"> </p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-05(1).jpg" style="height:330px; width:512px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-05(2).jpg" style="height:510px; width:340px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-05(3).jpg" style="height:365px; width:512px" /></p>', N'/uploads/images/13-05_2_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Tập trung cáo độ cho công tác thu gom, vận chuyển và xử lý rác thải có nguy cơ chứa SARS – CoV 2","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Chủ tịch UBND tỉnh Phan Ngọc Thọ động viên cán bộ, công nhân HEPCO lên đường đi phun khử khuẩn, chống Covid-19', N'12/05/2021', N'<p>Chiều nay, Chủ tịch UBND tỉnh Phan Ngọc Thọ đã đến động viên cán bộ, công nhân Cty môi trường và công trình đô thị Huế trước giờ lên đường thực hiện nhiệm vụ phun khử khuẩn, phòng chống dịch Covid-19.</p>

<p style="text-align:center"><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/LjGSVJqRk-w?start=726" title="YouTube video player" width="560"></iframe></p>

<p>Thực hiện chỉ đạo của lãnh đạo tỉnh Thừa Thiên Huế và ban chỉ đạo phòng chống dịch Covid -19, liên tục trong những ngày vừa qua công ty Cổ phần Môi trường và Công trình Đô thị Huế đã thực hiện phun hoá chất khử khuẩn tại huyện Phong Điền, huyên Phú Lộc nhằm nâng cao chất lượng phòng chống dịch Covid-19.</p>

<p>Nguồn: <a href="https://www.facebook.com/TRT.COM.VN/videos/208310580879943">https://www.facebook.com/TRT.COM.VN/videos/208310580879943</a></p>', N'/uploads/images/12-05.PNG', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Chủ tịch UBND tỉnh Phan Ngọc Thọ động viên cán bộ, công nhân HEPCO lên đường đi phun khử khuẩn, chống Covid-19","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'8 Cách bảo vệ môi trường sống vì sức khỏe cộng đồng', N'05/05/2021', N'<p>Môi trường ô nhiễm trực tiếp tác động đến sức khỏe mỗi người sống trong đó và cả thế hệ tương lai sau này. Vậy nên, hãy chung tay bảo vệ môi trường sống bằng những hành động thiết thực sau đây:<br />
<strong>Trồng cây xanh</strong>: Việc trồng và bảo vệ cây xanh nơi công cộng sẽ giúp bạn có không khí trong lành và giải trí sau ngày làm việc căng thẳng.<br />
<strong>Sử dụng các chấy liệu từ thiên nhiên</strong>: Bạn có biết rằng thuốc bảo vệ thực vật và các loại hóa chất sử dụng trong vệ sinh hằng ngày đang có những tác động tiêu cực đến môi trường nếu không được xử lý phù hợp. Vậy nên, phân vi sinh, mỹ phẩm thiên nhiên,… đang là xu hướng được nhiều người chọn lựa hiện nay.<br />
<strong>Tiết kiệm điện năng</strong>: Việc rút các chuôi cắm ra khỏi ổ hoặc tắt nguồn tất cả các thiết bị khi không sử dụng sẽ giúp bạn tiết kiệm một lượng điện khá lớn.<br />
<strong>Sử dụng năng lượng sạch</strong>: Việc sử dụng các loại năng lượng có thể tái tạo bất cứ lúc nào (năng lượng từ gió, ánh nắng, mặt trời…) rất được khuyến khích bởi chúng không làm phát sinh khí thải gây hiệu ứng nhà kính như nhiệt điện. Đồng thời, nó còn không ảnh hưởng môi trường sinh thái như thuỷ điện và năng lượng nguyên tử.<br />
<strong>Áp dụng nguyên tắc 3R</strong> (Reduce, Reuse, and Recycle): Việc Giảm thiểu – Tái chế - Tái sử dụng là rất quan trọng trong việc bảo vệ môi trường sống, tiết kiệm tài nguyên.<br />
<strong>Sử dụng sản vật được sản xuất tại địa phương</strong>: Việc làm này sẽ giảm được sự vận chuyển hàng hóa từ các nơi khác đến. Từ đây, nó góp phần hạn chế việc tiêu hao năng lượng cũng như giảm việc xả thải khí độc ra môi trường.<br />
<strong>Giảm sử dụng túi nilong</strong>: Để sản xuất ra 100 triệu túi nhựa phải tiêu tốn 12 triệu thùng dầu hỏa và mất từ 10 – 100 năm để phân hủy 1 chiếc túi ni lông (tùy loại). Vì vậy, chúng ta hãy sử dụng túi vải, giấy, các loại lá… để gói sản phẩm thay thế.<br />
<strong>Tận dụng ánh sáng mặt trời để chiếu sáng</strong>: Việc làm này không chỉ tốt cho mắt, tiết kiệm tiền mà còn góp phần bảo vệ môi trường khi không dùng các nguồn năng lượng khác có nguồn gốc từ nhiệt điện, thuỷ điện và năng lượng nguyên tử.<br />
<img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Sống tốt cho môi trường chính là sống cho chính mình và các thế hệ mai sau. Chúng ta hãy chung tay bảo vệ môi trường sống mọi người nhé!<br />
Nguồn bài viết: <a href="http://benhvien354.vn/tin-tuc/10-cach-bao-ve-moi-truong-song-vi-suc-khoe-cong-dong-99.html?fbclid=IwAR1i3j5r1tXT9l-W-6beubM3WmoykAp9X78DCLipFEflWdqrWz-dcHQJshI" rel="nofollow noopener" tabindex="0" target="_blank">http://benhvien354.vn/.../10-cach-bao-ve-moi-truong-song...</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/05-05.jpg" style="height:526px; width:526px" /></p>', N'/uploads/images/05-05.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"8 Cách bảo vệ môi trường sống vì sức khỏe cộng đồng","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thế giới nỗ lực bảo vệ môi trường', N'02/05/2021', N'<p>Trước tình hình ô nhiễm môi trường, nhiều quốc gia trên thế giới như Thái Lan, Đức, Pháp… đã đề ra các sáng kiến hiệu quả trong nỗ lực bảo vệ môi trường sống. Cụ thể:</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Thái Lan: Từ 2020 cấm túi ni lông dùng tại các cửa hàng lớn, hướng tới cấm hoàn toàn vào năm 2021.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Đức: Gói cải cách bảo vệ khí hậu diện rộng chính thức có hiệu lực 1/1/2020, bao gồm giảm giá vé đường sắt, tăng thuế đi lại bằng đường hàng không.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Pháp: Áp dụng thuế bảo vệ môi trường mới của các hãng hàng không, những chuyến bay quá cảnh không phải chịu thuế.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Hàn Quốc: Hạn chế ô tô xả thải ở mức cao nhất lưu thông trong “Khu vực giao thông xanh” từ 6h-21h hằng ngày, tăng lượng xe đạp công cộng.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Chile: Đóng cửa một số nhà máy nhiệt điện, chạy bằng than nhằm giảm lượng phát khí thải carbon dioxide độc hại vào môi trường.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Thụy Sĩ: Cấm sử dụng thuốc trừ sâu chlorothalonil, chống lại tình trạng ô nhiễm nguồn nước sinh hoạt.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> FIJI: Lệnh cấm sản xuất, tiêu thụ và cung cấp túi nhựa dùng 1 lần có hiệu lực từng ngày 1/1/2020.</p>

<p><img alt="🤝" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t64/1/16/1f91d.png" style="height:16px; width:16px" /> Mỗi chúng ta cũng nên ngày một nâng cao ý thức, nỗ lực từ những điều nhỏ nhất để bảo vệ môi trường XANH – SẠCH – ĐẸP các bạn nhé!</p>

<p>Nguồn bài viết: <a href="https://l.facebook.com/l.php?u=https%3A%2F%2Ftapchitaichinh.vn%2Finfo-media%2Finfographic-the-gioi-no-luc-bao-ve-moi-truong-326726.html%3Ffbclid%3DIwAR3xREHLxZe04qsbq4y9OakHSUD_6Y6tj_uxg0DA2o2K1VKT7nYyiW9GEM4&h=AT1muJdc3mt3WrAcXc83rqkH086Sq0vIFghRxyFOvE42NXtg_Si6UurzjldJggjc1sjRRKX5uKFgXx3JDBM1ti5tyKzKSezFsv2LFNrtSNXZ9305ouoIcrl-nTO51aJ8f9nk&__tn__=-UK-R&c[0]=AT3LILuP2PLQpeGWeNhCvtgBpaNKY8jNxAMK5Mtxhj3oRs-U5Hr2xw1v-SoRr8vtmMmnzLnvLjj7U91ejA5FMemH0pHbTPaE7b9Vxn3HnHwXj3tqprWhUy57vn_11xGcCoUzTUDyxy7gASHhCMWtllYMhKSYXuJIsRbZyeB7E5G3DwM" rel="nofollow noopener" tabindex="0" target="_blank">https://tapchitaichinh.vn/.../infographic-the-gioi-no-luc...</a></p>

<p>Ảnh: TTXVN</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-05.png" style="height:540px; width:512px" /></p>', N'/uploads/images/02-05.png', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thế giới nỗ lực bảo vệ môi trường","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Đốt vàng mã đúng quy định', N'28/04/2021', N'<p>Theo quyết định số 6113/2016/QĐ-UBND ngày 17/8/2016 của UBND thành phố Huế quy định về đốt rãi vàng mã trên địa bàn thành phố Huế. Việc đốt, rãi vàng mã được quy định như sau:</p>

<p><img alt="🔥" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t50/1/16/1f525.png" style="height:16px; width:16px" /> ĐỐI VỚI VIỆC ĐỐT VÀNG MÃ</p>

<p><img alt="❇️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb1/1/16/2747.png" style="height:16px; width:16px" /> TẠI KHU VỰC DÂN CƯ: phải đốt trong thùng, thùng đốt phải đặt trong khuôn viên hộ gia đình hoặc đặt trên vỉa hè, sau khi đốt xong phải vệ sinh sạch sẽ và thu gom tàn tro.</p>

<p><img alt="❇" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb1/1/16/2747.png" style="height:16px; width:16px" />TẠI ĐIỂM AN TÁNG THI HÀI NGƯỜI CHẾT: phải thực hiện theo quy định của Ban quản lý nghĩa trang hoặc theo quy định của UBND Phường nơi thực hiện chôn cất.</p>

<p><img alt="❇" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb1/1/16/2747.png" style="height:16px; width:16px" />TẠI NƠI TỔ CHỨC LỄ HỘI, DI TÍCH LỊCH SỬ - VĂN HÓA: phải đốt đúng vị trí quy định của BTC lễ hội, BQL di tích và phù hợp với đặc thù của lễ hội, di tích lịch sử văn hóa.</p>

<p><img alt="❌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tdd/1/16/274c.png" style="height:16px; width:16px" />Nghiêm cấm đốt vàng mã :</p>

<p>- Trên lòng đường giao thông (bao gồm cả đường chính đường kiệt.)</p>

<p>- Tại các công viên, điểm xanh</p>

<p>- Không đúng quy định tại nơi tổ chức lễ hội, di tích lịch sử, văn hóa.</p>

<p><img alt="🔥" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t50/1/16/1f525.png" style="height:16px; width:16px" /> ĐỐI VỚI VIỆC RẢI VÀNG MÃ</p>

<p>Việc rải vàng mã chỉ được thực hiện một cách hạn chế tại các vị trí sau:</p>

<p><img alt="✅" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png" style="height:16px; width:16px" /> Trong khuôn viên hộ gia đình nơi lưu giữ thi hài người chết.</p>

<p><img alt="✅" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png" style="height:16px; width:16px" /> Nơi an táng thi hài người chết.</p>

<p><img alt="❌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tdd/1/16/274c.png" style="height:16px; width:16px" /> Nghiêm cấm rải tiền Việt nam, tiền Nước ngoài, vàng mã trên tất cả các tuyến đường của Thành phố, các tuyến đường đưa tang và xuống sông, hồ.</p>

<p><img alt="‼️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t77/1/16/203c.png" style="height:16px; width:16px" /><img alt="‼️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t77/1/16/203c.png" style="height:16px; width:16px" /> Tổ chức, cá nhân khi đốt, rải vàng mã phải tuân thủ những nguyên tắc sau:</p>

<p><img alt="❗️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t50/1/16/2757.png" style="height:16px; width:16px" /> Không được trái với quy định của pháp luật, thuần phong mỹ tục của dân tộc; không để xảy ra các hoạt động mê tín dị đoan.</p>

<p><img alt="❗" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t50/1/16/2757.png" style="height:16px; width:16px" />Không làm ảnh hưởng đến an toàn giao thông và trật tự, an toàn công cộng, phòng chống cháy nổ, vệ sinh môi trường.</p>

<p><img alt="✅" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png" style="height:16px; width:16px" />Các hành vi vi phạm về quy định bảo vệ môi trường sẽ bị xử phạt vi phạm hành chính căn cứ theo Nghị định 155/2016/NĐ-CP ngày 18.11.2016 của Chính phủ quy định về xử phạt vi phạm hành chính trong lĩnh vực bảo vệ môi trường.</p>

<p>Cùng nâng cao nhận thức, nghiêm chỉnh chấp hành quy định đốt rải vàng mã góp phần bảo vệ môi trường, thực hiện nếp sống văn minh đô thị góp phần để Thừa Thiên Huế ngày mỗi Xanh – Sạch – Sáng.</p>

<p>Ảnh chụp: báo Thừa Thiên Huế</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/28-04.jpg" style="height:686px; width:1024px" /></p>

<p><a href="https://baothuathienhue.vn/van-minh-trong-dot-rai-vang-ma-a95346.html?fbclid=IwAR39625kRH-Y7GO3xnwKevP-gIDTdkjE41oK0DFcKaxy-nUsshUm0tm_9yg" rel="nofollow noopener" tabindex="0" target="_blank">https://baothuathienhue.vn/van-minh-trong-dot-rai-vang-ma...</a></p>

<p> </p>', N'/uploads/images/28-04.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Đốt vàng mã đúng quy định","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4', N'26/04/2021', N'<p>Như thường lệ vào các ngày thứ bảy, chủ nhật hàng tuần, Công ty Cổ phần Môi trường và Công trình Đô thị Huế thường xuyên bố trí nhân lực và phương tiện thiết bị chuyên dùng để ra quân tổng vệ sinh ngày Chủ Nhật Xanh.</p>

<p>Với hơn 230 nhân lực và nhiều lượt phương tiện thiết bị, Công ty đã tiến hành tổng vệ sinh đường phố, gom nhặt rác, thu gom rác thải xây dựng, tăng cường vớt rác trên sông và hỗ trợ hơn 10 đơn vị địa phương.</p>

<p>Hãy cùng nhau hành động để Thừa Thiên Huế luôn xanh - sạch - sáng!</p>

<p>Một số hình ảnh hoạt động Chủ nhật xanh:</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-04.jpg" style="height:357px; width:521px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-04(1).jpg" style="height:507px; width:521px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-04(2_.jpg" style="height:399px; width:521px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-04(3).jpg" style="height:541px; width:521px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/26-04(4).jpg" style="height:423px; width:521px" /></p>', N'/uploads/images/26-04_4_.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Chủ nhật xanh tuần thứ 13 Ngày 24/4 -25/4","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Hiệu quả thiết thực từ mô hình "Thùng rác phân loại rác thải" của các em học sinh', N'16/04/2021', N'<p><img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Mô hình “Thùng rác phân loại rác thải” của Liên đội Trường Tiểu học Cao Văn Ngọc (Bà Rịa – Vũng Tàu) được nhiều người đánh giá rất cao. Cụ thể, các thành viên của Ban chỉ huy Liên đội đã chủ động tìm hiểu về cách phân loại rác thải, quá trình phân hủy của từng loại rác cũng như các loại rác có khả năng tái chế. Từ đó, các em đã phân chia rác thải thành 4 loại, thực hiện viết các khẩu hiệu lên 6 thùng rác khác nhau.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Đặc biệt, với mong muốn cho các bạn học sinh dễ hiểu, dễ hình dung và dễ dàng phân loại, các khẩu hiệu trên những thùng rác được thành viên ban chấp hành biến tấu với các câu từ, hình thức đa dạng, đáng yêu như: “Ai đó giúp tớ tìm các bạn giấy vụn nhé!”, “Ly nhựa ơi, các bạn ở đâu?”, “Lon nước là tớ, tớ có thể tái chế đấy, cho tớ xin nào”,… Ngoài ra, để thùng rác trở nên sống động, các thành viên còn thực hiện vẽ vô số hình ảnh minh họa của các loại rác thải phù hợp với câu khẩu hiệu như: hình ảnh vỏ lon, chai nhựa, giấy vụn,…<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Chỉ trong 1 tuần thực hiện, 6 thùng rác phân loại rác thải đã được hoàn thành và đưa vào sử dụng. Từ khi triển khai mô hình, ý thức bảo vệ môi trường của các em học sinh cũng như giáo viên tại Trường Tiểu học Cao Văn Ngọc đã được cải thiện rõ rệt. Không chỉ vậy, tình trạng rác nằm ở sân trường cũng không còn, các em đã hình thành được thói quen để rác vào thùng, phân loại rác và giữ gìn vệ sinh, cảnh quan xanh, sạch, thoáng đẹp. Rác thu gom được từ mô hình đã được thu gom vào mỗi thứ 6 hàng tuần và cứ 2 tuần được gom bán cho người thu mua phế liệu. Số tiền này được đóng góp vào quỹ Kế hoạch nhỏ của Liên đội.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Mô hình nói trên không chỉ mang lại hiệu quả thiết thực như giảm thiểu tình trạng ô nhiễm môi trường, bổ sung nguồn quỹ Kế hoạch nhỏ, mà nó còn là một hình thức giáo dục, nâng cao ý thức cho học sinh về việc bảo vệ môi trường, biết các phân loại các loại rác có thể tái chế và xử lý rác một cách có hiệu quả.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" />Từ câu chuyện kể trên, nhiều người đã thấy rõ hơn về hiệu quả của việc phân loại rác tại nguồn. Chúng ta hãy chung tay cùng nhau bảo vệ môi trường các bạn nhé!</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/16-04.jpg" style="height:522px; width:696px" /><br />
<br />
Nguồn bài viết: <a href="https://tuoitrebariavungtau.vn/hieu-qua-thiet-thuc-tu-mo-hinh-thung-rac-phan-loai-rac-thai-cua-lien-doi-truong-tieu-hoc-cao-van-ngoc-huyen-long-dien/?fbclid=IwAR3SAuvtiXnzS2SeLjt9MGj07NNawEEAIpIz3HmDcsSn4PM2DQncmarfKdE" rel="nofollow noopener" tabindex="0" target="_blank">https://tuoitrebariavungtau.vn/hieu-qua-thiet-thuc-tu-mo.../</a></p>

<p> </p>', N'/uploads/images/16-04.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Hiệu quả thiết thực từ mô hình \"Thùng rác phân loại rác thải\" của các em học sinh","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thanh toán "Tiền dịch vụ vệ sinh môi trường" qua ví điện tử VNPT Pay và MOMO Pay', N'15/04/2021', N'<p>Công ty Cổ phần Môi trường và Công trình Đô thị Huế đã triển khai dịch vụ thu hộ qua ứng dụng ví điện tử VNPTPAY và MOMOPAY nhằm đem lại sự thuận tiện cho khách hàng. Giờ đây, chỉ với vài bước đơn giản bạn đã có thể thanh toán tiền “dịch vụ thu gom vận chuyển rác sinh hoạt” một cách nhanh chóng.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Dưới đây là hướng dẫn thanh toán đối với ứng dụng VNPTPAY và ứng dụng MOMOPAY</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Bước 1: Mở ứng dụng ví MOMO/VNPTPAY, chọn “Thanh toán hóa đơn”</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Bước 2: Chọn “Vệ sinh môi trường”</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Bước 3: Chọn dịch vụ “Vệ sinh môi trường Huế”</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Bước 4: Nhập Mã Khách hàng, và chọn “Tiếp tục”</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Bước 5: Kiểm tra thông tin và chọn “Thanh toán”</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Bước 6: Chọn nguồn tiền và “Xác nhận” để thanh toán.</p>

<p style="text-align:center"><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/e8dEN0O_yeY" title="YouTube video player" width="560"></iframe></p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Chỉ cần ngồi ở nhà là có thể thanh toán hóa đơn từ xa một cách nhanh chóng, gọn lẹ, tiết kiệm thời gian và công sức. Bạn thử ngay nhé!</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Hướng dẫn thanh toán hóa đơn tiền vệ sinh môi trường Hepco qua MoMo: <a href="https://www.facebook.com/hepco.com.vn/posts/1590505591138564?__cft__[0]=AZXBQH5UI-hZDGbfyiVHLqUAaXQLU9slo7UPBBrwi_R5hlG1EUUn6VzRHeuUYwUGodDqTFsH0LUbpLY7I6SuaNh2Rpjhk8VH9ealTJK1aqThqBJfa2acIRDpEz2xYRgixkZ-MRUzo754WnyniQ9R7O3CRIcQYN6J2bbEDp9HxjXl6w&__tn__=-UK-R" tabindex="0">https://www.facebook.com/hepco.com.vn/posts/1590505591138564</a></p>', N'/uploads/images/05-04.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thanh toán \"Tiền dịch vụ vệ sinh môi trường\" qua ví điện tử VNPT Pay và MOMO Pay","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương', N'14/04/2021', N'<p><img alt="‼️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t77/1/16/203c.png" style="height:16px; width:16px" /> Báo cáo của tạp chí khoa học Science của Hiệp hội Mỹ gần đây cho biết: Đến nay thế giới có khoảng 6,3 tỉ tấn là rác thải nhựa. Trong đó: 9% rác thải nhựa được tái chế; 12% rác thải nhựa được đốt; 79% còn lại tồn tại trong môi trường tự nhiên, bao gồm cả môi trường biển.</p>

<p><img alt="‼️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t77/1/16/203c.png" style="height:16px; width:16px" /> Theo thống kê của Tổ chức Bảo vệ môi trường biển Ocean Conservancy của Mỹ, mỗi năm có khoảng 8 triệu tấn nhựa thải ra biển trên toàn thế giới. Tổ chức này dự báo là tới năm 2025, cứ 3 tấn cá sẽ có 1 tấn rác thải nhựa. Không chỉ ảnh hưởng đến môi trường, rác thải nhựa còn gây ra những tác động mạnh mẽ đến sinh vật biển:</p>

<p><img alt="📌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tac/1/16/1f4cc.png" style="height:16px; width:16px" /> Làm giảm khả năng hấp thu thức ăn của sinh vật: Theo thông tin từ Tổng cục Biển và Hải đảo Việt Nam thì có khoảng 267 loài sinh vật biển đã bị vướng hoặc ăn phải các mảnh vi nhựa trên biển. Rác thải nhựa sau khi vào cơ thể sinh vật có thể gây tổn hại thành ruột hoặc gây tắc nghẽn, dẫn tới giảm khả năng hấp thụ của sinh vật, thậm chí làm chúng không qua khỏi.</p>

<p><img alt="📌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tac/1/16/1f4cc.png" style="height:16px; width:16px" /> Tác động đến hệ thống nội tiết và điều hòa hormone trong cơ thể sinh vật.</p>

<p><img alt="📌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tac/1/16/1f4cc.png" style="height:16px; width:16px" /> Gây ra bệnh cho sinh vật qua đường ăn uống, thậm chí là qua đời.</p>

<p><img alt="📌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tac/1/16/1f4cc.png" style="height:16px; width:16px" /> Ảnh hưởng đến sự tồn tại của sinh vật biển khi mắc phải, bị kẹt: Đối với những sinh vật biển khi vướng vào lưới đánh cá bị bỏ đi hoặc các loại rác thải nhựa khác, chúng sẽ không thể thoát ra được nên sẽ yếu dần và ra đi.</p>

<p><img alt="📌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tac/1/16/1f4cc.png" style="height:16px; width:16px" /> Làm phá hủy hoặc suy giảm đa dạng sinh học: Rác thải nhựa sẽ làm nhiều loài sinh vật biển không qua khỏi, dẫn đến nguy cơ tuyệt chủng hoặc làm phá hủy, suy giảm đa dạng sinh học.</p>

<p><img alt="📌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tac/1/16/1f4cc.png" style="height:16px; width:16px" /> Làm thay đổi cấu trúc, thành phần loài của hệ sinh thái do việc chuyên chở các sinh vật ngoại lai thông qua rác thải nhựa từ nơi khác đến.</p>

<p><img alt="🍀" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t87/1/16/1f340.png" style="height:16px; width:16px" /> VẬY NÊN HÃY NÓI KHÔNG VỚI SẢN PHẨM NHỰA DÙNG 1 LẦN, CHUNG TAY PHÂN LOẠI RÁC SINH HOẠT NGAY TẠI NGUỒN MỌI NGƯỜI NHÉ!</p>

<p>Nguồn tham khảo: <a href="http://vnmha.gov.vn/tin-tuc-tai-nguyen-nuoc-va-moi-truong-114/rac-thai-nhua-tren-bien-%E2%80%93-noi-am-anh-cua-dai-duong-9187.html?fbclid=IwAR39625kRH-Y7GO3xnwKevP-gIDTdkjE41oK0DFcKaxy-nUsshUm0tm_9yg" rel="nofollow noopener" tabindex="0" target="_blank">http://vnmha.gov.vn/.../rac-thai-nhua-tren-bien-%E2%80%93...</a></p>

<p>Ảnh: Báo Lao Động</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/14-04.jpg" style="height:281px; width:500px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/14-04(1).jpg" style="height:512px; width:768px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/14-04(2).jpg" style="height:583px; width:765px" /></p>', N'/uploads/images/14-04.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Rác thải nhựa trên biển - Nỗi ám ảnh của đại dương","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế', N'13/04/2021', N'<p>Kết thúc đợt 1 của công tác phát tờ gấp tuyên truyền “Nâng cao ý thức của người dân về bảo vệ môi trường” triển khai tại 10 Phường trung tâm thành phố Huế, những ngày đầu tháng 4 vừa qua HEPCO tiếp tục triển khai công tác tuyên truyền tại 17/27 Phường còn lại dự kiến kết thúc và 25/4/2021.</p>

<p>Tờ gấp tuyên truyền bao hàm các nội dung về NÂNG CAO NHẬN THỨC CHẤP HÀNH QUY ĐỊNH VỀ VỆ SINH MÔI TRƯỜNG, LAN TỎA TINH THẦN NGÀY CHỦ NHẬT XANH, CÁCH THỨC PHÂN LOẠI RÁC TẠI NGUỒN, CÁCH XẢ THẢI ĐỐI VỚI CÁC LOẠI RÁC CỒNG KỀNH, RÁC XÂY DỰNG, MỨC THU TIỀN DỊCH VỤ THU GOM VẬN CHUYỂN RÁC THẢI SINH HOẠT VÀ GIỚI THIỆU HÌNH THỨC THANH TOÁN QUA APP được các tuyên truyền viên của HEPCO phối hợp với lực lượng cán bộ địa phương triển khai trao tận tay đến tận tay các hộ dân, cơ quan, đơn vị trên địa bàn thành phố Huế.</p>

<p>Bên cạnh việc mong muốn truyền tải được các thông tin hữu ích đến với mọi người dân, các thành viên tổ tuyên truyền còn mong muốn mọi người dân tiếp nhận, sử dụng và lưu trữ tờ gấp một cách văn minh để phát huy được hết ý nghĩa của công tác tuyên truyền.</p>

<p>Một số hình ảnh về buổi phát tờ gấp:</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-04.jpg" style="height:486px; width:621px" /></p>

<p style="text-align:center"> </p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-04(2).jpg" style="height:342px; width:512px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-04(3).jpg" style="height:347px; width:512px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/13-04(4).jpg" style="height:366px; width:512px" /></p>', N'/uploads/images/13-04_1_.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Triển khai công tác phát tờ gấp tuyên truyền tại 17/27 phường trên địa bàn thành phố Huế","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Phân loại rác thủy tinh', N'10/04/2021', N'<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Đầu tiên, việc phân loại, tái chế lại các chai thủy tinh đã qua sử dụng là một cách hữu hiệu để bảo vệ hành tinh của chúng ta. Bạn có biết, thủy tinh phải mất tới 1 triệu năm mới phân hủy hoàn toàn. Trong khi đó, người ta chỉ cần 30 ngày để làm mới hoàn toàn món đồ thủy tinh vứt đi để trở thành một sản phẩm đẹp đẽ. Mỗi tấn thủy tinh được tái chế, chúng ta sẽ tiết kiệm được lượng lớn nguyên liệu thô cần thiết để tạo ra thủy tinh mới, bao gồm: 590kg cát, 186kg bột Carbonate và 173kg đá vôi.</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Tiếp đến, sản phẩm thủy tinh tái chế từ thuỷ tinh cũ vụn sẽ tiêu thụ ít hơn 40% năng lượng so với việc làm ra thủy tinh mới làm tiết kiệm năng lượng, giảm thiểu ô nhiễm công nghiệp và góp phần giảm hiệu ứng nhà kính. Việc chế tạo thuỷ tinh mới bằng cách làm nóng cát và một số chất khác ở nhiệt độ lên đến hơn 1400 độ C mới tạo ra thủy tinh sẽ dẫn đến nhiều hệ quả về ô nhiễm môi trương.</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" />Ngoài ra, thủy tinh được làm những vật liệu ổn định như cát và đá vôi. Vậy nên, chúng ít ảnh hưởng và tương tác hóa học với các chất xung quanh. Đó chính là lý do tại sao thủy tinh có thể tái sử dụng nhiều lần mà chất lượng hầu như không thay đổi.</p>

<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Bên cạnh việc tái chế, chai lọ thủy tinh còn có thể dùng để xây tường và trang trí cảnh quan.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Có thể nói, thủy tinh là một trong những sản phẩm dễ tái chế nhất và mang lại lợi ích lớn cho môi trường.</p>

<p><img alt="🤝" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t64/1/16/1f91d.png" style="height:16px; width:16px" /> Chúng ta hãy cùng nhau phân loại rác thải thủy tinh để có lối sống xanh – sạch – đẹp hơn nhé!</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/10-04.jpg" style="height:540px; width:806px" /></p>', N'/uploads/images/10-04.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Phân loại rác thủy tinh","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thanh toán hóa đơn Vệ sinh môi trường với MOMO', N'09/04/2021', N'<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-04.jpg" style="height:686px; width:1024px" /></p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Chỉ cần ngồi ở nhà là có thể thanh toán hóa đơn từ xa một cách nhanh chóng, gọn lẹ, tiết kiệm thời gian và công sức.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Có MoMo, việc thanh toán các hóa đơn sẽ được giải quyết trong một nốt nhạc!</p>

<p>Vài bước đơn giản thanh toán hóa đơn Hepco trên Momo như sau:</p>

<p>Bước 1: Mở ứng dụng ví MoMo, chọn “Thanh toán hóa đơn”</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-04(1).jpg" style="height:1024px; width:1024px" /></p>

<p>Bước 2: Chọn “Vệ sinh môi trường”</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-04(2).jpg" style="height:1024px; width:1024px" /></p>

<p>Bước 3: Chọn dịch vụ “Vệ sinh môi trường Huế”</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-04(3).jpg" style="height:1024px; width:1024px" /></p>

<p>Bước 4: Nhập Mã Khách hàng, và chọn “Tiếp tục”</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-04(4).jpg" style="height:1024px; width:1024px" /></p>

<p>Bước 5: Kiểm tra thông tin và chọn “Thanh toán”</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-04(5).jpg" style="height:1024px; width:1024px" /></p>

<p>Bước 6: Chọn nguồn tiền và “Xác nhận” để thanh toán.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/09-04(6).jpg" style="height:1024px; width:1024px" /></p>', N'/uploads/images/09-04.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thanh toán hóa đơn Vệ sinh môi trường với MOMO","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'"Hố rác di động tại gia đình" - Mô hình nhỏ, hiệu quả lớn', N'08/04/2021', N'<p><img alt="🍃" src="https://static.xx.fbcdn.net/images/emoji.php/v9/ta/1/16/1f343.png" style="height:16px; width:16px" /> Trong vài năm trở lại đây, tại xã Mỹ Hội, huyện Cái Bè (Tiền Giang), mô hình “Hố rác di động tại gia đình” đang phát huy hiệu quả tích cực, thu hút nhiều chị em phụ nữ tham gia.<br />
<br />
<img alt="➖" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t4b/1/16/2796.png" style="height:16px; width:16px" /> Để xây dựng hố rác, mỗi gia đình chỉ cần một khoản đất trống ngang khoảng 1m, rộng 1m, sâu 1m và bên trên có nắp đậy bằng ván, nhựa hay tole. Chi phí xây dựng khoảng 100-200.000 đồng.<br />
<br />
<img alt="➖" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t4b/1/16/2796.png" style="height:16px; width:16px" /> Sau khi phân loại rác đầu nguồn, những rác thải hữu cơ dễ phân hủy như xác trà, cà phê, vỏ trái cây, rau quả… sẽ bỏ xuống hố. Sau khi rác hữu cơ phân hủy, chị em xới lên lấy làm phân phục vụ cho sản xuất nông nghiệp.<br />
Với rác thải khó phân hủy như vỏ bia, lon nhựa thì chị em để ráo, gom riêng và bán ve chai.<br />
<br />
<img alt="➡️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t9e/1/16/27a1.png" style="height:16px; width:16px" /> Cách làm đơn giản nhưng rất hiệu quả. Đến cuối năm 2020, trên toàn ấp Mỹ Chánh B đã có hơn 281 chị em tham gia xây dựng hố rác tại gia đình.<br />
<br />
<img alt="➡️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t9e/1/16/27a1.png" style="height:16px; width:16px" /> Nguồn tham khảo: <a href="http://tiengiang.gov.vn/chi-tiet-tin?%2Fxay-dung-mo-hinh-ho-rac-di-ong-tai-gia-inh-mo-hinh-nho-hieu-qua-lon%2F27017465&fbclid=IwAR1OWR4s_1jpv_4gGnQYr8gmsIKP39lxNLb19b-jPNIxiFO5ggDNuBNcglo" rel="nofollow noopener" tabindex="0" target="_blank">http://tiengiang.gov.vn/chi-tiet-tin...</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/08-04.jpg" style="height:686px; width:1024px" /></p>', N'/uploads/images/08-04.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"\"Hố rác di động tại gia đình\" - Mô hình nhỏ, hiệu quả lớn","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Phân loại chất thải rắn sinh hoạt tại nguồn đem lại những lợi ích gì?', N'07/04/2021', N'<p><img alt="💥" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t40/1/16/1f4a5.png" style="height:16px; width:16px" /> Phải nhắc đến đầu tiên đó là việc phân loại rác tại nguồn sẽ đem đến những lợi ích về mặt kinh tế:<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Chất thải rắn sinh hoạt (CTRSH) được phân loại triệt để thì tổng lượng rác trong cộng đồng thải ra môi trường sẽ được giảm thiểu từ đó sẽ tiết kiệm được chi phí thu gom, vận chuyển, xử lý CTRSH từ nguồn ngân sách nhà nước.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Phân loại rác tại nguồn còn mang lại lợi ích kinh tế cho gia đình.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Hoạt động phân loại tái chế còn có thể gây quỹ cho hoạt động cộng đồng của địa phương.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Nếu phân loại CTRSH tại nguồn hiệu quả sẽ góp phần tiết kiệm được tài nguyên, tăng cường tái chế, tái sử dụng, thu hồi năng lượng. Ví dụ chất thải rắn sinh hoạt được xử lý để làm nguyên liệu sản xuất phân bón, tái chế các loại bao bì phế thải thành nguyên liệu sản xuất…<br />
<br />
<img alt="💥" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t40/1/16/1f4a5.png" style="height:16px; width:16px" /> Bên cạnh những lợi ích về mặt kinh tế thì việc phân loại CTRSH tại nguồn còn có những lợi ích to lớn về mặt môi trường.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Đối với những chất thải nguy hại, khi được phân loại đúng thì sẽ góp phần giảm nguy cơ phát tán chất thải nguy hại ra môi trường.<br />
<br />
<img alt="🌿" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t1e/1/16/1f33f.png" style="height:16px; width:16px" /> Giảm được khối lượng chất thải rắn sinh hoạt đồng nghĩa với việc giảm tác động tiêu cực đến môi trường, như hạn chế mùi hôi, nước rỉ rác, giảm ô nhiễm nguồn đất, nguồn nước ngầm, nước mặt làm giảm thiểu ô nhiễm môi trường.<br />
<br />
<img alt="💥" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t40/1/16/1f4a5.png" style="height:16px; width:16px" /> Phân loại CTRSH cũng mang lại những lợi ích về mặt xã hội, góp phần nâng cao nhận thức của cộng đồng trong việc bảo vệ môi trường hình thành ở mỗi cá nhân nhận thức bảo vệ môi trường sống.<br />
<br />
<img alt="📣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tba/1/16/1f4e3.png" style="height:16px; width:16px" /> Để bảo vệ môi trường, tiết kiệm tài nguyên, có thêm những lợi ích về kinh tế thì chúng ta hãy tập thói quen phân loại rác tại nguồn từ mỗi hộ gia đình.<br />
<br />
<img alt="📣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tba/1/16/1f4e3.png" style="height:16px; width:16px" /> Phân loại rác tại nguồn, hành động nhỏ ý nghĩa lớn!<br />
<br />
Bài, ảnh: HEPCO<br />
Ảnh: mô hình mẫu thùng lưu chứa chất thải rắn sinh hoạt phân loại áp dụng cho chương trình Phân loại Chất thải rắn sinh hoạt tại nguồn trên địa bàn Thành phố Huế sẽ triển khai trong thời gian sắp đến.</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/07-04.jpg" style="height:540px; width:720px" /></p>', N'/uploads/images/07-04.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"Phân loại chất thải rắn sinh hoạt tại nguồn đem lại những lợi ích gì?","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay', N'05/04/2021', N'<p><span style="color:#27ae60"><strong>Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay</strong></span></p>

<p><img alt="▶️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t40/1/16/25b6.png" style="height:16px; width:16px" /> Từ ngày 24/03/2021, VNPT Pay chính thức ra mắt tính năng "Vệ sinh môi trường", theo đó người dân tại Huế đã có thể thanh toán hóa đơn vệ sinh môi trường một cách nhanh chóng và tiện lợi.<br />
<br />
<img alt="✴️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8f/1/16/2734.png" style="height:16px; width:16px" /> Tiện ích thanh toán dịch vụ nói trên do công ty Cổ phần Môi trường Đô thị Huế (HEPCO) kết hợp cùng VNPT Pay thực hiện, cho phép người dân cư trú tại Huế thanh toán tiền dịch vụ thu gom, vận chuyển rác thải không dùng tiền mặt qua ứng dụng VNPT Pay.<br />
<br />
<img alt="💳" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tdd/1/16/1f4b3.png" style="height:16px; width:16px" /> Tính năng này vừa giúp khách hàng thao tác thanh toán đơn giản, tiện lợi, an toàn vừa hỗ trợ đơn vị triển khai dịch vụ trong việc điều hành, quản lý thu phí vệ sinh. Đây được xem là giải pháp góp phần hoàn thiện Chiến lược thúc đẩy tài chính toàn diện đến năm 2025 Chính Phủ đề ra, đồng thời giúp đẩy nhanh công cuộc Chuyển đổi số Quốc gia.<br />
<br />
Truy cập: ''VNPT Pay'' > ''Dịch vụ khác'' > ''Vệ sinh môi trường''</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/05-04.jpg" style="height:1080px; width:1080px" /></p>', N'/uploads/images/05-04.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thanh toán hóa đơn Vệ sinh môi trường với VNPT Pay","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'"Tiếng chổi tre" trong đêm', N'03/04/2021', N'<p>LẮNG NGHE “ TIẾNG CHỔI TRE” TRONG ĐÊM</p>

<p>Giữa cuộc sống bề bộn, hối hả, có bao giờ bạn dừng lại để chiêm nghiệm những điều rất đỗi bình dị, thiết thực không?</p>

<p>Đã bao giờ bạn tự hỏi những con đường mình đi qua hằng ngày sao lại đẹp và sạch sẽ đến thế chưa?</p>

<p>Đằng sau những cung đường đó luôn có những “ người hùng” thầm lặng cùng tiếng chổi tre vẫn vang vọng trên khắp tuyến đường để đem lại hạnh phúc cho đời.</p>

<p>Mỗi chúng ta, cần có ý thức giữ gìn và bảo vệ môi trường, ít nhất là trong việc vứt rác đúng nơi quy định.</p>

<p>Bạn một tay, chúng tôi một tay cùng nhau xây dựng thành phố Xanh-Sạch-Đẹp</p>

<p>Hãy thử tĩnh lại lắng nghe vài nhịp của “Tiếng chổi tre” nhé!</p>

<p>Hình ảnh: HepCo</p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/03-04(2).jpg" style="height:682px; width:1024px" /><img alt="" src="/Public/Upload/images/Tintuc/03-04.jpg" style="height:1024px; width:682px" /><img alt="" src="/Public/Upload/images/Tintuc/03-04(3).jpg" style="height:1024px; width:682px" /><img alt="" src="/Public/Upload/images/Tintuc/03-04(4).jpg" style="height:1024px; width:682px" /><img alt="" src="/Public/Upload/images/Tintuc/03-04(5).jpg" style="height:1024px; width:682px" /></p>', N'/uploads/images/03-04_5_.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[],"images":[],"summary":"\"Tiếng chổi tre\" trong đêm","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Rác thải hàng ngày mất bao lâu mới phân hủy?', N'02/04/2021', N'<p>RÁC THẢI HÀNG NGÀY CỦA BẠN MẤT BAO LÂU MỚI PHÂN HỦY?<br />
<img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Bạn có biết, một cái lõi táo ăn dở mất khoảng 2 tháng để phân hủy, trong khi bọc nước mía bạn vừa uống một hơi cho đã khát rồi vứt đại đâu đó bên đường, nó phải mất từ 10 – 20 năm mới biến mất không? Và rồi khi túi nhựa tràn ra đại dương, các sinh vật biển có thể nuốt nhầm, để rồi chết trong đau đớn.<br />
<br />
<img alt="✍️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/te2/1/16/270d.png" style="height:16px; width:16px" /> Infographic dưới đây sẽ giúp chúng ta có thể hiểu thêm về thời gian phân hủy của những rác thải sinh hoạt thường ngày.<br />
<br />
Nguồn: <a href="https://moitruong.net.vn/infographics-rac-thai-hang-ngay-cua-ban-mat-bao-lau-de-phan-huy/?fbclid=IwAR3QP4O56p-DuJ8pk95eHGV6dXe_b3_-bdrIfXKbxNAqdWAfqTxOMauicck" rel="nofollow noopener" tabindex="0" target="_blank">https://moitruong.net.vn/infographics-rac-thai-hang-ngay.../</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/02-04.png" style="height:1793px; width:800px" /></p>', N'/uploads/images/02-04.png', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Rác thải hàng ngày mất bao lâu mới phân hủy?","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thời gian để phân hủy một số rác thải nhựa trong đại dương?', N'01/04/2021', N'<p>THỜI GIAN ĐỂ PHÂN HỦY MỘT SỐ RÁC THẢI NHỰA TRONG ĐẠI DƯƠNG?</p>

<p><img alt="➡️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t9e/1/16/27a1.png" style="height:16px; width:16px" /> Chúng ta thường nghĩ các loại rác thải sau khi bị vứt đi sẽ vào các khu xử lý rác, thật ra thì một phần lớn chúng sẽ đến những bãi chôn lấp và thậm chí tệ hơn là tuồn ra đại dương.</p>

<p><img alt="❓" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t4c/1/16/2753.png" style="height:16px; width:16px" /> Nhưng điều gì thực sự xảy ra với mảnh rác đó và nó sẽ ảnh hưởng đến môi trường của chúng ta trong bao lâu<img alt="❓" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t4c/1/16/2753.png" style="height:16px; width:16px" /></p>

<p><img alt="❌" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tdd/1/16/274c.png" style="height:16px; width:16px" /> Loại rác thải để lại hậu quả lâu dài nhất chính là nhựa, vì chúng rất khó phân hủy nhưng lại dễ sản xuất. Loại rác thải này có tuổi thọ cao hơn chúng ta rất nhiều, thậm chí gấp 10 lần chúng ta. Một ví dụ điển hình là chai nhựa đựng nước bạn uống hằng ngày chẳng hạn, chúng có thể tồn tại lên đến 10 thế kỷ. Và khi chúng bị phân rã không có nghĩa là đã bị loại trừ hoàn toàn, chỉ là từ một mảnh lớn bây giờ chúng tách thành những mảnh nhỏ xíu và tiếp tục phá hủy đại dương từng chút một.</p>

<p><img alt="👉" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png" style="height:16px; width:16px" /> Infographic sau đây sẽ cho chúng ta biết các loại rác thải nhựa được hình thành từ đâu và vòng đời của chúng kéo dài bao lâu:</p>

<p>Nguồn tham khảo: <a href="https://tinhte.vn/thread/infographic-mat-bao-lau-de-rac-thai-nhua-co-the-phan-huy.2803279/?fbclid=IwAR36GRz0XD1PEPrzS2A5l5n88jjjn-hHdTiYCSJ2UNqzTI8C9HA4M5L7dOg" rel="nofollow noopener" tabindex="0" target="_blank">https://tinhte.vn/.../infographic-mat-bao-lau-de-rac.../</a></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-04(3).png" style="height:597px; width:566px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-04(4).png" style="height:503px; width:679px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-04(5).png" style="height:567px; width:680px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-04(6).png" style="height:500px; width:682px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-04(7).png" style="height:492px; width:677px" /></p>

<p style="text-align:center"><img alt="" src="/Public/Upload/images/Tintuc/01-04(8).png" style="height:551px; width:606px" /></p>', N'/uploads/images/01-04_3_.png', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Thời gian để phân hủy một số rác thải nhựa trong đại dương?","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Quy trình phân loại rác ở Nhật Bản', N'01/04/2021', N'<p>Ở NHẬT BẢN, PHÂN LOẠI RÁC VÀ BỎ RÁC NHƯ THẾ NÀO?</p>

<p><img alt="✍" src="https://static.xx.fbcdn.net/images/emoji.php/v9/te2/1/16/270d.png" style="height:16px; width:16px" /> HEPCO sẽ giúp bạn tìm hiểu về quy định bỏ rác ở Nhật ngay sau đây nhé!</p>

<p><img alt="1️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t7a/1/16/31_20e3.png" style="height:16px; width:16px" /> CÁCH PHÂN LOẠI RÁC: Ở Nhật, rác thường chia rác thành 4 loại lớn:</p>

<p>- Rác có thể đốt như rác nhà bếp, giấy vụn, vải quần áo.</p>

<p>- Rác không thể đốt như kim loại, thủy tinh, sành sứ.</p>

<p>- Rác tái chế như chai pet, bình, can, giấy báo.</p>

<p>- Rác cỡ lớn như đồ gia dụng cỡ lớn.</p>

<p><img alt="Các khay phân loại rác" src="/Public/Upload/images/Tintuc/01-04.png" style="height:395px; width:595px" /></p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Tuy nhiên, theo “luật tái chế đồ điện gia dụng” nhằm khuyến khích tái chế đồ điện gia dụng, có quy định chính quyền địa phương sẽ không thu gom đồ điện gia dụng như máy điều hòa, tivi, tủ lạnh, máy giặt,...</p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Trong 4 loại rác chính, Rác tái chế có nhiều loại, nhưng khi bỏ rác không gom chung vào một túi, mà phải phân chia từng loại là chai PET, chai lọ, lon hộp. Cần phải thanh toán phí tái chế khoảng 1,000~6,000 yên, cửa hàng thu mua sẽ tới thu gom hoặc mang tới “địa điểm giao dịch chỉ định” gần nhà.</p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Ở Nhật, rác có thể đốt được bỏ vào TÚI ĐỰNG RÁC bao gồm "túi nilon có thể nhìn được bên trong (túi trong suốt, túi bóng mờ, không dễ bị rách)".</p>

<p><img alt="2️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t99/1/16/32_20e3.png" style="height:16px; width:16px" /> BỎ RÁC Ở ĐÂU?</p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Địa điểm và cách bỏ rác ở Nhật có 2 loại là "bãi gom rác tập trung" và "gom rác tận nhà".</p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Bãi gom rác tập trung chủ yếu là khu vực để rác được bố trí ở khu dân cư tập trung như chung cư, căn hộ. Ở khu vực có ít người sống, chỗ gom rác tập trung bố trí ở ven đường.</p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Ngược lại, rác được để ngay trước nhà của các hộ gia đình, sau đó công nhân vệ sinh đi tới từng nhà một để gom rác, đây gọi là hình thức gom rác tận nhà.</p>

<p><img alt="3️⃣" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tb8/1/16/33_20e3.png" style="height:16px; width:16px" /> THỜI GIAN BỎ RÁC?</p>

<p><img alt="♻️" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf8/1/16/267b.png" style="height:16px; width:16px" /> Rác được bỏ vào các ngày do địa phương quy định. Ví dụ, rác có thể đốt bỏ vào thứ 4, rác không thể đốt bỏ vào thứ 6, mỗi khu vực lại quy định vào các thứ khác nhau. Rác được bỏ vào các ngày do địa phương quy định. Ví dụ, rác có thể đốt bỏ vào thứ 4, rác không thể đốt bỏ vào thứ 6, mỗi khu vực lại quy định vào các thứ khác nhau.</p>

<p><img alt="💪" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t6c/1/16/1f4aa.png" style="height:16px; width:16px" /> HÃY PHÂN LOẠI RÁC VÀ BỎ RÁC ĐÚNG QUI ĐỊNH ĐỂ BẢO VỆ MỘT MÔI TRƯỜNG XANH - SẠCH - ĐẸP NHÉ!</p>

<p><img alt="" src="/Public/Upload/images/Tintuc/01-04(2).png" style="height:426px; width:640px" /></p>

<p>Nguồn tham khảo: <a href="https://matcha-jp.com/vn/10149?fbclid=IwAR0ZBflxrvW9L7BUczVBGxfnnDqkTusaqJkCEJs97ao9EHAAvQIu3-Y03y8" rel="nofollow noopener" tabindex="0" target="_blank">https://matcha-jp.com/vn/10149</a></p>', N'/uploads/images/01-04_2_.png', N'news', N'{"category":"environment","publishYear":2021,"attachments":[],"images":[],"summary":"Quy trình phân loại rác ở Nhật Bản","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về hút hầm vệ sinh trên địa bàn thành phố Huế', N'11/05/2021 9:58', N'<p style="text-align:justify"><span style="font-size:18px"><span style="color:#000000"><span style="font-family:"Times New Roman",serif">Hiện nay trên địa bàn thành phố Huế và tỉnh Thừa Thiên Huế xuất hiện một số tổ chức, cá nhân mạo danh Công ty Cổ phần Môi trường và Công trình Đô thị Huế phát tờ rơi, hoặc dán áp phích quảng cáo (không ghi địa chỉ trụ sở, chỉ có số điện thoại di động liên lạc) để thực hiện dịch vụ hút hầm vệ sinh và các dịch vụ khác.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="color:#000000"><span style="font-family:"Times New Roman",serif">Các đối tượng mạo danh thực hiện dịch vụ với giá rất cao (gấp 3 đến 4 lần giá dịch vụ hút hầm vệ sinh do Công ty thực hiện), ảnh hưởng đến uy tín của Công ty.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="color:#000000"><span style="font-family:"Times New Roman",serif">Vậy Công ty Cổ phần Môi trường và Công trình Đô thị Huế thông báo để các tổ chức và cá nhân trên địa bàn tỉnh biết và lưu ý.</span></span></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="color:#000000"><span style="font-family:"Times New Roman",serif">Khi các tổ chức, cá nhân có nhu cầu hút hầm vệ sinh, hoặc các dịch vụ vệ sinh khác, xin vui lòng liên hệ Công ty Cổ phần Môi trường và Công trình Đô thị Huế tại: <strong>46 Trần Phú-Huế</strong>; hoặc qua điện thoại số: 054. <strong>3823896</strong>, <strong>3848242-113</strong>;</span></span></span></p>

<p style="text-align:justify"><span style="font-size:18px"><span style="color:#000000"><span style="font-family:"Times New Roman",serif">Rất hân hạnh phục vụ quý khách hàng. </span></span></span></p>', N'/uploads/images/thongbao.jpg', N'announcement', N'{"category":"announcement","publishYear":2021,"attachments":[],"images":[],"summary":"Thông báo về hút hầm vệ sinh trên địa bàn thành phố Huế","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Bán thanh lý tài sản', N'11/05/2021 9:59', N'<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">Công ty Cổ phần Môi trường và Công trình Đô thị Huế tổ chức bán thanh lý các tài sản đã qua sử dụng như sau:</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">1.Chi tiết tài sản bán thanh lý:</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">Đính kèm phụ lục: Chi tiết tài sản bán thanh lý năm 2016</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">2. Hình thức bán:</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Chào giá cạnh tranh theo hình thức bỏ giá bằng phiếu kín một lần duy nhất, người trả giá cao nhất là người trúng chào giá và được mua (ưu tiên cho người mua cả lô hàng).</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Nếu người trả giá cao nhất sau 03 ngày kể từ khi nhận được thông báo trúng chào giá mà không tới trụ sở Công ty Cổ phần Môi trường và Công trình Đô thị Huế ký hợp đồng thì người đó mất tiền đặt cọc và quyền mua tài sản sẽ thuộc về người trả giá cao sau liền kề.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">3. Thời gian xem tài sản: vào lúc 09h00 ngày 16/6/2016 tại Khu Tập kết Vật liệu xây dựng HTKT Hương Sơ  - Cụm Công nghiệp, làng nghề Hương Sơ, thành phố Huế.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">4. Thời gian đăng ký, nhận thư chào giá và đặt cọc.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Thời gian đăng ký và đặt cọc: không quá 03 ngày làm việc kể từ ngày xem tài sản. Số tiền đặt cọc: 10.000.000đ (mười triệu đồng).</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Thư tham gia chào giá được gửi phong bì dán kín và gửi trực tiếp tới địa chỉ:</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">+ Phòng Kế hoạch – Vật tư thuộc Công ty Cổ phần Môi trường và Công trình Đô thị Huế</span></span><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">+ Địa chỉ: 46 Trần Phú – Phước Vĩnh – Huế.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">+ Điện thoại liên hệ: 0543 848242-202</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Trên phong bì ghi rõ: thư chào giá nguyên lô hoặc thư chào giá từng loại phương tiện, thiết bị trong danh mục (Đính kèm mẫu thư chào giá).</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Thời gian nhận thư: từ 9h30 ngày 16/6/2016 đến 9h00 ngày 22/6/2016.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><em><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">* Thư chào giá được xem là hợp lệ khi có dấu treo của Công ty Cổ phần Môi trường và Công trình Đô thị Huế và đã nộp tiền đặt cọc.</span></span></em></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">5. Thời gian công bố người trúng:</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Hội đồng bán tài sản của Công ty Cổ phần Môi trường và Công trình Đô thị Huế sẽ mở thư chào giá công khai và thông báo người trúng chào giá.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">Thời gian tổ chức mở thư chào hàng: 09h30 ngày 22/6/2016 tại 46 Trần Phú – Phước Vĩnh – Huế</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="font-size:13.5pt"><span style="font-family:"Times New Roman",serif">- Người trúng hoặc không trúng chào giá chúng tôi sẽ gửi thư thông báo về địa chỉ được cung cấp trên thư tham gia chào giá.</span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><em><a href="/Public/Upload/files/Tintuc/CV.423.TB-MT%C4%90T.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank" title="Công văn số 423/TB-MTĐT">Chi tiết xem tệp đính kèm</a></em></span></span></p>', N'/uploads/images/thongbao.jpg', N'news', N'{"category":"company_activity","publishYear":2021,"attachments":[{"title":"Chi tiết xem tệp đính kèm","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/CV.423.TB-MT%C4%90T.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/CV.423.TB-MT%C4%90T.pdf","fileName":"CV.423.TB-MT%C4%90T.pdf"}],"images":[],"summary":"Bán thanh lý tài sản","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo thay đổi hình thức thanh toán tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phố Huế', N'20/05/2021 11:20', N'<p><span style="font-size:16px"><span style="color:#000000"><span style="font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif">Công ty Cổ phần Môi trường và Công trình Đô thị Huế (Công ty) kính thông báo đến toàn thể Quý khách hàng về việc thanh toán tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phố Huế bằng hình thức thanh toán trực tuyến qua máy in cầm tay và dịch vụ thu hộ thông qua các ví điện tử thay thế cho biên nhận thanh toán tiền in sẵn kể từ ngày 01/01/2021.</span></span></span></p>

<p><span style="font-size:16px"><span style="color:#000000"><span style="font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif"><span style="font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif">1. </span>Thanh toán tiền bằng máy in cầm tay: Nhân viên thu tiền sẽ thu trực tiếp từ khách hàng và in biên nhận bằng máy in cầm tay do Công ty trang cấp.</span></span></span></p>

<table cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none; font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif; font-size:12px; height:332px; padding:0px; width:703px">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:374px; vertical-align:top; width:302px">
			<p style="text-align:center"><span style="font-size:16px"><span style="color:#000000"><span style="color:#000000"><span style="font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif">Mẫu máy in: Sunmi v2, màu cam-xám-đen</span></span></span></span></p>

			<p><span style="font-size:16px"><span style="color:#000000"><span style="color:#000000"> </span></span></span></p>

			<p><span style="font-size:16px"><span style="color:#000000"><span style="color:#000000"><img alt="" src="/Public/Upload/images/SunmiV2.jpeg" style="font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif; font-size:12px; height:350px; padding:0px; text-align:center; text-indent:23.1pt; width:350px" /></span></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:374px; vertical-align:top; width:302px">
			<p style="text-align:center"><span style="font-size:16px"><span style="color:#000000"><span style="color:#000000"><span style="font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif">Mẫu biên nhận thanh toán tiền in bằng máy in cầm tay</span></span></span></span></p>

			<p style="text-align:center"><span style="font-size:16px"><span style="color:#000000"><span style="color:#000000"> <img alt="" src="/Public/Upload/images/MauBNTTT.jpg" style="font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif; font-size:12px; height:350px; padding:0px; width:200px" /></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:16px"><span style="color:#000000">2.  Thanh toán tiền bằng dịch vụ thu hộ thông qua các ví điện tử: Thông qua ứng dụng thu hộ do các nhà cung cấp dịch vụ có thu hộ tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phồ Huế, các nhà cung cấp dịch vụ thu hộ gồm có: Ví điện tử MOMO, VNPT Pay.</span></span></p>

<p><span style="font-size:16px"><span style="color:#000000">Công ty kính thông báo đến toàn thể Quý khách hàng biết hỗ trợ trong quá trình triển khai.</span></span></p>

<p><span style="font-size:16px"><span style="color:#000000">Trân trọng!</span></span></p>

<p style="text-align:justify"><span style="font-size:16px"><span style="background-color:#ffffff"><span style="color:#3498db"><em>(</em></span><em><a href="/Public/Upload/files/Tintuc/HEPCO.20210121.ThongBao.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="color:#3498db">Đính kèm file thông báo</span></a><span style="color:#3498db">)</span></em></span></span></p>

<div class="ddict_btn" style="left:151.844px; top:804px"><span style="font-size:16px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/16.png" /></span></div>', N'/uploads/images/SunmiV2.jpeg', N'announcement', N'{"category":"announcement","publishYear":2021,"attachments":[{"title":"Đính kèm file thông báo","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/HEPCO.20210121.ThongBao.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/HEPCO.20210121.ThongBao.pdf","fileName":"HEPCO.20210121.ThongBao.pdf"}],"images":[],"summary":"Thông báo thay đổi hình thức thanh toán tiền dịch vụ thu gom, vận chuyển rác thải sinh hoạt trên địa bàn thành phố Huế","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'HEPCO Khánh thành trung tâm giám sát thông minh', N'23/10/2020 7:50:02 AM', N'<p style="text-align:justify">Sáng 17/8, Công ty cổ phần Môi trường và Công trình đô thị Huế tổ chức lễ khánh thành Trung tâm Giám sát, điều hành thông minh về môi trường và chính thức triển khai thí điểm thu gom rác thải sinh hoạt bằng xe điện. UVTV Tỉnh ủy, Bí thư Thành ủy Huế Huỳnh Cư; Phó Chủ tịch UBND tỉnh Phan Thiên Định đến dự.</p>

<p style="text-align:justify">Trung tâm Giám sát, điều hành thông minh của Công ty cổ phần Môi trường và Công trình đô thị Huế là một tổ hợp hệ thống giám sát, bao gồm: Giám sát, quản lý hạ tầng kỹ thuật, công tác vệ sinh môi trường; giám sát hành trình phương tiện thu gom rác và hệ thống điện chiếu sáng.</p>

<p style="text-align:justify">Thông qua hệ thống camera giám sát được chia sẻ từ Sở Thông tin và Truyền thông và camera giám sát của thành phố Huế, Công ty cổ phần Môi trường và Công trình đô thị Huế có thể giám sát được công tác vệ sinh môi trường; kịp thời xử lý những vấn đề về vệ sinh môi trường và vi phạm hạ tầng kỹ thuật; giám sát lộ trình đường đi, tốc độ và việc chấp hành Luật Giao thông đường bộ của các xe chuyên chở, vận chuyển rác; quy trình làm việc, việc chấp hành nguyên tắc về an toàn lao động, chất lượng vệ sinh đường phố của người lao động; chủ động điều khiển hệ thống điện chiếu sáng; kịp thời xử lý tình huống khi có sự cố về điện…</p>

<p style="text-align:justify">Từ tháng 4/2019, Công ty cổ phần Môi trường và Công trình đô thị Huế đã nghiên cứu, đổi mới công nghệ thu gom rác. Theo đó, đã đưa 8 xe điện 3 bánh vào thử nghiệm thu gom rác trên địa bàn, bước đầu đem lại hiệu quả khả quan.</p>

<p style="text-align:justify"><img alt="" src="https://thuathienhue.gov.vn/Portals/0/nam%202019/THANG%208/m_20190816_khanhthanh3.jpg" /></p>

<p style="text-align:justify"><strong>Trung tâm Giám sát, điều hành thông minh của Công ty cổ phần Môi trường và Công trình đô thị Huế<br />
 là một tổ hợp hệ thống giám sát</strong></p>

<p style="text-align:justify">Ngoài tăng năng suất lao động, sự nặng nhọc, độc hại đối với người lao động cũng giảm đi nhiều. Bên cạnh đó, loại xe này phù hợp với địa hình, địa điểm thành phố du lịch và được người dân rất đồng tình, ủng hộ. Theo kế hoạch, xe điện 3 bánh thu gom rác sẽ được công ty nhân rộng, với việc đưa vào hoạt động 40 xe nữa trong thời gian tới. </p>

<p style="text-align:justify">Phát biểu tại lễ khánh thành, Phó Chủ tịch UBND tỉnh Phan Thiên Định đánh giá cao ý tưởng, sự nỗ lực cố gắng của tập thể lãnh đạo, cán bộ, công nhân viên của Công ty cổ phần Môi trường và Công trình đô thị Huế; đồng thời khẳng định, việc ứng dụng công nghệ thông tin trong lĩnh vực quản lý, điều hành là một yếu tố quan trọng trong thời điểm hiện nay. Đây là công trình có ý nghĩa hưởng ứng đề án “Ngày Chủ nhật xanh” của UBND tỉnh; góp phần làm cho thành phố Huế ngày càng “Xanh – sạch – sáng” hơn.</p>

<p style="text-align:justify">Được biết, hiện Công ty cổ phần Môi trường và Công trình đô thị Huế thực hiện công tác vệ sinh trên 1.830 tuyến đường kiệt; vận hành hơn 430km điện chiếu sáng và hơn 11.770 điểm sáng, 227 trạm đóng cắt điện và nhiều hệ thống điện chiếu sáng nghệ thuật, trang trí đường phố...</p>', N'/uploads/images/hepcohue-1.jpg', N'news', N'{"category":"company_activity","publishYear":2020,"attachments":[],"images":[],"summary":"HEPCO Khánh thành trung tâm giám sát thông minh","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Lịch trình vệ sinh, thu gom rác tại các phường thuộc địa bàn thành phố Huế', N'11/05/2021 10:25', N'<p>Công ty Cổ phần Môi trường và Công trình Đô thị Huế kính thông báo Lịch trình vệ sinh, thu gom rác tại các phường thuộc địa bàn thành phố Huế như sau:</p>

<p>* Khu vực Bắc Sông Hương:</p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.An%20Hoa.pdf" target="_blank">- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Hòa.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.An%20Hoa%20-%20qua%20thung.pdf" target="_blank">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Hòa.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Huong%20Long.pdf" target="_blank">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Hương Long.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Huong%20Long%20-%20qua%20thung.pdf" target="_blank">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Hương Long.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Huong%20So.pdf" target="_blank">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Hương Sơ.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long%20-%20qua%20thung.pdf" target="_blank">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Hương Sơ.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long.pdf" target="_blank">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Kim Long.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long%20-%20qua%20thung.pdf" target="_blank">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Kim Long.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Binh.pdf" target="_blank">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Bình.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Binh%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Bình.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Cat.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Cát.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Cat%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Cát.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hau.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hậu.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hau%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hậu.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hiep.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hiệp.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hiep%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hiệp.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hoa.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hòa.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hoa%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hòa.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Thuan.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Thuận.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Phu%20Thuan%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Thuận.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Tay%20Loc.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Tây Lộc.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Tay%20Loc%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Tây Lộc.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Hoa.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thuận Hòa.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Hoa%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thuận Hòa.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Loc.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thuận Lộc.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Loc%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thuận Lộc.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Thanh.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thuận Thành.</a></p>

<p><a href="/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Thanh%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thuận Thành.</a></p>

<p> </p>

<p>* Khu vực Nam Sông Hương:</p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.An%20Cuu.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Cựu.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.An%20Cuu%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Cựu.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.An%20Dong.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Đông.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.An%20Dong%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Đông.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.An%20Tay.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Tây.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.An%20Tay%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Tây.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phu%20Hoi.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hội.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phu%20Hoi%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hội.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phu%20Nhuan.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Nhuận.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phu%20Nhuan%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Nhuận.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phuoc%20Vinh.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phước Vĩnh.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phuoc%20Vinh%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phước Vĩnh.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phuong%20Duc.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phường Đúc.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Phuong%20Duc%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phường Đúc.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Bieu.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thủy Biều.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Bieu%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thủy Biều.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Xuan.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thủy Xuân.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Xuan%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thủy Xuân.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Truong%20An.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Trường An.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Truong%20An%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Trường An.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Vinh%20Ninh.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Vĩnh Ninh.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Vinh%20Ninh%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Vĩnh Ninh.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Vy%20Da.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Vỹ Dạ.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Vy%20Da%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Vỹ Dạ.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Xuan%20Phu.pdf">- Lịch trình vệ sinh, thu gom rác thủ công tại phường Xuân Phú.</a></p>

<p><a href="/Public/Upload/files/Tintuc/NSH/2020.Xuan%20Phu%20-%20qua%20thung.pdf">- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Xuân Phú.</a></p>', N'/uploads/images/Thu_gom_rac.jpg', N'news', N'{"category":"environment","publishYear":2021,"attachments":[{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Hòa.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.An%20Hoa.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.An%20Hoa.pdf","fileName":"2020.An%20Hoa.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Hòa.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.An%20Hoa%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.An%20Hoa%20-%20qua%20thung.pdf","fileName":"2020.An%20Hoa%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Hương Long.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Huong%20Long.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Huong%20Long.pdf","fileName":"2020.Huong%20Long.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Hương Long.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Huong%20Long%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Huong%20Long%20-%20qua%20thung.pdf","fileName":"2020.Huong%20Long%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Hương Sơ.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Huong%20So.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Huong%20So.pdf","fileName":"2020.Huong%20So.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Hương Sơ.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long%20-%20qua%20thung.pdf","fileName":"2020.Kim%20Long%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Kim Long.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long.pdf","fileName":"2020.Kim%20Long.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Kim Long.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Kim%20Long%20-%20qua%20thung.pdf","fileName":"2020.Kim%20Long%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Bình.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Binh.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Binh.pdf","fileName":"2020.Phu%20Binh.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Bình.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Binh%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Binh%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Binh%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Cát.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Cat.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Cat.pdf","fileName":"2020.Phu%20Cat.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Cát.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Cat%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Cat%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Cat%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hậu.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hau.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hau.pdf","fileName":"2020.Phu%20Hau.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hậu.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hau%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hau%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Hau%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hiệp.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hiep.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hiep.pdf","fileName":"2020.Phu%20Hiep.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hiệp.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hiep%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hiep%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Hiep%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hòa.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hoa.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hoa.pdf","fileName":"2020.Phu%20Hoa.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hòa.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hoa%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Hoa%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Hoa%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Thuận.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Thuan.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Thuan.pdf","fileName":"2020.Phu%20Thuan.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Thuận.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Thuan%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Phu%20Thuan%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Thuan%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Tây Lộc.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Tay%20Loc.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Tay%20Loc.pdf","fileName":"2020.Tay%20Loc.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Tây Lộc.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Tay%20Loc%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Tay%20Loc%20-%20qua%20thung.pdf","fileName":"2020.Tay%20Loc%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thuận Hòa.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Hoa.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Hoa.pdf","fileName":"2020.Thuan%20Hoa.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thuận Hòa.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Hoa%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Hoa%20-%20qua%20thung.pdf","fileName":"2020.Thuan%20Hoa%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thuận Lộc.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Loc.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Loc.pdf","fileName":"2020.Thuan%20Loc.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thuận Lộc.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Loc%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Loc%20-%20qua%20thung.pdf","fileName":"2020.Thuan%20Loc%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thuận Thành.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Thanh.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Thanh.pdf","fileName":"2020.Thuan%20Thanh.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thuận Thành.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Thanh%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/BSH/2020.Thuan%20Thanh%20-%20qua%20thung.pdf","fileName":"2020.Thuan%20Thanh%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Cựu.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Cuu.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Cuu.pdf","fileName":"2020.An%20Cuu.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Cựu.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Cuu%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Cuu%20-%20qua%20thung.pdf","fileName":"2020.An%20Cuu%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Đông.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Dong.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Dong.pdf","fileName":"2020.An%20Dong.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Đông.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Dong%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Dong%20-%20qua%20thung.pdf","fileName":"2020.An%20Dong%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường An Tây.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Tay.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Tay.pdf","fileName":"2020.An%20Tay.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường An Tây.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Tay%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.An%20Tay%20-%20qua%20thung.pdf","fileName":"2020.An%20Tay%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Hội.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Hoi.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Hoi.pdf","fileName":"2020.Phu%20Hoi.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Hội.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Hoi%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Hoi%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Hoi%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phú Nhuận.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Nhuan.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Nhuan.pdf","fileName":"2020.Phu%20Nhuan.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phú Nhuận.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Nhuan%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phu%20Nhuan%20-%20qua%20thung.pdf","fileName":"2020.Phu%20Nhuan%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phước Vĩnh.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuoc%20Vinh.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuoc%20Vinh.pdf","fileName":"2020.Phuoc%20Vinh.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phước Vĩnh.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuoc%20Vinh%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuoc%20Vinh%20-%20qua%20thung.pdf","fileName":"2020.Phuoc%20Vinh%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Phường Đúc.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuong%20Duc.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuong%20Duc.pdf","fileName":"2020.Phuong%20Duc.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Phường Đúc.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuong%20Duc%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Phuong%20Duc%20-%20qua%20thung.pdf","fileName":"2020.Phuong%20Duc%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thủy Biều.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Bieu.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Bieu.pdf","fileName":"2020.Thuy%20Bieu.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thủy Biều.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Bieu%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Bieu%20-%20qua%20thung.pdf","fileName":"2020.Thuy%20Bieu%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Thủy Xuân.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Xuan.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Xuan.pdf","fileName":"2020.Thuy%20Xuan.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Thủy Xuân.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Xuan%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Thuy%20Xuan%20-%20qua%20thung.pdf","fileName":"2020.Thuy%20Xuan%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Trường An.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Truong%20An.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Truong%20An.pdf","fileName":"2020.Truong%20An.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Trường An.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Truong%20An%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Truong%20An%20-%20qua%20thung.pdf","fileName":"2020.Truong%20An%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Vĩnh Ninh.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vinh%20Ninh.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vinh%20Ninh.pdf","fileName":"2020.Vinh%20Ninh.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Vĩnh Ninh.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vinh%20Ninh%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vinh%20Ninh%20-%20qua%20thung.pdf","fileName":"2020.Vinh%20Ninh%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Vỹ Dạ.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vy%20Da.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vy%20Da.pdf","fileName":"2020.Vy%20Da.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Vỹ Dạ.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vy%20Da%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Vy%20Da%20-%20qua%20thung.pdf","fileName":"2020.Vy%20Da%20-%20qua%20thung.pdf"},{"title":"- Lịch trình vệ sinh, thu gom rác thủ công tại phường Xuân Phú.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Xuan%20Phu.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Xuan%20Phu.pdf","fileName":"2020.Xuan%20Phu.pdf"},{"title":"- Lịch trình thu gom rác bằng cơ giới (qua thùng) tại phường Xuân Phú.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Xuan%20Phu%20-%20qua%20thung.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/Tintuc/NSH/2020.Xuan%20Phu%20-%20qua%20thung.pdf","fileName":"2020.Xuan%20Phu%20-%20qua%20thung.pdf"}],"images":[],"summary":"Lịch trình vệ sinh, thu gom rác tại các phường thuộc địa bàn thành phố Huế","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'HEPCO triển khai thí điểm thu gom rác thải sinh hoạt bằng xe điện', N'21/09/2020 11:04:22 AM', N'<p style="text-align:justify"><strong><em>(TN&MT) – Vừa qua, tại TP. Huế (tỉnh Thừa Thiên Huế), Công ty Cổ phần Môi trường và Công trình đô thị Huế (HEPCO) tổ chức lễ khánh thành Trung tâm giám sát điều hành thông minh, đồng thời triển khai thí điểm thu gom rác thải sinh hoạt bằng xe điện.</em></strong></p>

<p style="text-align:justify">HEPCO Huế khánh thành Trung tâm giám sát điều hành thông minh và triển khai thí điểm thu gom rác thải sinh hoạt bằng xe điện</p>

<p style="text-align:justify">Ông Trần Quốc Khánh - Giám đốc Công ty Cổ phần Môi trường và Công trình đô thị Huế cho biết, việc cho ra đời Trung tâm giám sát điều hành thông minh của công ty và triển khai thí điểm thu gom rác thải sinh hoạt bằng xe điện 3 bánh nhằm hưởng ứng việc Thừa Thiên Huế đã có Trung tâm giám sát- điều hành đô thị thông minh tỉnh đầu tiên của Việt Nam, đồng thời hưởng ứng đề án “Ngày chủ nhật xanh” giảm thiểu ô nhiễm và chủ trương của tỉnh về việc đổi mới phương tiện thu gom rác theo hướng hiện đại, thân thiện môi trường...</p>

<p style="text-align:justify">Theo đó, HEPCO Huế đã đưa 40 xe điện hoạt động trong khu vực trung tâm TP. Huế, các tuyến đường dốc trong giai đoạn 2019-2020. Trong giai đoạn 2 (2020-2022) sẽ đưa vào sử dụng 60 xe ở các địa bàn còn lại.</p>

<p style="text-align:justify">Xe điện thu gom rác có công suất 1.000w-2.000w, vận tốc thiết kế lớn nhất không quá 35km/h, bình điện tích hoạt động liên tục 8-10 tiếng. Xe có hệ thống đèn pha chiếu sáng, đèn báo rẽ, đèn báo công tác. Hệ thống loa phát thanh kết hợp hình ảnh tuyên truyền. Xe có thùng chuyên dùng chứa rác... Thời gian hoạt động của xe phù hợp với thời gian thu gom rác trên mỗi tuyến đường.</p>

<p style="text-align:justify">Những chiếc xe điện 3 bánh thân thiện, hiệu quả cao trong thu gom rác thải sinh hoạt</p>

<p style="text-align:justify">“Việc thí điểm sử dụng xe điện thu gom rác trên địa bàn nhằm giảm nặng nhọc, độc hại cho người lao động, tăng chất lượng công tác vệ sinh, mở rộng địa bàn thu gom rác. Thay vì chỉ tập trung gom rác thì nhân viên môi trường đô thị có thời gian chăm sóc cảnh quan môi trường hơn. Tăng tính thẩm mỹ, văn minh hiện đại cho đô thị Huế. Đồng thời nâng cao nhận thức cộng đồng trong bảo vệ môi trường, góp phần phát triển du lịch...”- ông Khánh nói.</p>

<p style="text-align:justify">Trong khi đó, Trung tâm giám sát điều hành thông minh gồm 3 chức năng chính là hệ thống giám sát, quản lý hạ tầng kỹ thuật, vệ sinh môi trường thông qua hệ thống camera chia sẻ từ Sở TT&TT, TP. Huế; hệ thống camera giám sát phương tiện chuyên dụng; giám sát điều khiển hệ thống chiếu sáng khắp thành phố.</p>

<p style="text-align:justify">Đặc biệt ở hệ thống camera giám sát phương tiện chuyên dụng, thông qua camera hành trình được trang bị ở mỗi xe vận chuyển rác sẽ giám sát lộ trình đường đi, tốc độ và việc tuân thủ chấp hành luật giao thông. Thông qua camera này, HEPCO có thể giám sát được việc tuân thủ quy trình làm việc của người lao động, việc chấp hành các nguyên tắc an toàn lao động và chất lượng vệ sinh đường phố, các điểm tập kết thùng rác, xe gom rác...</p>

<p style="text-align:justify">Trung tâm giám sát điều hành thông minh tại HEPCO với nhiều chức năng trong việc bảo vệ môi trường...</p>

<p style="text-align:justify">Phát biểu tại buổi lễ, ông Phan Thiên Định - Phó Chủ tịch UBND tỉnh Thừa Thiên Huế cho rằng, những phong trào như “Ngày Chủ nhật xanh”, “Nói không với túi ni lông và rác thải nhựa”... đang được nhiều tầng lớp hưởng ứng và đạt nhiều kết quả tích cực, vì vậy việc đưa xe điện thu gom rác thải sinh hoạt là việc làm đúng đắn, phù hợp và ý nghĩa nhằm tạo môi trường sống trong sạch, đảm bảo sức khỏe của người dân..</p>

<p style="text-align:justify">“Để thành công hơn, HEPCO cần tiếp tục đổi mới tư duy, công tác quản lý. Tiếp tục tuyên truyền các phong trào chống ô nhiễm môi trường nhằm giảm lượng rác thải và tăng ý thức cho người dân. Tỉnh sẽ tạo điều kiện cùng công ty để phát triển trung tâm giám sát và xe điện thu gom rác trong thời gian tới...”, ông Định nhấn mạnh.</p>

<p style="text-align:justify"><strong>Văn Dinh</strong></p>', N'/uploads/images/m_20190816_khanhthanh2.jpg', N'news', N'{"category":"environment","publishYear":2020,"attachments":[],"images":[],"summary":"HEPCO triển khai thí điểm thu gom rác thải sinh hoạt bằng xe điện","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị công ty (6 tháng đầu năm 2026)', N'14/08/2026 10:05', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202026.pdf" target="_blank">Báo cáo tình hình quản trị công ty (6 tháng đầu năm 2026)</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/DS%20NG%C6%AF%E1%BB%9CI%20NB_0001.pdf" target="_blank">Danh sách người nội bộ</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/TH%C3%94NG%20TIN%20V%E1%BB%80%20QU%E1%BA%A2N%20TR%E1%BB%8A%20C%C3%94NG%20TY_0001.pdf" target="_blank">Thông tin về quản trị công ty 6 tháng đầu năm</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2026,"attachments":[{"title":"Báo cáo tình hình quản trị công ty (6 tháng đầu năm 2026)","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202026.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202026.pdf","fileName":"BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202026.pdf"},{"title":"Danh sách người nội bộ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/DS%20NG%C6%AF%E1%BB%9CI%20NB_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/DS%20NG%C6%AF%E1%BB%9CI%20NB_0001.pdf","fileName":"DS%20NG%C6%AF%E1%BB%9CI%20NB_0001.pdf"},{"title":"Thông tin về quản trị công ty 6 tháng đầu năm","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TH%C3%94NG%20TIN%20V%E1%BB%80%20QU%E1%BA%A2N%20TR%E1%BB%8A%20C%C3%94NG%20TY_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TH%C3%94NG%20TIN%20V%E1%BB%80%20QU%E1%BA%A2N%20TR%E1%BB%8A%20C%C3%94NG%20TY_0001.pdf","fileName":"TH%C3%94NG%20TIN%20V%E1%BB%80%20QU%E1%BA%A2N%20TR%E1%BB%8A%20C%C3%94NG%20TY_0001.pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị công ty (6 tháng đầu năm 2026)","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết kèm quy chế và điều lệ thông qua Đại hội đồng cổ đông', N'18/05/2026 8:27', N'<p><a href="/Public/Upload/files/QuanHeCoDong/NQ%20KEM%20QUY%20CHE%20V%C3%80%20DIEU%20LE%20THONG%20QUA%20DHDCD%2015%2005%202026.pdf" target="_blank">Nghị quyết kèm quy chế và điều lệ thông qua Đại hội đồng cổ đông</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_resolution_minutes","documentType":"agm_resolution_minutes","publishYear":2026,"attachments":[{"title":"Nghị quyết kèm quy chế và điều lệ thông qua Đại hội đồng cổ đông","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NQ%20KEM%20QUY%20CHE%20V%C3%80%20DIEU%20LE%20THONG%20QUA%20DHDCD%2015%2005%202026.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NQ%20KEM%20QUY%20CHE%20V%C3%80%20DIEU%20LE%20THONG%20QUA%20DHDCD%2015%2005%202026.pdf","fileName":"NQ%20KEM%20QUY%20CHE%20V%C3%80%20DIEU%20LE%20THONG%20QUA%20DHDCD%2015%2005%202026.pdf"}],"images":[],"summary":"Nghị quyết kèm quy chế và điều lệ thông qua Đại hội đồng cổ đông","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo kèm nghị quyết HĐQT về việc chi trả cổ tức', N'18/5/2026 14:20', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20ng%C3%A0y%20%C4%91%C4%83ng%20k%C3%BD%20cu%E1%BB%91i%20c%C3%B9ng%20%C4%91%E1%BB%83%20th%E1%BB%B1c%20hi%E1%BB%87n%20quy%E1%BB%81n%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20b%E1%BA%B1ng%20ti%E1%BB%81n%20n%C4%83m%202025.pdf" target="_blank">Thông báo kèm nghị quyết HĐQT về việc chi trả cổ tức</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"board_resolution","documentType":"board_resolution","publishYear":2026,"attachments":[{"title":"Thông báo kèm nghị quyết HĐQT về việc chi trả cổ tức","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20ng%C3%A0y%20%C4%91%C4%83ng%20k%C3%BD%20cu%E1%BB%91i%20c%C3%B9ng%20%C4%91%E1%BB%83%20th%E1%BB%B1c%20hi%E1%BB%87n%20quy%E1%BB%81n%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20b%E1%BA%B1ng%20ti%E1%BB%81n%20n%C4%83m%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20ng%C3%A0y%20%C4%91%C4%83ng%20k%C3%BD%20cu%E1%BB%91i%20c%C3%B9ng%20%C4%91%E1%BB%83%20th%E1%BB%B1c%20hi%E1%BB%87n%20quy%E1%BB%81n%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20b%E1%BA%B1ng%20ti%E1%BB%81n%20n%C4%83m%202025.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20ng%C3%A0y%20%C4%91%C4%83ng%20k%C3%BD%20cu%E1%BB%91i%20c%C3%B9ng%20%C4%91%E1%BB%83%20th%E1%BB%B1c%20hi%E1%BB%87n%20quy%E1%BB%81n%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20b%E1%BA%B1ng%20ti%E1%BB%81n%20n%C4%83m%202025.pdf"}],"images":[],"summary":"Thông báo kèm nghị quyết HĐQT về việc chi trả cổ tức","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết và biên bản Họp đại hội đồng cổ đông thường niên năm 2026', N'15/5/2026 16:45', N'<p><a href="/Public/Upload/files/QuanHeCoDong/NGHI%20QUYET%20DHDCD%202026%20SO%2024%2015%2005%202026.pdf" target="_blank">Nghị quyết Họp đại hội đồng cổ đông thường niên năm 2026</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/BIEN%20BAN%20DHDC%C4%90TN%202026.pdf" target="_blank">Biên bản Họp đại hội đồng cổ đông thường niên năm 2026</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2026,"attachments":[{"title":"Nghị quyết Họp đại hội đồng cổ đông thường niên năm 2026","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NGHI%20QUYET%20DHDCD%202026%20SO%2024%2015%2005%202026.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NGHI%20QUYET%20DHDCD%202026%20SO%2024%2015%2005%202026.pdf","fileName":"NGHI%20QUYET%20DHDCD%202026%20SO%2024%2015%2005%202026.pdf"},{"title":"Biên bản Họp đại hội đồng cổ đông thường niên năm 2026","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BIEN%20BAN%20DHDC%C4%90TN%202026.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BIEN%20BAN%20DHDC%C4%90TN%202026.pdf","fileName":"BIEN%20BAN%20DHDC%C4%90TN%202026.pdf"}],"images":[],"summary":"Nghị quyết và biên bản Họp đại hội đồng cổ đông thường niên năm 2026","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo Đại hội đồng cổ đông năm 2026', N'24/04/2026 7:50', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20DHDCD%202026%20DINH%20KEM%20TAI%20LIEU%20LQUAN.pdf" target="_blank">Thông báo Đại hội đồng cổ đông năm 2026</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2026,"attachments":[{"title":"Thông báo Đại hội đồng cổ đông năm 2026","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20DHDCD%202026%20DINH%20KEM%20TAI%20LIEU%20LQUAN.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20DHDCD%202026%20DINH%20KEM%20TAI%20LIEU%20LQUAN.pdf","fileName":"THONG%20BAO%20DHDCD%202026%20DINH%20KEM%20TAI%20LIEU%20LQUAN.pdf"}],"images":[],"summary":"Thông báo Đại hội đồng cổ đông năm 2026","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo giám sát tài chính năm 2025', N'26/03/2026 18/15', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20GS%20TC%202025%20KY%20DIEN%20TU.pdf" target="_blank">Báo cáo giám sát tài chính năm 2025</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"financial_report","documentType":"financial_report","publishYear":2026,"attachments":[{"title":"Báo cáo giám sát tài chính năm 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20GS%20TC%202025%20KY%20DIEN%20TU.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20GS%20TC%202025%20KY%20DIEN%20TU.pdf","fileName":"BAO%20CAO%20GS%20TC%202025%20KY%20DIEN%20TU.pdf"}],"images":[],"summary":"Báo cáo giám sát tài chính năm 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo thường niên năm 2025', N'26/03/2026 18:10', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TN%20%202025.pdf" target="_blank">Báo cáo thường niên năm 2025</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2026,"attachments":[{"title":"Báo cáo thường niên năm 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TN%20%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TN%20%202025.pdf","fileName":"BAO%20CAO%20TN%20%202025.pdf"}],"images":[],"summary":"Báo cáo thường niên năm 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tài chính đã được kiểm toán 2025', N'24/03/2026 16:50', N'<p><a href="/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202025_0001.pdf" target="_blank">Báo cáo tài chính đã được kiểm toán 2025</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2026,"attachments":[{"title":"Báo cáo tài chính đã được kiểm toán 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202025_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202025_0001.pdf","fileName":"B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202025_0001.pdf"}],"images":[],"summary":"Báo cáo tài chính đã được kiểm toán 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Giải trình công bố báo cáo thông tin bất thường', N'13/02/2026 16:30', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20109_0001.pdf" target="_blank">Giải trình công bố báo cáo thông tin bất thường</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"extraordinary_disclosure","documentType":"extraordinary_disclosure","publishYear":2026,"attachments":[{"title":"Giải trình công bố báo cáo thông tin bất thường","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20109_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20109_0001.pdf","fileName":"CV%20109_0001.pdf"}],"images":[],"summary":"Giải trình công bố báo cáo thông tin bất thường","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị Công ty năm 2025', N'29/01/2026 13:50', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BC%2002%20-%20HDQT_0001.pdf" target="_blank">Báo cáo tình hình quản trị Công ty năm 2025 </a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2026,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty năm 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BC%2002%20-%20HDQT_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BC%2002%20-%20HDQT_0001.pdf","fileName":"BC%2002%20-%20HDQT_0001.pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị Công ty năm 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2026', N'23/01/2026 16:30', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Thong%20bao%20chot%20DS%20DHCD%202026%20so%2044.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2026</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2026,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2026","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Thong%20bao%20chot%20DS%20DHCD%202026%20so%2044.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Thong%20bao%20chot%20DS%20DHCD%202026%20so%2044.pdf","fileName":"Thong%20bao%20chot%20DS%20DHCD%202026%20so%2044.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2026","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo thay đổi nhân sự người nhận ủy quyền công bố thông tin và thay đổi tiếp nhận OTP', N'23/01/2026 16:30', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%2043%20TB%20thay%20%C4%91%E1%BB%95i%20CBTT%20k%C3%A8m%20GUQ_0001.pdf" target="_blank">CV 43: V/v Thông báo thay đổi nhân sự người nhận ủy quyền công bố thông tin</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/CV%2042%20%C4%90%C4%83ng%20k%C3%BD%20thay%20doi%20tiep%20nhan%20%20OTP_0001.pdf" target="_blank">CV 42: V/v Đăng ký thay đổi tiếp nhận OTP</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"personnel_change","documentType":"personnel_change","publishYear":2026,"attachments":[{"title":"CV 43: V/v Thông báo thay đổi nhân sự người nhận ủy quyền công bố thông tin","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%2043%20TB%20thay%20%C4%91%E1%BB%95i%20CBTT%20k%C3%A8m%20GUQ_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%2043%20TB%20thay%20%C4%91%E1%BB%95i%20CBTT%20k%C3%A8m%20GUQ_0001.pdf","fileName":"CV%2043%20TB%20thay%20%C4%91%E1%BB%95i%20CBTT%20k%C3%A8m%20GUQ_0001.pdf"},{"title":"CV 42: V/v Đăng ký thay đổi tiếp nhận OTP","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%2042%20%C4%90%C4%83ng%20k%C3%BD%20thay%20doi%20tiep%20nhan%20%20OTP_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%2042%20%C4%90%C4%83ng%20k%C3%BD%20thay%20doi%20tiep%20nhan%20%20OTP_0001.pdf","fileName":"CV%2042%20%C4%90%C4%83ng%20k%C3%BD%20thay%20doi%20tiep%20nhan%20%20OTP_0001.pdf"}],"images":[],"summary":"Thông báo thay đổi nhân sự người nhận ủy quyền công bố thông tin và thay đổi tiếp nhận OTP","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo GD cổ phiếu/ chứng chỉ quỹ của người nội bộ của công ty đại chúng, người nội bộ của quỹ đại chúng và người có liên quan của người nội bộ', N'07/01/2026 15:32', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Ph%E1%BB%A5%20l%E1%BB%A5c%20XIII_0001.pdf" target="_blank">Thông báo GD cổ phiếu/ chứng chỉ quỹ của người nội bộ của công ty đại chúng, người nội bộ của quỹ đại chúng và người có liên quan của người nội bộ</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"stock_trading_notice","documentType":"stock_trading_notice","publishYear":2026,"attachments":[{"title":"Thông báo GD cổ phiếu/ chứng chỉ quỹ của người nội bộ của công ty đại chúng, người nội bộ của quỹ đại chúng và người có liên quan của người nội bộ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ph%E1%BB%A5%20l%E1%BB%A5c%20XIII_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ph%E1%BB%A5%20l%E1%BB%A5c%20XIII_0001.pdf","fileName":"Ph%E1%BB%A5%20l%E1%BB%A5c%20XIII_0001.pdf"}],"images":[],"summary":"Thông báo GD cổ phiếu/ chứng chỉ quỹ của người nội bộ của công ty đại chúng, người nội bộ của quỹ đại chúng và người có liên quan của người nội bộ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo ký hợp đồng Kiểm toán và kèm hợp đồng đã ký 2025', N'01/12/2025 8:01', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20KY%20HDKT%20VA%20KEM%20HD%20DA%20KY%202025.pdf" target="_blank">Thông báo ký hợp đồng Kiểm toán và kèm hợp đồng đã ký 2025</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2025,"attachments":[{"title":"Thông báo ký hợp đồng Kiểm toán và kèm hợp đồng đã ký 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20KY%20HDKT%20VA%20KEM%20HD%20DA%20KY%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20KY%20HDKT%20VA%20KEM%20HD%20DA%20KY%202025.pdf","fileName":"THONG%20BAO%20KY%20HDKT%20VA%20KEM%20HD%20DA%20KY%202025.pdf"}],"images":[],"summary":"Thông báo ký hợp đồng Kiểm toán và kèm hợp đồng đã ký 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công văn thay đổi chữ ký số cổ phần', N'13/10/2025 11:22', N'<p bis_size="{"x":20,"y":20,"w":1563,"h":20,"abs_x":286,"abs_y":654}"><a bis_size="{"x":20,"y":22,"w":214,"h":15,"abs_x":286,"abs_y":656}" href="/Public/Upload/files/QuanHeCoDong/CV%20SO%2017%20THAY%20DOI%20CHU%20KY%20SO%20CO%20PHAN.pdf" target="_blank">Công văn thay đổi chữ ký số cổ phần </a></p>

<p bis_size="{"x":20,"y":53,"w":1563,"h":20,"abs_x":286,"abs_y":687}"><a bis_size="{"x":20,"y":55,"w":175,"h":15,"abs_x":286,"abs_y":689}" href="/Public/Upload/files/QuanHeCoDong/HEPCO1%20(1).pdf" target="_blank">SO CO PHAN MAU MOI SO 1</a></p>

<p bis_size="{"x":20,"y":87,"w":1563,"h":20,"abs_x":286,"abs_y":721}"><a bis_size="{"x":20,"y":89,"w":175,"h":15,"abs_x":286,"abs_y":723}" href="/Public/Upload/files/QuanHeCoDong/HEPCO2%20(1).pdf" target="_blank">SO CO PHAN MAU MOI SO 2</a></p>

<p bis_size="{"x":20,"y":121,"w":1563,"h":20,"abs_x":286,"abs_y":755}"><a bis_size="{"x":20,"y":123,"w":175,"h":15,"abs_x":286,"abs_y":757}" href="/Public/Upload/files/QuanHeCoDong/HEPCO3%20(1).pdf" target="_blank">SO CO PHAN MAU MOI SO 3</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2025,"attachments":[{"title":"Công văn thay đổi chữ ký số cổ phần","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20SO%2017%20THAY%20DOI%20CHU%20KY%20SO%20CO%20PHAN.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20SO%2017%20THAY%20DOI%20CHU%20KY%20SO%20CO%20PHAN.pdf","fileName":"CV%20SO%2017%20THAY%20DOI%20CHU%20KY%20SO%20CO%20PHAN.pdf"},{"title":"SO CO PHAN MAU MOI SO 1","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO1%20(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO1%20(1).pdf","fileName":"HEPCO1%20(1).pdf"},{"title":"SO CO PHAN MAU MOI SO 2","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2%20(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2%20(1).pdf","fileName":"HEPCO2%20(1).pdf"},{"title":"SO CO PHAN MAU MOI SO 3","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO3%20(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO3%20(1).pdf","fileName":"HEPCO3%20(1).pdf"}],"images":[],"summary":"Công văn thay đổi chữ ký số cổ phần","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'C/v gửi Sở giao dịch Chứng khoán Hà Nội đề nghị thay đổi sử dụng phương thức đăng nhập OTP', N'1/8/2025 14:38', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20VE%20VIEC%20GUI%20SO%20GDCK%20HA%20NOI%20CBO%20TT.pdf" target="_blank">Công văn gửi Sở giao dịch Chứng khoán Hà Nội đề nghị thay đổi sử dụng phương thức đăng nhập OTP</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"stock_trading_notice","documentType":"stock_trading_notice","publishYear":2025,"attachments":[{"title":"Công văn gửi Sở giao dịch Chứng khoán Hà Nội đề nghị thay đổi sử dụng phương thức đăng nhập OTP","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20VE%20VIEC%20GUI%20SO%20GDCK%20HA%20NOI%20CBO%20TT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20VE%20VIEC%20GUI%20SO%20GDCK%20HA%20NOI%20CBO%20TT.pdf","fileName":"CV%20VE%20VIEC%20GUI%20SO%20GDCK%20HA%20NOI%20CBO%20TT.pdf"}],"images":[],"summary":"C/v gửi Sở giao dịch Chứng khoán Hà Nội đề nghị thay đổi sử dụng phương thức đăng nhập OTP","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị Công ty 6 tháng đầu năm 2025', N'31/7/2025 16:00', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202025%20BAN%20CONG%20BO.pdf" target="_blank">Báo cáo tình hình quản trị Công ty 6 tháng đầu năm 2025</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2025,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty 6 tháng đầu năm 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202025%20BAN%20CONG%20BO.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202025%20BAN%20CONG%20BO.pdf","fileName":"BAO%20CAO%20QUAN%20TRI%206%20THANG%20DN%202025%20BAN%20CONG%20BO.pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị Công ty 6 tháng đầu năm 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo bổ sung, cập nhật thông tin đăng ký doanh nghiệp', N'24/7/2025 14:12', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2025.07.Th%C3%B4ng%20b%C3%A1o%20b%E1%BB%95%20sung%20c%E1%BA%ADp%20nh%E1%BA%ADt%20th%C3%B4ng%20tin%20%C4%91%C4%83ng%20k%C3%BD%20DN_0001.pdf" target="_blank">Thông báo bổ sung, cập nhật thông tin đăng ký doanh nghiệp</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2025,"attachments":[{"title":"Thông báo bổ sung, cập nhật thông tin đăng ký doanh nghiệp","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2025.07.Th%C3%B4ng%20b%C3%A1o%20b%E1%BB%95%20sung%20c%E1%BA%ADp%20nh%E1%BA%ADt%20th%C3%B4ng%20tin%20%C4%91%C4%83ng%20k%C3%BD%20DN_0001.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2025.07.Th%C3%B4ng%20b%C3%A1o%20b%E1%BB%95%20sung%20c%E1%BA%ADp%20nh%E1%BA%ADt%20th%C3%B4ng%20tin%20%C4%91%C4%83ng%20k%C3%BD%20DN_0001.pdf","fileName":"2025.07.Th%C3%B4ng%20b%C3%A1o%20b%E1%BB%95%20sung%20c%E1%BA%ADp%20nh%E1%BA%ADt%20th%C3%B4ng%20tin%20%C4%91%C4%83ng%20k%C3%BD%20DN_0001.pdf"}],"images":[],"summary":"Thông báo bổ sung, cập nhật thông tin đăng ký doanh nghiệp","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'NGHỊ QUYẾT ĐẠI HỘI ĐỒNG CỔ ĐÔNG THƯỜNG NIÊN NĂM 2025 VÀ NHIỆM KỲ 2025–2030 CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ', N'27/06/2025 16:45', N'<p><a href="/Public/Upload/files/QuanHeCoDong/NGHI%20Q%20BIEN%20BAN%20CAC%20TO%20TRINHDHDCDTN%202025.pdf" target="_blank">NGHỊ QUYẾT ĐẠI HỘI ĐỒNG CỔ ĐÔNG THƯỜNG NIÊN NĂM 2025 VÀ NHIỆM KỲ 2025–2030 CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20kem%20NQ%20chot%20DS%20chia%20co%20tuc%202024.pdf" target="_blank">THÔNG BÁO KÈM NGHỊ QUYẾT CHỐT DANH SÁCH CHIA CỔ TỨC</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2025,"attachments":[{"title":"NGHỊ QUYẾT ĐẠI HỘI ĐỒNG CỔ ĐÔNG THƯỜNG NIÊN NĂM 2025 VÀ NHIỆM KỲ 2025–2030 CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NGHI%20Q%20BIEN%20BAN%20CAC%20TO%20TRINHDHDCDTN%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NGHI%20Q%20BIEN%20BAN%20CAC%20TO%20TRINHDHDCDTN%202025.pdf","fileName":"NGHI%20Q%20BIEN%20BAN%20CAC%20TO%20TRINHDHDCDTN%202025.pdf"},{"title":"THÔNG BÁO KÈM NGHỊ QUYẾT CHỐT DANH SÁCH CHIA CỔ TỨC","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20kem%20NQ%20chot%20DS%20chia%20co%20tuc%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20kem%20NQ%20chot%20DS%20chia%20co%20tuc%202024.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20kem%20NQ%20chot%20DS%20chia%20co%20tuc%202024.pdf"}],"images":[],"summary":"NGHỊ QUYẾT ĐẠI HỘI ĐỒNG CỔ ĐÔNG THƯỜNG NIÊN NĂM 2025 VÀ NHIỆM KỲ 2025–2030 CÔNG TY CỔ PHẦN MÔI TRƯỜNG VÀ CÔNG TRÌNH ĐÔ THỊ HUẾ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Danh sách ứng cử viên bầu thành viên HĐQT và Ban kiểm soát nhiệm kỳ 2025 - 2030', N'17/06/2025 10:25', N'<p><a href="/Public/Upload/files/QuanHeCoDong/DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT%202025%20-%202030.pdf" target="_blank">Danh sách ứng cử viên bầu thành viên HĐQT và Ban kiểm soát nhiệm kỳ 2025 - 2030</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2025,"attachments":[{"title":"Danh sách ứng cử viên bầu thành viên HĐQT và Ban kiểm soát nhiệm kỳ 2025 - 2030","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT%202025%20-%202030.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT%202025%20-%202030.pdf","fileName":"DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT%202025%20-%202030.pdf"}],"images":[],"summary":"Danh sách ứng cử viên bầu thành viên HĐQT và Ban kiểm soát nhiệm kỳ 2025 - 2030","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo mời họp Đại hội đồng cổ đông thường niên năm 2025 và các văn bản liên quan', N'06/06/2025 14:00', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%C3%A0%20c%C3%A1c%20t%C3%A0i%20li%E1%BB%87u%20Cu%E1%BB%99c%20h%E1%BB%8Dp%20%C4%90H%C4%90%20C%E1%BB%95%20%C4%91%C3%B4ng%202025.pdf" target="_blank">Thông báo mời họp Đại hội đồng cổ đông thường niên năm 2025 và các văn bản liên quan</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2025,"attachments":[{"title":"Thông báo mời họp Đại hội đồng cổ đông thường niên năm 2025 và các văn bản liên quan","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%C3%A0%20c%C3%A1c%20t%C3%A0i%20li%E1%BB%87u%20Cu%E1%BB%99c%20h%E1%BB%8Dp%20%C4%90H%C4%90%20C%E1%BB%95%20%C4%91%C3%B4ng%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%C3%A0%20c%C3%A1c%20t%C3%A0i%20li%E1%BB%87u%20Cu%E1%BB%99c%20h%E1%BB%8Dp%20%C4%90H%C4%90%20C%E1%BB%95%20%C4%91%C3%B4ng%202025.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20v%C3%A0%20c%C3%A1c%20t%C3%A0i%20li%E1%BB%87u%20Cu%E1%BB%99c%20h%E1%BB%8Dp%20%C4%90H%C4%90%20C%E1%BB%95%20%C4%91%C3%B4ng%202025.pdf"}],"images":[],"summary":"Thông báo mời họp Đại hội đồng cổ đông thường niên năm 2025 và các văn bản liên quan","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo: UBND Thành phố Huế thống nhất gia hạn thời gian tổ chức Đại hội đồng cổ đông thường niên 2025', N'29/05/2025 15:00', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20UBND%20TP%20GIA%20HAN%20TGIAN%20DHDCD%202025.pdf" target="_blank">Thông báo: UBND Thành phố Huế thống nhất gia hạn thời gian tổ chức Đại hội đồng cổ đông thường niên 2025</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2025,"attachments":[{"title":"Thông báo: UBND Thành phố Huế thống nhất gia hạn thời gian tổ chức Đại hội đồng cổ đông thường niên 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20UBND%20TP%20GIA%20HAN%20TGIAN%20DHDCD%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20UBND%20TP%20GIA%20HAN%20TGIAN%20DHDCD%202025.pdf","fileName":"CV%20UBND%20TP%20GIA%20HAN%20TGIAN%20DHDCD%202025.pdf"}],"images":[],"summary":"Thông báo: UBND Thành phố Huế thống nhất gia hạn thời gian tổ chức Đại hội đồng cổ đông thường niên 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo V/v gia hạn thời gian Đại hội đồng cổ đông thường niên năm 2025', N'15/05/2025 11:00', N'<p><a href="/Public/Upload/files/QuanHeCoDong/NGHI%20QUYET%20SO%20%2017.NQ-H%C4%90QT%20VE%20GIA%20HAN%20DHCD%202025.pdf" target="_blank">Thông báo V/v gia hạn thời gian Đại hội đồng cổ đông thường niên năm 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/CV%2009.CV-H%C4%90QT%20GIA%20HAN%20THOI%20GIA%20N%20DHDCD.pdf" target="_blank">Công văn xin gia hạn thời gian Đại hội đồng cổ đông thường niên năm 2025</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2025,"attachments":[{"title":"Thông báo V/v gia hạn thời gian Đại hội đồng cổ đông thường niên năm 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NGHI%20QUYET%20SO%20%2017.NQ-H%C4%90QT%20VE%20GIA%20HAN%20DHCD%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NGHI%20QUYET%20SO%20%2017.NQ-H%C4%90QT%20VE%20GIA%20HAN%20DHCD%202025.pdf","fileName":"NGHI%20QUYET%20SO%20%2017.NQ-H%C4%90QT%20VE%20GIA%20HAN%20DHCD%202025.pdf"},{"title":"Công văn xin gia hạn thời gian Đại hội đồng cổ đông thường niên năm 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%2009.CV-H%C4%90QT%20GIA%20HAN%20THOI%20GIA%20N%20DHDCD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%2009.CV-H%C4%90QT%20GIA%20HAN%20THOI%20GIA%20N%20DHDCD.pdf","fileName":"CV%2009.CV-H%C4%90QT%20GIA%20HAN%20THOI%20GIA%20N%20DHDCD.pdf"}],"images":[],"summary":"Thông báo V/v gia hạn thời gian Đại hội đồng cổ đông thường niên năm 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo thường niên năm 2024', N'26/03/2025 15:10', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BC%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202024.pdf" target="_blank">Báo cáo thường niên năm 2024</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2025,"attachments":[{"title":"Báo cáo thường niên năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BC%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BC%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202024.pdf","fileName":"BC%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202024.pdf"}],"images":[],"summary":"Báo cáo thường niên năm 2024","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công bố thông tin trên cổng thông tin điện tử của Ủy ban Chứng khoán Nhà nước', N'21/03/2025 16:15', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20202-2025-H%C4%90QT%20cong%20bo%20BCTC%202024%20da%20kiem%20toan.pdf" target="_blank">Công bố thông tin trên cổng thông tin điện tử của Ủy ban Chứng khoán Nhà nước</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2025,"attachments":[{"title":"Công bố thông tin trên cổng thông tin điện tử của Ủy ban Chứng khoán Nhà nước","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20202-2025-H%C4%90QT%20cong%20bo%20BCTC%202024%20da%20kiem%20toan.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20202-2025-H%C4%90QT%20cong%20bo%20BCTC%202024%20da%20kiem%20toan.pdf","fileName":"CV%20202-2025-H%C4%90QT%20cong%20bo%20BCTC%202024%20da%20kiem%20toan.pdf"}],"images":[],"summary":"Công bố thông tin trên cổng thông tin điện tử của Ủy ban Chứng khoán Nhà nước","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tài chính đã được kiểm toán cho năm 2024', N'24/03/2025 16:30', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BCTC-da%20duoc%20kiem%20toan%202024%20ban%20co%20ky%20dong%20dau.pdf" target="_blank">Báo cáo tài chính đã được kiểm toán cho năm 2024</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2025,"attachments":[{"title":"Báo cáo tài chính đã được kiểm toán cho năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BCTC-da%20duoc%20kiem%20toan%202024%20ban%20co%20ky%20dong%20dau.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BCTC-da%20duoc%20kiem%20toan%202024%20ban%20co%20ky%20dong%20dau.pdf","fileName":"BCTC-da%20duoc%20kiem%20toan%202024%20ban%20co%20ky%20dong%20dau.pdf"}],"images":[],"summary":"Báo cáo tài chính đã được kiểm toán cho năm 2024","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo thay thế thông báo số 37/2025 ngày 10/1/2025 về  ngày đăng ký cuối cùng để thực hiện quyền ĐHĐCĐ  thường niên năm 2025', N'14/01/2025 14:52', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20SO%2064%20THAY%20THE%20TB%20SO%2037%20NGAY%2010%2001%202025%20CHOT%20DSDHCD%202025.pdf" target="_blank">Thông báo thay thế thông báo số 37/2025 ngày 10/1/2025 về ngày đăng ký cuối cùng để thực hiện quyền ĐHĐCĐ thường niên năm 2025.</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2025,"attachments":[{"title":"Thông báo thay thế thông báo số 37/2025 ngày 10/1/2025 về ngày đăng ký cuối cùng để thực hiện quyền ĐHĐCĐ thường niên năm 2025.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20SO%2064%20THAY%20THE%20TB%20SO%2037%20NGAY%2010%2001%202025%20CHOT%20DSDHCD%202025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20SO%2064%20THAY%20THE%20TB%20SO%2037%20NGAY%2010%2001%202025%20CHOT%20DSDHCD%202025.pdf","fileName":"THONG%20BAO%20SO%2064%20THAY%20THE%20TB%20SO%2037%20NGAY%2010%2001%202025%20CHOT%20DSDHCD%202025.pdf"}],"images":[],"summary":"Thông báo thay thế thông báo số 37/2025 ngày 10/1/2025 về  ngày đăng ký cuối cùng để thực hiện quyền ĐHĐCĐ  thường niên năm 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông nhiệm kỳ 2025 - 2029', N'10/01/2025 11:00', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20NGAY%20DANG%20KY%20CUOI%20CUNG%20DHDCD%202025%20-%202029.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông nhiệm kỳ 2025 - 2029</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2025,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông nhiệm kỳ 2025 - 2029","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20NGAY%20DANG%20KY%20CUOI%20CUNG%20DHDCD%202025%20-%202029.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20NGAY%20DANG%20KY%20CUOI%20CUNG%20DHDCD%202025%20-%202029.pdf","fileName":"THONG%20BAO%20NGAY%20DANG%20KY%20CUOI%20CUNG%20DHDCD%202025%20-%202029.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông nhiệm kỳ 2025 - 2029","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo Giấy phép Đăng ký kinh doanh thay đổi tên Thành phố chia theo Quận', N'08/01/2025 11:11', N'<p><a href="/Public/Upload/files/QuanHeCoDong/GPDKDN%20THAY%20DOI%20TEN%20TP%20CHIA%20THEO%20QUAN.pdf" target="_blank">Thông báo Giấy phép Đăng ký kinh doanh thay đổi tên Thành phố chia theo Quận</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2025,"attachments":[{"title":"Thông báo Giấy phép Đăng ký kinh doanh thay đổi tên Thành phố chia theo Quận","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/GPDKDN%20THAY%20DOI%20TEN%20TP%20CHIA%20THEO%20QUAN.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/GPDKDN%20THAY%20DOI%20TEN%20TP%20CHIA%20THEO%20QUAN.pdf","fileName":"GPDKDN%20THAY%20DOI%20TEN%20TP%20CHIA%20THEO%20QUAN.pdf"}],"images":[],"summary":"Thông báo Giấy phép Đăng ký kinh doanh thay đổi tên Thành phố chia theo Quận","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo ký hợp đồng kiểm toán báo cáo tài chính năm 2024', N'21/11/2024 17:18', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20KY%20HD%20KIEM%20TOAN%202024.pdf" target="_blank">Thông báo ký hợp đồng kiểm toán báo cáo tài chính năm 2024</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/H%C4%90%20ki%E1%BB%83m%20to%C3%A1n%20(ki%E1%BB%83m%20to%C3%A1n%20bc%20t%C3%A0i%20ch%C3%ADnh%20k%E1%BA%BFt%20th%C3%BAc%2031_12_2024).pdf" target="_blank">Hợp đồng kiểm toán</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2024,"attachments":[{"title":"Thông báo ký hợp đồng kiểm toán báo cáo tài chính năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20KY%20HD%20KIEM%20TOAN%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20KY%20HD%20KIEM%20TOAN%202024.pdf","fileName":"THONG%20BAO%20KY%20HD%20KIEM%20TOAN%202024.pdf"},{"title":"Hợp đồng kiểm toán","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/H%C4%90%20ki%E1%BB%83m%20to%C3%A1n%20(ki%E1%BB%83m%20to%C3%A1n%20bc%20t%C3%A0i%20ch%C3%ADnh%20k%E1%BA%BFt%20th%C3%BAc%2031_12_2024).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/H%C4%90%20ki%E1%BB%83m%20to%C3%A1n%20(ki%E1%BB%83m%20to%C3%A1n%20bc%20t%C3%A0i%20ch%C3%ADnh%20k%E1%BA%BFt%20th%C3%BAc%2031_12_2024).pdf","fileName":"H%C4%90%20ki%E1%BB%83m%20to%C3%A1n%20(ki%E1%BB%83m%20to%C3%A1n%20bc%20t%C3%A0i%20ch%C3%ADnh%20k%E1%BA%BFt%20th%C3%BAc%2031_12_2024).pdf"}],"images":[],"summary":"Thông báo ký hợp đồng kiểm toán báo cáo tài chính năm 2024","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị Công ty và báo cáo giám sát tài chính 6 tháng đầu năm 2024', N'24/07/2024 16:55', N'<p><a href="/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20quan%20tr%E1%BB%8B%206%20thang%202024%20s%E1%BB%91%2017-2024%20H%C4%90QT.pdf" target="_blank">Báo cáo tình hình quản trị Công ty 6 tháng đầu năm 2024</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20gi%C3%A1m%20s%C3%A1t%20t%C3%A0i%20ch%C3%ADnh%2006%20th%C3%A1ng%20%C4%91%E1%BA%A7u%20n%C4%83m%202024.pdf" target="_blank">Báo cáo giám sát tài chính Công ty 6 tháng đầu năm 2024</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"financial_report","documentType":"financial_report","publishYear":2024,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty 6 tháng đầu năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20quan%20tr%E1%BB%8B%206%20thang%202024%20s%E1%BB%91%2017-2024%20H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20quan%20tr%E1%BB%8B%206%20thang%202024%20s%E1%BB%91%2017-2024%20H%C4%90QT.pdf","fileName":"B%C3%A1o%20c%C3%A1o%20quan%20tr%E1%BB%8B%206%20thang%202024%20s%E1%BB%91%2017-2024%20H%C4%90QT.pdf"},{"title":"Báo cáo giám sát tài chính Công ty 6 tháng đầu năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20gi%C3%A1m%20s%C3%A1t%20t%C3%A0i%20ch%C3%ADnh%2006%20th%C3%A1ng%20%C4%91%E1%BA%A7u%20n%C4%83m%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20gi%C3%A1m%20s%C3%A1t%20t%C3%A0i%20ch%C3%ADnh%2006%20th%C3%A1ng%20%C4%91%E1%BA%A7u%20n%C4%83m%202024.pdf","fileName":"B%C3%A1o%20c%C3%A1o%20gi%C3%A1m%20s%C3%A1t%20t%C3%A0i%20ch%C3%ADnh%2006%20th%C3%A1ng%20%C4%91%E1%BA%A7u%20n%C4%83m%202024.pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị Công ty và báo cáo giám sát tài chính 6 tháng đầu năm 2024","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2023', N'16/04/2024 15:40', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20SO%2015%20CHOT%20DANH%20SACH%20CHIA%20CO%20TUC%202023%20KEM%20NQHDQT.pdf" target="_blank">Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2023 (Thay thế thông báo số 13/2024/TB-MTĐT ngày 15/04/2024)</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"dividend_notice","documentType":"dividend_notice","publishYear":2024,"attachments":[{"title":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2023 (Thay thế thông báo số 13/2024/TB-MTĐT ngày 15/04/2024)","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20SO%2015%20CHOT%20DANH%20SACH%20CHIA%20CO%20TUC%202023%20KEM%20NQHDQT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20SO%2015%20CHOT%20DANH%20SACH%20CHIA%20CO%20TUC%202023%20KEM%20NQHDQT.pdf","fileName":"THONG%20BAO%20SO%2015%20CHOT%20DANH%20SACH%20CHIA%20CO%20TUC%202023%20KEM%20NQHDQT.pdf"}],"images":[],"summary":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về việc chốt danh sách ngày đăng ký cuối cùng và Nghị quyết chi trả cổ tức bằng tiền năm 2023', N'16/04/2024 10:40', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20CHOT%20DS%20CHI%20TRA%20CO%20TUC%20%202023%20-%20Ngh%E1%BB%8B%20Quyet%20dinh%20kem(1).pdf" target="_blank">Thông báo về việc chốt danh sách ngày đăng ký cuối cùng và Nghị quyết chi trả cổ tức bằng tiền năm 2023</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_resolution_minutes","documentType":"agm_resolution_minutes","publishYear":2024,"attachments":[{"title":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng và Nghị quyết chi trả cổ tức bằng tiền năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20CHOT%20DS%20CHI%20TRA%20CO%20TUC%20%202023%20-%20Ngh%E1%BB%8B%20Quyet%20dinh%20kem(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20CHOT%20DS%20CHI%20TRA%20CO%20TUC%20%202023%20-%20Ngh%E1%BB%8B%20Quyet%20dinh%20kem(1).pdf","fileName":"THONG%20BAO%20CHOT%20DS%20CHI%20TRA%20CO%20TUC%20%202023%20-%20Ngh%E1%BB%8B%20Quyet%20dinh%20kem(1).pdf"}],"images":[],"summary":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng và Nghị quyết chi trả cổ tức bằng tiền năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết và Biên bản Đại hội Đồng Cổ đông thường niên năm 2024', N'12/04/2024 15:12', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20DHDCD%20ky%20hop%20thuong%20nien%20nam%202024.pdf" target="_blank">Nghị quyết và Biên bản Đại hội Đồng Cổ đông thường niên năm 2024</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2024,"attachments":[{"title":"Nghị quyết và Biên bản Đại hội Đồng Cổ đông thường niên năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20DHDCD%20ky%20hop%20thuong%20nien%20nam%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20DHDCD%20ky%20hop%20thuong%20nien%20nam%202024.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20DHDCD%20ky%20hop%20thuong%20nien%20nam%202024.pdf"}],"images":[],"summary":"Nghị quyết và Biên bản Đại hội Đồng Cổ đông thường niên năm 2024","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo mời họp Đại hội đồng Cổ đông thường niên năm 2024 kèm dự thảo Nghị quyết', N'02/04/2024 8:35', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20%C4%90H%C4%90C%C4%90%202024%20KEM%20DU%20THOA%20NQ%20VA%20TLIEU%20DINH%20KEM.pdf" target="_blank">Thông báo mời họp Đại hội đồng Cổ đông thường niên năm 2024 kèm dự thảo Nghị quyết</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2024,"attachments":[{"title":"Thông báo mời họp Đại hội đồng Cổ đông thường niên năm 2024 kèm dự thảo Nghị quyết","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20%C4%90H%C4%90C%C4%90%202024%20KEM%20DU%20THOA%20NQ%20VA%20TLIEU%20DINH%20KEM.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20%C4%90H%C4%90C%C4%90%202024%20KEM%20DU%20THOA%20NQ%20VA%20TLIEU%20DINH%20KEM.pdf","fileName":"THONG%20BAO%20%C4%90H%C4%90C%C4%90%202024%20KEM%20DU%20THOA%20NQ%20VA%20TLIEU%20DINH%20KEM.pdf"}],"images":[],"summary":"Thông báo mời họp Đại hội đồng Cổ đông thường niên năm 2024 kèm dự thảo Nghị quyết","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo thường niên năm 2023', N'28/03/2024 17:20', N'<p><a href="/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%20n%C4%83m%202023.pdf" target="_blank">Báo cáo thường niên năm 2023</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2024,"attachments":[{"title":"Báo cáo thường niên năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%20n%C4%83m%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%20n%C4%83m%202023.pdf","fileName":"B%C3%A1o%20c%C3%A1o%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%20n%C4%83m%202023.pdf"}],"images":[],"summary":"Báo cáo thường niên năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo mời họp đại hội đồng Cổ đông thường niên năm 2024', N'15/03/2024 17:50', N'<p><a href="/Public/Upload/files/QuanHeCoDong/TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202024.pdf" target="_blank">Thông báo mời họp đại hội đồng Cổ đông thường niên năm 2024</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2024,"attachments":[{"title":"Thông báo mời họp đại hội đồng Cổ đông thường niên năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202024.pdf","fileName":"TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202024.pdf"}],"images":[],"summary":"Thông báo mời họp đại hội đồng Cổ đông thường niên năm 2024","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công bố thông tin về báo cáo tài chính năm 2023 đã được kiểm toán', N'26/02/2024 16:28', N'<p><a href="/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202023.pdf" target="_blank">Báo cáo tài chính đã được kiểm toán năm 2023</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/C%C3%B4ng%20b%E1%BB%91%20th%C3%B4ng%20tin%20s%E1%BB%91%2008%20H%C4%90QT.pdf" target="_blank">Công bố thông tin số 08 HĐQT</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2024,"attachments":[{"title":"Báo cáo tài chính đã được kiểm toán năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202023.pdf","fileName":"B%C3%A1o%20c%C3%A1o%20t%C3%A0i%20ch%C3%ADnh%20%C4%91%C3%A3%20%C4%91%C6%B0%E1%BB%A3c%20ki%E1%BB%83m%20to%C3%A1n%202023.pdf"},{"title":"Công bố thông tin số 08 HĐQT","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/C%C3%B4ng%20b%E1%BB%91%20th%C3%B4ng%20tin%20s%E1%BB%91%2008%20H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/C%C3%B4ng%20b%E1%BB%91%20th%C3%B4ng%20tin%20s%E1%BB%91%2008%20H%C4%90QT.pdf","fileName":"C%C3%B4ng%20b%E1%BB%91%20th%C3%B4ng%20tin%20s%E1%BB%91%2008%20H%C4%90QT.pdf"}],"images":[],"summary":"Công bố thông tin về báo cáo tài chính năm 2023 đã được kiểm toán","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2024 đính kèm NQ số 06/ NG-HĐQT', N'19/02/2024 11:05', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20%20SO%2005%20H%C4%90QT%20CHOT%20DHDCD%20TN%202024.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2024</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20so%2006%20chot%20ngay%20DHDCDTN%202024.pdf" target="_blank">Nghị quyết HĐQT V/v chốt ngày đăng ký cuối cùng để thực hiện quyền tổ chức Đại hội đồng cổ đông thường niên năm 2024</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2024,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20%20SO%2005%20H%C4%90QT%20CHOT%20DHDCD%20TN%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20%20SO%2005%20H%C4%90QT%20CHOT%20DHDCD%20TN%202024.pdf","fileName":"THONG%20BAO%20%20SO%2005%20H%C4%90QT%20CHOT%20DHDCD%20TN%202024.pdf"},{"title":"Nghị quyết HĐQT V/v chốt ngày đăng ký cuối cùng để thực hiện quyền tổ chức Đại hội đồng cổ đông thường niên năm 2024","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20so%2006%20chot%20ngay%20DHDCDTN%202024.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20so%2006%20chot%20ngay%20DHDCDTN%202024.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20so%2006%20chot%20ngay%20DHDCDTN%202024.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2024 đính kèm NQ số 06/ NG-HĐQT","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Quy chế công bố thông tin Công ty Cổ phần Môi trường và Công trình Đô thị Huế', N'01/02/2024 16:15', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2024.01.QuyCheCongBoThongTin.pdf" target="_blank">Quy chế công bố thông tin Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2024,"attachments":[{"title":"Quy chế công bố thông tin Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2024.01.QuyCheCongBoThongTin.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2024.01.QuyCheCongBoThongTin.pdf","fileName":"2024.01.QuyCheCongBoThongTin.pdf"}],"images":[],"summary":"Quy chế công bố thông tin Công ty Cổ phần Môi trường và Công trình Đô thị Huế","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị Công ty năm 2023', N'31/01/2024 9:37', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%202023%20SO%2002-BC-H%C4%90QT.pdf" target="_blank">Báo cáo tình hình quản trị Công ty năm 2023</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2024,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%202023%20SO%2002-BC-H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QUAN%20TRI%202023%20SO%2002-BC-H%C4%90QT.pdf","fileName":"BAO%20CAO%20QUAN%20TRI%202023%20SO%2002-BC-H%C4%90QT.pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị Công ty năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo: Ký hợp đồng Kiểm toán báo cáo tài chính năm 2023 và giấy chứng nhận đăng ký kinh doanh sau thay đổi', N'12/12/2023 14:12', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20thay%20%C4%91%E1%BB%95i%20gi%C3%A2y%20CN%20%C4%90%C4%83ng%20k%C3%BD%20kinh%20Doanh%20v%C3%A0%20Gi%E1%BA%A5y%20ch%E1%BB%A9ng%20nh%E1%BA%ADn%20%C4%91%C4%83ng%20k%C3%BD%20Doang%20nghi%E1%BB%87p.pdf" target="_blank">Thông báo: Ký hợp đồng Kiểm toán báo cáo tài chính năm 2023 và Giấy chứng nhận đăng ký kinh doanh sau thay đổi</a></p>

<p> </p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2023,"attachments":[{"title":"Thông báo: Ký hợp đồng Kiểm toán báo cáo tài chính năm 2023 và Giấy chứng nhận đăng ký kinh doanh sau thay đổi","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20thay%20%C4%91%E1%BB%95i%20gi%C3%A2y%20CN%20%C4%90%C4%83ng%20k%C3%BD%20kinh%20Doanh%20v%C3%A0%20Gi%E1%BA%A5y%20ch%E1%BB%A9ng%20nh%E1%BA%ADn%20%C4%91%C4%83ng%20k%C3%BD%20Doang%20nghi%E1%BB%87p.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20thay%20%C4%91%E1%BB%95i%20gi%C3%A2y%20CN%20%C4%90%C4%83ng%20k%C3%BD%20kinh%20Doanh%20v%C3%A0%20Gi%E1%BA%A5y%20ch%E1%BB%A9ng%20nh%E1%BA%ADn%20%C4%91%C4%83ng%20k%C3%BD%20Doang%20nghi%E1%BB%87p.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20thay%20%C4%91%E1%BB%95i%20gi%C3%A2y%20CN%20%C4%90%C4%83ng%20k%C3%BD%20kinh%20Doanh%20v%C3%A0%20Gi%E1%BA%A5y%20ch%E1%BB%A9ng%20nh%E1%BA%ADn%20%C4%91%C4%83ng%20k%C3%BD%20Doang%20nghi%E1%BB%87p.pdf"}],"images":[],"summary":"Thông báo: Ký hợp đồng Kiểm toán báo cáo tài chính năm 2023 và giấy chứng nhận đăng ký kinh doanh sau thay đổi","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Hợp đồng kiểm toán: Kiếm toán báo cáo tài chính  kết thúc ngày 31/12/2023', N'08/12/2023 18:45', N'<p><a href="/Public/Upload/files/QuanHeCoDong/H%E1%BB%A3p%20%C4%91%E1%BB%93ng%20ki%E1%BB%83m%20to%C3%A1n%20s%E1%BB%91%201223100.pdf" target="_blank">Hợp đồng kiểm toán: Kiếm toán báo cáo tài chính kết thúc ngày 31/12/2023</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2023,"attachments":[{"title":"Hợp đồng kiểm toán: Kiếm toán báo cáo tài chính kết thúc ngày 31/12/2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/H%E1%BB%A3p%20%C4%91%E1%BB%93ng%20ki%E1%BB%83m%20to%C3%A1n%20s%E1%BB%91%201223100.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/H%E1%BB%A3p%20%C4%91%E1%BB%93ng%20ki%E1%BB%83m%20to%C3%A1n%20s%E1%BB%91%201223100.pdf","fileName":"H%E1%BB%A3p%20%C4%91%E1%BB%93ng%20ki%E1%BB%83m%20to%C3%A1n%20s%E1%BB%91%201223100.pdf"}],"images":[],"summary":"Hợp đồng kiểm toán: Kiếm toán báo cáo tài chính  kết thúc ngày 31/12/2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết và Biên bản Đại hội đồng Cổ đông bất thường năm 2023 và Thông báo thay đổi người đại diện pháp luật Công ty', N'01/12/2023 14:12', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Nghi%CC%A3%20quye%CC%82%CC%81t%20%C4%90HC%C4%90%20BT%20NAM%202023%20so%CC%82%CC%81%2059%20(1).pdf" target="_blank">Nghị quyết và Biên bản Đại hội đồng Cổ đông bất thường năm 2023</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/ThA%CC%83%C2%B4ng%20bA%CC%83%C2%A1o%20%20thay%20doi%20nguoi%20DD%20phap%20luat%20va%20NQBB%20dinh%20kem.pdf" target="_blank">Thông báo thay đổi người đại diện pháp luật Công ty</a></p>

<div class="ddict_btn" style="left:413.062px; top:53px"> </div>

<div class="ddict_btn" style="left:324.172px; top:87px"> </div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_resolution_minutes","documentType":"agm_resolution_minutes","publishYear":2023,"attachments":[{"title":"Nghị quyết và Biên bản Đại hội đồng Cổ đông bất thường năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Nghi%CC%A3%20quye%CC%82%CC%81t%20%C4%90HC%C4%90%20BT%20NAM%202023%20so%CC%82%CC%81%2059%20(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Nghi%CC%A3%20quye%CC%82%CC%81t%20%C4%90HC%C4%90%20BT%20NAM%202023%20so%CC%82%CC%81%2059%20(1).pdf","fileName":"Nghi%CC%A3%20quye%CC%82%CC%81t%20%C4%90HC%C4%90%20BT%20NAM%202023%20so%CC%82%CC%81%2059%20(1).pdf"},{"title":"Thông báo thay đổi người đại diện pháp luật Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/ThA%CC%83%C2%B4ng%20bA%CC%83%C2%A1o%20%20thay%20doi%20nguoi%20DD%20phap%20luat%20va%20NQBB%20dinh%20kem.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/ThA%CC%83%C2%B4ng%20bA%CC%83%C2%A1o%20%20thay%20doi%20nguoi%20DD%20phap%20luat%20va%20NQBB%20dinh%20kem.pdf","fileName":"ThA%CC%83%C2%B4ng%20bA%CC%83%C2%A1o%20%20thay%20doi%20nguoi%20DD%20phap%20luat%20va%20NQBB%20dinh%20kem.pdf"}],"images":[],"summary":"Nghị quyết và Biên bản Đại hội đồng Cổ đông bất thường năm 2023 và Thông báo thay đổi người đại diện pháp luật Công ty","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Danh sách ứng cử viên bầu bổ sung Hội đồng Quản trị nhiệm kỳ 2020 - 2023 và Lý lịch Ông Phan Lê Hiến', N'21/11/2023 16:15', N'<p><a href="/Public/Upload/files/QuanHeCoDong/DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20b%E1%BA%A7u%20b%E1%BB%95%20sung%20H%C4%90QT.pdf" target="_blank">Danh sách ứng cử viên bầu bổ sung Hội đồng Quản trị nhiệm kỳ 2020 - 2023</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/S%C6%A1%20y%E1%BA%BFu%20l%C3%BD%20lich%20Phan%20L%C3%AA%20Hi%E1%BA%BFn.pdf" target="_blank">Lý lịch Ông Phan Lê Hiến</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2023,"attachments":[{"title":"Danh sách ứng cử viên bầu bổ sung Hội đồng Quản trị nhiệm kỳ 2020 - 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20b%E1%BA%A7u%20b%E1%BB%95%20sung%20H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20b%E1%BA%A7u%20b%E1%BB%95%20sung%20H%C4%90QT.pdf","fileName":"DS%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20b%E1%BA%A7u%20b%E1%BB%95%20sung%20H%C4%90QT.pdf"},{"title":"Lý lịch Ông Phan Lê Hiến","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/S%C6%A1%20y%E1%BA%BFu%20l%C3%BD%20lich%20Phan%20L%C3%AA%20Hi%E1%BA%BFn.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/S%C6%A1%20y%E1%BA%BFu%20l%C3%BD%20lich%20Phan%20L%C3%AA%20Hi%E1%BA%BFn.pdf","fileName":"S%C6%A1%20y%E1%BA%BFu%20l%C3%BD%20lich%20Phan%20L%C3%AA%20Hi%E1%BA%BFn.pdf"}],"images":[],"summary":"Danh sách ứng cử viên bầu bổ sung Hội đồng Quản trị nhiệm kỳ 2020 - 2023 và Lý lịch Ông Phan Lê Hiến","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Bản Công bố, thông tin họp Đại hội đồng Cổ đông bất thường năm 2023', N'09/11/2023 14:29', N'<p><a href="/Public/Upload/files/QuanHeCoDong/C%C3%B4ng%20b%E1%BB%91%2C%20th%C3%B4ng%20tin%20%C4%90%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng.pdf" target="_blank">Bản Công bố, thông tin họp Đại hội đồng Cổ đông bất thường năm 2023</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2023,"attachments":[{"title":"Bản Công bố, thông tin họp Đại hội đồng Cổ đông bất thường năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/C%C3%B4ng%20b%E1%BB%91%2C%20th%C3%B4ng%20tin%20%C4%90%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/C%C3%B4ng%20b%E1%BB%91%2C%20th%C3%B4ng%20tin%20%C4%90%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng.pdf","fileName":"C%C3%B4ng%20b%E1%BB%91%2C%20th%C3%B4ng%20tin%20%C4%90%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng.pdf"}],"images":[],"summary":"Bản Công bố, thông tin họp Đại hội đồng Cổ đông bất thường năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông bất thường năm 2023', N'16/10/2023 15:26', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20s%E1%BB%91%20591%20DS%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng%20n%C4%83m%202023.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông bất thường năm 2023</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2023,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông bất thường năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20s%E1%BB%91%20591%20DS%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng%20n%C4%83m%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20s%E1%BB%91%20591%20DS%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng%20n%C4%83m%202023.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20s%E1%BB%91%20591%20DS%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%20b%E1%BA%A5t%20th%C6%B0%E1%BB%9Dng%20n%C4%83m%202023.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông bất thường năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Danh sách người nội bộ và người liên quan (cá nhân, tổ chức) đến người nội bộ', N'27/09/2023 11:20', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Danh%20s%C3%A1ch%20ng%C6%B0%E1%BB%9Di%20n%E1%BB%99i%20b%E1%BB%99.pdf" target="_blank">Danh sách người nội bộ và người liên quan (cá nhân, tổ chức) đến người nội bộ</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2023,"attachments":[{"title":"Danh sách người nội bộ và người liên quan (cá nhân, tổ chức) đến người nội bộ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Danh%20s%C3%A1ch%20ng%C6%B0%E1%BB%9Di%20n%E1%BB%99i%20b%E1%BB%99.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Danh%20s%C3%A1ch%20ng%C6%B0%E1%BB%9Di%20n%E1%BB%99i%20b%E1%BB%99.pdf","fileName":"Danh%20s%C3%A1ch%20ng%C6%B0%E1%BB%9Di%20n%E1%BB%99i%20b%E1%BB%99.pdf"}],"images":[],"summary":"Danh sách người nội bộ và người liên quan (cá nhân, tổ chức) đến người nội bộ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết và Quyết định bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải', N'26/06/2023 14:26', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf" target="_blank">Nghị quyết số 19/2023/NQ-HQĐT miễn nhiệm chức vụ Kế toán trưởng theo đơn xin thôi làm Kế toán trưởng của bà Dương Thị Huệ và bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Quyet%20dinh%20bo%20nhiem%20KTT%20so%20369.pdf" target="_blank">Quyết định số 369/QĐ-MTĐT bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"agm_resolution_minutes","documentType":"agm_resolution_minutes","publishYear":2023,"attachments":[{"title":"Nghị quyết số 19/2023/NQ-HQĐT miễn nhiệm chức vụ Kế toán trưởng theo đơn xin thôi làm Kế toán trưởng của bà Dương Thị Huệ và bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf"},{"title":"Quyết định số 369/QĐ-MTĐT bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Quyet%20dinh%20bo%20nhiem%20KTT%20so%20369.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Quyet%20dinh%20bo%20nhiem%20KTT%20so%20369.pdf","fileName":"Quyet%20dinh%20bo%20nhiem%20KTT%20so%20369.pdf"}],"images":[],"summary":"Nghị quyết và Quyết định bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Miễn nhiệm chức danh Kế toán trưởng theo đơn xin thôi giữ chức Kế toán trưởng của bà Dương Thị Huệ đã được Ban Lãnh đạo đồng kèm theo NQ và QĐ', N'26/06/2023 14:15', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf">Nghị quyết số 19/2023/NQ-HQĐT miễn nhiệm chức vụ Kế toán trưởng theo đơn xin thôi làm Kế toán trưởng của bà Dương Thị Huệ và bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Quyet%20dinh%20so%20%20368%20%20mien%20nhiem%20chuc%20danh%20KTT%20k%C3%A8m%20NQHDQT%20va%20cac%20BB%20don.pdf" target="_blank">Miễn nhiệm chức danh Kế toán trưởng theo đơn xin thôi giữ chức Kế toán trưởng của bà Dương Thị Huệ, đã được Ban Lãnh đạo đồng ý kèm theo quyết định miễn nhiệm số 368/QĐ-MTĐT</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"personnel_change","documentType":"personnel_change","publishYear":2023,"attachments":[{"title":"Nghị quyết số 19/2023/NQ-HQĐT miễn nhiệm chức vụ Kế toán trưởng theo đơn xin thôi làm Kế toán trưởng của bà Dương Thị Huệ và bổ nhiệm chức danh Kế toán trưởng Ông Lê Phi Hải","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20s%E1%BB%91%2019b%20bo%20nhiem%20KTT.pdf"},{"title":"Miễn nhiệm chức danh Kế toán trưởng theo đơn xin thôi giữ chức Kế toán trưởng của bà Dương Thị Huệ, đã được Ban Lãnh đạo đồng ý kèm theo quyết định miễn nhiệm số 368/QĐ-MTĐT","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Quyet%20dinh%20so%20%20368%20%20mien%20nhiem%20chuc%20danh%20KTT%20k%C3%A8m%20NQHDQT%20va%20cac%20BB%20don.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Quyet%20dinh%20so%20%20368%20%20mien%20nhiem%20chuc%20danh%20KTT%20k%C3%A8m%20NQHDQT%20va%20cac%20BB%20don.pdf","fileName":"Quyet%20dinh%20so%20%20368%20%20mien%20nhiem%20chuc%20danh%20KTT%20k%C3%A8m%20NQHDQT%20va%20cac%20BB%20don.pdf"}],"images":[],"summary":"Miễn nhiệm chức danh Kế toán trưởng theo đơn xin thôi giữ chức Kế toán trưởng của bà Dương Thị Huệ đã được Ban Lãnh đạo đồng kèm theo NQ và QĐ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết HĐQT về việc chi trả cổ tức bằng tiền năm 2022', N'11/05/2023 15:23', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%202023%20chi%20tra%20co%20tuc%202022%20(1).pdf" target="_blank">Nghị quyết HĐQT về việc chi trả cổ tức bằng tiền năm 2022</a></p>

<div class="ddict_btn" style="left:363.75px; top:27px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"board_resolution","documentType":"board_resolution","publishYear":2023,"attachments":[{"title":"Nghị quyết HĐQT về việc chi trả cổ tức bằng tiền năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%202023%20chi%20tra%20co%20tuc%202022%20(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%202023%20chi%20tra%20co%20tuc%202022%20(1).pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%202023%20chi%20tra%20co%20tuc%202022%20(1).pdf"}],"images":[],"summary":"Nghị quyết HĐQT về việc chi trả cổ tức bằng tiền năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức  bằng tiền năm 2022', N'09/05/2023 11:20', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20%C4%91%C4%83ng%20k%C3%BD%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022%20thay%20the%20TB%20so%2016.pdf" target="_blank">Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2022</a></p>

<div class="ddict_btn" style="left:670.5px; top:32px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"dividend_notice","documentType":"dividend_notice","publishYear":2023,"attachments":[{"title":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20%C4%91%C4%83ng%20k%C3%BD%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022%20thay%20the%20TB%20so%2016.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20%C4%91%C4%83ng%20k%C3%BD%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022%20thay%20the%20TB%20so%2016.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20%C4%91%C4%83ng%20k%C3%BD%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022%20thay%20the%20TB%20so%2016.pdf"}],"images":[],"summary":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức  bằng tiền năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo v/v chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền và Tài liệu Đại hội đồng Cổ đông thường niên năm 2022', N'05/05/2023 15:23', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022.pdf" target="_blank">Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20n%C4%83m%202023.pdf" target="_blank">Biên bản đại hội đồng Cổ đông thường niên năm 2023 Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202023.pdf" target="_blank">Nghị quyết đại hội đồng Cổ đông thường niên năm 2023 Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>

<p> </p>

<p> </p>

<div class="ddict_btn" style="left:363.75px; top:140px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2023,"attachments":[{"title":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20v.v%20ch%E1%BB%91t%20danh%20s%C3%A1ch%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%202022.pdf"},{"title":"Biên bản đại hội đồng Cổ đông thường niên năm 2023 Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20n%C4%83m%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20n%C4%83m%202023.pdf","fileName":"Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20n%C4%83m%202023.pdf"},{"title":"Nghị quyết đại hội đồng Cổ đông thường niên năm 2023 Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202023.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20%C4%91%E1%BB%93ng%20c%E1%BB%95%20%C4%91%C3%B4ng%20th%C6%B0%E1%BB%9Dng%20ni%C3%AAn%202023.pdf"}],"images":[],"summary":"Thông báo v/v chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền và Tài liệu Đại hội đồng Cổ đông thường niên năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo mời họp Đại hồi đồng Cổ đông thường niên năm 2023', N'21/04/2023 4:36', N'<p>1. <a href="/Public/Upload/files/QuanHeCoDong/TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%202023.pdf" target="_blank">Thông báo mời họp Đại hội đồng Cổ đông thường niên năm 2023</a></p>

<p>2. <a href="/Public/Upload/files/QuanHeCoDong/Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90H%C4%90C%C4%90%202023.pdf" target="_blank">Chương trình Đại hội đồng Cổ đông thường niên năm 2023</a></p>

<p>3. <a href="/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20BC%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%20H%C4%90QT%202022%20v%C3%A0%20ph%C6%B0%C6%A1ng%20h%C6%B0%E1%BB%9Bng%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%202023.pdf" target="_blank">Dự thảo Báo cáo hoạt động HĐQT năm 2022 và phương hướng hoạt động năm 2023</a></p>

<p>4. <a href="/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20ngh%E1%BB%8B%20quy%E1%BA%BFt.pdf" target="_blank">Dự thảo Nghị quyết Đại hội đồng Cổ đông năm 2023</a></p>

<div class="ddict_btn" style="left:338.047px; top:133px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2023,"attachments":[{"title":"Thông báo mời họp Đại hội đồng Cổ đông thường niên năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%202023.pdf","fileName":"TB%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%C4%90C%C4%90%202023.pdf"},{"title":"Chương trình Đại hội đồng Cổ đông thường niên năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90H%C4%90C%C4%90%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90H%C4%90C%C4%90%202023.pdf","fileName":"Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90H%C4%90C%C4%90%202023.pdf"},{"title":"Dự thảo Báo cáo hoạt động HĐQT năm 2022 và phương hướng hoạt động năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20BC%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%20H%C4%90QT%202022%20v%C3%A0%20ph%C6%B0%C6%A1ng%20h%C6%B0%E1%BB%9Bng%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%202023.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20BC%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%20H%C4%90QT%202022%20v%C3%A0%20ph%C6%B0%C6%A1ng%20h%C6%B0%E1%BB%9Bng%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%202023.pdf","fileName":"D%E1%BB%B1%20th%E1%BA%A3o%20BC%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%20H%C4%90QT%202022%20v%C3%A0%20ph%C6%B0%C6%A1ng%20h%C6%B0%E1%BB%9Bng%20ho%E1%BA%A1t%20%C4%91%E1%BB%99ng%202023.pdf"},{"title":"Dự thảo Nghị quyết Đại hội đồng Cổ đông năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20ngh%E1%BB%8B%20quy%E1%BA%BFt.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20ngh%E1%BB%8B%20quy%E1%BA%BFt.pdf","fileName":"D%E1%BB%B1%20th%E1%BA%A3o%20ngh%E1%BB%8B%20quy%E1%BA%BFt.pdf"}],"images":[],"summary":"Thông báo mời họp Đại hồi đồng Cổ đông thường niên năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2022', N'4/4/2023 8:57', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2022.BC%20thuong%20nien.pdf" target="_blank">Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2022</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2023,"attachments":[{"title":"Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022.BC%20thuong%20nien.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022.BC%20thuong%20nien.pdf","fileName":"2022.BC%20thuong%20nien.pdf"}],"images":[],"summary":"Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tài chính cho năm tài chính kết thúc 31 tháng 12 năm 2022 (đã được kiểm toán)', N'31/03/2023 23:02', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2022.BaoCaoTaiChinh_DaDuocKiemToan.pdf" target="_blank">Báo cáo tài chính cho năm tài chính kết thúc 31 tháng 12 năm 2022 (đã được kiểm toán)</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2023,"attachments":[{"title":"Báo cáo tài chính cho năm tài chính kết thúc 31 tháng 12 năm 2022 (đã được kiểm toán)","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022.BaoCaoTaiChinh_DaDuocKiemToan.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022.BaoCaoTaiChinh_DaDuocKiemToan.pdf","fileName":"2022.BaoCaoTaiChinh_DaDuocKiemToan.pdf"}],"images":[],"summary":"Báo cáo tài chính cho năm tài chính kết thúc 31 tháng 12 năm 2022 (đã được kiểm toán)","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng thay thế thông báo số 159/2023/TB-MTĐT ngày 23/03/2023 để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên', N'23/03/2023 10:20', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20%C4%91%C4%83ng%20k%C3%BD%20ng%C3%A0y%20%C4%91%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng thay thế thông báo số 159/2023/TB-MTĐT ngày 23/03/2023 để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2023</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2023,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng thay thế thông báo số 159/2023/TB-MTĐT ngày 23/03/2023 để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20%C4%91%C4%83ng%20k%C3%BD%20ng%C3%A0y%20%C4%91%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20%C4%91%C4%83ng%20k%C3%BD%20ng%C3%A0y%20%C4%91%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20%C4%91%C4%83ng%20k%C3%BD%20ng%C3%A0y%20%C4%91%E1%BA%A1i%20h%E1%BB%99i%20c%E1%BB%95%20%C4%91%C3%B4ng.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng thay thế thông báo số 159/2023/TB-MTĐT ngày 23/03/2023 để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2023', N'22/03/2023 15:28:18', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2023_Th%C3%B4ng%20b%C3%A1o%20s%C3%B3%20159_2023_TB-MT%C4%90T.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2023</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2023,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2023","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2023_Th%C3%B4ng%20b%C3%A1o%20s%C3%B3%20159_2023_TB-MT%C4%90T.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2023_Th%C3%B4ng%20b%C3%A1o%20s%C3%B3%20159_2023_TB-MT%C4%90T.pdf","fileName":"2023_Th%C3%B4ng%20b%C3%A1o%20s%C3%B3%20159_2023_TB-MT%C4%90T.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2023","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị Công ty năm 2022', N'18/01/2023 10:20', N'<p><a href="/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20%20t%C3%ACnh%20h%C3%ACnh%20qu%E1%BA%A3n%20tr%E1%BB%8B%20c%C3%B4ng%20ty%202022%20(1).pdf" target="_blank">Báo cáo tình hình quản trị Công ty năm 2022</a></p>

<div class="ddict_btn" style="left:278.734px; top:29px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2023,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20%20t%C3%ACnh%20h%C3%ACnh%20qu%E1%BA%A3n%20tr%E1%BB%8B%20c%C3%B4ng%20ty%202022%20(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20%20t%C3%ACnh%20h%C3%ACnh%20qu%E1%BA%A3n%20tr%E1%BB%8B%20c%C3%B4ng%20ty%202022%20(1).pdf","fileName":"B%C3%A1o%20c%C3%A1o%20%20t%C3%ACnh%20h%C3%ACnh%20qu%E1%BA%A3n%20tr%E1%BB%8B%20c%C3%B4ng%20ty%202022%20(1).pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị Công ty năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết và biên bản về việc lựa chọn đơn vị kiểm toán Báo báo tài chính năm 2022', N'14/12/2022 11:23:17 AM', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2022_Nghi%20quyet%20va%20bien%20ban%20lua%20chon%20KTDL%202022.pdf" target="_blank">Nghị quyết và biên bản về việc lựa chọn đơn vị kiểm toán Báo báo tài chính năm 2022 của Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2022,"attachments":[{"title":"Nghị quyết và biên bản về việc lựa chọn đơn vị kiểm toán Báo báo tài chính năm 2022 của Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022_Nghi%20quyet%20va%20bien%20ban%20lua%20chon%20KTDL%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022_Nghi%20quyet%20va%20bien%20ban%20lua%20chon%20KTDL%202022.pdf","fileName":"2022_Nghi%20quyet%20va%20bien%20ban%20lua%20chon%20KTDL%202022.pdf"}],"images":[],"summary":"Nghị quyết và biên bản về việc lựa chọn đơn vị kiểm toán Báo báo tài chính năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về việc chi trả cổ tức năm 2021', N'23/06/2022 16:41', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20n%C4%83m%202021%20(1).pdf" target="_blank">Thông báo về việc chi trả cổ tức năm 2021</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"dividend_notice","documentType":"dividend_notice","publishYear":2022,"attachments":[{"title":"Thông báo về việc chi trả cổ tức năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20n%C4%83m%202021%20(1).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20n%C4%83m%202021%20(1).pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20v%E1%BB%81%20vi%E1%BB%87c%20chi%20tr%E1%BA%A3%20c%E1%BB%95%20t%E1%BB%A9c%20n%C4%83m%202021%20(1).pdf"}],"images":[],"summary":"Thông báo về việc chi trả cổ tức năm 2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Giải trình số tiền chênh lệch chia cổ tức năm 2021 so với số tiền thông báo tại Nghị quyết của Đại hội đồng Cổ đông thường niên năm 2022', N'17:12 28/05/2022', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20422%20GIAI%20TRINH%20CHENH%20LECH%20CHIA%20CO%20TUC%202021.pdf" target="_blank">Công văn số 422 về giải trình số tiền chênh lệch chia cổ tức</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2022,"attachments":[{"title":"Công văn số 422 về giải trình số tiền chênh lệch chia cổ tức","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20422%20GIAI%20TRINH%20CHENH%20LECH%20CHIA%20CO%20TUC%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20422%20GIAI%20TRINH%20CHENH%20LECH%20CHIA%20CO%20TUC%202021.pdf","fileName":"CV%20422%20GIAI%20TRINH%20CHENH%20LECH%20CHIA%20CO%20TUC%202021.pdf"}],"images":[],"summary":"Giải trình số tiền chênh lệch chia cổ tức năm 2021 so với số tiền thông báo tại Nghị quyết của Đại hội đồng Cổ đông thường niên năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Chốt danh sách ngày đăng ký cuối cùng chia cổ tức 2021 đính kèm nghị quyết ĐH đồng Cổ đông năm 2022 và nghị quyết của HĐQT về chi trả cổ tức 2021', N'24/05/2022 16:29', N'<p><a href="/Public/Upload/files/QuanHeCoDong/th%C3%B4ng%20b%C3%A1o%2019%20chia%20co%20tuc%202021.pdf" target="_blank">Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2021</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%2018%20chia%20co%20tuc.pdf" target="_blank">Nghị quyết Hội đồng Quản trị</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf" target="_blank">Nghị quyết Đại hội đồng Cổ đông thường niên năm 2022 Công ty Cổ phần Môi trường và Công trình Độ thị Huế</a></p>

<div class="ddict_btn" style="left:473.031px; top:119px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>

<div class="ddict_btn" style="left:187.656px; top:66px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"board_resolution","documentType":"board_resolution","publishYear":2022,"attachments":[{"title":"Thông báo về việc chốt danh sách ngày đăng ký cuối cùng để thực hiện quyền chi trả cổ tức bằng tiền năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/th%C3%B4ng%20b%C3%A1o%2019%20chia%20co%20tuc%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/th%C3%B4ng%20b%C3%A1o%2019%20chia%20co%20tuc%202021.pdf","fileName":"th%C3%B4ng%20b%C3%A1o%2019%20chia%20co%20tuc%202021.pdf"},{"title":"Nghị quyết Hội đồng Quản trị","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%2018%20chia%20co%20tuc.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%2018%20chia%20co%20tuc.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%2018%20chia%20co%20tuc.pdf"},{"title":"Nghị quyết Đại hội đồng Cổ đông thường niên năm 2022 Công ty Cổ phần Môi trường và Công trình Độ thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf"}],"images":[],"summary":"Chốt danh sách ngày đăng ký cuối cùng chia cổ tức 2021 đính kèm nghị quyết ĐH đồng Cổ đông năm 2022 và nghị quyết của HĐQT về chi trả cổ tức 2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Tờ trình, nghị quyết và biên bản đại hội Đồng Cổ đông thường niên năm 2022', N'20/05/2022 11:12', N'<p><a href="/Public/Upload/files/QuanHeCoDong/T%E1%BB%9D%20tr%C3%ACnh%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202022.pdf" target="_blank">Tờ trình Đại hội Đồng Cổ đông thường niên năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf" target="_blank">Nghị quyết Đại hội Đồng Cổ đông thường niên năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20TN%202022.pdf" target="_blank">Biên bản Đại hội Đồng Cổ đông thường niên năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/T%E1%BB%9D%20khai%20%C4%90K%20MS%20CT%20Ch%E1%BB%89nh%20trang%20Tr%C6%B0%C6%A1ng%20Gia%20M%C3%B4.pdf" target="_blank">Tờ khai đăng ký mã số đơn vị có quan hệ với ngân sách dùng cho các dự án đầu tư ở gian đoạn thực hiện dự án</a></p>

<p> </p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2022,"attachments":[{"title":"Tờ trình Đại hội Đồng Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/T%E1%BB%9D%20tr%C3%ACnh%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/T%E1%BB%9D%20tr%C3%ACnh%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202022.pdf","fileName":"T%E1%BB%9D%20tr%C3%ACnh%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%202022.pdf"},{"title":"Nghị quyết Đại hội Đồng Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%C4%90%20c%E1%BB%95%20%C4%91%C3%B4ng%20TN%20nam%202022.pdf"},{"title":"Biên bản Đại hội Đồng Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20TN%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20TN%202022.pdf","fileName":"Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90%E1%BA%A1i%20H%E1%BB%99i%20TN%202022.pdf"},{"title":"Tờ khai đăng ký mã số đơn vị có quan hệ với ngân sách dùng cho các dự án đầu tư ở gian đoạn thực hiện dự án","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/T%E1%BB%9D%20khai%20%C4%90K%20MS%20CT%20Ch%E1%BB%89nh%20trang%20Tr%C6%B0%C6%A1ng%20Gia%20M%C3%B4.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/T%E1%BB%9D%20khai%20%C4%90K%20MS%20CT%20Ch%E1%BB%89nh%20trang%20Tr%C6%B0%C6%A1ng%20Gia%20M%C3%B4.pdf","fileName":"T%E1%BB%9D%20khai%20%C4%90K%20MS%20CT%20Ch%E1%BB%89nh%20trang%20Tr%C6%B0%C6%A1ng%20Gia%20M%C3%B4.pdf"}],"images":[],"summary":"Tờ trình, nghị quyết và biên bản đại hội Đồng Cổ đông thường niên năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo mời dự Đại hội Cổ đông thường niên năm 2022 và tài liệu đính kèm', N'09/05/2022 16:24', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%20%C4%90C%C4%90%202022%20BAN%20CHINH.pdf" target="_blank">Thông báo Đại hội Cổ đông thường niên năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90%E1%BA%A1i%20h%E1%BB%99i.pdf" target="_blank">Chương trình Đại hội Cổ đông thường niên năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%E1%BB%95ng%20k%E1%BA%BFt%20nam%202021%20DHDCDTN%202022.pdf" target="_blank">Báo cáo Tổng kết Công tác năm 2021. Phương hướng nhiệm vụ năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20HDQT%20TAI%20DHDCDTN%202022.pdf" target="_blank">Báo cáo hoạt động của Hội đồng Quản trị năm 2021 và phương hướng hoạt động năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20CAC%20CHI%20TIEU%20TC%20DHCD%202022.pdf" target="_blank">Báo cáo các chỉ tiêu tài chính, phương án phân chia lợi nhuận, chi trả cổ tức và thù lao tại hội đồng Cổ dông thường niên năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20BKSDHDCDTN%202022.pdf" target="_blank">Báo cáo hoạt động của Ban kiểm soát tại Đại hội đồng cổ đông thường niên năm 2022</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf" target="_blank">Dự thảo nghị quyết Đại hội Cổ đông thường niên năm 2022 Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf" target="_blank">Dự thảo biên bản Đại hội Cổ đông thường niên năm 2022 Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>

<div class="ddict_btn" style="left:314.781px; top:28px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>

<div class="ddict_btn" style="left:314.781px; top:33px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>

<div class="ddict_btn" style="left:779.953px; top:168px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2022,"attachments":[{"title":"Thông báo Đại hội Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%20%C4%90C%C4%90%202022%20BAN%20CHINH.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%20%C4%90C%C4%90%202022%20BAN%20CHINH.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20m%E1%BB%9Di%20h%E1%BB%8Dp%20%C4%90H%20%C4%90C%C4%90%202022%20BAN%20CHINH.pdf"},{"title":"Chương trình Đại hội Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90%E1%BA%A1i%20h%E1%BB%99i.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90%E1%BA%A1i%20h%E1%BB%99i.pdf","fileName":"Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20%C4%90%E1%BA%A1i%20h%E1%BB%99i.pdf"},{"title":"Báo cáo Tổng kết Công tác năm 2021. Phương hướng nhiệm vụ năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%E1%BB%95ng%20k%E1%BA%BFt%20nam%202021%20DHDCDTN%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/B%C3%A1o%20c%C3%A1o%20t%E1%BB%95ng%20k%E1%BA%BFt%20nam%202021%20DHDCDTN%202022.pdf","fileName":"B%C3%A1o%20c%C3%A1o%20t%E1%BB%95ng%20k%E1%BA%BFt%20nam%202021%20DHDCDTN%202022.pdf"},{"title":"Báo cáo hoạt động của Hội đồng Quản trị năm 2021 và phương hướng hoạt động năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20HDQT%20TAI%20DHDCDTN%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20HDQT%20TAI%20DHDCDTN%202022.pdf","fileName":"BAO%20CAO%20HDQT%20TAI%20DHDCDTN%202022.pdf"},{"title":"Báo cáo các chỉ tiêu tài chính, phương án phân chia lợi nhuận, chi trả cổ tức và thù lao tại hội đồng Cổ dông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20CAC%20CHI%20TIEU%20TC%20DHCD%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20CAC%20CHI%20TIEU%20TC%20DHCD%202022.pdf","fileName":"BAO%20CAO%20CAC%20CHI%20TIEU%20TC%20DHCD%202022.pdf"},{"title":"Báo cáo hoạt động của Ban kiểm soát tại Đại hội đồng cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20BKSDHDCDTN%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20BKSDHDCDTN%202022.pdf","fileName":"BAO%20CAO%20BKSDHDCDTN%202022.pdf"},{"title":"Dự thảo nghị quyết Đại hội Cổ đông thường niên năm 2022 Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf","fileName":"D%E1%BB%B1%20th%E1%BA%A3o%20Ngh%E1%BB%8B%20quy%E1%BA%BFt%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf"},{"title":"Dự thảo biên bản Đại hội Cổ đông thường niên năm 2022 Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/D%E1%BB%B1%20th%E1%BA%A3o%20Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf","fileName":"D%E1%BB%B1%20th%E1%BA%A3o%20Bi%C3%AAn%20b%E1%BA%A3n%20%C4%90H%20C%E1%BB%95%20%C4%91%C3%B4ng.pdf"}],"images":[],"summary":"Thông báo mời dự Đại hội Cổ đông thường niên năm 2022 và tài liệu đính kèm","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022', N'08/04/2022 16:29', N'<p><a href="/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20CHOT%20DHCD%202022.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2022,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20CHOT%20DHCD%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/THONG%20BAO%20CHOT%20DHCD%202022.pdf","fileName":"THONG%20BAO%20CHOT%20DHCD%202022.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022, thay thế Thông báo số 220/2022/TB-MTĐT', N'29/03/2022 15:05', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20H%C4%90QT%20chot%20danh%20sach%20DHCD.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022, thay thế Thông báo số 220/2022/TB-MTĐT</a></p>

<div class="ddict_btn" style="left:994.422px; top:26px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>

<div class="ddict_btn" style="left:994.422px; top:25px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>

<div class="ddict_btn" style="left:894.172px; top:31px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2022,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022, thay thế Thông báo số 220/2022/TB-MTĐT","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20H%C4%90QT%20chot%20danh%20sach%20DHCD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Th%C3%B4ng%20b%C3%A1o%20H%C4%90QT%20chot%20danh%20sach%20DHCD.pdf","fileName":"Th%C3%B4ng%20b%C3%A1o%20H%C4%90QT%20chot%20danh%20sach%20DHCD.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng Cổ đông thường niên năm 2022, thay thế Thông báo số 220/2022/TB-MTĐT","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghị quyết Hội đồng Quản trị Về việc chốt ngày đăng ký cuối cùng để thực hiện quyền Tổ chức Đại hội Cổ đông thường niên năm 2022', N'21/03/2022 13:03', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20chot%20ngay%20dang%20ky%20DHCD.pdf" target="_blank">Nghị quyết Hội đồng Quản trị Về việc chốt ngày đăng ký cuối cùng để thực hiện quyền Tổ chức Đại hội Cổ đông thường niên năm 2022</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2022,"attachments":[{"title":"Nghị quyết Hội đồng Quản trị Về việc chốt ngày đăng ký cuối cùng để thực hiện quyền Tổ chức Đại hội Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20chot%20ngay%20dang%20ky%20DHCD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20chot%20ngay%20dang%20ky%20DHCD.pdf","fileName":"Ngh%E1%BB%8B%20quy%E1%BA%BFt%20H%C4%90QT%20chot%20ngay%20dang%20ky%20DHCD.pdf"}],"images":[],"summary":"Nghị quyết Hội đồng Quản trị Về việc chốt ngày đăng ký cuối cùng để thực hiện quyền Tổ chức Đại hội Cổ đông thường niên năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2021', N'25/03/2022 14:56', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TN%20NAM%202021.pdf" target="_blank">Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2021</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2022,"attachments":[{"title":"Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TN%20NAM%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TN%20NAM%202021.pdf","fileName":"BAO%20CAO%20TN%20NAM%202021.pdf"}],"images":[],"summary":"Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Dự kiến phương án phân phối lợi nhuận năm 2021 và kế hoạch SXKD năm 2022', N'25/03/2022 14:49', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20DE%20NGHI%20PHE%20DUYET%20PAPPLN%202021.pdf" target="_blank">Dự kiến phương án phân phối lợi nhuận năm 2021 và kế hoạch SXKD năm 2022</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2022,"attachments":[{"title":"Dự kiến phương án phân phối lợi nhuận năm 2021 và kế hoạch SXKD năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20DE%20NGHI%20PHE%20DUYET%20PAPPLN%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20DE%20NGHI%20PHE%20DUYET%20PAPPLN%202021.pdf","fileName":"CV%20DE%20NGHI%20PHE%20DUYET%20PAPPLN%202021.pdf"}],"images":[],"summary":"Dự kiến phương án phân phối lợi nhuận năm 2021 và kế hoạch SXKD năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội Cổ đông thường niên năm 2022', N'22/03/2022 10:28', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20ngay%20dang%20ky%20cuoi%20cung%20DHDCDTN%202022.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội Cổ đông thường niên năm 2022</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"annual_report","documentType":"annual_report","publishYear":2022,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội Cổ đông thường niên năm 2022","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20ngay%20dang%20ky%20cuoi%20cung%20DHDCDTN%202022.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20ngay%20dang%20ky%20cuoi%20cung%20DHDCDTN%202022.pdf","fileName":"CV%20ngay%20dang%20ky%20cuoi%20cung%20DHDCDTN%202022.pdf"}],"images":[],"summary":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội Cổ đông thường niên năm 2022","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công văn Công bố Báo cáo tài chính kiểm toán năm 2021', N'22/03/2022 10:20', N'<p><a href="/Public/Upload/files/QuanHeCoDong/CV%20cong%20bo%20bao%20cao%20TC%202021.pdf" target="_blank">Công văn Công bố Báo cáo tài chính kiểm toán năm 2021 </a></p>

<div class="ddict_btn" style="left:353.891px; top:28px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/images.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2022,"attachments":[{"title":"Công văn Công bố Báo cáo tài chính kiểm toán năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20cong%20bo%20bao%20cao%20TC%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/CV%20cong%20bo%20bao%20cao%20TC%202021.pdf","fileName":"CV%20cong%20bo%20bao%20cao%20TC%202021.pdf"}],"images":[],"summary":"Công văn Công bố Báo cáo tài chính kiểm toán năm 2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tài chính cho năm tài chính kết thúc ngày 31 tháng 12 năm 2021', N'22/03/2022 8:10', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TC%20DA%20KIEM%20TOAN%202021.pdf" target="_blank">Báo cáo tài chính cho năm tài chính kết thúc ngày 31 tháng 12 năm 2021</a></p>

<div class="ddict_btn" style="left:441.359px; top:78px"><img src="chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png" /></div>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"financial_report","documentType":"financial_report","publishYear":2022,"attachments":[{"title":"Báo cáo tài chính cho năm tài chính kết thúc ngày 31 tháng 12 năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TC%20DA%20KIEM%20TOAN%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20TC%20DA%20KIEM%20TOAN%202021.pdf","fileName":"BAO%20CAO%20TC%20DA%20KIEM%20TOAN%202021.pdf"}],"images":[],"summary":"Báo cáo tài chính cho năm tài chính kết thúc ngày 31 tháng 12 năm 2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo kết quả giao dịch cổ phiếu/chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ', N'16/02/2022 15:37', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Ph%E1%BB%A5%20l%E1%BB%A5c%20s%E1%BB%91%20XV.pdf" target="_blank">Báo cáo kết quả giao dịch cổ phiếu/chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ</a></p>', N'/uploads/images/report.png', N'shareholders', N'{"category":"stock_trading_notice","documentType":"stock_trading_notice","publishYear":2022,"attachments":[{"title":"Báo cáo kết quả giao dịch cổ phiếu/chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ph%E1%BB%A5%20l%E1%BB%A5c%20s%E1%BB%91%20XV.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Ph%E1%BB%A5%20l%E1%BB%A5c%20s%E1%BB%91%20XV.pdf","fileName":"Ph%E1%BB%A5%20l%E1%BB%A5c%20s%E1%BB%91%20XV.pdf"}],"images":[],"summary":"Báo cáo kết quả giao dịch cổ phiếu/chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị Công ty năm 2021', N'26/01/2022 16:35', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QT%20NAM%202021.pdf" target="_blank">Báo cáo tình hình quản trị Công ty năm 2021</a></p>', N'/uploads/images/cach-viet-bao-cao-cong-viec-gay-an-tuong-tuyet-doi-voi-sep-hinh-anh-1.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2022,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QT%20NAM%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BAO%20CAO%20QT%20NAM%202021.pdf","fileName":"BAO%20CAO%20QT%20NAM%202021.pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị Công ty năm 2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo giao dịch Cổ phiếu/Chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ', N'07/01/2022 10:30', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2022_THONG%20BAO%20HCP.pdf">Thông báo giao dịch Cổ phiếu/Chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"stock_trading_notice","documentType":"stock_trading_notice","publishYear":2022,"attachments":[{"title":"Thông báo giao dịch Cổ phiếu/Chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022_THONG%20BAO%20HCP.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022_THONG%20BAO%20HCP.pdf","fileName":"2022_THONG%20BAO%20HCP.pdf"}],"images":[],"summary":"Thông báo giao dịch Cổ phiếu/Chứng chỉ quỹ của người nội bộ và người có liên quan của người nội bộ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tình hình quản trị Công ty sáu tháng đầu năm 2021', N'26/07/2021 10:30', N'<p><a href="/Public/Upload/files/QuanHeCoDong/bao%20cao%20QT%20%206%20thang%202021.pdf" target="_blank">Báo cáo tình hình quản trị Công ty sáu tháng đầu năm 2021</a></p>', N'/uploads/images/SEO-icon.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2021,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty sáu tháng đầu năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/bao%20cao%20QT%20%206%20thang%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/bao%20cao%20QT%20%206%20thang%202021.pdf","fileName":"bao%20cao%20QT%20%206%20thang%202021.pdf"}],"images":[],"summary":"Báo cáo tình hình quản trị Công ty sáu tháng đầu năm 2021","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo kết quả giao dịch cổ phiếu/chứng chỉ quỹ', N'12/07/2021 16:47', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2021_ketquagiaodichcophieu2.pdf" target="_blank">Báo cáo kết quả giao dịch cổ phiếu/ chứng chỉ quỹ của người nội bộ của Công ty đại chúng, người nội bộ của quỹ đại chúng và người có liên quan của người nội bộ</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"stock_trading_notice","documentType":"stock_trading_notice","publishYear":2021,"attachments":[{"title":"Báo cáo kết quả giao dịch cổ phiếu/ chứng chỉ quỹ của người nội bộ của Công ty đại chúng, người nội bộ của quỹ đại chúng và người có liên quan của người nội bộ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2021_ketquagiaodichcophieu2.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2021_ketquagiaodichcophieu2.pdf","fileName":"2021_ketquagiaodichcophieu2.pdf"}],"images":[],"summary":"Báo cáo kết quả giao dịch cổ phiếu/chứng chỉ quỹ","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo giao dịch cổ phần', N'08/06/2021 13:57', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2021.THONG%20BAO%20GIAO%20DICH%20CP%20HCP.pdf" target="_blank">Thông báo giao dịch cổ phần</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"stock_trading_notice","documentType":"stock_trading_notice","publishYear":2021,"attachments":[{"title":"Thông báo giao dịch cổ phần","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2021.THONG%20BAO%20GIAO%20DICH%20CP%20HCP.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2021.THONG%20BAO%20GIAO%20DICH%20CP%20HCP.pdf","fileName":"2021.THONG%20BAO%20GIAO%20DICH%20CP%20HCP.pdf"}],"images":[],"summary":"Thông báo giao dịch cổ phần","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Các văn bản xin gia hạn thời gian tổ chức Đại hội Đồng cổ đông hết nhiệm kỳ 2015-2019', N'02/01/2020 17:48', N'<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.1-Thong%20bao%20so%20800-DKKD-TB.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="font-size:12px"><span style="font-family:Verdana,sans-serif">Thông báo số 800/ĐKKD ngày 27/12/2019 của Phòng Đăng ký Kinh doanh – Sở Kế hoạch và Đầu tư tỉnh Thừa Thiên Huế</span></span></a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.2-CV%20so%209990-UBND-KH.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="font-size:12px"><span style="font-family:Verdana,sans-serif">Công văn số 9990/UBND-KH 27/12/2019 của UBND tỉnh Thừa Thiên Huế</span></span></a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.3-Nghi%20Quyet%2022-2019-NQ-HDQT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="font-size:12px"><span style="font-family:Verdana,sans-serif">Nghị quyết về việc gia hạn thời gian Đại hội đồng cổ đông thường niên hết nhiệm kỳ 2015-2019 của Công ty Cổ phần Môi trường và Công trình Đô thị Huế</span></span></a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.4-CV%20so%203937-SKHDT-DKKD.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="font-size:12px"><span style="font-family:Verdana,sans-serif">Công văn số 3937/SKHĐT-ĐKKD ngày 20/12/2019 của Sở Kế hoạch và Đầu tư tỉnh Thừa Thiên Huế</span></span></a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.5-CV%20so%209725-UBND-KH.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="font-size:12px"><span style="font-family:Verdana,sans-serif">Công văn số 9725/UBND-KH ngày 19/12/2019 của UBND tỉnh Thừa Thiên Huế</span></span></a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.6-CV%20so%203560-STC-GCS%26DN.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="font-size:12px"><span style="font-family:Verdana,sans-serif">Công văn 3560/STC-GCS&DN ngày 16/12/2019 của Sở Tài chính tỉnh Thừa Thiên Huế</span></span></a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.7-CV%20so%20885-CV-MTDT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="font-size:12px"><span style="font-family:Verdana,sans-serif">Công văn số 885/CV-MTĐT ngày 09/12/2019 của Công ty về việc Xin gia hạn thời gian tổ chức Đại hội Đồng cổ đông hết nhiệm kỳ 2015-2019</span></span></a></span></span></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2020,"attachments":[{"title":"Thông báo số 800/ĐKKD ngày 27/12/2019 của Phòng Đăng ký Kinh doanh – Sở Kế hoạch và Đầu tư tỉnh Thừa Thiên Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.1-Thong%20bao%20so%20800-DKKD-TB.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.1-Thong%20bao%20so%20800-DKKD-TB.pdf","fileName":"HEPCO2019.02.1-Thong%20bao%20so%20800-DKKD-TB.pdf"},{"title":"Công văn số 9990/UBND-KH 27/12/2019 của UBND tỉnh Thừa Thiên Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.2-CV%20so%209990-UBND-KH.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.2-CV%20so%209990-UBND-KH.pdf","fileName":"HEPCO2019.02.2-CV%20so%209990-UBND-KH.pdf"},{"title":"Nghị quyết về việc gia hạn thời gian Đại hội đồng cổ đông thường niên hết nhiệm kỳ 2015-2019 của Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.3-Nghi%20Quyet%2022-2019-NQ-HDQT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.3-Nghi%20Quyet%2022-2019-NQ-HDQT.pdf","fileName":"HEPCO2019.02.3-Nghi%20Quyet%2022-2019-NQ-HDQT.pdf"},{"title":"Công văn số 3937/SKHĐT-ĐKKD ngày 20/12/2019 của Sở Kế hoạch và Đầu tư tỉnh Thừa Thiên Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.4-CV%20so%203937-SKHDT-DKKD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.4-CV%20so%203937-SKHDT-DKKD.pdf","fileName":"HEPCO2019.02.4-CV%20so%203937-SKHDT-DKKD.pdf"},{"title":"Công văn số 9725/UBND-KH ngày 19/12/2019 của UBND tỉnh Thừa Thiên Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.5-CV%20so%209725-UBND-KH.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.5-CV%20so%209725-UBND-KH.pdf","fileName":"HEPCO2019.02.5-CV%20so%209725-UBND-KH.pdf"},{"title":"Công văn 3560/STC-GCS&DN ngày 16/12/2019 của Sở Tài chính tỉnh Thừa Thiên Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.6-CV%20so%203560-STC-GCS%26DN.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.6-CV%20so%203560-STC-GCS%26DN.pdf","fileName":"HEPCO2019.02.6-CV%20so%203560-STC-GCS%26DN.pdf"},{"title":"Công văn số 885/CV-MTĐT ngày 09/12/2019 của Công ty về việc Xin gia hạn thời gian tổ chức Đại hội Đồng cổ đông hết nhiệm kỳ 2015-2019","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.7-CV%20so%20885-CV-MTDT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO2019.02.7-CV%20so%20885-CV-MTDT.pdf","fileName":"HEPCO2019.02.7-CV%20so%20885-CV-MTDT.pdf"}],"images":[],"summary":"Các văn bản xin gia hạn thời gian tổ chức Đại hội Đồng cổ đông hết nhiệm kỳ 2015-2019","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Tổng hợp thông tin của Hội đồng Quản trị, Ban Kiểm soát Công ty', N'12/03/2020 11:48', N'<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/1-%20CV%20so%20217%20gui%20SGD%20CK%20HN.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Báo cáo cung cấp thông tin và thực hiện quản trị Công ty</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><strong>Hội đồng quản trị:</strong></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/2-PL3%20-%20Nguyen%20Hong%20Son.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">1. Nguyễn Hồng Sơn</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/3-PL3%20-%20Tran%20Quoc%20Khanh.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">2. Trần Quốc Khánh</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/4-PL3%20-%20Tran%20Trung%20Khanh.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">3. Trần Trung Khánh</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/5-PL3%20-%20Duong%20Thi%20Hue.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">4. Dương Thị Huệ</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/6-PL3%20-%20Nguyen%20Van%20Rin.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">5. Nguyễn Văn Rin</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><strong>Ban Kiểm soát:</strong></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/7-PL3%20-%20Hoang%20Trong%20Thuan.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">1.</a> <a href="/Public/Upload/files/QuanHeCoDong/8-PL3%20-%20Truong%20Lan%20Huong.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Trương Thị Lan Hương</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/8-PL3%20-%20Truong%20Lan%20Huong.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">2.</a> <a href="/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Phan Thị Trang</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">3.</a> </span></span><span style="background-color:#ffffff"><span style="font-size:12px"><a href="/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank"><span style="color:#2980b9">V</span></a></span></span><span style="color:#2980b9"><span style="font-size:12px"><span style="background-color:#ffffff">õ Thị Diệu Phương</span></span></span></p>', N'/uploads/images/report.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2020,"attachments":[{"title":"Báo cáo cung cấp thông tin và thực hiện quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-%20CV%20so%20217%20gui%20SGD%20CK%20HN.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-%20CV%20so%20217%20gui%20SGD%20CK%20HN.pdf","fileName":"1-%20CV%20so%20217%20gui%20SGD%20CK%20HN.pdf"},{"title":"1. Nguyễn Hồng Sơn","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-PL3%20-%20Nguyen%20Hong%20Son.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-PL3%20-%20Nguyen%20Hong%20Son.pdf","fileName":"2-PL3%20-%20Nguyen%20Hong%20Son.pdf"},{"title":"2. Trần Quốc Khánh","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-PL3%20-%20Tran%20Quoc%20Khanh.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-PL3%20-%20Tran%20Quoc%20Khanh.pdf","fileName":"3-PL3%20-%20Tran%20Quoc%20Khanh.pdf"},{"title":"3. Trần Trung Khánh","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-PL3%20-%20Tran%20Trung%20Khanh.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-PL3%20-%20Tran%20Trung%20Khanh.pdf","fileName":"4-PL3%20-%20Tran%20Trung%20Khanh.pdf"},{"title":"4. Dương Thị Huệ","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/5-PL3%20-%20Duong%20Thi%20Hue.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/5-PL3%20-%20Duong%20Thi%20Hue.pdf","fileName":"5-PL3%20-%20Duong%20Thi%20Hue.pdf"},{"title":"5. Nguyễn Văn Rin","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/6-PL3%20-%20Nguyen%20Van%20Rin.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/6-PL3%20-%20Nguyen%20Van%20Rin.pdf","fileName":"6-PL3%20-%20Nguyen%20Van%20Rin.pdf"},{"title":"1.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/7-PL3%20-%20Hoang%20Trong%20Thuan.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/7-PL3%20-%20Hoang%20Trong%20Thuan.pdf","fileName":"7-PL3%20-%20Hoang%20Trong%20Thuan.pdf"},{"title":"Trương Thị Lan Hương","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/8-PL3%20-%20Truong%20Lan%20Huong.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/8-PL3%20-%20Truong%20Lan%20Huong.pdf","fileName":"8-PL3%20-%20Truong%20Lan%20Huong.pdf"},{"title":"2.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/8-PL3%20-%20Truong%20Lan%20Huong.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/8-PL3%20-%20Truong%20Lan%20Huong.pdf","fileName":"8-PL3%20-%20Truong%20Lan%20Huong.pdf"},{"title":"Phan Thị Trang","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf","fileName":"9-PL3%20-%20Phan%20Thi%20Trang.pdf"},{"title":"3.","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf","fileName":"9-PL3%20-%20Phan%20Thi%20Trang.pdf"},{"title":"V","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/9-PL3%20-%20Phan%20Thi%20Trang.pdf","fileName":"9-PL3%20-%20Phan%20Thi%20Trang.pdf"}],"images":[],"summary":"Tổng hợp thông tin của Hội đồng Quản trị, Ban Kiểm soát Công ty","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về việc chốt danh sách cổ đông', N'12/03/2020 11:52', N'<p><a href="/Public/Upload/files/QuanHeCoDong/2020-T3-12-TB%20so%20216-chot%20DS%20co%20dong.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông nhiệm kỳ 2020 - 2025</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2020,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông nhiệm kỳ 2020 - 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-T3-12-TB%20so%20216-chot%20DS%20co%20dong.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-T3-12-TB%20so%20216-chot%20DS%20co%20dong.pdf","fileName":"2020-T3-12-TB%20so%20216-chot%20DS%20co%20dong.pdf"}],"images":[],"summary":"Thông báo về việc chốt danh sách cổ đông","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tài chính', N'16/03/2020 09:39', N'<p><a href="/Public/Upload/files/QuanHeCoDong/BaoCaoTaiChinh2019(DaKiemToan).pdf" target="_blank">Báo cáo tài chính cho năm tài chính kết thúc ngày 31/12/2019 (Đã kiểm toán)</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"financial_report","documentType":"financial_report","publishYear":2020,"attachments":[{"title":"Báo cáo tài chính cho năm tài chính kết thúc ngày 31/12/2019 (Đã kiểm toán)","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BaoCaoTaiChinh2019(DaKiemToan).pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BaoCaoTaiChinh2019(DaKiemToan).pdf","fileName":"BaoCaoTaiChinh2019(DaKiemToan).pdf"}],"images":[],"summary":"Báo cáo tài chính","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo mời họp Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025', N'16/04/2020 16:51', N'<p><a href="/Public/Upload/files/QuanHeCoDong/1-Thong%20bao%20moi%20hop%20Dai%20hoi%20dong%20co%20dong.pdf" target="_blank">Thông báo mời họp Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/2-%20Giay%20moi%20hop.pdf" target="_blank">Giấy mời họp</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/3-%20Quyet%20dinh%20733-QD-UBND.pdf" target="_blank">Quyết định về việc cử lại người đại diện phần vốn Nhà nước tham gia vốn Điều lệ tại Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/4-CV%20740-STC-GCS%20DN.pdf" target="_blank">Công văn 740/STC-GCS&DN về việc thông nhất các nội dung để Người đại diện phần vốn nhà nước có ý kiến tại Đại hội cổ đông thường niên</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/5-BC%2002-TKet%20nhiem%20ky%202015-2019.pdf" target="_blank">Báo cáo Tổng kết Nhiệm kỳ 2015-2019 định hướng hoạt động Nhiệm kỳ 2020-2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Bao%20cao%20KQHD%20SXKD%205%20nam%202015-2019.pdf" target="_blank">Báo cáo thường niên – Niên độ Kế toán 2019</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/2022_L%C3%BD%20L%E1%BB%8Bch%20tr%C3%ADch%20ngang%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT.pdf" target="_blank">Lý lịch trích ngang ứng cử viên Hội đồng Quản trị nhiệm kỳ 2020-2025</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2020,"attachments":[{"title":"Thông báo mời họp Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-Thong%20bao%20moi%20hop%20Dai%20hoi%20dong%20co%20dong.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-Thong%20bao%20moi%20hop%20Dai%20hoi%20dong%20co%20dong.pdf","fileName":"1-Thong%20bao%20moi%20hop%20Dai%20hoi%20dong%20co%20dong.pdf"},{"title":"Giấy mời họp","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-%20Giay%20moi%20hop.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-%20Giay%20moi%20hop.pdf","fileName":"2-%20Giay%20moi%20hop.pdf"},{"title":"Quyết định về việc cử lại người đại diện phần vốn Nhà nước tham gia vốn Điều lệ tại Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-%20Quyet%20dinh%20733-QD-UBND.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-%20Quyet%20dinh%20733-QD-UBND.pdf","fileName":"3-%20Quyet%20dinh%20733-QD-UBND.pdf"},{"title":"Công văn 740/STC-GCS&DN về việc thông nhất các nội dung để Người đại diện phần vốn nhà nước có ý kiến tại Đại hội cổ đông thường niên","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-CV%20740-STC-GCS%20DN.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-CV%20740-STC-GCS%20DN.pdf","fileName":"4-CV%20740-STC-GCS%20DN.pdf"},{"title":"Báo cáo Tổng kết Nhiệm kỳ 2015-2019 định hướng hoạt động Nhiệm kỳ 2020-2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/5-BC%2002-TKet%20nhiem%20ky%202015-2019.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/5-BC%2002-TKet%20nhiem%20ky%202015-2019.pdf","fileName":"5-BC%2002-TKet%20nhiem%20ky%202015-2019.pdf"},{"title":"Báo cáo thường niên – Niên độ Kế toán 2019","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bao%20cao%20KQHD%20SXKD%205%20nam%202015-2019.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bao%20cao%20KQHD%20SXKD%205%20nam%202015-2019.pdf","fileName":"Bao%20cao%20KQHD%20SXKD%205%20nam%202015-2019.pdf"},{"title":"Lý lịch trích ngang ứng cử viên Hội đồng Quản trị nhiệm kỳ 2020-2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022_L%C3%BD%20L%E1%BB%8Bch%20tr%C3%ADch%20ngang%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2022_L%C3%BD%20L%E1%BB%8Bch%20tr%C3%ADch%20ngang%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT.pdf","fileName":"2022_L%C3%BD%20L%E1%BB%8Bch%20tr%C3%ADch%20ngang%20%E1%BB%A9ng%20c%E1%BB%AD%20vi%C3%AAn%20H%C4%90QT.pdf"}],"images":[],"summary":"Thông báo mời họp Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Tài liệu Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025', N'17/04/2020 16:55', N'<p><a href="/Public/Upload/files/QuanHeCoDong/01.%20Chuong%20trinh%20Dai%20hoi%20Dong%20Co%20dong.pdf" target="_blank">Chương trình Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/02.%20Quy%20che%20De-cu%20Ung-cu.pdf" target="_blank">Quy chế đề cử, ứng cử vào Hội đồng quản trị, Ban kiểm soát</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/03.%20Bao%20cao%20TKet%20nhiem%20ky%202015-2020.pdf" target="_blank">Báo cáo Tổng kết Nhiệm kỳ 2015-2019 định hướng hoạt động Nhiệm kỳ 2020-2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/04.%20Bao%20cao%20KQ%20HD%20SXKD%205%20n%C4%83m%202015-2019.pdf" target="_blank">Báo cáo kết quả Hoạt động SXKD 5 năm 2015 – 2019, kế hoạch SXKD năm 2020 – 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/05.%20Bao%20cao%20Hoat%20dong%20cua%20Ban%20Kiem%20soat.pdf" target="_blank">Báo cáo Hoạt động của Ban kiểm soát</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Bao%20cao%20cac%20chi%20tieu%20TC%202020-2025.pdf" target="_blank">Báo cáo các chỉ tiêu tài chính, phương án phân chia lợi nhuận, chi trả cổ tức và phương án chi trả thù lao</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Dthao%20The%20le%20bau-cu.pdf" target="_blank">Dự thảo thể lệ bầu cử</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Dthao%20To%20trinh%20vv%20Cac%20vde%20xin%20ykien%20DH%20Dong%20Co%20dong.pdf" target="_blank">Dự thảo tờ trình về việc Các vấn đề xin ý kiến Đại hội đồng cổ đông nhiệm kỳ 2020 – 2025 thông qua</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Dthao%20To%20trinh%20vv%20mien%20nhiem%20thanh%20vien%20HDQT.pdf" target="_blank">Dự thảo tờ trình về việc miễn nhiệm thành viên HĐQT, BKS do kết thúc nhiệm kỳ 2015 – 2019 và bầu HĐQT, BKS nhiệm kỳ 2020 – 2025</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2020,"attachments":[{"title":"Chương trình Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/01.%20Chuong%20trinh%20Dai%20hoi%20Dong%20Co%20dong.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/01.%20Chuong%20trinh%20Dai%20hoi%20Dong%20Co%20dong.pdf","fileName":"01.%20Chuong%20trinh%20Dai%20hoi%20Dong%20Co%20dong.pdf"},{"title":"Quy chế đề cử, ứng cử vào Hội đồng quản trị, Ban kiểm soát","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/02.%20Quy%20che%20De-cu%20Ung-cu.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/02.%20Quy%20che%20De-cu%20Ung-cu.pdf","fileName":"02.%20Quy%20che%20De-cu%20Ung-cu.pdf"},{"title":"Báo cáo Tổng kết Nhiệm kỳ 2015-2019 định hướng hoạt động Nhiệm kỳ 2020-2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/03.%20Bao%20cao%20TKet%20nhiem%20ky%202015-2020.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/03.%20Bao%20cao%20TKet%20nhiem%20ky%202015-2020.pdf","fileName":"03.%20Bao%20cao%20TKet%20nhiem%20ky%202015-2020.pdf"},{"title":"Báo cáo kết quả Hoạt động SXKD 5 năm 2015 – 2019, kế hoạch SXKD năm 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/04.%20Bao%20cao%20KQ%20HD%20SXKD%205%20n%C4%83m%202015-2019.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/04.%20Bao%20cao%20KQ%20HD%20SXKD%205%20n%C4%83m%202015-2019.pdf","fileName":"04.%20Bao%20cao%20KQ%20HD%20SXKD%205%20n%C4%83m%202015-2019.pdf"},{"title":"Báo cáo Hoạt động của Ban kiểm soát","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/05.%20Bao%20cao%20Hoat%20dong%20cua%20Ban%20Kiem%20soat.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/05.%20Bao%20cao%20Hoat%20dong%20cua%20Ban%20Kiem%20soat.pdf","fileName":"05.%20Bao%20cao%20Hoat%20dong%20cua%20Ban%20Kiem%20soat.pdf"},{"title":"Báo cáo các chỉ tiêu tài chính, phương án phân chia lợi nhuận, chi trả cổ tức và phương án chi trả thù lao","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bao%20cao%20cac%20chi%20tieu%20TC%202020-2025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Bao%20cao%20cac%20chi%20tieu%20TC%202020-2025.pdf","fileName":"Bao%20cao%20cac%20chi%20tieu%20TC%202020-2025.pdf"},{"title":"Dự thảo thể lệ bầu cử","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Dthao%20The%20le%20bau-cu.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Dthao%20The%20le%20bau-cu.pdf","fileName":"Dthao%20The%20le%20bau-cu.pdf"},{"title":"Dự thảo tờ trình về việc Các vấn đề xin ý kiến Đại hội đồng cổ đông nhiệm kỳ 2020 – 2025 thông qua","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Dthao%20To%20trinh%20vv%20Cac%20vde%20xin%20ykien%20DH%20Dong%20Co%20dong.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Dthao%20To%20trinh%20vv%20Cac%20vde%20xin%20ykien%20DH%20Dong%20Co%20dong.pdf","fileName":"Dthao%20To%20trinh%20vv%20Cac%20vde%20xin%20ykien%20DH%20Dong%20Co%20dong.pdf"},{"title":"Dự thảo tờ trình về việc miễn nhiệm thành viên HĐQT, BKS do kết thúc nhiệm kỳ 2015 – 2019 và bầu HĐQT, BKS nhiệm kỳ 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Dthao%20To%20trinh%20vv%20mien%20nhiem%20thanh%20vien%20HDQT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Dthao%20To%20trinh%20vv%20mien%20nhiem%20thanh%20vien%20HDQT.pdf","fileName":"Dthao%20To%20trinh%20vv%20mien%20nhiem%20thanh%20vien%20HDQT.pdf"}],"images":[],"summary":"Tài liệu Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo', N'29/04/2020', N'<p><a href="/Public/Upload/files/QuanHeCoDong/1-TB%20chot%20DS%20tra%20co%20tuc.pdf" target="_blank">Thông báo chốt danh sách để trả cổ tức bằng tiền năm 2019</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/2-CV%20gui%20TT%20Luu%20ky%20CK.pdf" target="_blank">Thông báo gửi Trung tâm lưu ký Chứng khoáng Việt Nam</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2020,"attachments":[{"title":"Thông báo chốt danh sách để trả cổ tức bằng tiền năm 2019","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-TB%20chot%20DS%20tra%20co%20tuc.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-TB%20chot%20DS%20tra%20co%20tuc.pdf","fileName":"1-TB%20chot%20DS%20tra%20co%20tuc.pdf"},{"title":"Thông báo gửi Trung tâm lưu ký Chứng khoáng Việt Nam","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-CV%20gui%20TT%20Luu%20ky%20CK.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-CV%20gui%20TT%20Luu%20ky%20CK.pdf","fileName":"2-CV%20gui%20TT%20Luu%20ky%20CK.pdf"}],"images":[],"summary":"Thông báo","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Tài liệu kết quả Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025', N'29/04/2020', N'<p><a href="/Public/Upload/files/QuanHeCoDong/3-Bao%20cao%20c%C3%A1c%20CTieu%20TC-PA%20phchia%20loi%20nhuan.pdf" target="_blank">Báo cáo các chỉ tiêu tài chính, phương án phân chia lợi nhuận, chi trả cổ tức và phương án chi trả thù lao tại Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/1-%20To%20trinh%20so%2008.pdf" target="_blank">Tờ trình về việc thông qua Quy chế nội bộ về quản trị Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/7-%20Quy%20che%20Qtri%20noi%20bo%20Cty.pdf" target="_blank">Quy chế nội bộ về quản trị nội bộ Công ty Cổ phần Môi trường và Công trình Đô thị Huế</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/2-%20To%20trinh%20so%2006.pdf" target="_blank">Tờ trình Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025 về việc lựa chọn Công ty Kiểm toán Báo cáo tài chính năm 2020</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/4-Bao%20cao%20Hoat%20dong%20cua%20Ban%20KSoat.pdf" target="_blank">Báo cáo Hoạt động của Ban kiểm soát tại Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/3-%20BB%20Dai%20hoi%20Dong%20co%20dong%202020-2025.pdf" target="_blank">Biên bản Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/4-%20Nghi%20Quyet%20DH%20DCD%202020-2025.pdf" target="_blank">Nghị quyết Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/5-%20BB%20hop%20HDong%20QTri.pdf" target="_blank">Biên bản Họp Hội đồng quản trị về việc Bầu Chủ tịch Hội đồng quản trị và Bổ nhiệm Ban Tổng Giám đốc, Kế toán trưởng</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/6-%20BB%20hop%20Ban%20Kiem%20soat.pdf" target="_blank">Biên bản họp Ban kiểm soát về việc bầu Trưởng Ban kiểm soát</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"agm_notice","documentType":"agm_notice","publishYear":2020,"attachments":[{"title":"Báo cáo các chỉ tiêu tài chính, phương án phân chia lợi nhuận, chi trả cổ tức và phương án chi trả thù lao tại Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-Bao%20cao%20c%C3%A1c%20CTieu%20TC-PA%20phchia%20loi%20nhuan.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-Bao%20cao%20c%C3%A1c%20CTieu%20TC-PA%20phchia%20loi%20nhuan.pdf","fileName":"3-Bao%20cao%20c%C3%A1c%20CTieu%20TC-PA%20phchia%20loi%20nhuan.pdf"},{"title":"Tờ trình về việc thông qua Quy chế nội bộ về quản trị Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-%20To%20trinh%20so%2008.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/1-%20To%20trinh%20so%2008.pdf","fileName":"1-%20To%20trinh%20so%2008.pdf"},{"title":"Quy chế nội bộ về quản trị nội bộ Công ty Cổ phần Môi trường và Công trình Đô thị Huế","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/7-%20Quy%20che%20Qtri%20noi%20bo%20Cty.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/7-%20Quy%20che%20Qtri%20noi%20bo%20Cty.pdf","fileName":"7-%20Quy%20che%20Qtri%20noi%20bo%20Cty.pdf"},{"title":"Tờ trình Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025 về việc lựa chọn Công ty Kiểm toán Báo cáo tài chính năm 2020","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-%20To%20trinh%20so%2006.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2-%20To%20trinh%20so%2006.pdf","fileName":"2-%20To%20trinh%20so%2006.pdf"},{"title":"Báo cáo Hoạt động của Ban kiểm soát tại Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-Bao%20cao%20Hoat%20dong%20cua%20Ban%20KSoat.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-Bao%20cao%20Hoat%20dong%20cua%20Ban%20KSoat.pdf","fileName":"4-Bao%20cao%20Hoat%20dong%20cua%20Ban%20KSoat.pdf"},{"title":"Biên bản Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-%20BB%20Dai%20hoi%20Dong%20co%20dong%202020-2025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/3-%20BB%20Dai%20hoi%20Dong%20co%20dong%202020-2025.pdf","fileName":"3-%20BB%20Dai%20hoi%20Dong%20co%20dong%202020-2025.pdf"},{"title":"Nghị quyết Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-%20Nghi%20Quyet%20DH%20DCD%202020-2025.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/4-%20Nghi%20Quyet%20DH%20DCD%202020-2025.pdf","fileName":"4-%20Nghi%20Quyet%20DH%20DCD%202020-2025.pdf"},{"title":"Biên bản Họp Hội đồng quản trị về việc Bầu Chủ tịch Hội đồng quản trị và Bổ nhiệm Ban Tổng Giám đốc, Kế toán trưởng","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/5-%20BB%20hop%20HDong%20QTri.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/5-%20BB%20hop%20HDong%20QTri.pdf","fileName":"5-%20BB%20hop%20HDong%20QTri.pdf"},{"title":"Biên bản họp Ban kiểm soát về việc bầu Trưởng Ban kiểm soát","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/6-%20BB%20hop%20Ban%20Kiem%20soat.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/6-%20BB%20hop%20Ban%20Kiem%20soat.pdf","fileName":"6-%20BB%20hop%20Ban%20Kiem%20soat.pdf"}],"images":[],"summary":"Tài liệu kết quả Đại hội đồng Cổ đông nhiệm kỳ 2020 – 2025","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo về việc chi trả cổ tức năm 2019', N'25/05/2020 15:48', N'<p><a href="/Public/Upload/files/QuanHeCoDong/TB-ChiTraCoTuc2019.pdf" target="_blank">Thông báo về việc chi trả cổ tức năm 2019</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"dividend_notice","documentType":"dividend_notice","publishYear":2020,"attachments":[{"title":"Thông báo về việc chi trả cổ tức năm 2019","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TB-ChiTraCoTuc2019.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/TB-ChiTraCoTuc2019.pdf","fileName":"TB-ChiTraCoTuc2019.pdf"}],"images":[],"summary":"Thông báo về việc chi trả cổ tức năm 2019","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Quy chế hoạt động của Hội đồng quản trị', N'03/06/2020 14:29', N'<p><a href="/Public/Upload/files/QuanHeCoDong/Qche%20HD-HDQT.pdf" target="_blank">Quyết định về việc Ban hành quy chế hoạt động của Hội đồng quản trị</a></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2020,"attachments":[{"title":"Quyết định về việc Ban hành quy chế hoạt động của Hội đồng quản trị","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Qche%20HD-HDQT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Qche%20HD-HDQT.pdf","fileName":"Qche%20HD-HDQT.pdf"}],"images":[],"summary":"Quy chế hoạt động của Hội đồng quản trị","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty', N'01/07/2020 14:21', N'<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:13pt"><span style="font-family:"Times New Roman",serif"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Nghị quyết của Hội đồng Quản trị  về việc bổ nhiệm Phó Tổng Giám đốc Công ty</a></span></span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:13pt"><span style="font-family:"Times New Roman",serif"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Quyết định về việc bổ nhiệm Phó Tổng Giám đốc Công ty</a></span></span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:13pt"><span style="font-family:"Times New Roman",serif"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Bản cung cấp thông tin (của Phó Tổng Giám đốc Công ty - Ông Lê Vĩnh Thắng)</a></span></span></span></span></p>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"personnel_change","documentType":"personnel_change","publishYear":2020,"attachments":[{"title":"Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf","fileName":"2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf"},{"title":"Nghị quyết của Hội đồng Quản trị  về việc bổ nhiệm Phó Tổng Giám đốc Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf","fileName":"2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf"},{"title":"Quyết định về việc bổ nhiệm Phó Tổng Giám đốc Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf","fileName":"2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf"},{"title":"Bản cung cấp thông tin (của Phó Tổng Giám đốc Công ty - Ông Lê Vĩnh Thắng)","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf","fileName":"2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf"}],"images":[],"summary":"Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công bố thông tin về việc bổ nhiệm người phụ trách quản trị công ty', N'03/08/2020 17:07', N'<table style="-webkit-text-stroke-width:0px; background-color:#ffffff; color:#000000; font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif; font-size:12px; font-style:normal; font-variant-caps:normal; font-variant-ligatures:normal; font-weight:400; letter-spacing:normal; orphans:2; padding:0px; text-align:start; text-decoration-color:initial; text-decoration-style:initial; text-decoration-thickness:initial; text-transform:none; white-space:normal; widows:2; width:100%; word-spacing:0px">
	<tbody>
		<tr>
			<td style="background-color:#ffffff; border-bottom:0px; border-left:0px; border-right:0px; border-top:0px; text-align:justify">
			<p><span style="color:#000000"><span style="color:#000000"><a href="/Public/Upload/files/QuanHeCoDong/Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank" title="Quyết định">Quyết định của Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty</a></span></span></p>

			<p><span style="color:#000000"><span style="color:#000000"><a href="/Public/Upload/files/QuanHeCoDong/BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank" title="Biên bản HĐQT">Biên bản họp Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty</a></span></span></p>

			<p><span style="color:#000000"><span style="color:#000000"><a href="/Public/Upload/files/QuanHeCoDong/NQ21%20NQ-H%C4%90QT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank" title="Nghị quyết">Nghị quyết về việc Bổ nhiệm người phụ trách quản trị Công ty</a></span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<div class="ddict_btn" style="left:388.969px; top:36px"> </div>', N'/uploads/images/thongbao.jpg', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2020,"attachments":[{"title":"Quyết định của Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf","fileName":"Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf"},{"title":"Biên bản họp Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf","fileName":"BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf"},{"title":"Nghị quyết về việc Bổ nhiệm người phụ trách quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NQ21%20NQ-H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NQ21%20NQ-H%C4%90QT.pdf","fileName":"NQ21%20NQ-H%C4%90QT.pdf"}],"images":[],"summary":"Công bố thông tin về việc bổ nhiệm người phụ trách quản trị công ty","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2020', N'16/03/2021 23:14', N'<p><a href="/Public/Upload/files/QuanHeCoDong/HEPCO.2020.BAO%20CAO%20TN%202020.pdf" target="_blank">Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2020</a></p>', N'/uploads/images/report.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2021,"attachments":[{"title":"Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2020","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.BAO%20CAO%20TN%202020.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.BAO%20CAO%20TN%202020.pdf","fileName":"HEPCO.2020.BAO%20CAO%20TN%202020.pdf"}],"images":[],"summary":"Báo cáo thường niên niên độ kế toán đã kiểm toán năm 2020","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Giải trình về BCTT về tình hình quản trị Công ty', N'10/03/2021 16:53', N'<p><a href="/Public/Upload/files/QuanHeCoDong/HEPCO.2020.bao%20cao%20quan%20tr%E1%BB%8B%20c%20ty%202020.pdf" target="_blank">Báo cáo tình hình quản trị Công ty năm 2020</a></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/HEPCO.2020.cv%20giai%20trinh%20bao%20cao%20QT%20cong%20ty%202020.pdf" target="_blank">Giải trình về CBTT về tình hình quản trị Công ty</a></p>', N'/uploads/images/report.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2021,"attachments":[{"title":"Báo cáo tình hình quản trị Công ty năm 2020","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.bao%20cao%20quan%20tr%E1%BB%8B%20c%20ty%202020.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.bao%20cao%20quan%20tr%E1%BB%8B%20c%20ty%202020.pdf","fileName":"HEPCO.2020.bao%20cao%20quan%20tr%E1%BB%8B%20c%20ty%202020.pdf"},{"title":"Giải trình về CBTT về tình hình quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.cv%20giai%20trinh%20bao%20cao%20QT%20cong%20ty%202020.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.cv%20giai%20trinh%20bao%20cao%20QT%20cong%20ty%202020.pdf","fileName":"HEPCO.2020.cv%20giai%20trinh%20bao%20cao%20QT%20cong%20ty%202020.pdf"}],"images":[],"summary":"Giải trình về BCTT về tình hình quản trị Công ty","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo chốt danh sách cổ đông', N'08/03/2021 11:13', N'<p><a href="/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20THAY%20THE%20TB%20%20129%20CHOT%20DS%20DHCD%202021.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2021 thay thế thông báo số 129/2021/TB-MTĐT ngày 02/03/2021</a></p>', N'/uploads/images/report.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2021,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2021 thay thế thông báo số 129/2021/TB-MTĐT ngày 02/03/2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20THAY%20THE%20TB%20%20129%20CHOT%20DS%20DHCD%202021.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20THAY%20THE%20TB%20%20129%20CHOT%20DS%20DHCD%202021.pdf","fileName":"HEPCO.2020.THONG%20BAO%20THAY%20THE%20TB%20%20129%20CHOT%20DS%20DHCD%202021.pdf"}],"images":[],"summary":"Thông báo chốt danh sách cổ đông","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công bố báo cáo tài chính kiểm toán năm 2020', N'04/03/2021 13:39', N'<p><a href="/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20CONG%20BO%20BCTC%202020.pdf" target="_blank">Công bố báo cáo tài chính kiểm toán năm 2020</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"audited_financial_report","documentType":"audited_financial_report","publishYear":2021,"attachments":[{"title":"Công bố báo cáo tài chính kiểm toán năm 2020","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20CONG%20BO%20BCTC%202020.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20CONG%20BO%20BCTC%202020.pdf","fileName":"HEPCO.2020.THONG%20BAO%20CONG%20BO%20BCTC%202020.pdf"}],"images":[],"summary":"Công bố báo cáo tài chính kiểm toán năm 2020","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thông báo chốt danh sách cổ đông', N'04/03/2021 13:38', N'<p><a href="/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20CHOT%20DS%20DHCD.pdf" target="_blank">Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2021</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"other_document","documentType":"other_document","publishYear":2021,"attachments":[{"title":"Thông báo về ngày đăng ký cuối cùng để thực hiện quyền tham dự Đại hội đồng cổ đông thường niên năm 2021","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20CHOT%20DS%20DHCD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.2020.THONG%20BAO%20CHOT%20DS%20DHCD.pdf","fileName":"HEPCO.2020.THONG%20BAO%20CHOT%20DS%20DHCD.pdf"}],"images":[],"summary":"Thông báo chốt danh sách cổ đông","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Báo cáo tài chính', N'03/03/2021 21:48', N'<p><a href="/Public/Upload/files/QuanHeCoDong/HEPCO.BaoCaoTaiChinh.2020.pdf" target="_blank">Báo cáo tài chính cho năm tài chính kết thúc ngày 31/12/2020 (Đã kiểm toán)</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"financial_report","documentType":"financial_report","publishYear":2021,"attachments":[{"title":"Báo cáo tài chính cho năm tài chính kết thúc ngày 31/12/2020 (Đã kiểm toán)","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.BaoCaoTaiChinh.2020.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/HEPCO.BaoCaoTaiChinh.2020.pdf","fileName":"HEPCO.BaoCaoTaiChinh.2020.pdf"}],"images":[],"summary":"Báo cáo tài chính","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Quy chế hoạt động của Hội đồng quản trị', N'(03/06/2020)', N'<p><span style="font-size:12px"><em>(03/06/2020)</em></span></p>

<p><a href="/Public/Upload/files/QuanHeCoDong/Qche%20HD-HDQT.pdf" target="_blank">Quyết định về việc Ban hành quy chế hoạt động của Hội đồng quản trị</a></p>', N'/uploads/images/images.png', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2020,"attachments":[{"title":"Quyết định về việc Ban hành quy chế hoạt động của Hội đồng quản trị","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Qche%20HD-HDQT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Qche%20HD-HDQT.pdf","fileName":"Qche%20HD-HDQT.pdf"}],"images":[],"summary":"Quy chế hoạt động của Hội đồng quản trị","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty', N'23/10/2020', N'<p style="text-align:justify"><span style="font-size:12px"><em>(23/10/2020)</em></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:13pt"><span style="font-family:"Times New Roman",serif"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Nghị quyết của Hội đồng Quản trị  về việc bổ nhiệm Phó Tổng Giám đốc Công ty</a></span></span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:13pt"><span style="font-family:"Times New Roman",serif"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Quyết định về việc bổ nhiệm Phó Tổng Giám đốc Công ty</a></span></span></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><span style="font-size:13pt"><span style="font-family:"Times New Roman",serif"><a href="/Public/Upload/files/QuanHeCoDong/2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank">Bản cung cấp thông tin (của Phó Tổng Giám đốc Công ty - Ông Lê Vĩnh Thắng)</a></span></span></span></span></p>', N'/uploads/images/hepcohue-1.jpg', N'shareholders', N'{"category":"personnel_change","documentType":"personnel_change","publishYear":2020,"attachments":[{"title":"Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf","fileName":"2020-07-01.1-%20Cong%20bo%20ttin%20-%20bo%20nhiem%20PTGD.pdf"},{"title":"Nghị quyết của Hội đồng Quản trị  về việc bổ nhiệm Phó Tổng Giám đốc Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf","fileName":"2020-07-01.2.CV%2019-%20H%C4%90QT%20VV%20BO%20NHIEM%20PTGD.pdf"},{"title":"Quyết định về việc bổ nhiệm Phó Tổng Giám đốc Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf","fileName":"2020-07-01.3-%20QD%20bo%20nhiem%20PTGD.pdf"},{"title":"Bản cung cấp thông tin (của Phó Tổng Giám đốc Công ty - Ông Lê Vĩnh Thắng)","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf","fileName":"2020-07-01.4.534%20BAN%20CUNG%20CAP%20TT%20LE%20VINH%20THANG.pdf"}],"images":[],"summary":"Công bố thông tin về việc bổ nhiệm Phó Tổng Giám đốc Công ty","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Công bố thông tin về việc bổ nhiệm người phụ trách quản trị công ty', N'23/10/2020', N'<p style="text-align:justify"><span style="font-size:12px"><em>(23/10/2020)</em></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank" title="Quyết định">Quyết định của Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank" title="Biên bản HĐQT">Biên bản họp Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty</a></span></span></p>

<p style="text-align:justify"><span style="color:#000000"><span style="background-color:#ffffff"><a href="/Public/Upload/files/QuanHeCoDong/NQ21%20NQ-H%C4%90QT.pdf" style="font-family:Tahoma, Geneva, Arial, Helvetica, sans-serif; font-size:12px; padding:0px; text-decoration:none; text-align:justify" target="_blank" title="Nghị quyết">Nghị quyết về việc Bổ nhiệm người phụ trách quản trị Công ty</a></span></span></p>', N'/uploads/images/1537589828-mt-7.jpg', N'shareholders', N'{"category":"governance_report","documentType":"governance_report","publishYear":2020,"attachments":[{"title":"Quyết định của Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf","fileName":"Q%C4%9022%20Q%C4%90-H%C4%90QT.pdf"},{"title":"Biên bản họp Hội đồng quản trị về việc Bổ nhiệm người phụ trách quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf","fileName":"BB23%20H%C4%90QT-MT%C4%90T-nguoiQTCT.pdf"},{"title":"Nghị quyết về việc Bổ nhiệm người phụ trách quản trị Công ty","fileUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NQ21%20NQ-H%C4%90QT.pdf","downloadUrl":"https://www.hepco.com.vn/Public/Upload/files/QuanHeCoDong/NQ21%20NQ-H%C4%90QT.pdf","fileName":"NQ21%20NQ-H%C4%90QT.pdf"}],"images":[],"summary":"Công bố thông tin về việc bổ nhiệm người phụ trách quản trị công ty","status":"published","slug":""}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Thu gom, vận chuyển và xử lý rác', N'01/01/2021', N'<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Ban hành kèm theo quyết định số  660/QĐ-MTĐT ngày 24 tháng 12 năm 2024.</strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>1. Rác thải sinh hoạt</strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">Đơn giá dịch vụ thu gom, vận chuyển và xử lý rác thải sinh hoạt bằng phương pháp đốt là: <strong>436.000đ/m³</strong>.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">* Trường hợp các đơn vị có nhu cầu hợp đồng thu gom, vận chuyển và xử lý rác thải sinh hoạt có khối lượng lớn (vận chuyển riêng chuyến), Bộ phận Giao dịch và các Xí nghiệp liên quan lập dự toán chi tiết đề xuất Lãnh đạo Công ty thực hiện.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>2. Rác thải công nghiệp thông thường</strong></span></span></p>

<table align="center" border="1" cellpadding="1" cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none; margin:0 auto; width:80%">
	<tbody>
		<tr>
			<td style="border-color:black; border-style:solid; border-width:1px; height:37px; text-align:center; vertical-align:middle; white-space:nowrap; width:151px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Công tác</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:37px; text-align:center; vertical-align:middle; white-space:nowrap; width:142px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Đơn giá (đ/tấn)</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:37px; text-align:center; vertical-align:middle; white-space:nowrap; width:151px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Đơn giá (đ/m³)</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:38px; text-align:center; vertical-align:middle; white-space:nowrap; width:151px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">Xử lý (chôn lấp)</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:38px; text-align:center; vertical-align:middle; white-space:nowrap; width:142px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">371.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:38px; text-align:center; vertical-align:middle; white-space:nowrap; width:151px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">185.000</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">* Trường hợp các đơn vị có nhu cầu hợp đồng thu gom, vận chuyển và xử lý rác thải công nghiệp thông thường có khối lượng lớn (vận chuyển riêng chuyến), Bộ phận Giao dịch và các Xí nghiệp liên quan lập dự toán chi tiết đề xuất Lãnh đạo Công ty thực hiện.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>3. Chở nước, tưới đường</strong></span></span></p>

<table align="center" border="1" cellpadding="1" cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none; margin:0 auto; width:80%">
	<tbody>
		<tr>
			<td style="border-color:black; border-style:solid; border-width:1px; text-align:center; vertical-align:middle; width:201px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Đối tượng và khu vực</strong></span></span></p>
			</td>
			<td colspan="2" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; width:214px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Đơn giá (đ/chuyến)</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:201px">
			<p> </p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe 8m³</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe 11m³</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:201px">
			<p style="text-align:left"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>a. Nội thành</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:91px">
			<p style="text-align:center"> </p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:123px">
			<p style="text-align:center"> </p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:201px">
			<p style="text-align:left"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Phục vụ sinh hoạt</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">610.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">775.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:201px">
			<p style="text-align:left"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Tưới đường, tưới sân, vườn, phục vụ SXKD…</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">927.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.106.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:201px">
			<p style="text-align:left"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>b. Các vùng ven (<15km)</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:91px">
			<p style="text-align:center"> </p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:123px">
			<p style="text-align:center"> </p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:201px">
			<p style="text-align:left"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Phục vụ sinh hoạt</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">826.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.042.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:201px">
			<p style="text-align:left"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Tưới đường, tưới sân, vườn, phục vụ SXKD…</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.042.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.233.000</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">Trường hợp phục vụ ở vùng ngoại vi cách trung tâm Quận Phú Xuân và Quận Thuận Hóa trên 15km, giá thỏa thuận với khách hàng.</span></span></p>', N'/images/services/thu-gom-rac-1.jpg', N'service', N'{"attachments":[],"images":[{"url":"/images/services/thu-gom-rac-1.jpg","caption":"Vận hành xe cuốn ép rác chuyên dụng thu gom chất thải sinh hoạt trên địa bàn TP. Huế"},{"url":"/images/services/thu-gom-rac-2.jpg","caption":"Đội hình xe gom rác đẩy tay HEPCO phục vụ thu gom tại các tuyến phố và khu dân cư"},{"url":"/images/services/thu-gom-rac-3.jpg","caption":"Công nhân môi trường HEPCO thu gom và tập kết thùng rác công cộng đúng quy chuẩn"},{"url":"/images/services/thu-gom-rac-4.jpg","caption":"Phun khử khuẩn và vận hành an toàn tại Khu xử lý chất thải nguy hại HEPCO"}],"summary":"Ban hành kèm theo quyết định số 660/QĐ-MTĐT ngày 24 tháng 12 năm 2024. 1. Rác thải sinh hoạt Đơn giá dịch vụ thu gom, vận chuyển và xử lý rác thải sinh hoạt bằng phương pháp đốt là: 436.000đ/m³ . * Trường hợp các đơn vị ...","status":"published","slug":"thu-gom-van-chuyen-va-xu-ly-rac-127"}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Tưới nước rửa đường', N'01/01/2021', N'<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Ban hành kèm theo quyết định số  660/QĐ-MTĐT ngày 24 tháng 12 năm 2024.</strong></span></span></p>

<p> </p>

<table cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none; margin:0 auto; width:80%">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; width:201px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Đối tượng và khu vực</strong></span></span></p>
			</td>
			<td colspan="2" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:214px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Đơn giá (đ/chuyến)</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p> </p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe 8m³</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe 11m³</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>a. Nội thành</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:91px">
			<p style="text-align:center"> </p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:123px">
			<p style="text-align:center"> </p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Phục vụ sinh hoạt</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">610.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">775.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Tưới đường, tưới sân, vườn, phục vụ SXKD…</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">927.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.106.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>b. Các vùng ven (<15km)</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:91px">
			<p style="text-align:center"> </p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:123px">
			<p style="text-align:center"> </p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Phục vụ sinh hoạt</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">826.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.042.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">– Tưới đường, tưới sân, vườn, phục vụ SXKD…</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:91px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.042.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:123px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.233.000</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      <em>Trường hợp phục vụ ở vùng ngoại vi cách trung tâm Thành phố trên 15km, giá thỏa thuận với khách hàng.</em></span></span></p>', N'/images/services/tuoi-nuoc-rua-duong-1.jpg', N'service', N'{"attachments":[],"images":[{"url":"/images/services/tuoi-nuoc-rua-duong-1.jpg","caption":"Xe bồn chuyên dụng HEPCO phun nước áp lực cao rửa đường tại khu vực Phu Văn Lâu"},{"url":"/images/services/tuoi-nuoc-rua-duong-2.jpg","caption":"Hoạt động tưới nước rửa đường ban đêm đảm bảo mỹ quan xanh - sạch - sáng cho Cố đô Huế"},{"url":"/images/services/tuoi-nuoc-rua-duong-3.jpg","caption":"Vận hành xe bồn tưới nước rửa đường 75K-1508 trên các trục đường trung tâm"},{"url":"/images/services/tuoi-nuoc-rua-duong-4.jpg","caption":"Phun rửa mặt đường giảm bụi và làm mát không khí đô thị về đêm"}],"summary":"Ban hành kèm theo quyết định số 660/QĐ-MTĐT ngày 24 tháng 12 năm 2024. Đối tượng và khu vực Đơn giá (đ/chuyến) Xe 8m³ Xe 11m³ a. Nội thành – Phục vụ sinh hoạt 610.000 775.000 – Tưới đường, tưới sân, vườn, phục vụ SXKD… 9...","status":"published","slug":"tuoi-nuoc-rua-duong-126"}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Hút Hầm Vệ Sinh - Xử Lý Phân Hầm Cầu', N'01/01/2021', N'<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Ban hành kèm theo quyết định số  660/QĐ-MTĐT ngày 24 tháng 12 năm 2024.</strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>1. Hút hầm vệ sinh</strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>      1.1. Phạm vi Quận Phú Xuân và Quận Thuận Hóa</strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>      </strong>a.1. Khu vực Nam Sông Hương:</span></span></p>

<table align="center" cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Chiều dài hút (m)</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe Hino 3 m³</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe Hino 4,7 m³</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe Hino 5,75 m³</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">≤ 30 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.887.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.780.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.326.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 30 m và ≤ 40 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.958.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.863.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.410.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 40 m và ≤ 50 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.027.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.948.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.494.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 50 m và ≤ 60 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.111.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.061.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.607.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 60 m và ≤ 70 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.210.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.174.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.721.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 70 m và ≤ 80 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.378.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.384.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.931.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 80 m và ≤ 100 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.616.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">—</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">4.153.000</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>     </strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>    </strong>b.1. Khu vực Bắc Sông Hương:</span></span></p>

<table align="center" cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Chiều dài hút (m)</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe Hino 3 m³</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe Hino 4,7 m³</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>Xe Hino 5,75 m³</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">≤ 30 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">1.929.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.833.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.379.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 30 m và ≤ 40 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.000.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.916.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.462.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 40 m và ≤ 50 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.069.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.001.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.547.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 50 m và ≤ 60 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.153.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.114.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.660.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 60 m và ≤ 70 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.252.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.227.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.773.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 70 m và ≤ 80 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.420.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.437.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">3.984.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:149px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">> 80 m và ≤ 100 m</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:156px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">2.658.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:139px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">—</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:160px">
			<p style="text-align:center"><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">4.206.000</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:center"><em><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">*Ghi chú: </span></span>Xử lý phân hầm cầu bằng công nghệ RO</em><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><em>.</em></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong> 1.2. Khu vực ngoại vi Thành phố Huế:</strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>      </strong>a. Phía Nam Sông Hương:</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      Đơn giá hút hầm được xác định = đơn giá trong địa bàn Nam Sông Hương + (số km vượt phạm vi x 20.000đ ÷ 30.000đ).</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      * Đối với thị xã Hương Thủy:</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      + Phường Thủy Dương và Thủy Phương: đơn giá bằng đơn giá hút hầm địa bàn Nam Sông Hương.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      + Các phường, xã còn lại: đơn giá hút hầm được xác định = đơn giá trong địa bàn Nam Sông Hương x 1,1 ÷ 1,2.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong>      </strong>b. Phía Bắc Sông Hương</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      Đơn giá hút hầm được xác định = đơn giá trong địa bàn Bắc Sông Hương + (số km vượt phạm vi x 20.000đ ÷ 30.000đ).</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      <em>Tùy theo điều kiện địa điểm hút để xác định đơn giá hút hầm vệ sinh ngoại vi Quận Phú Xuân và Quận Thuận Hóa.</em></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><em>      Các trường hợp địa điểm hút cách 30km trở lên: thực hiện giá thỏa thuận với khách hàng.</em></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      <strong><em>* Ghi chú: Mức tăng, giảm giá cho các trường hợp sau:</em></strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      - Khách hàng là các hộ gia đình đăng ký thực hiện nhiều chuyến, từ chuyến thứ 2 giảm giá 15%.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      - Tăng thêm 80.000đ/chuyến đến 100.000đ/chuyến cho các trường hợp khách hàng yêu cầu làm việc ngoài giờ (từ 17h00 về đêm và trước 7h00 sáng).</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      - Tăng thêm 40.000đ/chuyến cho trường hợp khách hàng yêu cầu làm việc vào ngày chủ nhật, nếu yêu cầu làm ngoài giờ vào ngày chủ nhật (từ 17h00 về đêm và trước 7h00 sáng) thì tăng thêm 100.000đ/chuyến đến 150.000đ/chuyến.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      - Tăng 180.000đ/chuyến cho các trường hợp khách hàng yêu cầu làm việc vào các ngày lễ, tết.</span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif"><strong> 2. Xử lý phân hầm cầu</strong></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Times New Roman,Times,serif">      Đơn giá xử lý phân hầm cầu (đối với các xe của đơn vị ngoài đổ bãi Thủy Phương): 580.000đ/chuyến.</span></span></p>', N'/images/services/hut-ham-ve-sinh-1.jpg', N'service', N'{"attachments":[],"images":[{"url":"/images/services/hut-ham-ve-sinh-1.jpg","caption":"Xe hút hầm vệ sinh chuyên dụng công nghệ Nhật Bản phục vụ tận nơi tại TP. Huế"},{"url":"/images/services/hut-ham-ve-sinh-2.jpg","caption":"Phương tiện xe bồn hút hầm cầu hiện đại, đa dạng dung tích đáp ứng mọi địa hình"},{"url":"/images/services/hut-ham-ve-sinh-3.jpg","caption":"Kỹ thuật viên HEPCO lắp đặt hệ thống ống hút chuyên nghiệp, đảm bảo vệ sinh"},{"url":"/images/services/hut-ham-ve-sinh-4.jpg","caption":"Thi công hút hầm vệ sinh và xử lý triệt để, an toàn cho hộ gia đình và cơ quan"}],"summary":"Ban hành kèm theo quyết định số 660/QĐ-MTĐT ngày 24 tháng 12 năm 2024. 1. Hút hầm vệ sinh 1.1. Phạm vi Quận Phú Xuân và Quận Thuận Hóa a.1. Khu vực Nam Sông Hương: Chiều dài hút (m) Xe Hino 3 m³ Xe Hino 4,7 m³ Xe Hino 5,...","status":"published","slug":"hut-ham-ve-sinh-xu-ly-phan-ham-cau-44"}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Nghĩa trang và dịch vụ đưa tang, mai táng', N'01/01/2021', N'<p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>Ban hành kèm theo quyết định số  660/QĐ-MTĐT ngày 24 tháng 12 năm 2024.</strong></span></span></p>

<p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">Cấp đất nghĩa trang phía Bắc, Nam, nghĩa trang phía Nam (mới) – xã Thủy Phù<br />
<em>(theo quy định hiện hành của UBND Tỉnh)</em></span></span></p>

<h3><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>1. Mộ cải táng</strong></span></span></h3>

<table cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none; margin:0 auto; width:80%">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>Loại mộ</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>Đơn giá (đ/m²)</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>Thành tiền (đ/ô mộ)</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">– Loại 0,6 m²/ô</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">268.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">160.800</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">– Loại 3 m²/ô</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">240.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">720.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">– Loại 4 m²/ô</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">240.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">960.000</span></span></p>
			</td>
		</tr>
	</tbody>
</table>

<div class="ddict_btn" style="left:761.5px; top:2153px"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>2. Mộ an táng</strong></span></span></div>

<div class="ddict_btn" style="left:761.5px; top:2153px">
<table cellspacing="0" class="MsoTableGrid" style="border-collapse:collapse; border:none; margin:0 auto; width:80%">
	<tbody>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>Loại mộ</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>Đơn giá (đ/m²)</strong></span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>Thành tiền (đ/ô mộ)</strong></span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">– Loại 5 m²/ô</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">212.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">1.060.000</span></span></p>
			</td>
		</tr>
		<tr>
			<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; width:201px">
			<p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">– Loại 9 m²/ô</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">212.000</span></span></p>
			</td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; width:201px">
			<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">1.908.000</span></span></p>
			</td>
		</tr>
	</tbody>
</table>
</div>

<div class="ddict_btn" style="left:761.5px; text-align:center; top:2153px">
<p style="text-align:left"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>* Ghi chú:</strong></span></span></p>

<ul>
	<li>
	<p style="text-align:left"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">Các trường hợp thực hiện ngoài địa bàn thành phố Huế: thực hiện giá thỏa thuận với khách hàng, do Bộ phận Giao dịch và các Xí nghiệp liên quan đề xuất với Lãnh đạo Công ty để thực hiện.</span></span></p>
	</li>
</ul>

<hr />
<p style="text-align:left"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px"><strong>THỜI GIAN ÁP DỤNG</strong><br />
Từ ngày <strong>01/01/2025</strong>.</span></span></p>
</div>', N'/images/services/quan-ly-nghia-trang-1.jpg', N'service', N'{"attachments":[],"images":[{"url":"/images/services/quan-ly-nghia-trang-1.jpg","caption":"Đội ngũ cán bộ, nhân viên Ban Quản lý Nghĩa trang HEPCO tận tâm phục vụ"},{"url":"/images/services/quan-ly-nghia-trang-2.jpg","caption":"Công tác chỉnh trang, chăm sóc cảnh quan và vệ sinh khuôn viên nghĩa trang"},{"url":"/images/services/quan-ly-nghia-trang-3.jpg","caption":"Cắt tỉa thảm cỏ, duy tu cây xanh tạo không gian trang nghiêm, sạch đẹp"},{"url":"/images/services/quan-ly-nghia-trang-4.jpg","caption":"Tập thể Ban Quản lý Nghĩa trang sẵn sàng hỗ trợ chu đáo các dịch vụ mai táng, cải táng"}],"summary":"Ban hành kèm theo quyết định số 660/QĐ-MTĐT ngày 24 tháng 12 năm 2024. Cấp đất nghĩa trang phía Bắc, Nam, nghĩa trang phía Nam (mới) – xã Thủy Phù (theo quy định hiện hành của UBND Tỉnh) 1. Mộ cải táng Loại mộ Đơn giá (đ...","status":"published","slug":"nghia-trang-va-dich-vu-dua-tang-mai-tang-47"}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Lịch sử hình thành', N'01/01/2021', N'<p style="text-align:justify"><samp><span style="font-size:13.0pt"><span style="font-family:"Times New Roman",serif">      Công ty Cổ phần Môi trường và Công trình Đô thị Huế được chuyển đổi từ Công ty TNHH Nhà nước MTV Môi trường và Công trình Đô thị Huế theo Quyết định số 2728/QĐ-UBND ngày 26 tháng 12 năm 2014 của UBND tỉnh Thừa Thiên Huế. Công ty TNHH Nhà nước Môi trường và Công trình Đô thị Huế được chuyển đổi từ doanh nghiệp Nhà nước Công ty Môi trường và Công trình Đô thị Huế theo Quyết định số 4041/QĐ-UBND ngày 29 tháng 11 năm 2005 của UBND tỉnh Thừa Thiên Huế.</span></span></samp><br />
<span style="font-size:13.0pt"><span style="font-family:"Times New Roman",serif"><samp><span style="font-family:"Times New Roman",serif">     Tiền thân của Công ty là Phòng Công trình Công cộng và Quản lý Nhà đất, được thành lập ngay sau ngày miền nam giải phóng, năm 1985 được chuyển đổi thành Công ty Quản lý Công trình Đô thị Huế và đến năm 1991 chuyển đổi thành Trung tâm Quản lý Vệ sinh Môi trường Đô thị Huế.</span></samp></span></span><br />
<strong>- Tên viết tắt:</strong> HEPCO<br />
<strong>- Loại hình doanh nghiệp:</strong> Công ty Cổ phần<br />
<strong>- Chủ tịch Hội đồng quản trị:</strong><br />
            Phan Lê Hiến<br />
<strong>- Tổng Giám đốc:</strong><br />
            Trần Quốc Khánh<br />
<strong>- Phó Tổng Giám đốc:</strong><br />
            Trần Hữu Ân<br />
            Lê Vĩnh Thắng</p>

<p style="text-align:justify"><strong>- Thường trực Hội đồng quản trị:</strong><br />
            Dương Thị Huệ<br />
<strong>Chức năng nhiệm vụ của đơn vị:</strong><br />
<strong>1. Lĩnh vực công ích:</strong><br />
    - Quản lý, thu gom, vận chuyển và xử lý chất thải, phân, bùn cống thoát nước.<br />
    - Quản lý, duy tu, bảo dưỡng Hệ thống thoát nước, kênh, mương, hồ; Hệ thống vỉa hè, lề đường; Hệ thống điện chiếu sáng và trang trí đường phố.<br />
    - Quản lý, duy tu, bảo dưỡng Nghĩa trang, làm các dịch vụ mai táng.<br />
    - Thực hiện công tác vệ sinh công cộng.<br />
<strong>2. Kinh doanh khác:</strong><br />
    - Tư vấn thiết kế và nhận thầu thi công các công trình hạ tầng và dân dụng như: hệ thống thoát nước, vỉa hè, lề đường, điện chiếu sáng và trang trí đường phố; các công trình xây dựng, cấp nước, đèn tín hiệu giao thông, các công trình điện, công viên cây xanh, thuỷ lợi, kênh mương, hồ và các tuyến đường giao thông.<br />
    - Hoạt động kinh doanh vật tư, nguyên liệu, thiết bị máy móc chuyên ngành phục vụ công cộng, cơ giới thuỷ lợi.<br />
    - Sản xuất và kinh doanh vật liệu xây dựng và thực hiện các dịch vụ vệ sinh môi trường khác.<br />
<strong>3. Quản lý dự án:</strong><br />
    - Thực hiện chức năng Chủ đầu tư và Quản lý Dự án đối với các công trình hạ tầng do Tỉnh và Thành phố giao về Vệ sinh môi trường, Thoát nước, Điện chiếu sáng, Nghĩa trang... <br />
<strong>Về một số nội dung quản lý cụ thể:</strong><br />
<strong>  </strong><strong> 1. Công tác vệ sinh đô thị:</strong><br />
    -  Duy trì mạng lưới thu gom và vệ sinh đường phố với tổng chiều dài đường, kiệt: 532,288 km trên 1920 tuyến đường, kiệt;<br />
    -  Thu gom rác nhà, rác đường đã thực hiện: 248,55 km;<br />
    - Quét rác đường phố:1.110.233 m<sup>2</sup>;<br />
    - Vận chuyển và xử lý rác, đất, bùn thực hiện được khoảng 99.000 tấn;<br />
    - Quản lý, nạo vét khơi thông hơn 187 km mương, cống các loại với hơn 9.681 hố ga, quản lý hơn 265.000 m<sup>2</sup> vỉa hè xây lát…<strong> </strong><br />
<strong> 2. Điện chiếu sáng và trang trí thành phố</strong><br />
    - Quản lý điện chiếu sáng hơn 515 km với 16.407 bóng, tổng công suất hơn 1930Kwh.<br />
    - Tủ điện được nối với trung tâm điều khiển và giám sát chiếu sáng; hơn 235 trạm đóng cắt điện tự động cùng hệ thống điện chiếu sáng nghệ thuật cầu Trường Tiền, cầu Dã Viên; hệ thống điện trang trí đường phố.  <br />
    - Quản lý vận hành 45 cụm đèn tín hiệu giao thông của Thành phố.  <br />
    - Quản lý 937 cột bảng tên của Thành phố.   <br />
    - Quản lý 3 nghĩa trang nhân dân với tổng diện tích 148 ha.</p>

<p> </p>', N'/images/cover.png', N'about', N'{"attachments":[],"images":[{"url":"/images/cover.png","originalUrl":"https://www.hepco.com.vn","caption":"Lịch sử hình thành","isThumbnail":true}],"summary":"Công ty Cổ phần Môi trường và Công trình Đô thị Huế được chuyển đổi từ Công ty TNHH Nhà nước MTV Môi trường và Công trình Đô thị Huế theo Quyết định số 2728/QĐ-UBND ngày 26 tháng 12 năm 2014 của UBND tỉnh Thừa Thiên Huế....","status":"published","slug":"lich-su-hinh-thanh-49"}');

INSERT INTO news (title, date, content, thumbnail, type, metadata)
VALUES (N'Chức năng nhiệm vụ', N'01/01/2021', N'<table style="-webkit-text-stroke-width:0px; background-color:#ffffff; color:#000000; font-family:Tahoma,Geneva,Arial,Helvetica,sans-serif; font-size:12px; font-style:normal; font-variant-caps:normal; font-variant-ligatures:normal; font-weight:400; letter-spacing:normal; orphans:2; padding:0px; text-align:start; text-decoration-color:initial; text-decoration-style:initial; text-indent:0px; text-transform:none; white-space:normal; widows:2; width:100%; word-spacing:0px">
	<tbody>
		<tr>
			<td style="background-color:#ffffff; border-bottom:0px; border-left:0px; border-right:0px; border-top:0px; text-align:left"> </td>
		</tr>
		<tr>
			<td style="background-color:#ffffff; border-bottom:0px; border-left:0px; border-right:0px; border-top:0px; text-align:justify">
			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><strong><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">1. Lĩnh vực công ích:</span></span></span></strong></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Quản lý, thu gom, vận chuyển và xử lý chất thải, phân, bùn cống thoát nước.</span></span></span></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Quản lý, duy tu, bảo dưỡng Hệ thống thoát nước, kênh, mương, hồ; Hệ thống vỉa hè, lề đường; Hệ thống điện chiếu sáng và trang trí đường phố.</span></span></span></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Quản lý, duy tu, bảo dưỡng Nghĩa trang, làm các dịch vụ mai táng.</span></span></span></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Thực hiện công tác vệ sinh công cộng.</span></span></span></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><strong><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">2. Kinh doanh khác:</span></span></span></strong></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Tư vấn thiết kế và nhận thầu thi công các công trình hạ tầng và dân dụng như: hệ thống thoát nước, vỉa hè, lề đường, điện chiếu sáng và trang trí đường phố; các công trình xây dựng, cấp nước, đèn tín hiệu giao thông, các công trình điện, công viên cây xanh, thuỷ lợi, kênh mương, hồ và các tuyến đường giao thông.</span></span></span></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Hoạt động kinh doanh vật tư, nguyên liệu, thiết bị máy móc chuyên ngành phục vụ công cộng, cơ giới thuỷ lợi.</span></span></span></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Sản xuất và kinh doanh vật liệu xây dựng và thực hiện các dịch vụ vệ sinh môi trường khác.</span></span></span></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><strong><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">3. Quản lý dự án:</span></span></span></strong></span></span></p>

			<p style="text-align:justify"><span style="color:#000000"><span style="color:#000000"><span style="font-size:12pt"><span style="font-family:Verdana,sans-serif"><span style="color:black">+ Thực hiện chức năng Chủ đầu tư và Quản lý Dự án đối với các công trình hạ tầng do Tỉnh và Thành phố giao về Vệ sinh môi trường, Thoát nước, Điện chiếu sáng, Nghĩa trang...</span></span></span></span></span></p>
			</td>
		</tr>
	</tbody>
</table>', N'/images/cover.png', N'about', N'{"attachments":[],"images":[{"url":"/images/cover.png","originalUrl":"https://www.hepco.com.vn","caption":"Chức năng nhiệm vụ","isThumbnail":true}],"summary":"1. Lĩnh vực công ích: + Quản lý, thu gom, vận chuyển và xử lý chất thải, phân, bùn cống thoát nước. + Quản lý, duy tu, bảo dưỡng Hệ thống thoát nước, kênh, mương, hồ; Hệ thống vỉa hè, lề đường; Hệ thống điện chiếu sáng v...","status":"published","slug":"chuc-nang-nhiem-vu-48"}');

PRINT 'Đã nạp thành công toàn bộ bài viết.';
PRINT '=======================================================';
PRINT 'HOÀN TẤT NẠP DỮ LIỆU SQL SERVER CHO HEPCO WEBSITE!';
PRINT '=======================================================';
GO
