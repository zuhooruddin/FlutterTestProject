import 'package:test_project/Model/Employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeApi {
  Future<Employee?> fetchemployee() async {
    http.Response response;

    response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));

    if (response.statusCode == 200) {
      var jresponse = response.body;

      Employee emp = Employee.fromJson(json.decode(jresponse));
      return emp;
    }
  }
}
