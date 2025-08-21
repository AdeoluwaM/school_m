import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.hintText,
    required this.items,
  });

  final String? value;
  final void Function(String?)? onChanged;
  final String hintText;
  final List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.0,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: value,
            hint: Text(
              hintText,
              style: GoogleFonts.nunitoSans(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}