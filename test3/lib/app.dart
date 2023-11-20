import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test1/utils/constants/colorpallets.dart';
import 'package:test1/view/components/bottom_bar.dart';
import 'package:test1/view/screens/main_screen.dart';


class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List Screens = [MainScreen()];

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#0D2A3C"),
      body: SafeArea(
          child: Column(
        children: [
          Screens[index],
          BottomBar(
            backgroundColor: TheamColors.backgroundColor,
            iconColor: HexColor("#133C58"),
            screen: (value) {
              setState(() {
                index = value;
              });
            },
          )
        ],
      )),
    );
  }
}
