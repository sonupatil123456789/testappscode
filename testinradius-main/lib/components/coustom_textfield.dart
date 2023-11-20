import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/listners_utils.dart';

class CoustomTextfield extends StatefulWidget {
  late double width;
  late double height;
  late String hintText;
  late int maxLength;
  late dynamic inputFormater;
  late int maxLine;
  late Function getFieldValue;
  late Function onFieldSubmit;
  late TextEditingController fieldController;

  CoustomTextfield(
      {super.key,
      required this.width,
      required this.height,
      required this.hintText,
      required this.maxLength,
      required this.inputFormater,
      required this.onFieldSubmit,
      required this.maxLine,
      required this.getFieldValue,
      required this.fieldController});

  @override
  State<CoustomTextfield> createState() => _CoustomTextfieldState();
}

class _CoustomTextfieldState extends State<CoustomTextfield> {
  bool setFocus = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.fieldController,
        autofocus: setFocus,
        onFieldSubmitted: (value) {
          setState(() {
            setFocus = !setFocus;
          });
        },
        textInputAction: TextInputAction.done,
        maxLength: widget.maxLength,
        keyboardType: widget.inputFormater,
        maxLines: widget.maxLine,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          hintText: widget.hintText,
          labelStyle: TextStyle(color: HexColor("#133C58")),
          hintStyle: GoogleFonts.poppins(
              color: CoustomTheams.blackShade54,
              fontSize: MediaQuery.of(context).size.width * 0.032,
              fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: CoustomTheams.fieldsBorderColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: CoustomTheams.fieldsBorderColor,
          ),
        ),
        onChanged: (value) {
          if (value.length > widget.maxLength) {
            ListnersUtils.showFlushbarMessage(
                'Sallery cannot exceed ${widget.maxLength} digit',
                Colors.yellowAccent,
                Colors.white,
                'Error',
                Icons.error,
                context);
          }
          if (value.isEmpty) {
            ListnersUtils.showFlushbarMessage(
                'Field Should Not Be Empty',
                Colors.yellowAccent,
                Colors.white,
                'Error',
                Icons.error,
                context);
          } else {
            if (kDebugMode) {
              print(value);
            }
            widget.getFieldValue(value);
          }
        },
      ),
    );
  }
}
