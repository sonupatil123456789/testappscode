import 'package:flutter/material.dart';
import 'package:test/components/coustom_otp_textfield.dart';

FocusNode OtpFocusNode1 = FocusNode();
FocusNode OtpFocusNode2 = FocusNode();
FocusNode OtpFocusNode3 = FocusNode();
FocusNode OtpFocusNode4 = FocusNode();
FocusNode OtpFocusNode5 = FocusNode();
FocusNode OtpFocusNode6 = FocusNode();

class CoustomOTPComponent extends StatefulWidget {
  Function getOtp;
  Function submitOtp;

  CoustomOTPComponent(
      {super.key, required this.getOtp, required this.submitOtp});

  @override
  State<CoustomOTPComponent> createState() => _CoustomOTPComponentState();
}

class _CoustomOTPComponentState extends State<CoustomOTPComponent> {
  String _otpValues = "";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.80,
      height: height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CoustomOtpTextfield(
              width: width * 0.10,
              height: height * 0.07,
              focusNodeName: OtpFocusNode1,
              maxLength: 1,
              getFieldValue: (otpval1) {
                _otpValues = otpval1;
              },
              onFieldSubmit: () {
            },
              changeFocusNodeName: OtpFocusNode2),
          CoustomOtpTextfield(
              width: width * 0.10,
              height: height * 0.07,
              focusNodeName: OtpFocusNode2,
              maxLength: 1,
              getFieldValue: (otpval2) {
                _otpValues = _otpValues + otpval2;
              },
              onFieldSubmit: () {
            },
              changeFocusNodeName: OtpFocusNode3),
          CoustomOtpTextfield(
              width: width * 0.10,
              height: height * 0.07,
              focusNodeName: OtpFocusNode3,
              maxLength: 1,
              getFieldValue: (otpval3) {
                _otpValues = _otpValues + otpval3;
              },
              onFieldSubmit: () {
            },
              changeFocusNodeName: OtpFocusNode4),
          CoustomOtpTextfield(
              width: width * 0.10,
              height: height * 0.07,
              focusNodeName: OtpFocusNode4,
              maxLength: 1,
              getFieldValue: (otpval4) {
                _otpValues = _otpValues + otpval4;
              },
              onFieldSubmit: () {
              widget.submitOtp();
            },
              changeFocusNodeName: OtpFocusNode5),
          CoustomOtpTextfield(
              width: width * 0.10,
              height: height * 0.07,
              focusNodeName: OtpFocusNode5,
              maxLength: 1,
              getFieldValue: (otpval5) {
                _otpValues = _otpValues + otpval5;
              },
              changeFocusNodeName: OtpFocusNode6,
              onFieldSubmit: () {

            },
              
              ),
          CoustomOtpTextfield(
            width: width * 0.10,
            height: height * 0.07,
            focusNodeName: OtpFocusNode6,
            maxLength: 1,
            getFieldValue: (otpval6) {
              _otpValues = _otpValues + otpval6;
              widget.getOtp(_otpValues);
            },
            changeFocusNodeName: OtpFocusNode6,
            onFieldSubmit: () {
              widget.submitOtp();
            },
          ),
        ],
      ),
    );
  }
}