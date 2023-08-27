import 'package:flutter/material.dart';
import 'package:test_project/Model/Albummodel.dart';
import 'package:test_project/pages/Adddata.dart';
import 'package:test_project/pages/AlbumPage.dart';
import 'package:test_project/pages/Countries.dart';
import 'package:test_project/pages/Holidaypage.dart';
import 'package:test_project/pages/employeedata.dart';
import 'package:test_project/pages/entrydata.dart';
import 'package:test_project/pages/joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY API CALL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My API CALL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    child: Text(
                      "Add Data",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddData()),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text(
                      "Album Page",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AlbumList()),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 15, 27, 43),
                        elevation: 2,
                        backgroundColor: Colors.amber),
                  ),
                  TextButton(
                    child: Text(
                      "Countries Page",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Countrie()),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
                  ),
                  TextButton(
                    child: Text(
                      "Employee Page",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmployeeData()),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
                  ),
                  TextButton(
                    child: Text(
                      "Entry Page",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EntryData()),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
                  ),
                  TextButton(
                    child: Text(
                      "Holiday Page",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HolidayPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
                  ),
                  TextButton(
                    child: Text(
                      "Joke Page",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JokePage()),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
