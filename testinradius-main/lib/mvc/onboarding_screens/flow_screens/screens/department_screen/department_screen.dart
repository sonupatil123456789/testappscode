import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/department_screen/department_screen_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/listners_utils.dart';

import 'widget/department_screen_choice_chip.dart';

class DepartmentScreen extends StatelessWidget {
  PageController pageController;
  int navigateToPage;
  DepartmentScreen(
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
              child:DepartmentScreenChoiceChips(
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
                  Consumer<DepartmentScreenController>(
                    builder: (BuildContext context, DepartmentScreenController departmentScreenValue,
                        Widget? child) {
                      return CoustomButtonFrount(
                        gradientBackgroundColor:
                            CoustomTheams.buttonGradient,
                        validateOpacity:
                            departmentScreenValue.userPreferredDepartment == "" ||
                                    departmentScreenValue.userPreferredDepartmentId == ""
                                ? 0.4
                                : 1,
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (departmentScreenValue.userPreferredDepartment == "" ||
                              departmentScreenValue.userPreferredDepartmentId == "") {
                            return ListnersUtils.showFlushbarMessage(
                                'Please select any one department before proceeding ',
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
