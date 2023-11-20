import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/view/components/social_button.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/input_field_utils.dart';
import '../../utils/routes/routes_name.dart';
import '../components/coustom_button.dart';
import '../components/coustom_textfield.dart';
// import 'package:mystore/view/screens/signeup_screen.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final formkey = GlobalKey<FormState>();

  late Map inputFieldData;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenheight * 0.70,
        alignment: Alignment.center,
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomTextfield(
                  controller: InputFielUtils.emailController,
                  isPasswordTextField: false,
                  labelText: 'Email',
                  maxline: 1,
                  placeholder: 'Enter your email',
                  width: screenwidth * 0.80,
                  FocusNodeNames: InputFielUtils.emailFocusNode,
                  changeFocusNode: InputFielUtils.passwordFocusNode,
                  iconName: Icons.email,
                ),
                CoustomTextfield(
                  controller: InputFielUtils.passowrdController,
                  isPasswordTextField: true,
                  labelText: 'Password',
                  maxline: 1,
                  placeholder: 'Enter your password',
                  width: screenwidth * 0.80,
                  FocusNodeNames: InputFielUtils.passwordFocusNode,
                  changeFocusNode: InputFielUtils.passwordFocusNode,
                  iconName: Icons.lock,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenwidth * 0.52, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot password",
                      style: GoogleFonts.notoSans(
                          fontSize: screenwidth * 0.032,
                          color: Color.fromARGB(255, 148, 148, 148),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                CommonButton(
                    width: screenwidth * 0.80,
                    height: screenheight * 0.056,
                    btnTitle: "Log In",
                    btnColor: TheamColors.primaryColor,
                    onTapHandler: () {
                      Navigator.pushNamed(context, RoutesName.app);
                    }),
                Container(
                  height: 50,
                  width: screenwidth * 0.80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenwidth * 0.36,
                        height: 20,
                        child: const Divider(
                          height: 10,
                          color: Color.fromARGB(255, 148, 148, 148),
                          // indent: 20,
                          thickness: 1,
                          endIndent: 20,
                        ),
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(),
                      ),
                      Container(
                        width: screenwidth * 0.36,
                        height: 20,
                        child: const Divider(
                          height: 10,
                          color: Color.fromARGB(255, 148, 148, 148),
                          indent: 20,
                          thickness: 1,
                          // endIndent: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                SocialButton(
                  width: screenwidth * 0.80,
                  height: screenheight * 0.056,
                  btnTitle: "Continue With Google",
                  btnColor: TheamColors.backgroundColor,
                  onTapHandler: () {
                    Navigator.pushNamed(context, RoutesName.app);
                  },
                  iconImage: AssetImgLinks.google,
                  btnTextColor: TheamColors.primaryColor,
                ),
                SizedBox(
                  height: screenheight * 0.01,
                ),
                SocialButton(
                  width: screenwidth * 0.80,
                  height: screenheight * 0.056,
                  btnTitle: "Continue With Facebook",
                  btnColor: TheamColors.backgroundColor,
                  onTapHandler: () {
                    Navigator.pushNamed(context, RoutesName.app);
                  },
                  iconImage: AssetImgLinks.facebook,
                  btnTextColor: TheamColors.primaryColor,
                ),
                SizedBox(
                  height: screenheight * 0.01,
                ),
                SocialButton(
                  width: screenwidth * 0.80,
                  height: screenheight * 0.056,
                  btnTitle: "Continue With Twiter",
                  btnColor: TheamColors.backgroundColor,
                  onTapHandler: () {
                    Navigator.pushNamed(context, RoutesName.app);
                  },
                  iconImage: AssetImgLinks.twiter,
                  btnTextColor: TheamColors.primaryColor,
                ),
              ]),
        ));
  }
}
