import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/industry_screen/industry_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/industry_screen/widget/industry_screen_choice_chip.dart';
import 'package:test/theams/coustom_theams.dart';


class IndustryScreen extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  late bool ignored = false;
  IndustryScreen(
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
                height: height * 0.46,
                width: width * 0.80,
                child: IndustryScreenChoiceChips(
                  bgColor: CoustomTheams.white,
                  selectColor: CoustomTheams.accentColor,
                  textFontSize: width * 0.032,
                )),

            SizedBox(
              height: height * 0.02,
            ),

            //next and previous page button

            SizedBox(
              width: width * 0.80,
              height: height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CoustomButtonBack(
                    gradientBackgroundColor: CoustomTheams.buttonGradient,
                    validateOpacity: 1,
                    name: 'Back',
                    icon: Icons.west,
                    width: width * 0.36,
                    height: height * 0.07,
                    onTapHandler: () {
                      pageController.animateToPage(
                        navigateToPage - 2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    backgroundColor: CoustomTheams.buttonColor,
                    fontSize: width * 0.032,
                    textColor: CoustomTheams.white,
                        iconSize: width * 0.044,
                        iconColor: CoustomTheams.white,
                  ),
                  Consumer<IndustryScreenController>(
                    builder: (BuildContext context, IndustryScreenController industryScreenValue,
                        Widget? child) {
                      return CoustomButtonFrount(
                        gradientBackgroundColor: CoustomTheams.buttonGradient,
                        validateOpacity: industryScreenValue.userPreferredIndustry == "" ||
                                industryScreenValue.userPreferredIndustryId == ""
                            ? 0.4
                            : 1,
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (industryScreenValue.userPreferredIndustry == "" ||
                              industryScreenValue.userPreferredIndustryId == "") {
                            return null;
                          }
                          pageController.animateToPage(
                            navigateToPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        backgroundColor: CoustomTheams.buttonColor,
                        fontSize: width * 0.032,
                         textColor: CoustomTheams.white,
                        iconSize: width * 0.044,
                        iconColor: CoustomTheams.white,
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
