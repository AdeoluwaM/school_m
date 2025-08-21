// import 'package:flutter/material.dart';
//
// class DropdownWithHint extends StatefulWidget {
//   const DropdownWithHint({super.key});
//
//   @override
//   State<DropdownWithHint> createState() => _DropdownWithHintState();
// }
//
// class _DropdownWithHintState extends State<DropdownWithHint> {
//   String? selectedValue; // initially null
//
//   final List<String> options = ["Option 1", "Option 2", "Option 3"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Dropdown with Hint")),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.blueAccent),
//             borderRadius: BorderRadius.circular(12),
//             color: Colors.blue[50],
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: selectedValue,
//               hint: const Text("Select an option"), // 👈 hint text
//               icon: const Icon(Icons.arrow_drop_down),
//               isExpanded: true, // makes it take full width
//               items: options.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedValue = value;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_m/models/build_model.dart';

class DropdownWithHint extends StatefulWidget {
  const DropdownWithHint({super.key});

  @override
  State<DropdownWithHint> createState() => _DropdownWithHintState();
}

class _DropdownWithHintState extends State<DropdownWithHint> {
  String? selectedProgramme;
  String? selectedFaculty;

  final buildModel = BuildModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text("Dynamic Dropdowns")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Programme Dropdown
            DropdownButton<String>(
              value: selectedProgramme,
              hint: const Text("Select Programme"),
              isExpanded: true,
              items: buildModel.programmes
                  .map((programme) => DropdownMenuItem<String>(
                value: programme,
                child: Text(programme),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedProgramme = value;
                  selectedFaculty = null; // reset faculty when programme changes
                });
              },
            ),

            const SizedBox(height: 20),

            // Faculty Dropdown (depends on Programme)
            DropdownButton<String>(
              value: selectedFaculty,
              hint: const Text("Select Faculty"),
              isExpanded: true,
              items: selectedProgramme == null
                  ? []
                  : (buildModel.faculties[selectedProgramme] ?? [])
                  .map((faculty) => DropdownMenuItem<String>(
                value: faculty,
                child: Text(faculty),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedFaculty = value;
                });
              },
            ),

            const SizedBox(height: 40),

            // Example: Reuse the selected values anywhere
            Text(
              "Selected: Programme = $selectedProgramme, Faculty = $selectedFaculty",
              style: GoogleFonts.nunitoSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

