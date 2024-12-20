# Klinik Ganesha

Klinik Ganesha adalah aplikasi digitalisasi layanan klinik yang membantu pasien dalam melakukan pendaftaran, membuat janji konsultasi, mengelola laporan hasil uji lab dan konsultasi, serta melihat jadwal mendatang dengan mudah.

## Fitur Utama
Sementara ini, fitur yang diimplementasikan secara benar-benar (dinamis berdasarkan aksi user dan bukan data statis adalah fitur membuat janji konsultasi)
1. **Registrasi Pasien**: Memungkinkan pengguna untuk mendaftar akun baru.
2. **Janji Konsultasi**: 
   - Membuat janji konsultasi offline (online belum tersedia).
   - Menampilkan jadwal konsultasi yang sudah terjadwal.
3. **Janji Pengujian Laboratorium**:
   - Menampilkan data statis terkait jadwal uji lab.
   - Fitur pembuatan janji uji lab akan segera hadir.
4. **Laporan Hasil**:
   - Menampilkan hasil laporan uji lab dan konsultasi secara statis untuk saat ini.
5. **Jadwal Mendatang**:
   - Menampilkan jadwal konsultasi dan kegiatan lainnya yang akan datang.

## Teknologi yang Digunakan

- **Flutter**: Framework untuk pengembangan aplikasi mobile (front-end).
- **Supabase**: Digunakan untuk mekanisme database, autentikasi, dan backend lainnya.

## Cara Menggunakan

### 1. Mengunduh dan Menginstal .apk
- Anda dapat mengunduh file `.apk` melalui tautan yang disediakan (tautan akan segera ditambahkan).
- Install file `.apk` pada perangkat Android Anda.

### 2. Menjalankan di Emulator
- Pastikan **Flutter** sudah terinstall di perangkat Anda.
- Jalankan perintah berikut pada terminal:
  ```bash
  flutter pub get
  flutter run

## Cara Mengoperasikan
1. **Registrasi Pasien**: Sign up dengan email dan password atau sign in jika sudah daftar sebelumnya pada layar registrasi (autentikasi)
2. **Janji Konsultasi**: 
   - Navigasi pada layar Consult dan scrool ke bawah untuk melihat tombol "Buat Janji Konsultasi Baru"
   - Pilih salah satu dokter yang tersedia (sementara ini baru 2 akun yang terdaftar sebagai dokter) dengan mengklik tombol "Buat Janji". Perlu diperhatikan pada prototype ini, belum bisa memilih range hari yang available dari dokter tersebut, alhasil default value adalah hari dan jam tercepat dari range yang disediakan
   - Jika berhasil (database dapat menyimpan data) maka Anda akan dinavigasikan ke layar utama (Home) dan melihat jadwal mendatang sesuai jadwal konsultasi yang anda pilih pada tahap sebelumnya
3. **Ganti akun/keluar**:
   - Anda bisa Sign Out jika ingin mengganti akun atau sekedar keluar dari akun melalui layar Profile dan mengklik tombol "Sign Out"
4. **Miscellaneous**:
   - Konten lainnya pada layar Lab dan Results masih statis, belum diimplementasikan fitur implementasi seperti proses bisnis membuat jadwal konsultasi.
   - Tombol-tombol "Detail" yang akan sering ditemukan pada aplikasi juga belum diimplemntasikan --> Details Screen dari tiap Widget/Component

Made by Alessandro JH.

P.S. : Prototype sudah berhasil mengimpelmentasi proses bisnis Registrasi Pasien dan Membuat Janji Konsultasi
