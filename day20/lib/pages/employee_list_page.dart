import 'dart:io';

import 'package:day20/employee_model.dart';
import 'package:day20/pages/employee_details_page.dart';
import 'package:day20/pages/new_employee_page.dart';
import 'package:day20/providers/employee_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeListPage extends StatefulWidget {
  static const String routeName = '/';
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {

  Future<bool?> deleteConfirmationDialog(DismissDirection dismissDirection){
    return showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Delete'),
      content: const Text('Sure to delete this employee?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context,false),
            child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () => Navigator.pop(context,true),
            child: const Text('Yes')),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee List'),),
      body: Consumer<EmployeeProvider>(
        builder: (context,provider,child) =>ListView.builder(
            itemCount: employeeList.length,
            itemBuilder: (context,index){
              final emp = employeeList[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.delete,size: 35,color: Colors.white,),
                ),
                confirmDismiss: deleteConfirmationDialog,
                onDismissed: (_){
                  provider.deleteEmployee(emp);
                },
                child: ListTile(
                  onTap: ()=>Navigator.pushNamed(context, EmployeeDetailsPage.routeName,arguments: emp),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(File(emp.img)),
                  ),
                  title: Text(emp.name),
                  subtitle: Text(emp.desingnation),
                  trailing: IconButton(
                    onPressed: (){
                      provider.updateFavorite(index);
                    },
                    icon: Icon(emp.favorite ? Icons.favorite : Icons.favorite_border),
                  ),
                ),
              );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, NewEmployeePage.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}
