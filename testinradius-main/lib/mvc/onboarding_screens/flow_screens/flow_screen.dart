import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:test/constants/assets_links.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/flows_screen_const_data.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/cities_list_screen/cities_list_screen.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page10/page10.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page11/page11.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page12/page12.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page13/page13.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page14/page14.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page15/page15.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/qualification_screen/qualification_screen.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/page2.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/industry_screen/industry_screen.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/department_screen/department_screen.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page6/page6.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/skills_screen/skills_screen.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page8/page8.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page9/page9.dart';
import 'package:test/theams/coustom_theams.dart';

class FlowScreen extends StatelessWidget {
  late List<Widget> _pageViews;

   FlowScreen({super.key});




  final PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    _pageViews = [

      CitiesListScreen(
        pageController: pageController,
        navigateToPage: 1,
      ),
      Page2(
        pageController: pageController,
        navigateToPage: 2,
      ),
      QualificationScreen(
        pageController: pageController,
        navigateToPage: 3,
      ),
      IndustryScreen(
        pageController: pageController,
        navigateToPage: 4,
      ),
      DepartmentScreen(
        pageController: pageController,
        navigateToPage: 5,
      ),
      Page6(
        pageController: pageController,
        navigateToPage: 6,
      ),
      SkillsScreen(
        pageController: pageController,
        navigateToPage: 7,
      ),
      Page8(
        pageController: pageController,
        navigateToPage: 8,
      ),
      Page9(
        pageController: pageController,
        navigateToPage: 9,
      ),
      Page10(
        pageController: pageController,
        navigateToPage: 10,
      ),
      page11(
        pageController: pageController,
        navigateToPage: 11,
      ),
      Page12(
        pageController: pageController,
        navigateToPage: 12,
      ),
      Page13(
        pageController: pageController,
        navigateToPage: 13,
      ),
      Page14(
        pageController: pageController,
        navigateToPage: 14,
      ),
      // Page15(
      //   pageController: pageController,
      //   navigateToPage: 15,
      // ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: CoustomTheams.lightPurpleColor,
          child: SafeArea(
            child: PageView.builder(
                itemCount: _pageViews.length,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {},
                itemBuilder: (BuildContext context, int index) {
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
                              Container(
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
                              SizedBox(
                                width: width * 0.06,
                              ),
                              Container(
                                width: width * 0.60,
                                height: double.maxFinite,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FlowScreenConstData.pagesTitle[index],
                                      style: GoogleFonts.poppins(
                                          color: CoustomTheams.black,
                                          fontSize: width * 0.044,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 4,),
                                     Text(
                                       FlowScreenConstData.pageSubTitle[index],
                                      style: GoogleFonts.poppins(
                                          color: CoustomTheams.blackShade54,
                                          fontSize: width * 0.032,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                       _pageViews[index]
                    ],
                  );
                },
                physics: const NeverScrollableScrollPhysics()),
          ),
        ),
      ),
    );
  }
}
