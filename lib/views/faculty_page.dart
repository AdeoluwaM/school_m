import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_m/components/custom_container.dart';
import 'package:school_m/models/build_model.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mastersFaculties = BuildModel().faculties['Masters'] ?? [];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            'FACULTIES',
            style: GoogleFonts.notoSerif(
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 1,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: GridView.builder(
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 9 / 1.5,
            ),
            itemCount: BuildModel().faculties.length,
            itemBuilder: (context, index) {
              // final faculty = BuildModel().faculties[index];
              final faculty = mastersFaculties[index].toString();
              return CustomContainer(
                cardName: BuildModel().faculties[index].toString(),
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
