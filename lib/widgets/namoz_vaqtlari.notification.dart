import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class Nomoz_Time_Notifier extends StatefulWidget {
  Nomoz_Time_Notifier({
    Key? key,
    required this.text,
    required this.vaqt,
    required this.nomoz_vaqti,
    required this.update,
  }) : super(key: key);

  int vaqt;
  String text;
  DateTime nomoz_vaqti;
  final update;

  @override
  State<Nomoz_Time_Notifier> createState() => _Nomoz_Time_NotifierState();
}

class _Nomoz_Time_NotifierState extends State<Nomoz_Time_Notifier> {
  Box<AlarmModel> alarmBox = Boxes.getAlarm();
  List<AlarmModel> alarms = [];
  bool? changeedValue;

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> selectTime(int v) async {
    switch (v) {
      case 1:
        return alarmBox.values.first.bomdod;
      case 2:
        return alarmBox.values.first.quyosh;
      case 3:
        return alarmBox.values.first.peshin;
      case 4:
        return alarmBox.values.first.asr;
      case 5:
        return alarmBox.values.first.shom;
      case 6:
        return alarmBox.values.first.xufton;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: FutureBuilder(
        future: selectTime(widget.vaqt),
        builder: (context, AsyncSnapshot snap) {
          changeedValue = snap.data;

          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snap.hasError) {
            return const Center(
              child: Text("No Data found"),
            );
          } else {
            return ListTile(
              dense: true,
              onTap: () async {
                changeedValue = await snap.data;
                print(snap.data);

                await updateBox(widget.vaqt);
                setState(() {});
                await alarmBox.values.first.save();
                changeedValue!
                    ? SetNotifications.setNotifications(
                        id: widget.vaqt,
                        title: widget.text,
                        body:
                            "${widget.text} vaqti kirdi! Nomoz o'z vaqtida o'qilishi farz qilingan.E'tiborli bo'ling!",
                        payload: "",
                        joriy_nomoz_vaqti: widget.nomoz_vaqti,
                      )
                    : await SetNotifications.deleteNotification(widget.vaqt);

                widget.update();
              },
              tileColor: changeedValue!
                  ? ConstantColors.selected_namaz_time_color
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: getWidth(6)),
              trailing: CircleAvatar(
                radius: 13,
                backgroundColor: Colors.black,
                child: changeedValue! ? checkedIcon() : uncheckedIcon(),
              ),
              title: Text(
                widget.text,
                style: const TextStyle(fontSize: 18.0),
              ),
            );
          }
        },
      ),
    );
  }

  checkedIcon() => const Icon(
        Icons.check,
        color: Colors.white,
        size: 18,
      );
  uncheckedIcon() => const Icon(
        Icons.circle,
        color: Colors.white,
      );

  updateBox(int index) async {
    switch (index) {
      case 1:
        alarmBox.values.first.bomdod = !alarmBox.values.first.bomdod;
        break;
      case 2:
        alarmBox.values.first.quyosh = !alarmBox.values.first.quyosh;

        break;

      case 3:
        alarmBox.values.first.peshin = !alarmBox.values.first.peshin;

        break;

      case 4:
        alarmBox.values.first.asr = !alarmBox.values.first.asr;

        break;

      case 5:
        alarmBox.values.first.shom = !alarmBox.values.first.shom;

        break;

      case 6:
        alarmBox.values.first.xufton = !alarmBox.values.first.xufton;

        break;
    }
  }
}
