import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReuseButton extends StatelessWidget {
  const ReuseButton({super.key, required this.buttonName, required this.buttonColor, required this.onTap});

  final String buttonName;
  final Color buttonColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 8.0),
          child: Text(
            buttonName,
            style: GoogleFonts.nunitoSans(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}