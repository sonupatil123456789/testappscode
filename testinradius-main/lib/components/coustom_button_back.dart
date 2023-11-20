import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomButtonBack extends StatelessWidget {
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
  CoustomButtonBack(
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
                gradient: CoustomTheams.buttonGradient
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(name,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize,
                        color: textColor)),
              ],
            )),
      ),
    );
  }
}
