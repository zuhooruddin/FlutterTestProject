import 'package:test_project/Model/Entries.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntryApi {
  Future<Entry?> fetchentries() async {
    http.Response response;

    response = await http.get(Uri.parse("https://api.publicapis.org/entries"));

    if (response.statusCode == 200) {
      final jresponse = response.body;

      Entry entry = Entry.fromJson(json.decode(jresponse));
      return entry;
    }
  }
}
