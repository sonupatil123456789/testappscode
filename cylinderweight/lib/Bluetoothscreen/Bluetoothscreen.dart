import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bluetooth_app/Backbtnnavbar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class Bluetooth_screen extends StatefulWidget {
  const Bluetooth_screen({Key? key}) : super(key: key);

  @override
  State<Bluetooth_screen> createState() => _Bluetooth_screenState();
}

class _Bluetooth_screenState extends State<Bluetooth_screen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Back_btn_navbar(navname: "Details"),
            Expanded(
              child: Container(
                width: screenwidth,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: HexColor("#EDF7FF"),
                ),
                child: Column(children: [
                  Container(
                    width: screenwidth,
                    // color: Color.fromARGB(255, 7, 255, 48),
                    height: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("hello");
                          },
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              // color: HexColor("#EB304A"),
                              color: HexColor('#1FAEFF'),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bluetooth_connected,
                                  color: HexColor("#FFFFFF"),
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Scanning...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: HexColor('#FFFFFF')),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.amber,
                      height: 300.0,
                      width: screenwidth,
                      child: Wrap(
                        // runSpacing: 25,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
////////////////////////////////////////////////////////////////////////////////////////////////////
                          GestureDetector(
                            onTap: () {
                              print("hello blue");
                            },
                            child: Container(
                              // width: 364,
                              width: screenwidth * 0.88,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: HexColor("#EDF7FF"),
                                // color: HexColor("#FFFFFF"),
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
                                        Icons.devices,
                                        size: 20,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ESP32_Classic_bt",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: HexColor('#212121')),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "81:65:73:88:34:96",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 16,
                                                color: HexColor('#212121')),
                                          )
                                        ]),
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("hello blue");
                            },
                            child: Container(
                              // width: 364,
                              width: screenwidth * 0.88,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: HexColor("#EDF7FF"),
                                // color: HexColor("#FFFFFF"),
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
                                        Icons.devices,
                                        size: 20,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ESP32_Classic_bt",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: HexColor('#212121')),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "81:65:73:88:34:96",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 16,
                                                color: HexColor('#212121')),
                                          )
                                        ]),
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("hello blue");
                            },
                            child: Container(
                              // width: 364,
                              width: screenwidth * 0.88,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: HexColor("#EDF7FF"),
                                // color: HexColor("#FFFFFF"),
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
                                        Icons.devices,
                                        size: 20,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ESP32_Classic_bt",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: HexColor('#212121')),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "81:65:73:88:34:96",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 16,
                                                color: HexColor('#212121')),
                                          )
                                        ]),
                                  ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("hello blue");
                            },
                            child: Container(
                              // width: 364,
                              width: screenwidth * 0.88,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: HexColor("#EDF7FF"),
                                // color: HexColor("#FFFFFF"),
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
                                        Icons.devices,
                                        size: 20,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ESP32_Classic_bt",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: HexColor('#212121')),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "81:65:73:88:34:96",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 16,
                                                color: HexColor('#212121')),
                                          )
                                        ]),
                                  ]),
                            ),
                          ),

////////////////////////////////////////////////////////////////////////////////////////////////
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
