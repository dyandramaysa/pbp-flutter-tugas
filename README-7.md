# Tugas 7: Elemen Dasar Flutter

Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023 
<br>
**Nama  : Nadira Maysa Dyandra** \
**NPM   : 2106632232** \
**Kelas : A**

## *Stateless Widget* dan *Stateful Widget*
*Stateless widget* adalah suatu widget yang dimuat secara statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal. Widget ini cocok digunakan ketika hanya perlu menampilkan data yang bersifat statis atau tidak memerlukan perubahan nilai. 
<br>
Sedangkan, *Stateful Widget* berlaku sebaliknya, yaitu bersifat dinamis, sehingga widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan *user actions* atau ketika terjadi perubahan data. Widget ini dapat mengubah tampilan, menambahkan widget lainnya, mengubah nilai variabel, ikon, warna, dan lain sebagainya. 

## Widget Pada Proyek counter_7
- `MaterialApp()`, merupakan widget utama yang akan diakses pertama kali oleh fungsi `main()`. Widget ini memiliki properti **home** yang akan menjadi *default route* aplikasi. 
- `Scaffold()`, merupakan widget utama yang akan ditampilkan pada aplikasi. Widget ini pada dasarnya adalah wadah untuk semua widget lainnya. `Scaffold()` juga menampung beberapa fitur dasar seperti AppBar, Body, BottomNavigationBar, FloatingActionButton, dll. 
- `AppBar`, merupakan widget yang terletak dibagian atas aplikasi dan biasanya berfungsi sebagai *control menu* pada aplikasi. 
- `Text`, widget yang digunakan untuk menampilkan *text* pada aplikasi. 
- `Column`, widget yang digunakan untuk mengatur tata letak atau *layout* widget secara menurun atau vertikal. 
- `Row`, widget yang digunakan untuk mengatur tata letak atau *layout* widget secara horizontal. 
- `Padding`, widget yang digunakan untuk menambahkan *padding* atau *empty space* di sekitar widget atau banyak widget.

## `setState()`
Fungsi `setState()` memberi tahu framework Flutter bahwa ada sesuatu yang berubah pada *state* yang menyebabkannya menjalankan lagi *method build* di bawahnya sehingga tampilan dapat mencerminkan nilai yang telah diperbaharui. 
<br>
Pada tugas ini, variabel yang terdampak adalah _counter. Selain itu, nilai _counter juga berdampak untuk menampilkan tombol decrement apabila _counter > 0

## Perbedaan `const` dengan `final`
`const` adalah variabel yang digunakan untuk deklarasi variabel *immutable* yang nilainya bersifat **konstan** dan harus sudah diketahui pada saat waktu kompilasi (***compile time***) berjalan. Dengan kata lain, variabel tersebut harus sudah diberikan *value* secara langsung.
<br> 
Sedangkan, `final` adalah variabel yang diinisialisasi pada saat pertama kali digunakan dan hanya disetel sekali. Dengan kata lain, nilai `final` akan diketahui pada saat ***run-time***. `final` dapat digunakan untuk mendeklarasikan variabel *immutable* yang nilainya sudah ataupun belum diketahui pada saat waktu kompilasi berjalan

## Mengimplementasikan *Checklilst* Tugas 7
1. Membuka terminal dan masuk ke direktori sesuai keinginan masing-masing.
2. Membuat proyek Flutter yang bernama **counter_7** dan masuk ke dalam direktori proyek dengan menuliskan kode berikut di terminal.
    ```
    flutter create counter_7
    cd counter_7
    ``` 
3. Mengubah file `lib/main.dart` denagn editor agar sesuai dengan *requirements* pada tugas.
4. Menambahkan fungsi untuk melakukan pengurangan satu nilai pada variabel _counter pada class _CounterState.
    ```
    void _decrementCounter() {
        setState(() {
        _counter--;
        });
    }
    ```
5. Menambahkan display *text* dan *button* yang sesuai dengan *requirements* tugas 7 pada widget body.
    ```
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_counter % 2 == 0) 
              const Text(
                'GENAP',
                style: TextStyle(color: Colors.blue),
              )
            else 
              const Text(
              'GANJIL',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_counter > 0)
            Padding(padding: const EdgeInsets.only(left: 30),
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
          Padding(padding: const EdgeInsets.only(left: 30),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    ```
6. Simpan file dan lihat perubahannya pada tampilan aplikasi dengan menuliskan kode berikut di terminal.
    ```
    flutter run
    ```
7. Lakukan git `add`-`commit`-`push` proyek ke dalam repositori `pbp-flutter-tugas`