========================================================================
    HE THONG WEBSITE HEPCO & CMS QUAN TRI NOI DUNG CHUYEN BIET 2026
    Ngay cap nhat: 09/11/2026
    Cong nghe: React 19, Vite, Tailwind CSS v4, Node.js, Microsoft SQL Server / Prisma
    Deployment Vercel: https://hepcoweb.vercel.app
    Git Repository: website_hepco (branch: main)
========================================================================

1. NOI DUNG HOAN TAT THEO YEU CAU:

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
          nhan su, phong ban, Base.vn), bundle giam 1.6MB, build chi 1.19 giay.
        - Giao dien CMS tap trung dung cac yeu cau cot loi:
          1) Chinh sua thong tin tren web: Thu ngo, tru so, thong so nang luc, Giay phep 317 & 48,
             So do to chuc, Ho so nang luc 2026, Banner Slider trang chu, Showcase 2026, Thu vien anh.
          2) Cap nhat tin tuc: CRUD tin tuc theo danh muc, Rich Text Editor, anh dai dien.
          3) Cap nhat thong bao: CRUD thong bao chinh thuc, so hieu van ban, dinh kem file PDF/Word.
          4) Quan he co dong: CRUD tai lieu DHDCĐ, BCTC, co tuc theo nam va nhom tai lieu.
          5) Dich vu: CRUD dich vu, mo ta giai phap, bo suu tap anh tung dich vu.
          6) Quan ly & Phan quyen Tai khoan Admin (MOI): Cap moi tai khoan admin, phan quyen 
             (Quan tri toi cao, Quan tri vien, Bien tap vien), doi mat khau va bao ve tai khoan goc.

   B. DUA TOAN BO DU LIEU VAO BACKEND & CO SO DU LIEU (HEPCO_Backend_API):
      * Da nap toan bo vao CSDL Backend:
        - 211 bai viet (Tin tuc, Thong bao, Tai lieu Co dong, Dich vu)
        - 287 hinh anh thu vien chat luong cao
        - 8 banners hoat dong trang chu
        - 4 du an trong diem 2026 (Showcase)
        - Danh sach tai khoan quan tri admin
      * Cung cap file script T-SQL chuan Microsoft SQL Server:
        - "setup_sqlserver.sql": Tao CSDL HEPCO_DB, bang, khoa chinh/ngoai, index, user admin, phan quyen.
        - "seed_sqlserver.sql": Nap toan bo 211 bai viet, thong bao, tai lieu co dong, dich vu va 311 anh gallery.
      * Schema Prisma cho SQL Server: "prisma/schema.sqlserver.prisma".
      * Lenh tao Prisma Client cho SQL Server: "npm run db:sqlserver:generate".
      * Che do kep (Dual Mode): Ket noi SQL Server qua DATABASE_URL trong .env, hoac chay local voi SQLite.

   C. GIT REPOSITORY & DEPLOY VERCEL:
      * Da khoi tao Git repository "website_hepco" voi branch "main" va commit toan bo ma nguon.
      * Da deploy thanh cong len Vercel tai:
        -> Production URL: https://hepcoweb.vercel.app

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

   B. KHOI CHAY FRONTEND WEBSITE & CMS (LOCAL):
      cd HEPCO_Frontend
      npm run dev
      -> Website chay tai: http://localhost:5173
      Hoac chay ban production toi uu:
      npm run preview

3. THONG TIN DANG NHAP QUAN TRI (CMS):
   - Link dang nhap Online: https://hepcoweb.vercel.app/admin/login
   - Link dang nhap Local: http://localhost:5173/admin/login
   - Tai khoan: admin
   - Mat khau: 123456
   (Co nut "Dien nhanh Admin" de truy cap ngay lap tuc)
========================================================================
