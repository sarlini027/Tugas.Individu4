# TugasIndividu4

1. Registrasi dan Login Menggunakan JWT:

Buat dua endpoint: satu untuk registrasi dan satu untuk login.
Gunakan JWT (JSON Web Token) untuk mengamankan akses.
Registrasi akan menerima informasi pengguna (nama, email, kata sandi) dan membuat entri pengguna baru di basis data setelah memvalidasi data.
Login akan memeriksa email dan kata sandi, kemudian menghasilkan token JWT jika pengguna valid.
2. CRUD Sumber Daya (Contoh: Movies):

Buat empat endpoint: Create, Read, Update, dan Delete (CRUD) untuk sumber daya (misalnya, movies).
Setiap endpoint menerima permintaan HTTP sesuai dengan operasi yang diinginkan.
3. Data Dummy dan Integrasi dengan Basis Data:

Masukkan minimal 10 data dummy ke dalam basis data. Misalnya, dalam tabel "movies" jika itu adalah sumber daya yang Anda kelola.
Pastikan endpoint CRUD berfungsi dengan baik untuk mengakses, membuat, memperbarui, dan menghapus data dari basis data.
4. Manajemen Peran Pengguna dan Kontrol Akses:

Tambahkan peran pengguna seperti "admin" dan "pengguna biasa".
Terapkan kontrol akses berdasarkan peran pengguna. Misalnya, hanya admin yang bisa menghapus data.
5. Middleware untuk Logging:

Buat middleware khusus yang akan mencatat aktivitas login, registrasi, dan akses pada data.
Middleware ini akan mencatat aktivitas ini dalam file log atau basis data.
6. Unit Test dengan Coverage > 80%:

Tulis unit test untuk setiap endpoint yang telah Anda buat.
Pastikan unit test menguji fungsionalitas dasar seperti registrasi, login, CRUD, dan kontrol akses.
Gunakan alat pengujian seperti Mocha, Chai, atau Jest.
Pastikan cakupan kode (code coverage) mencapai lebih dari 80%.
Panduan ini memberikan gambaran umum tentang bagaimana  memulai proyek ini. Untuk implementasi yang lebih rinci, Anda harus menggunakan bahasa pemrograman dan kerangka kerja tertentu yang sesuai untuk proyek Anda (seperti Node.js dengan Express, Django, Ruby on Rails, dll.), serta database management system yang Anda pilih (seperti MySQL, PostgreSQL, MongoDB, dll.). Juga, Anda perlu memahami konsep JWT, peran pengguna, dan kontrol akses dengan baik.

## Cara menjalankan project ini

- clone repo ini 
- install module berikut
- pip install pyramid_
- pip install pyramid_jwt
- pip install jwt
- pip install pymysql
- jalankan project dengan python app.py atau py app.py


