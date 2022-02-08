import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class Boxes {
  static Box<ModelPrayingTimes> getTime() =>
      Hive.box<ModelPrayingTimes>("nomoz_vaqtlari");
  static Box<QuranArabianModel> getQuran() =>
      Hive.box<QuranArabianModel>("quran");
  static Box<QuranInArabianModel> getQuranInArabian() =>
      Hive.box<QuranInArabianModel>("quran_in_arabian");
  static Box<OllohIsmlariModel> getNames() =>
      Hive.box<OllohIsmlariModel>("ismlar");
  static Box<AlarmModel> getAlarm() => Hive.box<AlarmModel>("alarms");
}