import 'package:flutter/material.dart';
import 'package:test/mvc/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


List Screens =[
  HomeScreen()
];


// this is the main entrypoint of all screen
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  Container(
        width: width,
        height: hight,
        //  color: Colors.amber,
        child :  SafeArea(
          child: Screens[0]
        ),
      ),
    );
  }
}