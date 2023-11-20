
import 'dart:math';

import 'package:fakestore/controllers/auth_controllers.dart';
import 'package:fakestore/utils/routes/routes.dart';
import 'package:fakestore/utils/routes/routes_name.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String buildCaptcha() {
const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
const length = 6;
final random = Random();
final randomString = String.fromCharCodes(List.generate(
    length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
print("the random string is ${randomString}");

return randomString;
}


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthControllers()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}

