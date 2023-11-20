import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_app/Filldetail.dart';
import 'package:flutter_bluetooth_app/Homepage.dart';
import 'package:flutter_bluetooth_app/Maincard.dart';
import 'package:flutter_bluetooth_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        // () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => (Showintroscreen == true
        //         ? Fill_details()
        //         : const Home_page(
        //             Myname: null, Mynumber: null, Mypic: null)))));

        // () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => Fill_details())));

        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home_page(
                  Myname: null,
                  Mynumber: null,
                  Mypic: null,
                  Message: null,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Splash screen")),
    );
  }
}
