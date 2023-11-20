import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class Bottom_navbar extends StatefulWidget {
  const Bottom_navbar({Key? key}) : super(key: key);

  @override
  State<Bottom_navbar> createState() => _Bottom_navbarState();
}

class _Bottom_navbarState extends State<Bottom_navbar> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      width: screenwidth,
      height: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: HexColor("#FFFFFF"),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (() {}),
              icon:
                  Icon(FeatherIcons.home, size: 25, color: HexColor('#212121')),
            ),
            IconButton(
              onPressed: (() {}),
              icon:
                  Icon(FeatherIcons.user, size: 25, color: HexColor('#212121')),
            )
          ]),
    );
  }
}
