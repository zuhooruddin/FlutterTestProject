import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_project/Api/HolidyaApi.dart';
import 'package:test_project/Model/Holidaysmodel.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  List<Holidays>? holdays;

  HolidayApi api = new HolidayApi();

  Future<void> fetchholidays() async {
    final data = await api.fetchholiday();
    if (data != null) {
      setState(() {
        holdays = data;
      });
    }
  }

  @override
  void initState() {
    fetchholidays();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Holiday")),
      body: Column(
        children: [
          holdays != null
              ? Expanded(
                  child: ListView.builder(
                      itemCount: holdays!.length,
                      itemBuilder: (context, index) {
                        final days = holdays![index];
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(days.name.toString()),
                              Text(days.localName.toString()),
                              Text(days.counties.toString()),
                              Text(days.countryCode.toString()),
                              Text(days.launchYear.toString()),
                              Text(days.global.toString()),
                              Text(days.global.toString()),
                            ],
                          ),
                        );
                      }))
              : Text(" Loading")
        ],
      ),
    );
  }
}
