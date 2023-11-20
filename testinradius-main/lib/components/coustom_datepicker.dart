import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page10/page10_controller.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomDatePicker extends StatefulWidget {
  Function getDate;
  num width;
  num height;
  Color color;
  String hintText;

  CoustomDatePicker(
      {super.key,
      required this.width,
      required this.height,
       required this.hintText,
      required this.color,
      required this.getDate});

  @override
  State<CoustomDatePicker> createState() => _CoustomDatePickerState();
}

class _CoustomDatePickerState extends State<CoustomDatePicker> {
  late DateTime? pickedDate;
  late String formattedDate = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<Page10Controller>(
      builder:
          (BuildContext context, Page10Controller page10Value, Widget? child) {
        return InkWell(
          onTap: () async {
            pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              // print(
              //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
              widget.getDate(formattedDate);
              page10Value.userLastWorkingDayDate = formattedDate;
            } else {}
          },
          child: Container(
            width: widget.width.toDouble(),
            height: widget.height.toDouble(),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: widget.color,
                border: CoustomTheams.coustomBorder),
            child: Text(
              page10Value.userLastWorkingDayDate.toString() == "" ? widget.hintText.toString() :page10Value.userLastWorkingDayDate.toString() ,
              style: GoogleFonts.poppins(
                  color: CoustomTheams.blackShade54,
                  fontSize: MediaQuery.of(context).size.width * 0.032,
                  fontWeight: FontWeight.w600),
            ),
          ),
        );
      },
    );
  }
}
