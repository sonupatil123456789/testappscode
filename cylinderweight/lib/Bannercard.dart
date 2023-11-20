import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bluetooth_app/Bluetoothscreen/Bluetoothscreen.dart';
import 'package:flutter_bluetooth_app/Cylinder_detail.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class Banner_cards extends StatefulWidget {
  const Banner_cards({Key? key}) : super(key: key);

  @override
  State<Banner_cards> createState() => _Banner_cardsState();
}

class _Banner_cardsState extends State<Banner_cards> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      width: screenwidth * 0.88,
      height: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: HexColor("FFFFFF"),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              HexColor('#86e6d6'), // light
              HexColor('538ad6'), //dark
            ],
          )),
      child: Row(children: [
        Container(
          width: 180,
          // color: Color.fromARGB(255, 7, 255, 48),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160,
                height: 160,
                // color: Colors.cyan,
                child: CustomPaint(
                  // ignore: sized_box_for_whitespace
                  // ignore: sort_child_properties_last
                  size: Size(
                      50,
                      (50 * 1)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: 180,
            // color: Colors.amber,
            height: 200,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    height: 30,
                    // color: Colors.redAccent,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.battery_charging_full,
                            size: 15,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Battery remaining",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: HexColor('#212121')),
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Container(
                      width: 140,
                      height: 74,
                      // color: Colors.redAccent,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 78,
                                  color: HexColor('#212121')),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: HexColor('#212121')),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: 140,
                    height: 38,
                    // color: Colors.deepPurpleAccent,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        // minimumSize: const Size(320, 50),
                        primary: HexColor('#000000'),
                        // primary: HexColor('#1FAEFF'),
                        onPrimary: HexColor('#FFFFFF'),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Cylinder_details_page();
                        }));
                      },
                      child: Text(
                        'View More',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ]),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
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
    paint_6_fill.color = Color(0xffeb304a).withOpacity(1.0);
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
    paint_7_fill.color = Color(0xffe4222e).withOpacity(1.0);
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

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.5336414, size.height * 0.7189574);
    path_10.cubicTo(
        size.width * 0.4830809,
        size.height * 0.7417145,
        size.width * 0.4173322,
        size.height * 0.7159076,
        size.width * 0.3962117,
        size.height * 0.6642032);
    path_10.cubicTo(
        size.width * 0.3822828,
        size.height * 0.6301046,
        size.width * 0.3950124,
        size.height * 0.5940361,
        size.width * 0.3959931,
        size.height * 0.5914841);
    path_10.cubicTo(
        size.width * 0.4080712,
        size.height * 0.5600548,
        size.width * 0.4303577,
        size.height * 0.5543342,
        size.width * 0.4416817,
        size.height * 0.5219808);
    path_10.cubicTo(
        size.width * 0.4494911,
        size.height * 0.4996686,
        size.width * 0.4472266,
        size.height * 0.4785743,
        size.width * 0.4443431,
        size.height * 0.4647779);
    path_10.arcToPoint(Offset(size.width * 0.4683662, size.height * 0.4958388),
        radius:
            Radius.elliptical(size.width * 0.1328871, size.height * 0.1328871),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_10.arcToPoint(Offset(size.width * 0.4798904, size.height * 0.5197946),
        radius:
            Radius.elliptical(size.width * 0.1894596, size.height * 0.1894596),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_10.arcToPoint(Offset(size.width * 0.4838288, size.height * 0.5328104),
        radius: Radius.elliptical(
            size.width * 0.09557115, size.height * 0.09557115),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_10.cubicTo(
        size.width * 0.4847303,
        size.height * 0.5368612,
        size.width * 0.4843916,
        size.height * 0.5410164,
        size.width * 0.4853333,
        size.height * 0.5449928);
    path_10.cubicTo(
        size.width * 0.4882361,
        size.height * 0.5572501,
        size.width * 0.5000959,
        size.height * 0.5378106,
        size.width * 0.5021260,
        size.height * 0.5344421);
    path_10.arcToPoint(Offset(size.width * 0.5119700, size.height * 0.5042285),
        radius: Radius.elliptical(
            size.width * 0.06734711, size.height * 0.06734711),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_10.arcToPoint(Offset(size.width * 0.5048239, size.height * 0.4677346),
        radius: Radius.elliptical(
            size.width * 0.07202881, size.height * 0.07202881),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_10.cubicTo(
        size.width * 0.5040422,
        size.height * 0.4661401,
        size.width * 0.5002768,
        size.height * 0.4574110,
        size.width * 0.4984777,
        size.height * 0.4572502);
    path_10.arcToPoint(Offset(size.width * 0.5248168, size.height * 0.4631244),
        radius:
            Radius.elliptical(size.width * 0.1024333, size.height * 0.1024333),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_10.cubicTo(
        size.width * 0.5764691,
        size.height * 0.4821693,
        size.width * 0.6163749,
        size.height * 0.5460267,
        size.width * 0.6101680,
        size.height * 0.6104265);
    path_10.cubicTo(
        size.width * 0.6058079,
        size.height * 0.6556641,
        size.width * 0.5749015,
        size.height * 0.7003861,
        size.width * 0.5336414,
        size.height * 0.7189574);
    path_10.close();

    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = Color(0xfffddd5a).withOpacity(1.0);
    canvas.drawPath(path_10, paint_10_fill);

    Path path_11 = Path();
    path_11.moveTo(size.width * 0.4416816, size.height * 0.5219808);
    path_11.arcToPoint(Offset(size.width * 0.4275742, size.height * 0.5472762),
        radius: Radius.elliptical(
            size.width * 0.08363598, size.height * 0.08363598),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_11.cubicTo(
        size.width * 0.4314300,
        size.height * 0.5543079,
        size.width * 0.4416596,
        size.height * 0.5375490,
        size.width * 0.4435322,
        size.height * 0.5344421);
    path_11.arcToPoint(Offset(size.width * 0.4533761, size.height * 0.5042285),
        radius: Radius.elliptical(
            size.width * 0.06734666, size.height * 0.06734666),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_11.arcToPoint(Offset(size.width * 0.4462300, size.height * 0.4677346),
        radius: Radius.elliptical(
            size.width * 0.07202941, size.height * 0.07202941),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_11.cubicTo(
        size.width * 0.4460536,
        size.height * 0.4673748,
        size.width * 0.4457200,
        size.height * 0.4666414,
        size.width * 0.4452966,
        size.height * 0.4657354);
    path_11.cubicTo(
        size.width * 0.4449765,
        size.height * 0.4654187,
        size.width * 0.4446657,
        size.height * 0.4650916,
        size.width * 0.4443430,
        size.height * 0.4647778);
    path_11.cubicTo(
        size.width * 0.4472266,
        size.height * 0.4785742,
        size.width * 0.4494910,
        size.height * 0.4996686,
        size.width * 0.4416816,
        size.height * 0.5219808);
    path_11.close();
    path_11.moveTo(size.width * 0.5248168, size.height * 0.4631243);
    path_11.arcToPoint(Offset(size.width * 0.4984776, size.height * 0.4572501),
        radius:
            Radius.elliptical(size.width * 0.1024335, size.height * 0.1024335),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_11.cubicTo(
        size.width * 0.5002767,
        size.height * 0.4574109,
        size.width * 0.5040421,
        size.height * 0.4661400,
        size.width * 0.5048238,
        size.height * 0.4677345);
    path_11.arcToPoint(Offset(size.width * 0.5093894, size.height * 0.4796564),
        radius: Radius.elliptical(
            size.width * 0.07137500, size.height * 0.07137500),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_11.arcToPoint(Offset(size.width * 0.5119861, size.height * 0.4947423),
        radius: Radius.elliptical(
            size.width * 0.07238697, size.height * 0.07238697),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_11.cubicTo(
        size.width * 0.5390584,
        size.height * 0.5240957,
        size.width * 0.5557473,
        size.height * 0.5671274,
        size.width * 0.5515740,
        size.height * 0.6104263);
    path_11.cubicTo(
        size.width * 0.5472141,
        size.height * 0.6556639,
        size.width * 0.5163076,
        size.height * 0.7003860,
        size.width * 0.4750476,
        size.height * 0.7189573);
    path_11.arcToPoint(Offset(size.width * 0.4642067, size.height * 0.7230095),
        radius: Radius.elliptical(
            size.width * 0.09223773, size.height * 0.09223773),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_11.cubicTo(
        size.width * 0.4869587,
        size.height * 0.7295486,
        size.width * 0.5117252,
        size.height * 0.7288217,
        size.width * 0.5336414,
        size.height * 0.7189573);
    path_11.cubicTo(
        size.width * 0.5749014,
        size.height * 0.7003860,
        size.width * 0.6058078,
        size.height * 0.6556639,
        size.width * 0.6101678,
        size.height * 0.6104263);
    path_11.cubicTo(
        size.width * 0.6163747,
        size.height * 0.5460267,
        size.width * 0.5764689,
        size.height * 0.4821692,
        size.width * 0.5248168,
        size.height * 0.4631243);
    path_11.close();

    Paint paint_11_fill = Paint()..style = PaintingStyle.fill;
    paint_11_fill.color = Color(0xfffed030).withOpacity(1.0);
    canvas.drawPath(path_11, paint_11_fill);

    Path path_12 = Path();
    path_12.moveTo(size.width * 0.5471659, size.height * 0.6715217);
    path_12.cubicTo(
        size.width * 0.5459807,
        size.height * 0.6890192,
        size.width * 0.5367305,
        size.height * 0.7208796,
        size.width * 0.5103681,
        size.height * 0.7270026);
    path_12.cubicTo(
        size.width * 0.4837925,
        size.height * 0.7331753,
        size.width * 0.4539532,
        size.height * 0.7106833,
        size.width * 0.4527314,
        size.height * 0.6895256);
    path_12.cubicTo(
        size.width * 0.4518456,
        size.height * 0.6741881,
        size.width * 0.4660519,
        size.height * 0.6604748,
        size.width * 0.4695062,
        size.height * 0.6571403);
    path_12.cubicTo(
        size.width * 0.4827462,
        size.height * 0.6443596,
        size.width * 0.4923860,
        size.height * 0.6460814,
        size.width * 0.4997072,
        size.height * 0.6355681);
    path_12.cubicTo(
        size.width * 0.5041957,
        size.height * 0.6291228,
        size.width * 0.5079357,
        size.height * 0.6177840,
        size.width * 0.5020908,
        size.height * 0.5966420);
    path_12.cubicTo(
        size.width * 0.5313755,
        size.height * 0.6135941,
        size.width * 0.5491395,
        size.height * 0.6423840,
        size.width * 0.5471659,
        size.height * 0.6715217);
    path_12.close();

    Paint paint_12_fill = Paint()..style = PaintingStyle.fill;
    paint_12_fill.color = Color(0xfff9a242).withOpacity(1.0);
    canvas.drawPath(path_12, paint_12_fill);

    Path path_13 = Path();
    path_13.moveTo(size.width * 0.5020907, size.height * 0.5966420);
    path_13.cubicTo(
        size.width * 0.5055864,
        size.height * 0.6092865,
        size.width * 0.5056411,
        size.height * 0.6184047,
        size.width * 0.5041703,
        size.height * 0.6250865);
    path_13.arcToPoint(Offset(size.width * 0.5178690, size.height * 0.6715217),
        radius: Radius.elliptical(
            size.width * 0.07284535, size.height * 0.07284535),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_13.cubicTo(
        size.width * 0.5167612,
        size.height * 0.6878771,
        size.width * 0.5086031,
        size.height * 0.7167761,
        size.width * 0.4860133,
        size.height * 0.7254805);
    path_13.arcToPoint(Offset(size.width * 0.5103681, size.height * 0.7270026),
        radius: Radius.elliptical(
            size.width * 0.04491781, size.height * 0.04491781),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_13.cubicTo(
        size.width * 0.5367305,
        size.height * 0.7208796,
        size.width * 0.5459807,
        size.height * 0.6890192,
        size.width * 0.5471659,
        size.height * 0.6715217);
    path_13.cubicTo(
        size.width * 0.5491395,
        size.height * 0.6423840,
        size.width * 0.5313755,
        size.height * 0.6135941,
        size.width * 0.5020907,
        size.height * 0.5966420);
    path_13.close();

    Paint paint_13_fill = Paint()..style = PaintingStyle.fill;
    paint_13_fill.color = Color(0xfff69531).withOpacity(1.0);
    canvas.drawPath(path_13, paint_13_fill);

    Path path_14 = Path();
    path_14.moveTo(size.width * 0.9352918, size.height * 0.8994597);
    path_14.arcToPoint(Offset(size.width * 0.9352918, size.height * 0.8936003),
        radius: Radius.elliptical(
            size.width * 0.002931445, size.height * 0.002931445),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_14.arcToPoint(Offset(size.width * 0.9352918, size.height * 0.8994597),
        radius: Radius.elliptical(
            size.width * 0.002931445, size.height * 0.002931445),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_14.close();

    Paint paint_14_fill = Paint()..style = PaintingStyle.fill;
    paint_14_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_14, paint_14_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
