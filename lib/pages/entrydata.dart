import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_project/Api/EntryApi.dart';
import 'package:test_project/Model/Entries.dart';

class EntryData extends StatefulWidget {
  const EntryData({super.key});

  @override
  State<EntryData> createState() => _EntryDataState();
}

class _EntryDataState extends State<EntryData> {
  late Entry entries;
  List<Entries>? entrylist;
  final EntryApi newentry = new EntryApi();

  Future<void> fetchentry() async {
    final getentry = await newentry.fetchentries();
    if (getentry != null) {
      setState(() {
        entries = getentry;
        setState(() {
          entrylist = entries.entries;
        });
      });
    }
  }

  @override
  void initState() {
    setState(() {
      fetchentry();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry Data"),
      ),
      body: Column(
        children: [
          entrylist != null
              ? Expanded(
                  child: ListView.builder(
                      itemCount: entrylist!.length,
                      itemBuilder: (context, index) {
                        final datalist = entrylist![index];
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(datalist.aPI.toString()),
                              Text(datalist.category.toString()),
                              // Text(datalist.description.toString()),
                              // Text(datalist.link.toString()),
                            ],
                          ),
                        );
                      }))
              : Text("data is loading")
        ],
      ),
    );
  }
}
