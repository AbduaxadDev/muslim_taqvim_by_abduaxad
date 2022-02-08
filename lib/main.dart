import 'package:timezone/data/latest.dart' as tz;
import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  Directory file_path = await path_provider.getApplicationDocumentsDirectory();
  await InitializeHive.hive_init(file_path);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ramazon',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.light,
      initialRoute: "/",
      onGenerateRoute: (settings) => RouterGenerator.generateRoute(settings),
    );
  }
}
