import 'package:hive/hive.dart';
part 'budilnik.g.dart';

@HiveType(typeId: 7)
class AlarmModel extends HiveObject {
  @HiveField(0)
  bool saharlik;
  @HiveField(1)
  bool iftorlik;
  @HiveField(2)
  bool bomdod;
  @HiveField(3)
  bool quyosh;
  @HiveField(4)
  bool peshin;
  @HiveField(5)
  bool asr;
  @HiveField(6)
  bool shom;
  @HiveField(7)
  bool xufton;

  AlarmModel({
    required this.saharlik,
    required this.iftorlik,
    required this.bomdod,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shom,
    required this.xufton,
  });
}
