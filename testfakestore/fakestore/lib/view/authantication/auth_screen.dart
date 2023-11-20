import 'package:fakestore/controllers/auth_controllers.dart';
import 'package:fakestore/utils/routes/routes_name.dart';
import 'package:fakestore/view/components/coustom_button.dart';
import 'package:fakestore/view/components/coustom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../utils/constants/assets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController numberController = TextEditingController();
  FocusNode numberFocusNode = FocusNode();

  bool isLoginScreen = false;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor("#F7F4FB"),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          // color: Colors.amber,
          width: screenwidth,
          height: screenheight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenheight * 0.02,
              ),
              SizedBox(
                width: screenwidth * 0.80,
                height: screenheight * 0.20,
                child: SvgPicture.asset(
                  AssetImgLinks.blueLoginAsset,
                  width: screenwidth * 0.80,
                  height: screenheight * 0.20,
                ),
              ),
              SizedBox(
                height: screenheight * 0.06,
              ),
              SizedBox(
                width: screenwidth * 0.80,
                child: CoustomTextfield(
                  controller: numberController,
                  isPasswordTextField: false,
                  labelText: 'Phone',
                  maxline: 1,
                  placeholder: 'Enter your PhoneNumber',
                  width: screenwidth * 0.80,
                  FocusNodeNames: numberFocusNode,
                  changeFocusNode: numberFocusNode,
                  iconName: Icons.email,
                  textValue: (data) {},
                ),
              ),
              SizedBox(
                height: screenheight * 0.01,
              ),
              Container(
                height: screenheight * 0.20,
                width: screenwidth * 0.80,
                // color: Colors.amber,
                child: Consumer<AuthControllers>(
                  builder: (BuildContext context, AuthControllers authValue,
                      Widget? child) {
                    if (authValue.loading == true) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Column(
                        children: [
                          CommonButton(
                              width: screenwidth * 0.80,
                              height: screenheight * 0.056,
                              btnTitle: "Login In",
                              btnColor: HexColor("#0D2A3C"),
                              onTapHandler: () async {
                                await authValue.signUpWithPhoneAuth(context,"+91${numberController.text}");
                                
                              }
                              ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
