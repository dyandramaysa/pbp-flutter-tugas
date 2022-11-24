# Tugas 9: Integrasi Web Service pada Flutter
Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023 
<br>
**Nama  : Nadira Maysa Dyandra** \
**NPM   : 2106632232** \
**Kelas : A**
<hr>

## Pengambilan Data JSON tanpa Membuat Model
Pengambilan data JSON tanpa membuat model tetap dapat dilakukan pada Flutter. Namun, terdapat beberapa kekurangan ketika melakukan hal tersebut, salah satunya tidak dapat mengakses data tersebut sebagai sebuah "class" sehingga menjadi kurang efisien. Selain itu, pengambilan data JSON dengan membuat model sebenarnya bertujuan untuk memimalisir kesalahan pengambilan dan pengiriman data melalui *http request*. Sehingga, jika tidak membuat model, maka risiko terjadi kesalahan pengambilan dan pengiriman data lebih tinggi. 

## Widget Pada Tugas 9
- `MaterialApp()`, merupakan widget utama yang akan diakses pertama kali oleh fungsi `main()`. Widget ini memiliki properti **home** yang akan menjadi *default route* aplikasi. 
- `Scaffold()`, merupakan widget utama yang akan ditampilkan pada aplikasi. Widget ini pada dasarnya adalah wadah untuk semua widget lainnya. `Scaffold()` juga menampung beberapa fitur dasar seperti AppBar, Body, BottomNavigationBar, FloatingActionButton, dll. 
- `AppBar`, merupakan widget yang terletak dibagian atas aplikasi dan biasanya berfungsi sebagai *control menu* pada aplikasi. 
- `Text`, widget yang digunakan untuk menampilkan *text* pada aplikasi. 
- `Column`, widget yang digunakan untuk mengatur tata letak atau *layout* widget secara menurun atau vertikal. 
- `Row`, widget yang digunakan untuk mengatur tata letak atau *layout* widget secara horizontal. 
- `Padding`, widget yang digunakan untuk menambahkan *padding* atau *empty space* di sekitar widget atau banyak widget.
- `Drawer`, widget yang digunakan untuk menampilkan menu yang tersembunyi pada sisi kanan atau kiri sebuah aplikasi. 
- `FutureBuilder`, widget yang disediakan oleh flutter untuk mendukung proses asinkron.
- `Container`, widget yang bertugas sebagai pembukus dari widget lain. 
- `GestureDetector`, widget yang digunakan untuk mendeteksi gesture, seperti menekan, mengetuk, melakukan *drag* suatu widget. 

## Mekanisme Pengambilan Data JSON pada Flutter
Secara umum mekanisme pengambilan data JSON dengan bantuan *http package* adalah sebagai berikut.
1. Menambahkan *dependency* `http` ke dalam proyek. *Dependency* ini digunakan untuk bertukar data melalui *HTTP request*, seperti **GET**, **POST**, **PUT**, dan lain-lain.
2. Membuat model yang sesuai dengan JSON yang berasal dari *web service* tersebut.
3. Membuat *http request* ke *web service* menggunakan *dependency* `http`.
4. Respons di-*decode* menjadi JSON dan dikonversi ke model yang telah dibuat pada langkah kedua.
5. Menampilkan data yang telah dikonversi ke aplikasi dengan `FutureBuilder`.

## Mengimplementasikan *Checklilst* Tugas 9
1. Melakukan *refactor file* dengan menambahkan folder `models` dan `pages` di dalam folder `lib`. Kemudian pindahkan semua file selain `main.dart` dan `drawer.dart` ke dalam folder `pages` dan `models` apabila sudah terdapat model.
2. Membuat model yang menyesuaikan dengan data JSON di dalam file `mywatchlist.dart` pada folder `models`.
  ```
  ...
  ```
3. Menambahkan dependensi HTTP dengan melakukan `flutter pub add http` pada terminal proyek Flutter untuk menambahkan *package* `http`. Kemudian, pada file `android/app/src/main/AndroidManifest.xml`, tambahkan kode berikut untuk memperbolehkan akses internet pada aplikasi Flutter yang sedang dibuat.
```
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```
4. Mengambil dan mengolah data dari *web service* dengan membuat file `mywatchlist_page.dart` pada folder `lib/pages`. Kemudian, melakukan pengambilan data dari URL https://tugas2nadira.herokuapp.com/mywatchlist/json/ dengan metode `http.get` yang dilakukan di dalam folder `fetch` pada file `fetch_mywatchlist.dart`.
5. Menampilkan judul film pada mywatchlist_page.dart dengan bantuan mywatchlist_item_card.dart untuk menampilkan data di dalam card dan menampilkan detail film pada mywatchlist_detail.dart dalam folder `lib/pages`.
6. Melakuan `add`, `commit`, dan `push` ke dalam repositori GitHub.