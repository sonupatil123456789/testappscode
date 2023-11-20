import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomButtonFrount extends StatelessWidget {

  // there is two option to passed in coustom button color or gradient color  from this only one can be selected ither the back ground color or the gradientbackground color

  String name;
  IconData icon;
  double width;
  double height;
  Function onTapHandler;
  Color backgroundColor;
  dynamic gradientBackgroundColor;
  double validateOpacity;
  Color textColor;
  Color iconColor;
  dynamic fontSize;
  double iconSize;
  CoustomButtonFrount(
      {super.key,
      required this.name,
      required this.icon,
      required this.width,
      required this.height,
      required this.onTapHandler,
      required this.backgroundColor,
      required this.gradientBackgroundColor,
      required this.validateOpacity,
      required this.textColor,
      required this.fontSize,
      required this.iconSize,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapHandler();
      },
      child: Opacity(
        opacity: validateOpacity,
        child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                gradient: gradientBackgroundColor,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize,
                        color: textColor)),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                )
              ],
            )),
      ),
    );
  }
}
