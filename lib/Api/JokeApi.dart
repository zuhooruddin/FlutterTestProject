import 'package:test_project/Model/Joke.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JokeApi {
  Future<joke?> fetchjoke() async {
    http.Response response;

    response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));

    if (response.statusCode == 200) {
      final jokedata = response.body;

      joke jdata = joke.fromJson(json.decode(jokedata));
      return jdata;
    }
  }
}
