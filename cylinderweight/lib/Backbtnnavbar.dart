import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bluetooth_app/Homepage.dart';
import 'package:hexcolor/hexcolor.dart';

class Back_btn_navbar extends StatelessWidget {
  final String navname;

  const Back_btn_navbar({
    Key? key,
    required this.navname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      height: 66.0,
      width: screenwidth,
      color: HexColor('EDF7FF'),
      // color: HexColor('FFFFFF'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 22,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) {
                return Home_page(
                  Myname: "",
                  Mynumber: 0,
                  Mypic: "",
                  Message: null,
                );
              }));
            },
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 24,
          ),
          SizedBox(
            width: 18,
          ),
          Text(navname,
              style: TextStyle(
                color: HexColor('#000000'),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              )),
          Container(
            width: screenwidth * 0.20,
            height: 40.0,
            // color: Colors.black,
          ),
        ],
      ),
    );
  }
}
