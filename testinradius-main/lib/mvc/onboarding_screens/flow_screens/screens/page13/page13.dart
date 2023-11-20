import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/components/coustom_textfield.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/input_utils.dart';
import 'package:test/utils/listners_utils.dart';

import 'page13_controller.dart';



class Page13 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  Page13(
      {super.key, required this.pageController, required this.navigateToPage});



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        width: width,
        height: height * 0.70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: CoustomTheams.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: height * 0.55,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
    

                  // enter your phone number for further verification
                  Consumer<Page13Controller>(
                    builder: (BuildContext context, value, Widget? child) {
                      return CoustomTextfield(
                          width: width * 0.80,
                          height: height * 0.07,
                          hintText: "Enter your Mobile number here",
                          maxLength: 10,
                          inputFormater: TextInputType.number,
                          maxLine: 1,
                          getFieldValue: (number) {
                            value.userPhoneNumber=number;
                          },
                          fieldController:InputUtils.USER_PHONE_NO, onFieldSubmit: (){

                          },);
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: width * 0.80,
                    alignment: Alignment.topLeft,
                    child: Text(
                      " # Please enter your active phone number to recive further verification code",
                      style: GoogleFonts.rubik(
                          color: CoustomTheams.blackShade54,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),

            //next and previous page button

            SizedBox(
              width: width * 0.80,
              height: height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CoustomButtonBack(
                    name: 'Back',
                    icon: Icons.west,
                    width: width * 0.36,
                    height: height * 0.07,
                    gradientBackgroundColor: CoustomTheams.buttonGradient,
                    validateOpacity: 1,
                    onTapHandler: () {
                      pageController.animateToPage(
                        navigateToPage - 2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    backgroundColor: CoustomTheams.buttonColor,
                    fontSize: width * 0.032,
                    textColor: CoustomTheams.whiteShade,
                    iconSize: width * 0.044,
                    iconColor: CoustomTheams.whiteShade,
                  ),
                  Consumer<Page13Controller>(
                    builder: (BuildContext context, Page13Controller value,
                        Widget? child) {
                      return CoustomButtonFrount(
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (value.userPhoneNumber.length > 10 ||value.userPhoneNumber.length < 10 ) {
                            return ListnersUtils.showFlushbarMessage(
                                'Please enter valid phone number',
                                Colors.yellowAccent,
                                CoustomTheams.blackShade54,
                                'Error',
                                Icons.error,
                                context);
                          }

                          

                          pageController.animateToPage(
                            navigateToPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        backgroundColor: CoustomTheams.buttonColor,
                        fontSize: width * 0.032,
                        textColor: CoustomTheams.whiteShade,
                        iconSize: width * 0.044,
                        iconColor: CoustomTheams.whiteShade,
                        gradientBackgroundColor:
                            CoustomTheams.buttonGradient,
                        validateOpacity: value.userPhoneNumber.length > 10 ||value.userPhoneNumber.length < 10 || value.userPhoneNumber.isEmpty ? 0.4 : 1,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }

}
