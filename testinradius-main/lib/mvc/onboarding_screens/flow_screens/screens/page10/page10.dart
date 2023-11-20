import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/components/coustom_datepicker.dart';
import 'package:test/components/coustom_textfield.dart';
import 'package:test/constants/assets_links.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page10/page10_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page10/widgets/joining_status_dropdown_page8.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/input_utils.dart';
import '../../../../../components/coustom_dropdown.dart';

class Page10 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  Page10(
      {super.key, required this.pageController, required this.navigateToPage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: width,
            height: height * 0.30,
            color: CoustomTheams.lightPurpleColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                      width: width * 0.16,
                      height: width * 0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue[50],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              child: Lottie.asset(
                            AssetLink.chatBot,
                            fit: BoxFit.fill,
                            width: width * 0.12,
                            height: width * 0.12,
                          )),
                        ],
                      )),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Container(
                  width: width * 0.60,
                  height: double.maxFinite,
                  alignment: Alignment.center,
                  child: Text(
                    "Let's add your joining status",
                    style: GoogleFonts.poppins(
                        color: CoustomTheams.black,
                        fontSize: width * 0.044,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.14,
                      ),
                      Consumer<Page10Controller>(
                        builder: (BuildContext context, Page10Controller value,
                            Widget? child) {
                          return JoiningStatusDropdownPage8(
                            dataList: const [
                              "Immediate",
                              "On Notice",
                              "Yet To Registered",
                            ],
                            hintText: 'Select joining status',
                            initialSelecteddata: "Immediate",
                          );
                        },
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Consumer<Page10Controller>(
                        builder: (BuildContext context, Page10Controller value,
                            Widget? child) {
                          if (value.userJoiningStatus == "On Notice") {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Last working date",
                                  style: GoogleFonts.rubik(
                                      color: CoustomTheams.blackShade54,
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CoustomDatePicker(
                                  width: width * 0.80,
                                  height: height * 0.07,
                                  color: CoustomTheams.white,
                                  getDate: (date) {
                                    value.userLastWorkingDayDate = date;
                                  },
                                  hintText: 'Select last working date',
                                ),
                              ],
                            );
                          }

                          if (value.userJoiningStatus == "Yet To Registered") {
                            return Column(
                              children: [
                                Text(
                                  "Notice period(in days)",
                                  style: GoogleFonts.rubik(
                                      color: CoustomTheams.blackShade54,
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CoustomTextfield(
                                  width: width * 0.80,
                                  height: height * 0.07,
                                  hintText: "   Notice period (in days) ",
                                  maxLength: 3,
                                  inputFormater: TextInputType.number,
                                  maxLine: 1,
                                  getFieldValue: (days) {
                                    value.userNoticePeriodDays = days;
                                  },
                                  fieldController:
                                      InputUtils.NOTICE_PERIOD_DAYS,
                                  onFieldSubmit: () {},
                                ),
                              ],
                            );
                          }

                          return const SizedBox();
                        },
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
                      Consumer<Page10Controller>(
                        builder: (BuildContext context, Page10Controller value,
                            Widget? child) {
                          return CoustomButtonFrount(
                            name: 'Next',
                            icon: Icons.east,
                            width: width * 0.36,
                            height: height * 0.07,
                            onTapHandler: () {
                              if (value.userJoiningStatus == "Immediate") {
                                if (kDebugMode) {
                                  print("clicked Yet To Immediate");
                                }
                                pageController.animateToPage(
                                  navigateToPage,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                              if (value.userJoiningStatus == "On Notice" &&
                                  value.userLastWorkingDayDate.isNotEmpty) {
                                if (kDebugMode) {
                                  print("clicked On Notice");
                                }
                                pageController.animateToPage(
                                  navigateToPage,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                              if (value.userJoiningStatus ==
                                      "Yet To Registered" &&
                                  value.userNoticePeriodDays != "0") {
                                if (kDebugMode) {
                                  print("clicked Yet To Registered");
                                }
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
                            gradientBackgroundColor:
                                CoustomTheams.buttonGradient,
                            validateOpacity: value.userJoiningStatus ==
                                    "Immediate"
                                ? 1
                                : value.userJoiningStatus == "On Notice" &&
                                        value.userLastWorkingDayDate.isNotEmpty
                                    ? 1
                                    : value.userJoiningStatus ==
                                                "Yet To Registered" &&
                                            value.userNoticePeriodDays != "0"
                                        ? 1
                                        : 0.4,
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}
