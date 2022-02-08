import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class RouterGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) =>  MyHomePage(),
        );
      case "/countdown":
        return MaterialPageRoute(
          builder: (context) => CountdownPage(
            today: args as ModelPrayingTimes,
          ),
        );
      case "/quran":
        return MaterialPageRoute(
          builder: (context) => const QuranPage(),
        );
      case "/tasbeh":
        return MaterialPageRoute(
          builder: (context) => Tasbeh(),
        );
      case "/muborak_kunlar":
        return MaterialPageRoute(
          builder: (context) => const MuborakKunlarPage(),
        );
      case "/ismlar":
        return MaterialPageRoute(
          builder: (context) => IsmlarPage(),
        );
      case "/qibla":
        return MaterialPageRoute(
          builder: (context) => QiblaPage(),
        );
      case "/nomoz_vaqtlari":
        return MaterialPageRoute(
          builder: (context) => MonthlyPrayingTimes(),
        );
      case "/sura":
        List arguments = args as List;
        return MaterialPageRoute(
          builder: (context) => SuraPage(
            sura: arguments[0] as QuranArabianModel,
            suraInArabian: arguments[1] as QuranInArabianModel,
          ),
        );
    }
  }
}
