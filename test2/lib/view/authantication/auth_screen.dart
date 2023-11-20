import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/input_field_utils.dart';
import 'login_screen.dart';
import 'signeup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ValueNotifier<bool> checkAuthScreen = ValueNotifier<bool>(false);

  bool isLoginScreen = false;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenheight * 0.02,
                ),
                Container(
                  height: screenheight * 0.04,
                  width: screenwidth,
                  child: Image.asset(AssetImgLinks.brand),
                ),
                ValueListenableBuilder(
                  builder: (BuildContext context, value, Widget? child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            checkAuthScreen.value = true;
                          },
                          child: Container(
                            width: screenwidth * 0.32,
                            height: screenheight * 0.05,
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: checkAuthScreen.value == true
                                      ? Color.fromARGB(255, 152, 152, 152)
                                      : Color.fromARGB(0, 255, 255, 255)),
                            )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "LogIn",
                                  style: GoogleFonts.poppins(
                                      color: TheamColors.primaryColor,
                                      fontSize: screenwidth * 0.034,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenheight * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            checkAuthScreen.value = false;
                          },
                          child: Container(
                            width: screenwidth * 0.32,
                            height: screenheight * 0.05,
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: checkAuthScreen.value == false
                                      ? Color.fromARGB(255, 152, 152, 152)
                                      : Color.fromARGB(0, 255, 255, 255)),
                            )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "SigneUp",
                                  style: GoogleFonts.poppins(
                                      color: TheamColors.primaryColor,
                                      fontSize: screenwidth * 0.034,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  valueListenable: checkAuthScreen,
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: checkAuthScreen,
                  builder: (BuildContext context, value, Widget? child) {
                    return checkAuthScreen.value == false
                        ? SigneupScreen()
                        : loginScreen();
                  },
                ),
                Container(
                  height: screenwidth * 0.03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        checkAuthScreen.value == true
                            ? "Already have account"
                            : "Dont have acount ?", //"Dont have acount ?",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 148, 148, 148),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          checkAuthScreen.value = !checkAuthScreen.value;
                        },
                        child: Text(
                          checkAuthScreen.value == true
                              ? " LogIn "
                              : " Register ",
                          style: TextStyle(
                              color: Colors.green.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          valueListenable: checkAuthScreen,
        ),
      )),
    );
    // : NoInternet();
  }

  @override
  void dispose() {
    InputFielUtils.passowrdController.dispose();
    InputFielUtils.emailController.dispose();
    InputFielUtils.nameController.dispose();
    super.dispose();
  }
}
