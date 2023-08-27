import 'package:test_project/Model/Countries.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountriesApi {
  Future<Countries?> fetchcountries() async {
    http.Response response;

    response = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));

    if (response.statusCode == 200) {
      final cjson = response.body;

      Countries mycountries = Countries.fromJson(json.decode(cjson));
      return mycountries;
    }
  }
}
