import 'package:flutter/material.dart';

class BuildModel {

  final programmes = ['Masters', 'Undergraduate', 'Diploma', 'Jupeb', 'Pre-Degree'];
  final faculties = {
    'Masters': ['Faculty of Technology', 'Faculty of Engineering', 'Faculty of Science'],
    'Undergraduate': ['Faculty of Technology', 'Faculty of Engineering'],
    'Diploma': ['Faculty of Technology', 'Faculty of Engineering'],
  };

  final departments = {
    'Faculty of Technology': ['Computer Science', 'Software Engineering', 'Cyber Security', 'Data Science'],
    'Faculty of Engineering': ['Building Eng', 'Chemical Eng', 'Mech Eng', 'Civil Eng'],
  };

  final levels = ['100', '200', '300', '400', '500'];

  final students = {
    'Quantum-100': ['Alice', 'Bob'],
    'Quantum-200': ['Charlie'],
    'Botany-100': ['David'],
  };

}