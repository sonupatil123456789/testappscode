import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class Cards extends StatefulWidget {
  // final String textprimary;
  // final String textsecondary;
  // // final String iconname;
  // final String value;
  // final String unit;

  // const Cards({
  //   Key? key,
  //   required this.textprimary,
  //   required this.textsecondary,
  //   // required this.iconname,
  //   required this.value,
  //   required this.unit,
  // }) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        height: 300.0,
        width: screenwidth,
        child: Wrap(
          runSpacing: 25,
          alignment: WrapAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 20, right: 0),
              child: Container(
                // width: 364,
                width: screenwidth * 0.88,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: HexColor("#FFFFFF"),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: HexColor("#000000"),
                        ),
                        child: Icon(
                          Icons.notifications_active,
                          size: 20,
                          color: HexColor("#FFFFFF"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "240.0 m/sec",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: HexColor('#212121')),
                            ),
                            Text(
                              "Gas leakage dectection emergancy mode",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14,
                                  color: HexColor('#212121')),
                            )
                          ]),
                    ]),
              ),
            ),
////////////////////////////////////////////////////////////////////////////////////////////////////
            Container(
              width: 160,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HexColor("#FFFFFF"),
                // color: HexColor("#FCFEFF"),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // color: Colors.cyan,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: HexColor("#000000"),
                          ),
                          child: Icon(
                            Icons.scale,
                            size: 20,
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "45",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: HexColor('#212121')),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "KG",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: HexColor('#212121')),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: screenwidth,
                    // color: Color.fromARGB(255, 34, 207, 81),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: HexColor('#212121')),
                            ),
                            Text("Measure the weight",
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    color: HexColor('#212121')))
                          ]),
                    ),
                  )
                ],
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////////////////////////
            Container(
              width: 160,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HexColor("#FFFFFF"),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // color: Colors.cyan,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: HexColor("#000000"),
                          ),
                          child: Icon(
                            Icons.air,
                            size: 20,
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "600",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: HexColor('#212121')),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  " PPM",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: HexColor('#212121')),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: screenwidth,
                    // color: Color.fromARGB(255, 34, 207, 81),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gas Leakage",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: HexColor('#212121'))),
                            Text(
                              "Check the gas leakage ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14,
                                  color: HexColor('#212121')),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            )
////////////////////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
