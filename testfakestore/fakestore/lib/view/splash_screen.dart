
import 'package:fakestore/controllers/auth_controllers.dart';
import 'package:fakestore/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {



  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2) , (){
          Navigator.pushNamed(context, RoutesName.authantication);
    });

  }


 

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor("#F7F4FB"),
      body: Center(
        child: Container(
            width: screenwidth * 0.40,
            height: screenheight * 0.20,
            ),
      ),
    );
  }
}