import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class InitializeHive {
  static hive_init(Directory file_path) async {
    Hive.init(file_path.path);
    Hive.registerAdapter(ModelPrayingTimesAdapter());
    Hive.registerAdapter(TimesAdapter());
    Hive.registerAdapter(QuranArabianModelAdapter());
    Hive.registerAdapter(AyahAdapter());
    Hive.registerAdapter(QuranInArabianModelAdapter());
    Hive.registerAdapter(OyatAdapter());
    Hive.registerAdapter(OllohIsmlariModelAdapter());
    Hive.registerAdapter(AlarmModelAdapter());

    await Hive.openBox<ModelPrayingTimes>("nomoz_vaqtlari");
    await Hive.openBox<QuranArabianModel>("quran");
    await Hive.openBox<QuranInArabianModel>("quran_in_arabian");
    await Hive.openBox<OllohIsmlariModel>("ismlar");
    await Hive.openBox<AlarmModel>("alarms");
  }
}

