import 'package:flutter/material.dart';

class EmployeeModel {
  int? empId;
  String name;
  String dob;
  String img;
  String desingnation;
  String mobileNumber;
  String email;
  String streetAddress;
  num salary;
  String gender;
  bool favorite;

  EmployeeModel(
      {this.empId,
      required this.name,
      required this.dob,
      required this.img,
      required this.desingnation,
      required this.mobileNumber,
      required this.email,
      required this.streetAddress,
      required this.salary,
      required this.gender,
      this.favorite = false
      });
}

final List<EmployeeModel> employeeList = [
  EmployeeModel(
      name: 'Monjur Ahmed',
      dob: '30/07/2022',
      img:
          '/data/user/0/com.example.day20/cache/f91589af-66d2-4bd9-b16b-3a14fc5819b8-1542695444.jpg',
      desingnation: 'CEO',
      mobileNumber: '017*******',
      email: 'monjurahmed.cse@gmail.com',
      streetAddress: 'Kaundia,Savar,Dhaka',
      salary: 50000,
      gender: 'Male'),
];
final designationList = <String>[
  'Director',
  'CEO',
  'CTO',
  'Sales Manager',
  'Project Manager',
  'Senior Developer',
  'Software Engineer'
];
