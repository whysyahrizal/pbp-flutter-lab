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

## Tugas 8: Flutter Form

1. **Bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter?**

   Navigator mengelola stack dari `Route` yang memungkinkan kita untuk "mendorong" dan "pop" rute/halaman untuk navigasi di aplikasi Flutter. Ketika kita "mendorong" sebuah rute baru menggunakan `Navigator.push()`, rute tersebut ditambahkan ke bagian atas stack dan ditampilkan. Ketika kita "pop" rute menggunakan `Navigator.pop()`, rute tersebut dihapus dari stack dan halaman sebelumnya ditampilkan.
2. **Sebutkan dan jelaskan tipe routing yang disediakan oleh Navigator.**

   Ada dua tipe utama routing dalam Navigator yaitu `Navigator.push()` dan `Navigator.pop()`.

   - `Navigator.push()`: Digunakan untuk navigasi ke halaman baru. Ini mendorong rute baru ke stack Navigator dan menampilkan halaman yang terkait dengan rute tersebut.
   - `Navigator.pop()`: Digunakan untuk kembali ke halaman sebelumnya. Ini menghapus rute teratas dari stack Navigator, dan menampilkan halaman yang terkait dengan rute baru di bagian atas stack.
3. **Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).**

   Beberapa jenis event dalam Flutter meliputi:

   - `onPressed`: Event ini dipicu saat pengguna menekan widget seperti `ElevatedButton` atau `IconButton`.
   - `onChanged`: Event ini dipicu saat nilai dari widget berubah, seperti dalam `TextField` atau `Checkbox`.
   - `onTap`: Event ini dipicu saat pengguna mengetuk widget seperti `GestureDetector` atau `InkWell`.
   - `onLongPress`: Event ini dipicu saat pengguna menekan dan menahan widget.
   - `onScroll`: Event ini dipicu saat pengguna menggulir widget seperti `ListView` atau `GridView`.
4. **Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**

   - `MaterialApp`: Widget ini biasanya berada di bagian atas widget tree dan digunakan untuk konfigurasi aplikasi.
   - `Scaffold`: Widget ini menyediakan struktur visual dasar untuk aplikasi, seperti `AppBar`, `Drawer`, dan `SnackBar`.
   - `AppBar`: Widget ini menampilkan bar aplikasi dengan judul, tombol, dan aksi.
   - `ElevatedButton`: Widget ini menampilkan tombol dengan elevasi yang berubah saat ditekan.
   - `IconButton`: Widget ini menampilkan tombol berbentuk ikon.
   - `Drawer`: Widget ini menampilkan panel navigasi horizontal yang biasanya digunakan untuk navigasi dalam aplikasi.
   - `ListView`: Widget ini menampilkan daftar gulir item.
   - `TextField`: Widget ini memungkinkan pengguna untuk memasukkan teks.
5. **Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).**

   Berikut adalah langkah-langkah yang dapat kita ikuti:

   - Pertama, tambahkan `Drawer` ke `Scaffold` dalam `MyHomePage`. Di dalam `Drawer`, tambahkan `ListView` dengan beberapa `ListTile`. Setiap `ListTile` mewakili item navigasi.
   - Untuk setiap item navigasi, tambahkan fungsi `onTap` yang akan memicu `Navigator.pushReplacement()`. Fungsi ini akan "mendorong" rute baru ke stack Navigator dan "menggantikan" rute saat ini. Dengan ini, kita dapat berpindah ke halaman baru.
   - Buat `FormPage` baru sebagai `StatefulWidget`. Ini karena kita perlu menyimpan state dari form.
   - - Di dalam `FormPage`, buat `Scaffold` dengan `AppBar` dan `Body`. Di dalam `Body`, tambahkan `Form` dengan beberapa `TextFormField`. Setiap `TextFormField` mewakili field input dalam form.
     - Atur `Form` untuk menyimpan nilai dari setiap field input ke dalam variabel.
     - Tambahkan `ElevatedButton` di bawah `Form`. Ketika tombol ini ditekan, tampilkan popup dengan informasi data yang diisi pada form.
     - Akhirnya, ubah fungsi `onPressed` dari tombol Tambah Tugas pada halaman menu untuk memicu `Navigator.pushReplacement()`. Fungsi ini akan mengarahkan pengguna ke `FormPage` ketika tombol ditekan.

   Selalu ingatlah untuk melakukan debugging dan testing setiap kali kita membuat perubahan signifikan pada kode kita. Ini membantu kita memahami bagaimana setiap bagian kode bekerja dan memungkinkan kita mengidentifikasi dan memperbaiki bug lebih awal.

## Tugas 9: Integrasi Web Service dengan Aplikasi Flutter

### Mengambil Data JSON Tanpa Membuat Model

Ya, kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Kita dapat menggunakan `Map<String, dynamic>` atau `List<dynamic>` untuk menampung data JSON dan kemudian mengaksesnya menggunakan kunci (dalam kasus `Map`) atau indeks (dalam kasus `List`).

