
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_app/Backbtnnavbar.dart';
import 'package:flutter_bluetooth_app/Bottomnavbar.dart';
import 'package:flutter_bluetooth_app/Bluetoothscreen/Headertext.dart';
import 'package:flutter_bluetooth_app/Maincard.dart';
import 'package:flutter_bluetooth_app/navbar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

const String firebriget = 'assets/firebriget.svg';

// ignore: camel_case_types
class Home_page extends StatefulWidget {
  // const Home_page({Key? key}) : super(key: key);

  final String? Myname;
  final String? Mypic;
  final int? Mynumber;
  var Message;

  Home_page({
    Key? key,
    required this.Myname,
    required this.Mypic,
    required this.Mynumber,
    required this.Message,
  }) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

// ignore: camel_case_types
class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenwidth,
          height: screenheight,
          color: HexColor('#EDF7FF'),
          child: Column(children: [
            Navbar(
              Mypic: widget.Mypic,
            ),
            Header_text(
              Myname: widget.Myname,
            ),
            Main_card(),
            Bottom_navbar()
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: HexColor('#1FAEFF'),
        child: Icon(
          Icons.emergency,
          size: 25,
          color: HexColor("#FFFFFF"),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Column(
                    children: [
                      Back_btn_navbar(navname: "SOS"),
                      Container(
                        width: 300,
                        height: 300,
                        // color: Colors.amber,
                        child: SvgPicture.asset(firebriget,
                            fit: BoxFit.contain, semanticsLabel: 'Fire'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: HexColor("#EB304A"),
                        ),
                        child: Icon(
                          Icons.sos,
                          color: HexColor("#FFFFFF"),
                        ),
                      )
                    ],
                  ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
