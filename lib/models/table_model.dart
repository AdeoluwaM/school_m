import 'package:flutter/material.dart';

class StudentPayment {
  final String name;
  final String matricNumber;
  final String expectedPayment;
  final String session;
  final String rrr1;
  final String rrr2;
  final String firstInstallment;
  final String secondInstallment;
  final String outstanding;

  StudentPayment({
    required this.name,
    required this.matricNumber,
    required this.expectedPayment,
    required this.session,
    required this.rrr1,
    required this.rrr2,
    required this.firstInstallment,
    required this.secondInstallment,
    required this.outstanding,
  });
}