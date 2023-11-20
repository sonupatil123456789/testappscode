import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page8/page8_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page8/widgets/month_dropdown_page8.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page9/page9_controller.dart';
import 'package:test/theams/coustom_theams.dart';

import 'widgets/year_dropdown_page8.dart';

class Page8 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  Page8(
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
            Container(
              height: height * 0.55,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.10,
                  ),

                  // freshe toggle component
                  SizedBox(
                    width: width * 0.80,
                    height: height * 0.10,
                    child: Consumer<Page8Controller>(
                      builder: (BuildContext context,
                          Page8Controller page8value, Widget? child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Are you a fresher ?",
                              style: GoogleFonts.poppins(
                                  color: page8value.isUserFresher == true
                                      ? CoustomTheams.black
                                      : CoustomTheams.blackShade54,
                                  fontSize: width * 0.036,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Switch(
                                 value: page8value.isUserFresher,
                                    inactiveTrackColor: CoustomTheams.whiteShade,
                                    inactiveThumbColor: CoustomTheams.white,
                                    trackOutlineWidth:const MaterialStatePropertyAll(0.0),
                                    trackOutlineColor: MaterialStatePropertyAll(CoustomTheams.whiteShade),
                                    activeColor:
                                        CoustomTheams.accentColor,  // fc4102
                                onChanged: (value) {
                                  page8value.isUserFresher = value;
                                }),
                          ],
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  // select the experience in month and year or is the user fresher
                  SizedBox(
                      width: width * 0.80,
                      height: height * 0.27,
                      child: Consumer<Page8Controller>(
                        builder: (BuildContext context, Page8Controller value,
                            Widget? child) {
                          return Visibility(
                            visible: value.isUserFresher == true ? false : true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                yearDropdownPage8(
                                  dataList: List.generate(35, (index) => (index+1)),
                                  hintText: 'Select Year',
                                  initialSelecteddata: "0",
                                ),
                                 monthDropdownPage8(
                                  dataList: List.generate(12, (index) => (index+1)),
                                  hintText: 'Select Month',
                                  initialSelecteddata: "0",
                                ),
                            
                              ],
                            ),
                          );
                        },
                      )),
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
                    gradientBackgroundColor: CoustomTheams.buttonGradient,
                    validateOpacity: 1,
                    name: 'Back',
                    icon: Icons.west,
                    width: width * 0.36,
                    height: height * 0.07,
                    onTapHandler: () {
                      // context.read<Page9Controller>().
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
                  Consumer<Page8Controller>(
                    builder: (BuildContext context, Page8Controller value,
                        Widget? child) {
                      return CoustomButtonFrount(
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (value.isUserFresher == true ||
                              value.userExperienceInMonth > 0 ||
                              value.userExperienceInYear > 0) {
                            pageController.animateToPage(
                              navigateToPage,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        backgroundColor: CoustomTheams.buttonColor,
                        fontSize: width * 0.032,
                          textColor: CoustomTheams.white,
                        iconSize: width * 0.044,
                        iconColor: CoustomTheams.white,
                        gradientBackgroundColor: CoustomTheams.buttonGradient,
                        validateOpacity: value.isUserFresher == true ||
                                value.userExperienceInMonth > 0 ||
                                value.userExperienceInYear > 0
                            ? 1
                            : 0.4,
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
