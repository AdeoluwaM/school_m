import 'package:flutter/material.dart';

class BuildModel {

  final programmes = ['Masters', 'Undergraduate', 'Diploma', 'Jupeb', 'Pre-Degree'];
  final faculties = {
    'Masters': ['Faculty of Technology', 'Faculty of Engineering'],
    'Undergraduate': ['Faculty of Technology', 'Faculty of Engineering'],
    'Diploma': ['Faculty of Technology', 'Faculty of Engineering'],
  };

  final departments = {
    'Faculty of Technology': ['Quantum', 'Astro'],
    'Faculty of Engineering': ['Botany', 'Zoology'],
  };

  final levels = ['100', '200', '300', '400', '500'];

  final students = {
    'Quantum-100': ['Alice', 'Bob'],
    'Quantum-200': ['Charlie'],
    'Botany-100': ['David'],
  };

}