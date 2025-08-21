import 'package:flutter/material.dart';
import 'package:school_m/views/dashboard_page.dart';
import 'package:school_m/views/test.dart';

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
      home: DashboardPage(),
      // home: DropdownWithHint(),
      theme: colorScheme,
    );
  }
}
