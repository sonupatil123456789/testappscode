import 'package:fakestore/utils/routes/routes_name.dart';
import 'package:fakestore/view/authantication/auth_screen.dart';
import 'package:fakestore/view/authantication/otpscreen.dart';
import 'package:fakestore/view/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../view/screens/home_screen.dart';




class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (buildContext) => SplashSCreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (buildContext) => HomeScreen());

      case RoutesName.otpScreen:
        return MaterialPageRoute(builder: (buildContext) => OtpScreen());

      case RoutesName.authantication:
        return MaterialPageRoute(builder: (buildContext) => AuthScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("Default")),
          );
        });
    }
  }
}
