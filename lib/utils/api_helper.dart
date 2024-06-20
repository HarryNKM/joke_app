import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jokes_app/screen/home/model/home_model.dart';

class ApiHelper {
  Future<HomeModel?>? getJokeApi({String? q}) async {
    String link =
        "https://api.chucknorris.io/jokes/random?_gl=1*1l8wzcc*_ga*MTIyNDQ4MDg5MC4xNzE4MjUzOTUw*_ga_ZCYG64C7PL*MTcxODg2MTYwMy44LjEuMTcxODg2MTYxMi4wLjAuMA..";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModel? modal = HomeModel.mapToModel(json);
      return modal;
    }
    return null;
  }
}
