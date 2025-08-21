import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_m/components/custom_container.dart';
import 'package:school_m/models/build_model.dart';
import 'package:school_m/views/unused_views/level.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key, required this.faculties});

  final String faculties;

  @override
  Widget build(BuildContext context) {
    // final mastersFaculties = BuildModel().faculties[programme] ?? [];
    final facultyDepartments = BuildModel().departments[faculties] ?? [];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            'DEPARTMENT',
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
        padding: EdgeInsets.all(50),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 9 / 1.5,
          ),
          itemCount: facultyDepartments.length,
          itemBuilder: (context, index) {
            if (facultyDepartments.length <= 3) {
              return SizedBox();
            }
            final department = facultyDepartments[index];
            return CustomContainer(
              cardName: department.toString(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Level();
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
