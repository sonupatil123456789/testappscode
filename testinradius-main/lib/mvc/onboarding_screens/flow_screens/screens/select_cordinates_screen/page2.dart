import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/widgets/coustom_google_map_view.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/widgets/coustom_slider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/page2_controller.dart';
import 'package:test/utils/listners_utils.dart';
import '../../../../../theams/coustom_theams.dart';

class Page2 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  Page2(
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


                  // seting radious for desire job location using google map 
                  CoustomGoogleMapView(),
                 

                  SizedBox(
                    height: width * 0.03,
                  ),

                  // job radious slider
                  SizedBox(
                      width: width * 0.80,
                      height: height * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " 5 Km",
                                style: GoogleFonts.poppins(
                                    color: CoustomTheams.blackShade54,
                                    fontSize: width * 0.030,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "30 Km ",
                                style: GoogleFonts.poppins(
                                    color: CoustomTheams.blackShade54,
                                    fontSize: width * 0.030,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          CoustomSlider(
                            maxValue: 30.0,
                            division: 30,
                          ),
                        ],
                      ))
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
                  Consumer<Page2Controller>(
                    builder: (BuildContext context, Page2Controller value,
                        Widget? child) {
                      return CoustomButtonFrount(
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (value.locationLatitude == 0.0 ||
                              value.locationLongitude == 0.0) {
                            return ListnersUtils.showFlushbarMessage(
                                'Please select radius location before proceeding ',
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
                        gradientBackgroundColor: CoustomTheams.buttonGradient,
                        validateOpacity: value.locationLatitude == 0.0 ||
                                value.locationLongitude == 0.0
                            ? 0.4
                            : 1,
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
