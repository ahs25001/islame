import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islame2/models/ResponseApi.dart';

class ApiManager {
  static Future<RadioModel> getData(String language) async {
    if (language == "en") {
      language = "eng";
    }
    Uri url =
        Uri.parse("https://mp3quran.net/api/v3/radios?language=$language");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    RadioModel responseApi =RadioModel.fromJson(json);
    return responseApi;
  }
}
