import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/rest_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: EmployeePage(),
    );
  }
}

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Một Số Mẹo Hữu Ích'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService.getEmployees(),
        builder: (context, snapshot) {
          final employees = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  
                  title: Text( employees[index]['employee_name']),
                  subtitle: Text('♥: ${employees[index]['employee_age']}'),
                );
              },
              itemCount: employees.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      
    );
  }
}