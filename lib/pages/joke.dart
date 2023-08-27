import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_project/Api/JokeApi.dart';
import 'package:test_project/Model/Joke.dart';

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  joke? myjokes;

  JokeApi alljoke = new JokeApi();

  Future<void> fetchjoke() async {
    final data = await alljoke.fetchjoke();

    if (data != null) {
      setState(() {
        myjokes = data;
      });
    }
  }

  @override
  void initState() {
    fetchjoke();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Joke Page")),
      body: Column(
        children: [
          myjokes != null
              ? Row(
                  children: [
                    Text(myjokes!.id.toString()),
                    Text(myjokes!.punchline.toString()),
                    Text(myjokes!.setup.toString()),
                  ],
                )
              : Text("Data loading"),
        ],
      ),
    );
  }
}
