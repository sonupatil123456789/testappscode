import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_app/Filldetail.dart';
import 'package:flutter_bluetooth_app/Homepage.dart';
import 'package:flutter_bluetooth_app/Splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool Showintroscreen = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  Showintroscreen = prefs.getBool('Onboarding') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(), home: SplashScreen());
  }
}
