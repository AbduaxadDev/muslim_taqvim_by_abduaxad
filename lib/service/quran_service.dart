import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

import 'package:http/http.dart' as http;

class ServiceQuran {
  static var url = Uri.parse("http://api.alquran.cloud/v1/quran/uz.sodik");
  static var urlInArabian =
      Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani");

  static Future<List<QuranArabianModel>> getQuran() async {
    var response = await http.get(url);

    var res = jsonDecode(response.body);

    return (res['data']['surahs'] as List)
        .map((e) => QuranArabianModel.fromJson(e))
        .toList();
  }

  static Future<List<QuranInArabianModel>> getQuranInArabian() async {
    var response = await http.get(urlInArabian);

    var res = jsonDecode(response.body);

    return (res['data']['surahs'] as List)
        .map((e) => QuranInArabianModel.fromJson(e))
        .toList();
  }
}
