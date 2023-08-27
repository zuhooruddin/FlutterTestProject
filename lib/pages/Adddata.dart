import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController address = new TextEditingController();

  Future<void> adddata() async {
    http.Response response;
    print(name.text);

    response = await http.post(Uri.parse("http://10.0.3.2:8000/adddata"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'name': name.text,
            'email': email.text,
            'phone': phone.text,
            'city': city.text,
            'address': address.text
          },
        ));

    if (response.statusCode == 200) {
      print("Data sucessdully added");
    } else {
      print("object not added");
    }
  }

  @override
  void initState() {
    setState(() {
      adddata();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter Your Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter Your Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: city,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'city',
                hintText: 'Enter Your city',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'phone',
                hintText: 'Enter Your Phone',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address',
                hintText: 'Enter Your Address',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text(
                "Add Data",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: adddata,
              style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 15, 27, 43),
                  elevation: 2,
                  backgroundColor: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
