import 'package:flutter/material.dart';
import 'package:school_m/views/school_page.dart';

import 'color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SchoolPage(),
      theme: colorScheme,
    );
  }
}
