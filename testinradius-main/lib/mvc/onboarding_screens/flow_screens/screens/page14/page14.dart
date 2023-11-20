import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom_otp_component.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/components/coustom_textfield.dart';
import 'package:test/constants/assets_links.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page14/page14_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import '../../../../../utils/coustom_timers.dart';

class Page14 extends StatefulWidget {
  PageController pageController;
  int navigateToPage;

  Page14(
      {super.key, required this.pageController, required this.navigateToPage});

  @override
  State<Page14> createState() => _Page14State();
}

TextEditingController Email_CONTROLLER = TextEditingController();

class _Page14State extends State<Page14> {
  late CoustomCounterController timerController = CoustomCounterController();

  Page14Controller page14controller = Page14Controller();

  @override
  void initState() {
    super.initState();
    timerController.startTimer();
  }

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
                  Container(
                    width: width * 0.80,
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Enter 6 digit OTP",
                      style: GoogleFonts.rubik(
                          color: CoustomTheams.blackShade54,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // enter your OTP component for verification
                  Form(child: Consumer<Page14Controller>(
                    builder: (BuildContext context, value, Widget? child) {
                      return CoustomOTPComponent(
                        getOtp: (otp) {
                          value.userOtp = otp;
                        },
                        submitOtp: () {
                          if (kDebugMode) {
                            print(" on submit pressed success for otp function");
                          }
                        },
                      );
                    },
                  )),

                  const SizedBox(
                    height: 10,
                  ),

                  // resend otp button by mobile
                  SizedBox(
                    width: width * 0.80,
                    height: height * 0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StreamBuilder<dynamic>(
                            stream: timerController.secondsStream,
                            initialData: "",
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<dynamic> snapshot,
                            ) {
                              if (snapshot.hasData) {
                                if (timerController.ResendOtpSeconds == 0 ||
                                    timerController.ResendOtpSeconds ==
                                        -1) {
                                  return InkWell(
                                    child: Text(
                                      "Request OTP Again",
                                      style: GoogleFonts.rubik(
                                          color: CoustomTheams.accentColor,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    onTap: () {
                                      timerController.startTimer();
                                    },
                                  );
                                } else {
                                  return Text(
                                    "Resend OTP In ${timerController.ResendOtpSeconds.toString()}",
                                    style: GoogleFonts.rubik(
                                        color: CoustomTheams.blackShade54,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w400),
                                  );
                                }
                              }
                              return const Text("Unable To Send OTP");
                            }),
                        SizedBox(
                          width: width * 0.025,
                        ),
                      ],
                    ),
                  ),

                  // resend otp button by email
                  SizedBox(
                    width: width * 0.80,
                    height: height * 0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Text(
                            "Request OTP On Mail",
                            style: GoogleFonts.rubik(
                                color: CoustomTheams.accentColor,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            ShowEmailDialogBox(context, width, height);
                          },
                        ),
                        SizedBox(
                          width: width * 0.025,
                        ),
                      ],
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
                      widget.pageController.animateToPage(
                        widget.navigateToPage - 2,
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
                  Consumer<Page14Controller>(
                    builder: (BuildContext context, Page14Controller value,
                        Widget? child) {
                      return CoustomButtonFrount(
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          widget.pageController.animateToPage(
                            widget.navigateToPage,
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
                        validateOpacity: 1,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  ShowEmailDialogBox(context, width, height) async {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: width * 0.80,
            height: height * 0.26,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your email",
                    style: GoogleFonts.poppins(
                        color: CoustomTheams.blackShade54,
                        fontSize: width * 0.042,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "You' ll receive an OTP on the given email",
                    style: GoogleFonts.rubik(
                        color: CoustomTheams.blackShade54,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  CoustomTextfield(
                    width: width * 0.80,
                    height: height * 0.07,
                    hintText: "Enter your email here",
                    maxLength: 10,
                    inputFormater: TextInputType.emailAddress,
                    maxLine: 1,
                    getFieldValue: (number) {},
                    fieldController: Email_CONTROLLER,
                    onFieldSubmit: () {},
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  CoustomButtonFrount(
                    name: 'Send',
                    icon: Icons.east,
                    width: width * 0.80,
                    height: height * 0.05,
                    onTapHandler: () {
                      Navigator.pop(context);
                      if (kDebugMode) {
                        print(" send email success");
                      }
                    },
                    backgroundColor: CoustomTheams.buttonColor,
                    fontSize: width * 0.032,
                    textColor: CoustomTheams.whiteShade,
                    iconSize: width * 0.044,
                    iconColor: CoustomTheams.whiteShade,
                    gradientBackgroundColor: CoustomTheams.buttonGradient,
                    validateOpacity: 1,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names

