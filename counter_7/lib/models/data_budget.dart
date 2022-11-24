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