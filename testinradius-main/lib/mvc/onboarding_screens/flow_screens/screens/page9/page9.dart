import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/components/coustom_textfield.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page8/page8_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page9/page9_controller.dart';
import 'package:test/utils/formaters/number_formater.dart';
import 'package:test/utils/listners_utils.dart';
import '../../../../../theams/coustom_theams.dart';
import '../../../../../utils/input_utils.dart';

class Page9 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  Page9(
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
        child: Consumer<Page9Controller>(
          builder: (BuildContext context, value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * 0.55,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // tip
                      Container(
                          width: width * 0.80,
                          padding: const EdgeInsets.all(16),
                          height: height * 0.16,
                          decoration: BoxDecoration(
                              color: CoustomTheams.dissabledColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: height * 0.03,
                                width: width * 0.60,
                                child: Text(
                                  "Pro Tip",
                                  style: GoogleFonts.poppins(
                                      color: CoustomTheams.blackShade54,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Consumer<Page9Controller>(
                                builder: (BuildContext context,
                                    Page9Controller value, Widget? child) {

                                  return Text(
                                    value.setSalleryNote(context.watch<Page8Controller>().totalExperienceInMonth),
                                    style: GoogleFonts.rubik(
                                        color: CoustomTheams.blackShade54,
                                        fontSize: width * 0.030,
                                        fontWeight: FontWeight.w400),
                                  );
                                },
                              )
                            ],
                          )),

                      SizedBox(
                        height: height * 0.02,
                      ),

                      Consumer<Page8Controller>(
                        builder: (BuildContext context, user, Widget? child) {
                          if (user.isUserFresher == true) {
                            return const SizedBox.shrink();
                          } else {
                            return Column(
                              children: [
                                // previous Annual salary text field
                                          Container(
                      width: width * 0.80,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Current annual salary",
                        style: GoogleFonts.rubik(
                            color: CoustomTheams.blackShade54,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 10,),
                                CoustomTextfield(
                                  width: width * 0.80,
                                  height: height * 0.07,
                                  hintText: "Enter Your Current Annual Salary ",
                                  maxLength: 10,
                                  inputFormater: TextInputType.number,
                                  maxLine: 1,
                                  getFieldValue: (currentSalary) {
                                    value.userCurrentAnnualSalary =
                                        currentSalary;
                                  },
                                  fieldController:
                                      InputUtils.CURRENT_ANNUAL_SALERY,
                                  onFieldSubmit: () {},
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                // convert expectation salary in to words
                                SizedBox(
                                  width: width * 0.80,
                                  height: height * 0.06,
                                  child: Text(
                                    NumberFormaters.convertNumberToWords(
                                        value.userCurrentAnnualSalary),
                                    style: GoogleFonts.rubik(
                                        color: CoustomTheams.blackShade54,
                                        fontSize: width * 0.032,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Column(
                        children: [
                          // expected salary input field
                                    Container(
                      width: width * 0.80,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Expected annual salary",
                        style: GoogleFonts.rubik(
                            color: CoustomTheams.blackShade54,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 10,),
                          CoustomTextfield(
                            width: width * 0.80,
                            height: height * 0.07,
                            hintText: "Enter Your Expected Salary ",
                            maxLength: 10,
                            inputFormater: TextInputType.number,
                            maxLine: 1,
                            getFieldValue: (salary) {
                              value.userExpectedSalary = salary;
                            },
                            fieldController: InputUtils.SALARY_EXPECTTION,
                            onFieldSubmit: () {},
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // convert expectation salary in to words
                          SizedBox(
                            width: width * 0.80,
                            height: height * 0.06,
                            child: Text(
                              NumberFormaters.convertNumberToWords(
                                  value.userExpectedSalary),
                              style: GoogleFonts.rubik(
                                  color: CoustomTheams.blackShade54,
                                  fontSize: width * 0.032,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
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
                      Consumer<Page9Controller>(
                        builder: (BuildContext context, Page9Controller value,
                            Widget? child) {
                          return CoustomButtonFrount(
                              name: 'Next',
                              icon: Icons.east,
                              width: width * 0.36,
                              height: height * 0.07,
                              onTapHandler: () {
                                if (value.userExpectedSalary.isEmpty == true) {
                                  return ListnersUtils.showFlushbarMessage(
                                      'Please enter your expected salary details ',
                                      Colors.yellowAccent,
                                      CoustomTheams.blackShade54,
                                      'Error',
                                      Icons.error,
                                      context);
                                }

                                if (context
                                            .read<Page8Controller>()
                                            .isUserFresher ==
                                        false &&
                                    value.userCurrentAnnualSalary == "0") {
                                  return ListnersUtils.showFlushbarMessage(
                                      'Please enter your current annual salary details ',
                                      Colors.yellowAccent,
                                      CoustomTheams.blackShade54,
                                      'Error',
                                      Icons.error,
                                      context);
                                }

                                if (int.parse(value.userExpectedSalary) <=
                                    int.parse(value.userCurrentAnnualSalary)) {
                                  return ListnersUtils.showFlushbarMessage(
                                      'Expected salary should not be smaller than annual salary ',
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
                              validateOpacity: value
                                          .userExpectedSalary.isEmpty ||
                                      int.parse(value.userExpectedSalary) <=
                                          int.parse(
                                              value.userCurrentAnnualSalary) ||
                                      context
                                                  .read<Page8Controller>()
                                                  .isUserFresher ==
                                              false &&
                                          value.userCurrentAnnualSalary == "0"
                                  ? 0.4
                                  : 1);
                        },
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
