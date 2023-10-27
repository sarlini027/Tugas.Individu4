# Tugas Individu 4

- Buatlah endpoint untuk registrasi dan login menggunakan JWT

- Buatlah endpoint untuk CRUD (Create, Read, Update, Delete) sumber daya, misalnya movies

- Buatlah data dummy minimal 10 dan masukkan data pada basisdata yang digunakan

- Integrasikan endpoint dengan basisdata yang dipilih

- Tambahkan Role pengguna dan ACL untuk pembatasan pada akses endpoint

- Implementasikan middleware untuk logging untuk aktivitas login, registrasi dan akses pada data

- Tuliskan beberapa unit test untuk endpoint yang telah dibuat dengan code coverage > 80%

## Cara menjalankan project ini

- clone repo ini (https://github.com/anggrndewi/TugasIndividu4.git)
- install module berikut
- pip install pyramid_jinja2
- pip install pyramid_jwt
- pip install jwt
- pip install pymysql
- import [file ini](https://github.com/anggrndewi/TugasIndividu4/blob/main/pyramid-tugasmovie.sql) ke localhost sql
- jalankan project dengan python app.py atau py app.py

## Route dalam project ini
- http://localhost:6543/ untuk halaman login
- http://localhost:6543/movie untuk ke halaman movie

## Dewi Anggraini - 120140149
