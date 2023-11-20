import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page6/page6_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/listners_utils.dart';

import 'widgets/coustom_multipalChips.dart';

class Page6 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  Page6(
      {super.key, required this.pageController, required this.navigateToPage});

  Page6Controller page6 = Page6Controller();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    page6 = Provider.of<Page6Controller>(context, listen: false);

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
              width: width * 0.80,
              alignment: Alignment.topLeft,
              child: Text(
                "Select upto 3 sub-function",
                style: GoogleFonts.rubik(
                    color: CoustomTheams.blackShade54,
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10,),
            


            // preferred job industry
            SizedBox(
              height: height * 0.46,
              width: width * 0.80,
              child:MultipalChipsPage6(
                    bgColor: CoustomTheams.white,
                    selectColor: CoustomTheams.accentColor,
                    textFontSize: width * 0.032,
                  )
            ),

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
                  Consumer<Page6Controller>(
                    builder: (BuildContext context, Page6Controller value,
                        Widget? child) {
                      return CoustomButtonFrount(
                        gradientBackgroundColor:
                            CoustomTheams.buttonGradient,
                        validateOpacity:
                            value.SelectedSubFunction.isEmpty
                                ? 0.4
                                : 1,
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (value.SelectedSubFunction.isEmpty) {
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