Meski begitu, pendekatan ini umumnya kurang disarankan karena lebih rentan terhadap kesalahan pada saat runtime. Misalnya, kita mungkin secara tidak sengaja mengetik salah kunci saat mengakses data dari `Map`, atau kita mungkin mengasumsikan tipe data yang salah. Dengan menggunakan model, kita dapat mendeteksi banyak kesalahan ini pada saat kompilasi dan mendapatkan dukungan autocompletion dan dokumentasi dari IDE kita.

## Mekanisme Pengambilan Data JSON

Pada Flutter, pengambilan data JSON biasanya melibatkan beberapa langkah:

1. Mengirim HTTP request ke server menggunakan paket seperti `http` atau `dio`.
2. Menerima HTTP response dari server. Response ini biasanya berisi data JSON.
3. Mengurai (parse) data JSON menjadi struktur data Dart menggunakan `jsonDecode()`.
4. (Opsional) Mengonversi struktur data Dart menjadi instance kelas model menggunakan konstruktor atau metode factory.
5. Menampilkan data tersebut di widget Flutter.

### Mekanisme Autentikasi

Autentikasi biasanya melibatkan beberapa langkah:

1. Pengguna memasukkan data akun (misalnya, email dan password) di form pada aplikasi Flutter.
2. Aplikasi mengirim data ini ke server Django melalui HTTP request (biasanya POST).
3. Server Django memeriksa data ini, dan jika valid, server akan mengirim balik token autentikasi.
4. Aplikasi Flutter menerima token ini dan menyimpannya (misalnya, di shared preferences).
5. Ketika aplikasi ingin mengakses data yang dibatasi (misalnya, data pengguna), aplikasi akan mengirim token ini dalam header Authorization dari HTTP request.
6. Jika token valid, server akan mengirim balik data yang diminta. Jika tidak, server akan mengirim balik error.


### Widget Flutter yang Digunakan

Berikut adalah beberapa widget yang digunakan dalam proyek ini:

- `MaterialApp`: Widget ini biasanya digunakan di root aplikasi dan menyediakan tema Material Design.
- `Scaffold`: Widget ini menyediakan struktur dasar visual aplikasi Material Design.
- `Drawer`: Widget ini menyediakan menu navigasi samping.
- `ListView`: Widget ini menampilkan anak-anaknya dalam daftar scrollable.
- `Text`: Widget ini menampilkan teks.
- `Icon`: Widget ini menampilkan ikon.
- `AppBar`: Widget ini menyediakan app bar Material Design.
- `FutureBuilder`: Widget ini menunggu hasil Future dan memanggil callback builder ketika Future selesai.

## Implementasi Checklist

Proses implementasi checklist umumnya melibatkan beberapa langkah:


1. **Migrasi proyek tugas Django  ke salah satu PaaS
   alternatif.**

   - Kita bisa menggunakan berbagai layanan PaaS seperti Heroku, Google Cloud, atau AWS, namun disini saya menggunakan railway (karena gratis :D). Untuk migrasi ke Heroku, Kita perlu membuat file `requirements.txt` untuk daftar
     dependensi Python, `Procfile` untuk menentukan proses web dan pekerja, dan
     `runtime.txt` untuk menentukan versi Python. Setelah itu, Kita bisa menerapkan
     aplikasi Django ke Heroku menggunakan Git.
2. **Membuat halaman login pada proyek tugas Flutter.**

   - Kita bisa menggunakan widget seperti `TextField` untuk input username dan password, dan `ElevatedButton` untuk tombol login. Kita juga perlu state management (misalnya
     dengan `setState` atau `Provider`) untuk mengendalikan input dan aksi pengguna.
3. **Mengintegrasikan sistem autentikasi Django dengan
   proyek tugas Flutter.**

   - Untuk ini, Kita perlu melakukan HTTP request dari aplikasi Flutter ke server Django. Kita bisa menggunakan package `http` untuk melakukan ini. Request ini biasanya dilakukan
     di dalam method `onPressed` dari tombol login.
4. **Membuat model kustom sesuai dengan proyek aplikasi
   Django.**

   - Kita bisa membuat class Dart untuk model yang sesuai dengan model Django. Class ini biasanya memiliki konstruktor dan method `fromJson` untuk mengubah JSON ke objek Dart.
5. **Membuat halaman yang berisi semua tugas yang ada pada
   endpoint JSON di Django yang telah kamu deploy sebelumnya.**

   - Kita bisa menggunakan `FutureBuilder` dan `ListView.builder` untuk mendapatkan dan
     menampilkan data dari endpoint JSON. Kita bisa menggunakan method `http.get`
     untuk mendapatkan data, dan `jsonDecode` untuk mengubah response menjadi list
     objek Dart.
6. **Membuat halaman detail untuk setiap tugas yang ada pada
   daftar tersebut.**

   - Kita bisa membuat halaman detail yang menampilkan lebih banyak informasi tentang tugas. Kita bisa menggunakan `Navigator.push` untuk berpindah ke halaman detail saat pengguna
     mengetuk item di `ListView`.
7. **Menambahkan tombol untuk kembali ke daftar tugas.**

   - Kita bisa menambahkan `IconButton` dengan `Icons.arrow_back` di `AppBar` halaman detail. Kita
     bisa menggunakan `Navigator.pop` di dalam `onPressed` untuk kembali ke halaman
     sebelumnya.
