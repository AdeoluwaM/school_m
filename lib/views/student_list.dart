import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_m/models/table_model.dart';
import '../models/build_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
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
            'STUDENT DATA',
            style: GoogleFonts.notoSerif(
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 1,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: TableBorder.all(color: Colors.white, width: 2.0),
                  defaultColumnWidth: IntrinsicColumnWidth(),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
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
    );
  }

  // Widget _buildHeaderCell
  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: GoogleFonts.notoSerif(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Widget _buildBodyCell
  Widget _buildBodyCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
