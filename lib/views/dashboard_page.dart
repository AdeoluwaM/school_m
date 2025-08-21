import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_m/components/custom_drop_down.dart';
import 'package:school_m/components/reuse_button.dart';
import 'package:school_m/models/build_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // String? selectedValue;

  String? selectedProgramme;
  String? selectedFaculty;
  String? selectedDepartment;
  String? selectedLevel;
  String? selectedSession;
  String? selectedpayment;

  final buildModel = BuildModel();

  /*
  Below begins code for the table
   */

  List<dynamic> students = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final url = Uri.parse('API call URL');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          students = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load students");
      }
    } catch (e) {
      print("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            ' ',
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
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            //Top container for welcome and all
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Welcome',
                          style: GoogleFonts.nunitoSans(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // drop down buttons
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // programmes
                CustomDropDown(
                  value: selectedProgramme,
                  onChanged: (value) {
                    setState(() {
                      selectedProgramme = value;
                      selectedFaculty = null;
                      selectedDepartment = null;
                    });
                  },
                  hintText: 'Programme',
                  items: BuildModel().programmes
                      .map(
                        (programme) => DropdownMenuItem<String>(
                          value: programme,
                          child: Text(programme),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(width: 10),
                // faculties
                CustomDropDown(
                  value: selectedFaculty,
                  onChanged: (value) {
                    setState(() {
                      selectedFaculty = value;
                      selectedDepartment = null;
                    });
                  },
                  hintText: 'Faculty',
                  items: selectedProgramme == null
                      ? []
                      : (buildModel.faculties[selectedProgramme] ?? [])
                            .map(
                              (faculty) => DropdownMenuItem<String>(
                                value: faculty,
                                child: Text(faculty),
                              ),
                            )
                            .toList(),
                ),
                SizedBox(width: 10),
                // department
                CustomDropDown(
                  value: selectedDepartment,
                  onChanged: (value) {
                    setState(() {
                      selectedDepartment = value;
                    });
                  },
                  hintText: 'Departments',
                  items: selectedFaculty == null
                      ? []
                      : (buildModel.departments[selectedFaculty] ?? [])
                            .map(
                              (dept) => DropdownMenuItem<String>(
                                value: dept,
                                child: Text(dept),
                              ),
                            )
                            .toList(),
                ),
                SizedBox(width: 10),
                // levels
                if (selectedProgramme != "Masters")
                  CustomDropDown(
                    value: selectedLevel,
                    onChanged: (value) {
                      setState(() {
                        selectedLevel = value;
                      });
                    },
                    hintText: 'Level',
                    items: BuildModel().levels
                        .map(
                          (level) => DropdownMenuItem<String>(
                            value: level,
                            child: Text(level),
                          ),
                        )
                        .toList(),
                  ),
                SizedBox(width: 10),
                // Sessions
                CustomDropDown(
                  value: selectedSession,
                  onChanged: (value) {
                    setState(() {
                      selectedSession = value;
                    });
                  },
                  hintText: 'Sessions',
                  items: BuildModel().sessions
                      .map(
                        (session) => DropdownMenuItem<String>(
                          value: session,
                          child: Text(session),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(width: 10),
                // payment category
                CustomDropDown(
                  value: selectedpayment,
                  onChanged: (value) {
                    setState(() {
                      selectedpayment = value;
                    });
                  },
                  hintText: 'Payment Category',
                  items: BuildModel().payments
                      .map(
                        (payment) => DropdownMenuItem<String>(
                          value: payment,
                          child: Text(payment),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            // export, refresh and search buttons
            Row(
              children: [
                Row(
                  children: [
                    ReuseButton(
                      buttonName: 'Export',
                      buttonColor: Theme.of(context).colorScheme.tertiary,
                      onTap: () {},
                    ),
                    SizedBox(width: 10),
                    ReuseButton(
                      buttonName: 'Refresh',
                      buttonColor: Theme.of(context).colorScheme.secondary,
                      onTap: () {},
                    ),
                  ],
                ),
                // The container below takes search button if later implemented
                Container(),
              ],
            ),
            SizedBox(height: 20),
            // Table result
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  border: TableBorder.all(color: Colors.white, width: 2.0),
                  defaultColumnWidth: IntrinsicColumnWidth(),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      children: [
                        _buildHeaderCell('S/n'),
                        _buildHeaderCell('Name'),
                        _buildHeaderCell('Matric Number'),
                        _buildHeaderCell('Expected Payment'),
                        _buildHeaderCell('Session'),
                        _buildHeaderCell('RRR1'),
                        _buildHeaderCell('RRR2'),
                        _buildHeaderCell('1st Installment'),
                        _buildHeaderCell('2nd Installment'),
                        _buildHeaderCell('Outstanding'),
                      ],
                    ),

                    // Table Body
                    ...students.asMap().entries.map((entry) {
                      final index = entry.key; // For S/n
                      final student = entry.value;

                      return TableRow(
                        children: [
                          _buildBodyCell((index + 1).toString()),
                          _buildBodyCell(student["name"]),
                          _buildBodyCell(student["matricNo"]),
                          _buildBodyCell(student["expectedPayment"].toString()),
                          _buildBodyCell(student["session"]),
                          _buildBodyCell(student["rrr1"]),
                          _buildBodyCell(student["rrr2"]),
                          _buildBodyCell(student["firstInstallment"].toString()),
                          _buildBodyCell(student["secondInstallment"].toString()),
                          _buildBodyCell(student["secondInstallment"].toString()),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildHeaderCell
  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: GoogleFonts.nunitoSans(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.visible,
      ),
    );
  }

  // Widget _buildBodyCell
  Widget _buildBodyCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
