// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bluetooth_app/Backbtnnavbar.dart';
import 'package:flutter_bluetooth_app/Maincard.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class Cylinder_details_page extends StatefulWidget {
  const Cylinder_details_page({Key? key}) : super(key: key);

  @override
  State<Cylinder_details_page> createState() => _Cylinder_details_pageState();
}

class _Cylinder_details_pageState extends State<Cylinder_details_page> {
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
                        Container(
                          width: 280,
                          height: 300,
                          // color: Colors.cyan,
                          child: CustomPaint(
                            // ignore: sized_box_for_whitespace
                            // ignore: sort_child_properties_last
                            size: Size(
                                50,
                                (50 * 1)
                                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter2(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Opacity(
                                  opacity: 1, // 0.0 to 0.1
                                  child: Container(
                                      height: 200, //200 for 100% and
                                      width: 148,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: HexColor("#EB304A"),
                                          width: 6,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                        // color: HexColor("#EB304A"),
                                        // color: HexColor("#FFDA00"),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 60, //188 for 100% and
                                            width: 148,
                                            decoration: BoxDecoration(
                                              color: HexColor("#EB304A"),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(24),
                                                topRight: Radius.circular(24),
                                                bottomLeft: Radius.circular(24),
                                                bottomRight:
                                                    Radius.circular(24),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  height: 30,
                                  width: 148,
                                  // color: Color.fromARGB(255, 127, 100, 215),
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
                      height: 300.0,
                      width: screenwidth,
                      child: Wrap(
                        runSpacing: 25,
                        alignment: WrapAlignment.spaceAround,
                        children: [
////////////////////////////////////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 20, right: 0),
                            child: Container(
                              width: 90,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: HexColor("#FFFFFF"),
                                // color: HexColor("#FCFEFF"),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.cyan,
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: HexColor("#000000"),
                                      ),
                                      child: Icon(
                                        Icons.line_weight_rounded,
                                        size: 20,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 50.0,
                                    width: screenwidth,
                                    // color: Color.fromARGB(255, 71, 34, 207),
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "45",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                  color: HexColor('#212121')),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "KG",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: HexColor('#212121')),
                                            ),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
////////////////////////////////////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 20, right: 0),
                            child: Container(
                              width: 90,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: HexColor("#FFFFFF"),
                                // color: HexColor("#FCFEFF"),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.cyan,
                                    child: Container(
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
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 50.0,
                                    width: screenwidth,
                                    // color: Color.fromARGB(255, 71, 34, 207),
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "3",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                  color: HexColor('#212121')),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "KG",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: HexColor('#212121')),
                                            ),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
////////////////////////////////////////////////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 20, right: 0),
                            child: Container(
                              width: 90,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: HexColor("#FFFFFF"),
                                // color: HexColor("#FCFEFF"),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.cyan,
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: HexColor("#000000"),
                                      ),
                                      child: Icon(
                                        Icons.battery_5_bar,
                                        size: 20,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 50.0,
                                    width: screenwidth,
                                    // color: Color.fromARGB(255, 71, 34, 207),
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "10",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                  color: HexColor('#212121')),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: HexColor('#212121')),
                                            ),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
///////////////////////////////////////////////////////////////////////////////////////////////
                          Container(
                            width: screenwidth * 0.88,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: HexColor("#FFFFFF"),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cylinder company ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: HexColor('#212121')),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "Bharat gas",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: HexColor('#212121')),
                                            )
                                          ]),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cylinder company ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: HexColor('#212121')),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "Bharat gas",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: HexColor('#212121')),
                                            )
                                          ]),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cylinder company ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: HexColor('#212121')),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              "Bharat gas",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: HexColor('#212121')),
                                            )
                                          ]),
                                    ],
                                  ),
                                ]),
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

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffe4222e).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.3505859, size.height * 0.07324219,
            size.width * 0.06445508, size.height * 0.1660156),
        paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffe4222e).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.5849609, size.height * 0.07324219,
            size.width * 0.06445508, size.height * 0.1660156),
        paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5000000, size.height * 0.2539063);
    path_2.arcToPoint(Offset(size.width * 0.4853516, size.height * 0.2392578),
        radius: Radius.elliptical(
            size.width * 0.01464855, size.height * 0.01464855),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.lineTo(size.width * 0.4853516, size.height * 0.1787109);
    path_2.arcToPoint(Offset(size.width * 0.5146484, size.height * 0.1787109),
        radius: Radius.elliptical(
            size.width * 0.01464844, size.height * 0.01464844),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.lineTo(size.width * 0.5146484, size.height * 0.2392578);
    path_2.arcToPoint(Offset(size.width * 0.5000000, size.height * 0.2539063),
        radius: Radius.elliptical(
            size.width * 0.01464855, size.height * 0.01464855),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xfffddd5a).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5367517, size.height * 0.1834421);
    path_3.lineTo(size.width * 0.4632483, size.height * 0.1834421);
    path_3.arcToPoint(Offset(size.width * 0.4632483, size.height * 0.1541452),
        radius: Radius.elliptical(
            size.width * 0.01464844, size.height * 0.01464844),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_3.lineTo(size.width * 0.5367517, size.height * 0.1541452);
    path_3.arcToPoint(Offset(size.width * 0.5367517, size.height * 0.1834421),
        radius: Radius.elliptical(
            size.width * 0.01464844, size.height * 0.01464844),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xfffddd5a).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.7080078, size.height * 0.8750000);
    path_4.lineTo(size.width * 0.7080078, size.height * 0.9267578);
    path_4.arcToPoint(Offset(size.width * 0.6494141, size.height * 0.9853516),
        radius: Radius.elliptical(
            size.width * 0.05859375, size.height * 0.05859375),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_4.lineTo(size.width * 0.3505859, size.height * 0.9853516);
    path_4.arcToPoint(Offset(size.width * 0.2919922, size.height * 0.9267578),
        radius: Radius.elliptical(
            size.width * 0.05859375, size.height * 0.05859375),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_4.lineTo(size.width * 0.2919922, size.height * 0.8750000);

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xffe4222e).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.6201172, size.height * 0.8750000);
    path_5.lineTo(size.width * 0.6201172, size.height * 0.9267578);
    path_5.arcToPoint(Offset(size.width * 0.5615234, size.height * 0.9853516),
        radius: Radius.elliptical(
            size.width * 0.05859375, size.height * 0.05859375),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_5.lineTo(size.width * 0.6494141, size.height * 0.9853516);
    path_5.arcToPoint(Offset(size.width * 0.7080078, size.height * 0.9267578),
        radius: Radius.elliptical(
            size.width * 0.05859375, size.height * 0.05859375),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_5.lineTo(size.width * 0.7080078, size.height * 0.8750000);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xffc0232c).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xffEDF7FF).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2343750, size.height * 0.2392578,
                size.width * 0.5312500, size.height * 0.6503906),
            bottomRight: Radius.circular(size.width * 0.1171875),
            bottomLeft: Radius.circular(size.width * 0.1171875),
            topLeft: Radius.circular(size.width * 0.1171875),
            topRight: Radius.circular(size.width * 0.1171875)),
        paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.6484375, size.height * 0.2392578);
    path_7.lineTo(size.width * 0.5605469, size.height * 0.2392578);
    path_7.arcToPoint(Offset(size.width * 0.6777344, size.height * 0.3564453),
        radius:
            Radius.elliptical(size.width * 0.1171875, size.height * 0.1171875),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_7.lineTo(size.width * 0.6777344, size.height * 0.7724609);
    path_7.arcToPoint(Offset(size.width * 0.5605469, size.height * 0.8896484),
        radius:
            Radius.elliptical(size.width * 0.1171875, size.height * 0.1171875),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_7.lineTo(size.width * 0.6484375, size.height * 0.8896484);
    path_7.arcToPoint(Offset(size.width * 0.7656250, size.height * 0.7724609),
        radius:
            Radius.elliptical(size.width * 0.1171875, size.height * 0.1171875),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_7.lineTo(size.width * 0.7656250, size.height * 0.3564453);
    path_7.arcToPoint(Offset(size.width * 0.6484375, size.height * 0.2392578),
        radius:
            Radius.elliptical(size.width * 0.1171875, size.height * 0.1171875),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xffEDF7FF).withOpacity(1.0);
    canvas.drawPath(path_7, paint_7_fill);

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Color(0xffeb304a).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2949219, size.height * 0.01464844,
                size.width * 0.4101563, size.height * 0.05859375),
            bottomRight: Radius.circular(size.width * 0.02929688),
            bottomLeft: Radius.circular(size.width * 0.02929688),
            topLeft: Radius.circular(size.width * 0.02929688),
            topRight: Radius.circular(size.width * 0.02929688)),
        paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.6757813, size.height * 0.01464844);
    path_9.lineTo(size.width * 0.5878906, size.height * 0.01464844);
    path_9.arcToPoint(Offset(size.width * 0.5878906, size.height * 0.07324219),
        radius: Radius.elliptical(
            size.width * 0.02929688, size.height * 0.02929688),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_9.lineTo(size.width * 0.6757813, size.height * 0.07324219);
    path_9.arcToPoint(Offset(size.width * 0.6757813, size.height * 0.01464844),
        radius: Radius.elliptical(
            size.width * 0.02929688, size.height * 0.02929688),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_9.close();

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = Color(0xffe4222e).withOpacity(1.0);
    canvas.drawPath(path_9, paint_9_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
