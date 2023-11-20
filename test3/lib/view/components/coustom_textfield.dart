import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/listners_utils.dart';

class CoustomTextfield extends StatelessWidget {
  String labelText;
  String placeholder;
  bool isPasswordTextField;
  double width;
  late TextEditingController controller;
  FocusNode FocusNodeNames;
  var changeFocusNode;
  IconData iconName;
  var maxline;

  CoustomTextfield({
    super.key,
    required this.labelText,
    required this.placeholder,
    required this.isPasswordTextField,
    required this.width,
    required this.controller,
    required this.maxline,
    required this.FocusNodeNames,
    required this.changeFocusNode,
    required this.iconName,
  });

  // bool _isObscure = true;

  ValueNotifier<bool> _isObscure = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print("built method ran");
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
      child: ValueListenableBuilder(
        valueListenable: _isObscure,
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            width: width,
            child: TextFormField(
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onFieldSubmitted: (String value) {
                  FocusScope.of(context).requestFocus(changeFocusNode);
                },
                autocorrect: true,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                maxLines: maxline,
                obscureText: _isObscure.value,
                validator: (value) {},
                controller: controller,
                textInputAction: TextInputAction.next,
                focusNode: FocusNodeNames,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: placeholder,
                  // labelText: labelText,
                  labelStyle: TextStyle(color: HexColor("#133C58")),
                  hintStyle: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.038,
                      color: HexColor('#133C58')),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: HexColor("#133C58"), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: HexColor("#133C58"), width: 1),
                  ),
                )),
          );
        },
      ),
    );
  }
}
