import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/authantication/auth_screen/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    authController = Provider.of<AuthController>(context, listen: false);
    authController.authanticateUser(context, <String, dynamic>{});

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<AuthController>(
          builder: (BuildContext context, value, Widget? child) {
            return Container(color: Color.fromARGB(255, 7, 255, 110), child: Text(value.loading == true ? "Loading..." : value.userName));
          },
        )
      ],
    );
  }
}
