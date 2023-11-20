import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CoustomTheams {
  static Color lightPurpleColor = HexColor("#F9F5FC"); //

  static Color blackShade54 = Colors.black54;
  static Color black = HexColor("#000000");

  static Color whiteShade = Color.fromARGB(174, 228, 228, 228);
  static Color white = HexColor("#FFFFFF");

  static Color accentColor = HexColor("#FD6A39");
  static Color blue = HexColor("#0D2A3C");
  static Color buttonColor = HexColor("#0D2A3C");
  static Color dissabledColor = Color.fromARGB(255, 223, 223, 223);

  static LinearGradient buttonGradient = LinearGradient(
    colors: [HexColor("#602b87"), HexColor("#211f88")],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static BorderSide fieldsBorderColor = BorderSide(color: HexColor("#94929B"), width: 1);
  static Border coustomBorder = Border.all(color: HexColor("#94929B"), width: 1);


}

























//   dynamic theamMode = false;

//   SetDarkMode(bool mode) {
//     if (mode == true) {
//       theamMode = mode;
//       // lightPurpleColor = Color.fromARGB(255, 255, 255, 255);
//     } else {
//       theamMode = mode;
//       // lightPurpleColor = Colors.black87;
//     }

//     notifyListeners();
//   }
// }

// static BoxShadow buttonBoxShadow = BoxShadow(
//   color: const Color(0xaeaeae).withOpacity(0.74),
//   offset: const Offset(10, 10),
//   blurRadius: 6,
//   spreadRadius: -1,
// );

// card

//   BoxShadow(
//  color: Color(0xaeaeae).withOpacity(0.74),
//  offset: Offset(0, 2),
//  blurRadius: 25,
//  spreadRadius: 4,
// )
