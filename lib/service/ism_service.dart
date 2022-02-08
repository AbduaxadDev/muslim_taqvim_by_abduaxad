import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

import 'package:http/http.dart' as http;

class ServiceOllohIsmlari {
  static var url = Uri.parse("https://allah-name.p.rapidapi.com/name");
  static var headers = {
    'x-rapidapi-host': "allah-name.p.rapidapi.com",
    'x-rapidapi-key': "5135af140dmshe8830315ad32694p18ac46jsncafa56229fcc"
  };

  static Future<List<OllohIsmlariModel>> getNames() async {
    var response = await http.get(
      url,
      headers: headers,
    );

    var res = jsonDecode(response.body);
    print(res['main'][0]);

    return (res['main'] as List)
        .map((e) => OllohIsmlariModel.fromJson(e))
        .toList();
  }
}
