import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String Brandlogo = 'assets/Logo.svg';
String? usesetimage;

class Navbar extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String? Mypic;
  const Navbar({
    Key? key,
    required this.Mypic,
  }) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String? setimg;

  @override
  void initState() {
    super.initState();
    setmyprofilepic();
  }

  setmyprofilepic() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    String? IMG = prefs.getString('Image');
    setState(() {
      setimg = IMG;
    });
    print("this is navbar variable $setimg");
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    var picture;
    return Container(
      height: 66.0,
      width: screenwidth,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //     width: 40.0,
          //     height: 40.0,
          //     child: SvgPicture.asset(Brandlogo, semanticsLabel: 'Brand Logo')),
          Text("My Home",
              style: TextStyle(
                color: HexColor('#000000'),
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              )),
          Container(
            width: screenwidth * 0.20,
            height: 40.0,
            // color: Colors.black,
          ),
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/profile.jpg', fit: BoxFit.cover),
            ),
            // child: (setimg != null
            //     ? Image.memory(
            //         base64Decode(setimg!),
            //         // fit: BoxFit.cover,
            //         // width: 40,
            //         // height: 40,
            //       )
            //     : const Text("data loading")),
          ),
        ],
      ),
    );
  }
}
