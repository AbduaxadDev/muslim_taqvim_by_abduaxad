import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class ContdownTime extends StatefulWidget {
  @override
  _ContdownTimeState createState() => _ContdownTimeState();
}

class _ContdownTimeState extends State<ContdownTime> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CountdownTimer(
          endTime: endTime,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return const Text('Game over');
            }
            return Text(
                'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
          },
        ),
      ),
    );
  }
}
