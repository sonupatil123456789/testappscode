import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bluetooth_app/Bluetoothscreen/Bluetoothscreen.dart';
import 'package:hexcolor/hexcolor.dart';

class Header_text extends StatefulWidget {
  final String? Myname;
  Header_text({Key? key, required this.Myname}) : super(key: key);

  @override
  State<Header_text> createState() => _Header_textState();
}

class _Header_textState extends State<Header_text> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      height: 90.0,
      width: screenwidth,
      // color: Color.fromARGB(255, 34, 207, 81),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${"Shreyas Patil"} 👋",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: HexColor('#212121')),
                  ),
                  Text("Welcome back to home",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: HexColor('#000000')))
                ]),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(100, 44),
                    // primary: HexColor('#8F3BFB'),
                    primary: HexColor('#1FAEFF'),
                    onPrimary: HexColor('#FFFFFF'),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Bluetooth_screen();
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Connect',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
