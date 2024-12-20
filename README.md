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
