# Tugas 8: Flutter Form

Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023 
<br>
**Nama  : Nadira Maysa Dyandra** \
**NPM   : 2106632232** \
**Kelas : A**

## Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` adalah metode push yang digunakan untuk menambahkan rute lain ke atas tumpukan *screen* (*stack*) saat ini. Dengan demikian, halaman baru akan ditampilkan di atas halaman sebelumnya. 
<br>
Sedangkan, `Navigator.pushReplacement` adalah metode push yang digunakan untuk mengganti rute navigator saat ini dengan mendorong rute yang diberikan dan kemudian membuang rute sebelumnya setelah rute baru selesai dianimasikan. 

## Widget Pada Tugas 8
- `MaterialApp()`, merupakan widget utama yang akan diakses pertama kali oleh fungsi `main()`. Widget ini memiliki properti **home** yang akan menjadi *default route* aplikasi. 
- `Scaffold()`, merupakan widget utama yang akan ditampilkan pada aplikasi. Widget ini pada dasarnya adalah wadah untuk semua widget lainnya. `Scaffold()` juga menampung beberapa fitur dasar seperti AppBar, Body, BottomNavigationBar, FloatingActionButton, dll. 
- `AppBar`, merupakan widget yang terletak dibagian atas aplikasi dan biasanya berfungsi sebagai *control menu* pada aplikasi. 
- `Text`, widget yang digunakan untuk menampilkan *text* pada aplikasi. 
- `Column`, widget yang digunakan untuk mengatur tata letak atau *layout* widget secara menurun atau vertikal. 
- `Row`, widget yang digunakan untuk mengatur tata letak atau *layout* widget secara horizontal. 
- `Padding`, widget yang digunakan untuk menambahkan *padding* atau *empty space* di sekitar widget atau banyak widget.

## Jenis-jenis Event
- onPressed
- onChange
- onHover
- onFocusChange
- onLongPress
- onTap

## Cara Kerja `Navigator`
`Navigator` merupakan widget yang membantu untuk menavigasi antarrute. `Navigator` bekerja seperti tumpukan *stack* yang menggunakan prinsip LIFO (Last-In, First-Out) untuk menampilkan layar teratas berdasarkan *stack of route*. Dalam melakukan navigasi ke layar baru, *route* widget yang disimpan oleh `BuildContext` akan diakses oleh Navigator dengan *methods* yang ada pada class Navigator, seperti `push()`, `pop()`, dll.   

## Mengimplementasikan *Checklilst* Tugas 8
1. Menambahkan drawer/hamburger menu pada app yang telah dibuat sebelumnya dan menambahkan tiga tombol navigasi pada drawer/hamburger. Widget Drawer ini dibuat pada file terpisah.
```
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budget_form.dart';
import 'package:counter_7/show_budget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Counter()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetForm()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ShowBudget()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```
2. Menambahkan halaman Form Budget dengan membuat budget_form.dart
```
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/show_budget.dart';

class BudgetForm extends StatefulWidget {
    //final List<Budget> data;
    //const BudgetForm({Key? key,required this.data,}) : super(key: key);
    const BudgetForm({super.key});

    @override
    State<BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? _jenisBudget;
  List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
  DateTime? _tanggal;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: const Text('Form Budget'),
          ),
          // Menambahkan drawer menu
          drawer: const MyDrawer(),
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          // Menggunakan padding sebesar 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          // Form Judul
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Contoh: Makan Siang",
                                  labelText: "Judul",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                  ),
                              ),
                              // Menambahkan behavior saat judul diketik 
                              onChanged: (String? value) {
                                  setState(() {
                                      _judul = value!;
                                  });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                  setState(() {
                                      _judul = value!;
                                  });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                      return 'Judul tidak boleh kosong!';
                                  }
                                  return null;
                              },
                          ),
                        ),
                        // Form Nominal
                        Padding(
                          // Menggunakan padding sebesar 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          // Form Nominal
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Contoh: 10000",
                                  labelText: "Nominal",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                  ),
                              ),
                              // Menambahkan behavior saat judul diketik 
                              onChanged: (String? value) {
                                  setState(() {
                                      _nominal = int.parse(value!);
                                  });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                  setState(() {
                                      _nominal = int.parse(value!);
                                  });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                      return 'Nominal tidak boleh kosong!';
                                  }
                                  return null;
                              },
                          ),
                        ),
                        // Form Dropdown
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: DropdownButton(
                              value: _jenisBudget,
                              hint: const Text("Pilih Jenis"),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: listJenisBudget
                                  .map<DropdownMenuItem<String>>((String items) {
                                return DropdownMenuItem<String>(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _jenisBudget = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        // Date Form
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime(2030),
                                ).then((value) {
                                  setState(() {
                                    _tanggal = value;
                                  });
                                });
                              },
                              child: Text(_tanggal == null
                                  ? "Pilih Tanggal"
                                  : "${_tanggal!.day}-${_tanggal!.month}-${_tanggal!.year}"),
                            ),
                          ),
                        ),
                        // Save button
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate() && _tanggal != null) {
                              DataBudget.tambahBudget(
                                  judul: _judul,
                                  nominal: _nominal,
                                  jenis: _jenisBudget,
                                  tanggal: _tanggal
                        
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const ShowBudget()),
                              );
                            }
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
          ),
      );
  }
}
```
3. Membuat Class penampung data *budget* dengan nama file data_budget.dart
```
class DataBudget {
  static List<DataBudget> budgetList = [];
  String judul;
  int nominal;
  String jenis;
  DateTime tanggal;

  DataBudget({
    required this.judul,
    required this.nominal,
    required this.jenis,
    required this.tanggal,
  });

  static void tambahBudget({
    required judul,
    required nominal,
    required jenis,
    required tanggal,
  }) {
    budgetList.add(DataBudget(
      judul: judul,
      nominal: nominal,
      jenis: jenis,
      tanggal: tanggal,
    ));
  }
}
```
4. Menambahkan halaman data *budget* dan membuat show_budget.dart
```
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';

class ShowBudget extends StatefulWidget {
  const ShowBudget({super.key});

  @override
  State<ShowBudget> createState() => _ShowBudgetState();
}

class _ShowBudgetState extends State<ShowBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        // Menambahkan drawer menu
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    children: DataBudget.budgetList.isNotEmpty
                        ? DataBudget.budgetList
                            .map((budget) => Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(budget.judul,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            // Date
                                            Text(
                                                "${budget.tanggal.day}-${budget.tanggal.month}-${budget.tanggal.year}"),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(budget.nominal.toString()),
                                            Text(
                                              budget.jenis,
                                              style: TextStyle(
                                                  color: budget.jenis ==
                                                          "Pemasukan"
                                                      ? Colors.green
                                                      : Colors.red),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()
                        : [
                            Center(
                                child: Column(children: const [
                              Text(
                                "Belum ada data budget yang ditambahkan",
                                style: TextStyle(fontSize: 16),
                              ),
                            ]))
                          ]))));
  }
}
```