import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_project/Api/EmployeeApi.dart';
import 'package:test_project/Model/Employee.dart';

class EmployeeData extends StatefulWidget {
  const EmployeeData({super.key});

  @override
  State<EmployeeData> createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  late Employee employeedata;

  List<Data>? employeelist;

  EmployeeApi employeeApi = new EmployeeApi();

  Future<void> getemployee() async {
    final data = await employeeApi.fetchemployee();

    if (data != null) {
      setState(() {
        employeedata = data;
        setState(() {
          employeelist = employeedata.data;
        });

        print(employeelist![0].employeeName);
      });
    }
  }

  @override
  void initState() {
    getemployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Employee Data")),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ID'),
                Text('Name'),
                Text('Sale Price'),
                Text('Stock'),
              ],
            ),
          ),
          employeelist != null
              ? Expanded(
                  child: ListView.builder(
                      itemCount: employeelist!.length,
                      itemBuilder: ((context, index) {
                        final employe = employeelist![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(employe.id.toString()),
                              Text(employe.employeeName.toString()),
                              Text(employe.employeeAge.toString()),
                              Text(employe.employeeSalary.toString())
                            ],
                          ),
                        );
                      })))
              : Text("Loading"),
        ]));
  }
}
