import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class section1Card extends StatefulWidget {
  var cta;
  section1Card({super.key, required this.cta});
  @override
  State<section1Card> createState() => _section1CardState();
}

class _section1CardState extends State<section1Card> {
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          width: width * 0.25,
          height: height * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Color(0x3fffffff),
                blurRadius: 4,
                offset: Offset(0, -1),
              ),
            ],
            color: Color(0xff1b2152),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 19,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: FlutterLogo(size: 40),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.cta,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // SizedBox(width: 10,),
      ],
    );
  }
}
