import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/components/coustom_quil_text_editer.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page11/page11_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/listners_utils.dart';

class page11 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  page11(
      {super.key, required this.pageController, required this.navigateToPage});

  // TextEditingController USER_COVER_LETTER = TextEditingController();

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
                  // coustom quill text eduiter
                  Consumer<Page11Controller>(
                    builder: (BuildContext context, value, Widget? child) {
                      return SizedBox(
                          height: height * 0.45,
                          width: width * 0.80,
                          // color: Colors.amberAccent,
                          child: CoustomQuillTextediter(
                            getEditerData: (htmlEncodedData) {
                              value.userCoverLetter = htmlEncodedData;
                            },
                          ));
                    },
                  ),

                  SizedBox(
                    height: width * 0.03,
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
                    textColor: CoustomTheams.white,
                        iconSize: width * 0.044,
                        iconColor: CoustomTheams.white,
                  ),
                  Consumer<Page11Controller>(
                    builder: (BuildContext context, Page11Controller value,
                        Widget? child) {
                      return CoustomButtonFrount(
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (value.userCoverLetter.length < 10) {
                            return ListnersUtils.showFlushbarMessage(
                                'Summery should not be empty',
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
                        textColor: CoustomTheams.white,
                        iconSize: width * 0.044,
                        iconColor: CoustomTheams.white,
                        gradientBackgroundColor:
                            CoustomTheams.buttonGradient,
                        validateOpacity: value.userCoverLetter.length < 10 ? 0.4 : 1,
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
