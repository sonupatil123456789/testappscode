import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test/utils/listners_utils.dart';

class CoustomOtpTextfield extends StatefulWidget {
  late double width;
  late double height;
  late dynamic focusNodeName;
  late int maxLength;
  late Function getFieldValue;
  late dynamic changeFocusNodeName;
  Function onFieldSubmit;

  CoustomOtpTextfield(
      {super.key,
      required this.width,
      required this.height,
      required this.focusNodeName,
      required this.maxLength,
      required this.getFieldValue,
      required this.onFieldSubmit,
      required this.changeFocusNodeName});

  @override
  State<CoustomOtpTextfield> createState() => _CoustomOtpTextfieldState();
}

class _CoustomOtpTextfieldState extends State<CoustomOtpTextfield> {
  bool setFocus = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        autofocus: setFocus,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        focusNode: widget.focusNodeName,
        onFieldSubmitted: (value) {
          setState(() {
            setFocus = !setFocus;
          });
          widget.onFieldSubmit();
        },
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterText: "",
          labelStyle: TextStyle(color: HexColor("#133C58")),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: HexColor("#94929B"), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: HexColor("#94929B"), width: 1),
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
                'Not A Valid Otp',
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
            FocusScope.of(context).requestFocus(widget.changeFocusNodeName);
          }
        },
      ),
    );
  }
}
