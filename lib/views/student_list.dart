import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/build_model.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            'LEVEL LEVEL',
            style: GoogleFonts.notoSerif(
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 1,
      ),
      body: Container(
        color: Color(0xF023868),
        padding: EdgeInsets.all(50),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            border: TableBorder.all(color: Color(0xFF023868), width: 1),
            defaultColumnWidth: FixedColumnWidth(100),
            // children: List.generate(BuildModel().levels.length, generator),
          ),
        ),
      ),
    );
  }
}
