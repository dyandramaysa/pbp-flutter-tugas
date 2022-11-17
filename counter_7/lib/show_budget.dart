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