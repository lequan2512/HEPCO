========================================================================
    HE THONG WEBSITE HEPCO & CMS QUAN TRI NOI DUNG CHUYEN BIET 2026
    Ngay cap nhat: 09/11/2026
    Cong nghe: React 19, Vite, Tailwind CSS v4, Node.js, Microsoft SQL Server / Prisma
========================================================================

1. NOI DUNG NANG CAP & XAY MOI:

   A. PHAN FRONTEND (HEPCO_Frontend) DUOC TAI CAU TRUC TINH GON & CHUYEN NGHIEP:
      * Giu nguyen 100% giao dien va tinh nang xuat sac cua Website Hepco:
        - Trang Chu: Hero Banner, Video Phim gioi thieu, 4 Du an trong diem 2026, 
          Dich vu noi bat, Tin tuc moi nhat, Thu vien hinh anh, Doi tac.
        - Gioi Thieu: Thu ngo Ban Lanh Dao, Giay phep Moi truong so 317 va 48, 
          So do to chuc, Ho so nang luc 2026 Flipbook lat trang & tai PDF.
        - Dich Vu: Chi tiet cac dich vu ve sinh, thu gom, chieu sang, cay xanh, thoat nuoc.
        - Tin Tuc: 6 chuyen muc tin tuc, loc theo nam, tim kiem, xem chi tiet bai viet.
        - Thong Bao (MOI): Chuyen trang danh sach thong bao chinh thuc, thong bao dau thau,
          thong bao tuyen dung, xem chi tiet & tai file van ban dinh kem.
        - Quan He Co Dong: Bao cao tai chinh kiem toan, bao cao thuong nien, Nghi quyet DHDCĐ,
          co tuc, tai file PDF tai lieu truc tiep.
      * XAY LAI PHAN FE QUAN TRI (ADMIN CMS):
        - Loai bo triet de toan bo cac module khong phai noi dung web (PC, POS, nhien lieu,
          nhan su, phong ban, Base.vn).
        - Giao dien CMS cuc ky tinh gon, tap trung 100% vao dung 5 yeu cau cot loi:
          1) Chinh sua thong tin tren web: Thu ngo, tru so, thong so nang luc, Giay phep 317 & 48,
             So do to chuc, Ho so nang luc 2026, Banner Slider trang chu, Showcase 2026, Thu vien anh.
          2) Cap nhat tin tuc: CRUD tin tuc theo danh muc, Rich Text Editor, anh dai dien.
          3) Cap nhat thong bao: CRUD thong bao chinh thuc, so hieu van ban, dinh kem file PDF/Word.
          4) Quan he co dong: CRUD tai lieu DHDCĐ, BCTC, co tuc theo nam va nhom tai lieu.
          5) Dich vu: CRUD dich vu, mo ta giai phap, bo suu tap anh tung dich vu.

   B. HO TRO CO SO DU LIEU MICROSOFT SQL SERVER (HEPCO_Backend_API):
      * Cung cap file script T-SQL chuan Microsoft SQL Server:
        - "setup_sqlserver.sql": Tao CSDL HEPCO_DB, bang, khoa chinh/ngoai, index, user admin.
        - "seed_sqlserver.sql": Nap toan bo 211 bai viet, thong bao, tai lieu co dong, 
          dich vu va 287 anh gallery.
      * Schema Prisma cho SQL Server: "prisma/schema.sqlserver.prisma".
      * Lenh tao Prisma Client cho SQL Server: "npm run db:sqlserver:generate".
      * Che do kep (Dual Mode): Khi co SQL Server, chi can dien DATABASE_URL cua SQL Server 
        trong file .env; khi chay thu nghiem local chua bat SQL Server, he thong tu chay bang 
        SQLite da nap day du du lieu ma khong he bao loi.

2. HUONG DAN KHOI CHAY NHANH:

   A. KHOI CHAY BACKEND API:
      cd HEPCO_Backend_API
      npm run dev
      -> Server API chay tai: http://localhost:3000

      * De ket noi Microsoft SQL Server cua ban:
        Mo file HEPCO_Backend_API/.env va sua:
        DATABASE_URL="sqlserver://localhost:1433;database=HEPCO_DB;user=sa;password=YourPassword;encrypt=false;trustServerCertificate=true"
        Sau do chay:
        npm run db:sqlserver:generate

   B. KHOI CHAY FRONTEND WEBSITE & CMS:
      cd HEPCO_Frontend
      npm run dev
      -> Website chay tai: http://localhost:5173
      Hoac chay ban production toi uu (1.19s build):
      npm run preview

3. THONG TIN DANG NHAP QUAN TRI (CMS):
   - Link dang nhap: http://localhost:5173/admin/login
   - Tai khoan: admin
   - Mat khau: 123456
   (Co nut "Dien nhanh Admin" de truy cap ngay lap tuc)
========================================================================
