import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class buttons extends StatefulWidget {
  IconData buttonname;
  String buttonvalue;
  Function buttonfunction;
  buttons(
      {super.key,
      required this.buttonname,
      required this.buttonvalue,
      required this.buttonfunction});

  @override
  State<buttons> createState() => _buttonsState();
}

class _buttonsState extends State<buttons> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        widget.buttonfunction();
      },
      child: Container(
        width: screenwidth * 0.14,
        height: screenheight * 0.085,
        child: Column(
          children: [
            Container(
                width: screenwidth * 0.10,
                height: screenheight * 0.050,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white60.withOpacity(0.2),
                ),
                child: Icon(
                  widget.buttonname,
                  color: Colors.white60.withOpacity(0.8),
                  size: screenwidth*0.05,
                )),
            SizedBox(
              height: 6,
            ),
            Text(
              "${widget.buttonvalue}",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: screenwidth * 0.030,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

