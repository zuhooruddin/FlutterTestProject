import 'package:test_project/Model/Albummodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlbumApi {
  Future<List<Album>> fetchalbum() async {
    http.Response response;

    response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonalbum = json.decode(response.body);
      return jsonalbum.map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
