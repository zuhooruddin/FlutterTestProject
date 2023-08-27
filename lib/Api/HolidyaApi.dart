import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_project/Model/Holidaysmodel.dart';

class HolidayApi {
  Future<List<Holidays>?> fetchholiday() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://date.nager.at/api/v2/publicholidays/2020/US"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonlist = json.decode(response.body);

      print(jsonlist);
      return jsonlist.map((e) => Holidays.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
