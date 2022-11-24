import 'package:counter_7/models/data_budget.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/pages/show_budget.dart';

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