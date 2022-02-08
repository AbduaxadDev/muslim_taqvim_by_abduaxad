import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bool _switchValueIftar = false;
  final bool _switchValueSaher = false;
  final format = DateFormat("dd-MM-yyyy");

  final now = DateTime.now();
  List<ModelPrayingTimes>? pray_times;
  ModelPrayingTimes? today;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {

    checkAlarmBox();
    checkingDataBase();
    pray_times = Boxes.getTime().values.toList();

    for (var e in pray_times!) {
      format.format(now) == format.format(e.date!) ? today = e : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerPage(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        getWidth(20), getHeight(0), getWidth(0), getHeight(10)),
                    child: SizedBox(
                        height: getHeight(170),
                        width: getWidth(220),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              icon: const Icon(Icons.menu),
                              padding: const EdgeInsets.only(left: 0),
                              alignment: Alignment.centerLeft,
                              iconSize: 30,
                            ),
                            Text(
                              "Muslim Taqvimi",
                              style: TextStyle(
                                fontSize: ConstantSizes.hearder_one_size,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: getHeight(130),
                    width: getWidth(110),
                    child: Image.asset(
                      ConstantLinks.lantern_image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    getWidth(20), getHeight(10), getWidth(20), getHeight(20)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.57,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ContainerDecoration(
                            child: IftarSaharAlert(
                              sub_text: "Iftorlik Vaqti",
                              icon: Icon(
                                Icons.light_mode_outlined,
                                size: ConstantSizes.icon_size,
                              ),
                              rozaVaqti: today!,
                            ),
                            height: 210,
                            width: 155,
                          ),
                          ContainerDecoration(
                            child: IftarSaharAlert(
                              sub_text: "Saharlik Vaqti",
                              icon: Icon(
                                Icons.nights_stay_outlined,
                                size: ConstantSizes.icon_size,
                              ),
                              rozaVaqti: today!,
                            ),
                            height: 210,
                            width: 155,
                          ),
                        ],
                      ),
                      ContainerDecoration(
                        child: AzonTimes(
                          nomoz_vaqti: today!,
                        ),
                        height: 470,
                        width: 170,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SizedBox(
          height: getHeight(60),
          width: getWidth(210),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, "/countdown", arguments: today);
            },
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            label: const Center(
              child: Text("Batafsil"),
            ),
          ),
        ),
      ),
    );
  }

  checkAlarmBox() async {
    // *Opening Alarm HiveBox
    Box alarmBox = Boxes.getAlarm();
    if (alarmBox.isEmpty) {
      final newAlarm = AlarmModel(
          saharlik: false,
          iftorlik: false,
          bomdod: false,
          quyosh: false,
          peshin: false,
          asr: false,
          shom: false,
          xufton: false);
      await alarmBox.add(newAlarm);
    }
  }

  checkingDataBase() async {
    List<ModelPrayingTimes> datas = [];

    Box<ModelPrayingTimes> boxtime = Boxes.getTime();

    if (boxtime.isEmpty) {
      print("1");
      // TODO viloyat nomini parametr sifatida jo'nat
      await ServicePrayingTimes.getTimes("toshkent")
          .then((value) => datas = value);

      datas.sort((a, b) {
        var aDate = a.date;
        var bDate = b.date;
        return aDate!.compareTo(bDate!);
      });
      for (ModelPrayingTimes model in datas) {
        await boxtime.add(model);
      }
    } else {

      if (DateFormat('MM').format(now) !=
          DateFormat('MM').format(boxtime.values.toList().last.date!)) {
        print("object");
        await ServicePrayingTimes.getTimes(
                boxtime.values.first.region.toString())
            .then((value) => datas = value);
        await boxtime.clear();

        datas.sort((a, b) {
          var aDate = a.date;
          var bDate = b.date;
          return aDate!.compareTo(bDate!);
        });

        for (ModelPrayingTimes model in datas) {
          await boxtime.add(model);
        }
      }
    }
  }
}
