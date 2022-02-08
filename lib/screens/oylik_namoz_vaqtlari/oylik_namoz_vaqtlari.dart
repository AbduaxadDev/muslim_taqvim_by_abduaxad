import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

import 'package:intl/intl.dart';

class MonthlyPrayingTimes extends StatefulWidget {
  MonthlyPrayingTimes({Key? key}) : super(key: key);

  @override
  State<MonthlyPrayingTimes> createState() => _MonthlyPrayingTimesState();
}

class _MonthlyPrayingTimesState extends State<MonthlyPrayingTimes> {
  Box<ModelPrayingTimes>? nomoz_times = Boxes.getTime();

  int? month_days;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oylik taqvim"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(color: Colors.black, width: 1),
                children: List.generate(
                  nomoz_times!.length + 1,
                  (index) {
                    if (index != 0) {
                      index -= 1;
                      ModelPrayingTimes soatlar =
                          nomoz_times!.values.toList()[index];
                      String sana = nomoz_times!.values
                          .toList()[index]
                          .date
                          .toString()
                          .split(" ")[0];
                      sana = DateFormat.MMMd().format(DateTime.parse(sana));
                      return TableRow(
                        decoration: BoxDecoration(color: Colors.blue.shade100),
                        children: [
                          Center(child: Text(sana)),
                          Center(child: Text("${soatlar.times!.tongSaharlik}")),
                          Center(child: Text("${soatlar.times!.quyosh}")),
                          Center(child: Text("${soatlar.times!.peshin}")),
                          Center(child: Text("${soatlar.times!.asr}")),
                          Center(child: Text("${soatlar.times!.shomIftor}")),
                          Center(child: Text("${soatlar.times!.hufton}")),
                        ],
                      );
                    } else {
                      return const TableRow(
                        decoration: BoxDecoration(color: Colors.greenAccent),
                        children: [
                          Center(child: Text("Sana")),
                          Center(child: Text("Bomdod")),
                          Center(child: Text("Quyosh")),
                          Center(child: Text("Peshin")),
                          Center(child: Text("Asr")),
                          Center(child: Text("Shom")),
                          Center(child: Text("Xufton")),
                        ],
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Center(
                  child: Text(
                    "${nomoz_times!.values.first.region} uchun 1 oylik nomoz vaqtlari. O'zbekiston Musulmonlar idorasi ma'lumotlariga ko'ra olinmoqda",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: ConstantSizes.header_third_size),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
