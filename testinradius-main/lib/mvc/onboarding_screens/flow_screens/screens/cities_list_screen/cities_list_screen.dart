import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/cities_list_screen/cities_list_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/cities_list_screen/widgets/cities_card.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/theams/coustom_theams.dart';

class CitiesListScreen extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  CitiesListScreen(
      {super.key, required this.pageController, required this.navigateToPage});

  CitiesListScreenController citiesListScreenController = CitiesListScreenController();

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
                  // city cards list
                  SizedBox(
                      height: height * 0.32,
                      width: width * 0.80,
                      child: CitiesCard()),

                  SizedBox(
                    height: width * 0.03,
                  ),

                  // open to relocate switch
                  Consumer<CitiesListScreenController>(
                    builder: (BuildContext context,
                        CitiesListScreenController cityScreenValue, Widget? child) {
                      return SizedBox(
                        height: height * 0.12,
                        width: width * 0.80,
                        // color: Colors.deepPurple,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                const Spacer(),
                                Text(
                                  "Open to relocate ?",
                                  style: GoogleFonts.poppins(
                                      color:
                                          cityScreenValue.openToRelocate == true
                                              ? CoustomTheams.black
                                              : CoustomTheams.blackShade54,
                                      fontSize: width * 0.036,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Switch(
                                    value: cityScreenValue.openToRelocate,
                                    inactiveTrackColor: CoustomTheams.whiteShade,
                                    inactiveThumbColor: CoustomTheams.white,
                                    trackOutlineWidth:const MaterialStatePropertyAll(0.0),
                                    trackOutlineColor: MaterialStatePropertyAll(CoustomTheams.whiteShade),
                                    activeColor:
                                        CoustomTheams.accentColor, // fc4102
                                    onChanged: (value) {
                                      cityScreenValue.openToRelocate = value;
                                    }),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                cityScreenValue.openToRelocate == true
                                    ? "Note : You must select a default / primary city to proceed"
                                    : "",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: CoustomTheams.blackShade54,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w300))
                          ],
                        ),
                      );
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Consumer<CitiesListScreenController>(
                    builder: (BuildContext context, CitiesListScreenController cityScreenValue,
                        Widget? child) {
                      return CoustomButtonFrount(
                        name: 'Start Your Journey',
                        icon: Icons.trending_flat,
                        width: width * 0.80,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (cityScreenValue.cityName.isEmpty == true) {
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
                        iconSize: width * 0.05,
                        iconColor: CoustomTheams.white,
                        gradientBackgroundColor:
                            CoustomTheams.buttonGradient,
                        validateOpacity: cityScreenValue.cityName.isEmpty ? 0.4 : 1,
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
