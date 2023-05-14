## Tugas 7: Elemen Dasar Flutter

1. Stateless Widget vs Stateful Widget

   - **Stateless Widget:** Merupakan widget yang mendeskripsikan bagian dari antarmuka pengguna yang bisa di-configure berdasarkan parameter yang tidak berubah seiring waktu. Stateless widget tidak memiliki state internal yang berubah seiring waktu. Contoh dari Stateless Widget adalah `Icon`, `IconButton`, dan `Text`.
   - **Stateful Widget:** Merupakan widget yang dapat berubah seiring waktu. Stateful widget memiliki state internal yang bisa diperbarui dan ketika state tersebut berubah, widget tersebut akan memanggil method `build()` untuk memperbarui tampilan di layar. Contoh dari Stateful Widget adalah `Checkbox`, `Radio`, `Slider`, `Form`, dan `TextField`.
   - **Perbedaan:** Perbedaan mendasar antara keduanya adalah bahwa stateless widget tidak memiliki state yang berubah seiring waktu, sedangkan stateful widget memiliki state yang dapat berubah seiring waktu.
2. Widget yang digunakan:

   - `MaterialApp`: Widget root yang menyediakan berbagai fungsi yang biasanya diperlukan dalam aplikasi berbasis material design seperti navigasi, tema, dan sebagainya.
   - `Scaffold`: Menyediakan struktur visual dasar yang biasanya digunakan dalam aplikasi berbasis material design. Termasuk app bar, body, floating action button, dan lainnya.
   - `ScaffoldMessenger`: Widget yang digunakan untuk menampilkan `SnackBar`.
   - `AppBar`: Menyediakan app bar di atas aplikasi.
   - `Center`: Mengatur posisi child widget-nya di tengah.
   - `Column`: Menyusun child widget-nya dalam bentuk kolom.
   - `ElevatedButton.icon`: Membuat tombol dengan ikon dan label.
   - `SizedBox`: Menyediakan ruang kosong dengan ukuran tertentu. Digunakan di sini untuk memberi jarak antara tombol.
   - `Icon`: Menampilkan ikon.
   - `Text`: Menampilkan teks.
   - `SnackBar`: Menampilkan pesan singkat di bagian bawah layar.
3. Implementasi checklist:

   - Pertama, buat aplikasi Flutter baru dengan nama `study_tracker`.
   - Lalu, buat struktur dasar aplikasi dengan `MaterialApp` dan `Scaffold`.
   - Selanjutnya, buat fungsi `showSnackBar` untuk menampilkan snackbar dengan pesan yang diinginkan.
   - Kemudian, buat tiga `ElevatedButton.icon` dengan teks dan ikon yang sesuai. Tambahkan `onPressed` callback ke setiap tombol yang memanggil fungsi `showSnackBar` dengan pesan yang sesuai.
   - Terakhir, tambahkan `SizedBox` antara setiap tombol untuk memberikan jarak antara tombol.
