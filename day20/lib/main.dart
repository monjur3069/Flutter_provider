import 'package:day20/pages/employee_details_page.dart';
import 'package:day20/pages/employee_list_page.dart';
import 'package:day20/pages/new_employee_page.dart';
import 'package:day20/providers/employee_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => EmployeeProvider() ..getAllEmployees(),
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: EmployeeListPage.routeName,
      routes: {
        EmployeeListPage.routeName: (context) => EmployeeListPage(),
        NewEmployeePage.routeName: (context) => NewEmployeePage(),
        EmployeeDetailsPage.routeName: (context) => EmployeeDetailsPage(),
      },
    );
  }
}