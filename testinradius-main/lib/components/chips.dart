import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomChips extends StatefulWidget {
  Function deletChip;
  late dynamic dataName;
  dynamic id;

  CoustomChips({
    super.key,
    required this.deletChip,
    required this.id,
    required this.dataName,
  });

  @override
  State<CoustomChips> createState() => _CoustomChipsState();
}

class _CoustomChipsState extends State<CoustomChips> {
  int? _lastIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        deleteIcon: Icon(
          Icons.close,
          color: CoustomTheams.white,
          size: width * 0.034,
        ),
        backgroundColor: CoustomTheams.accentColor,
        onDeleted: () {
          widget.deletChip(widget.id);
        },
        label: Text(
          widget.dataName.toString(),
          style: GoogleFonts.rubik(
              color: CoustomTheams.white,
              fontSize: width * 0.032,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
