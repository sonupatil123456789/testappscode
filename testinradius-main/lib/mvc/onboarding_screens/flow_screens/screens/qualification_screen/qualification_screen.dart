import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/qualification_screen/qualification_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/qualification_screen/widgets/dropdown_search.dart';
import 'package:test/theams/coustom_theams.dart';

class QualificationScreen extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  QualificationScreen(
      {super.key, required this.pageController, required this.navigateToPage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        context.read<QualificationScreenController>().openCloseDropdownState = false;
        if (context.read<QualificationScreenController>().openCloseDropdownState == false) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Container(
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
             
                    DropdownSearchQualification(
                      maxCount: 2,
                      hintText: 'Select Up To Three Qualification',
                    )
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
                    Consumer<QualificationScreenController>(
                      builder: (BuildContext context, QualificationScreenController QualificationScreenvalue,
                          Widget? child) {
                        return CoustomButtonFrount(
                          name: 'Next',
                          icon: Icons.east,
                          width: width * 0.36,
                          height: height * 0.07,
                          onTapHandler: () {
                            if (QualificationScreenvalue.userThreeQualification.isEmpty) {
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
                          gradientBackgroundColor: CoustomTheams.buttonGradient,
                          validateOpacity:
                              QualificationScreenvalue.userThreeQualification.isEmpty ? 0.4 : 1,
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
