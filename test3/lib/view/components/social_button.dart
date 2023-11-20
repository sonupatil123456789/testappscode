import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/view/components/icon_svg_button.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';

class SocialButton extends StatelessWidget {
  double width;
  double height;
  String btnTitle;
  Color btnColor;
  Color btnTextColor;
  Function onTapHandler;
  dynamic iconImage;
  SocialButton(
      {super.key,
      required this.width,
      required this.height,
      required this.btnTitle,
      required this.btnColor,
      required this.btnTextColor,
      required this.onTapHandler,
      required this.iconImage});

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onTapHandler();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: btnColor,
            border: Border.all(
              width: 1.0,
              color: Color.fromARGB(255, 152, 152, 152),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconImage,
                width: 20, height: 20, semanticsLabel: 'Cart'),
            const SizedBox(
              width: 12,
            ),
            Text(
              btnTitle,
              style: GoogleFonts.poppins(
                  // color: btnTextColor,
                  fontSize: screenwidth * 0.034,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
