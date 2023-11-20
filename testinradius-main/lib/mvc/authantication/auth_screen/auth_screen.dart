import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/authantication/auth_screen/auth_controller.dart';
import 'package:test/mvc/main_screen/main_screen.dart';
import 'package:test/mvc/screens/home/home_screen.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  AuthController authScreenController = AuthController();

  late Map<String, dynamic> authanticatio = <String, dynamic>{};

  // ignore: non_constant_identifier_names
  TextEditingController EMAIL_CONTROLLER = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController PASSWORD_CONTROLLER = TextEditingController();

  @override
  Widget build(BuildContext context) {
    authScreenController = Provider.of<AuthController>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          width: width,
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: hight * 0.10,
              ),
              Container(
                width: width * 0.80,
                child: TextFormField(
                  controller: EMAIL_CONTROLLER,
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: hight * 0.05,
              ),
              Container(
                width: width * 0.80,
                child: TextFormField(
                  controller: PASSWORD_CONTROLLER,
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              Consumer<AuthController>(
                builder: (BuildContext context, value, Widget? child) {
                  return InkWell(
                    onTap: () async {
                      authanticatio = {
                        "email": EMAIL_CONTROLLER.text.toString(),
                        "password": PASSWORD_CONTROLLER.text.toString()
                      };
                      // {email: mehank@inradius.in, password: Mehank@123}
                      await authScreenController.logInUser(
                          context, authanticatio);
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                        return MainScreen();
                     }), (r){
                       return false;
                     });
                    },
                    child: Container(
                        color: Colors.amber,
                        alignment: Alignment.center,
                        height: hight * 0.05,
                        width: width * 0.80,
                        child: value.loading == true
                            ? const CircularProgressIndicator()
                            : const Text("LOG IN")),
                  );
                },
              ),
              SizedBox(
                height: hight * 0.05,
              ),
              Consumer<AuthController>(
                builder: (BuildContext context, value, Widget? child) {
                  return InkWell(
                    onTap: () async {
                      await authScreenController
                          .authanticateUser(context, <String, dynamic>{});

                    },
                    child: Container(
                        color: Colors.amber,
                        alignment: Alignment.center,
                        height: hight * 0.05,
                        width: width * 0.80,
                        child: value.loading == true
                            ? const CircularProgressIndicator()
                            : const Text("Authanticate User")),
                  );
                },
              ),
            ],
          ))),
    );
  }
}
