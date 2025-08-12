import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_m/models/table_model.dart';

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
      body: Center(
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
              // TableRow(
              //   children: [
              //     _buildBodyCell('${index + 1}'),
              //     _buildBodyCell(payment.name),
              //     _buildBodyCell(payment.matricNumber),
              //     _buildBodyCell(payment.expectedPayment),
              //     _buildBodyCell(payment.session),
              //     _buildBodyCell(payment.rrr1),
              //     _buildBodyCell(payment.rrr2),
              //     _buildBodyCell(payment.firstInstallment),
              //     _buildBodyCell(payment.secondInstallment),
              //     _buildBodyCell(payment.outstanding),
              //   ]
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildHeaderCell

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
      padding: const EdgeInsets.all(8.0),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}

/*
* Container(
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
      *
       */
