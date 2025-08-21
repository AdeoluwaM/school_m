import 'package:flutter/material.dart';

class BuildModel {

  final programmes = ['Masters', 'Undergraduate', 'Diploma', 'Jupeb', 'Pre-Degree'];
  final faculties = {
    'Masters': ['Faculty of Tech', 'Faculty of Eng', 'Faculty of Science'],
    'Undergraduate': ['Faculty of BMS', 'Faculty of Agric', 'Faculty of Science'],
    'Diploma': ['Faculty of Tech', 'Faculty of Eng', 'Faculty of Science'],
  };

  final departments = {
    'Faculty of Tech': ['Computer Science', 'Software Engineering', 'Cyber Security', 'Data Science'],
    'Faculty of Eng': ['Building Eng', 'Chemical Eng', 'Mech Eng', 'Civil Eng'],
    'Faculty of Science': ['BCH', 'ICH', 'Geology', 'Geophysics'],
  };

  final levels = ['Year 1', 'Year 2', 'Year 3', 'Year 4', 'Year 5'];

  final sessions = ['2024/2025', '2023/2024', '2022/2023', '2021/2022', '2020/2019'];

  final payments = ['Accommodation fee', 'School Fees', 'Acceptance Fee', 'Graduation Fee', 'Convocation Fee'];

  final students = {
    'Year 1': ['Alice', 'Bob'],
    'Year 2': ['Charlie'],
    'Year 3': ['David'],
  };

}