import 'package:flutter/material.dart';
import 'package:test1/app.dart';
import 'package:test1/utils/routes/routes_name.dart';

import 'package:test1/view/screens/main_screen.dart';
import 'package:test1/view/screens/refine_screen.dart';


class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
   

      case RoutesName.home:
        return MaterialPageRoute(builder: (buildContext) => MainScreen());

      case RoutesName.app:
        return MaterialPageRoute(builder: (buildContext) => App());

      case RoutesName.refine:
        return MaterialPageRoute(builder: (buildContext) => RefineScreen());

      




      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("Default")),
          );
        });
    }
  }
}
