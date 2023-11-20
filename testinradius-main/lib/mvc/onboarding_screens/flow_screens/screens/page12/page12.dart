import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page12/page12_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/input_utils.dart';
import 'package:test/utils/listners_utils.dart';

class Page12 extends StatelessWidget {
  PageController pageController;
  int navigateToPage;



  Page12(
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
                children: [
                  Container(
                    width: width * 0.80,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Upload resume (Maximum 5 MB) in any of the following format pdf , docs , png , jpg",
                      style: GoogleFonts.rubik(
                          color: CoustomTheams.blackShade54,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // file picker component for selecting cv
                  Consumer<Page12Controller>(
                    builder: (BuildContext context, value, Widget? child) {
                      return InkWell(
                          onTap: () async {
                            value.userPickedFilename = await InputUtils.getMyFile();
                          },
                          child: Container(
                            width: width * 0.80,
                            height: height * 0.07,
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                color: CoustomTheams.white,
                                border: Border.all(
                                    color: HexColor("#94929B"), width: 1)),
                            child: Row(
                              children: [
                                const Icon(Icons.file_upload),
                                const SizedBox(width: 10,),
                                Text(
                                  value.userPickedFilename,
                                  style: GoogleFonts.poppins(
                                      color: CoustomTheams.blackShade54,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.032,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),

                     const SizedBox(
                    height: 10,
                  ),



                     Container(
                    width: width * 0.80,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "If you want to change your resume than re upload file ",
                      style: GoogleFonts.rubik(
                          color: CoustomTheams.blackShade54,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400),
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
                      pageController.animateToPage(
                        navigateToPage - 2,
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
                  Consumer<Page12Controller>(
                    builder: (BuildContext context, Page12Controller value,
                        Widget? child) {
                      return CoustomButtonFrount(
                        name: 'Next',
                        icon: Icons.east,
                        width: width * 0.36,
                        height: height * 0.07,
                        onTapHandler: () {
                          if (value.userPickedFilename.isEmpty) {
                            return ListnersUtils.showFlushbarMessage(
                                'Please upload your cv',
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
                        textColor: CoustomTheams.whiteShade,
                        iconSize: width * 0.044,
                        iconColor: CoustomTheams.whiteShade,
                        gradientBackgroundColor:
                            CoustomTheams.buttonGradient,
                        validateOpacity:
                            value.userPickedFilename.isEmpty ? 0.4 : 1,
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
