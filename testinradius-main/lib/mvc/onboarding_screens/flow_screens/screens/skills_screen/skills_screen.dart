import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:test/components/coustom%20_button_frount.dart';
import 'package:test/components/coustom_button_back.dart';
import 'package:test/constants/assets_links.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/skills_screen/skills_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/skills_screen/widgets/dropdown_search.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/listners_utils.dart';

class SkillsScreen extends StatelessWidget {
  PageController pageController;
  int navigateToPage;

  SkillsScreen(
      {super.key, required this.pageController, required this.navigateToPage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
          context.read<SkillsScreenController>().openCloseDropdownState = false;
        if (context.read<SkillsScreenController>().openCloseDropdownState == false) {
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
                    //  searchable dropdown component for skills
                    DropdownSearchSkills(
                      hintText: 'Select Up To five skills',
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
                    Consumer<SkillsScreenController>(
                      builder: (BuildContext context, SkillsScreenController skillsScreenValue,
                          Widget? child) {
                        int maxSkillsLength =
                            skillsScreenValue.userFiveSkillsMaxLength - 1;
    
                        return CoustomButtonFrount(
                          name: 'Next',
                          icon: Icons.east,
                          width: width * 0.36,
                          height: height * 0.07,
                          onTapHandler: () {
                            if (skillsScreenValue.userFiveSkills.isEmpty ||
                                skillsScreenValue.userFiveSkills.length <=
                                    maxSkillsLength) {
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
                          gradientBackgroundColor:
                              CoustomTheams.buttonGradient,
                          validateOpacity: skillsScreenValue.userFiveSkills.isEmpty ||
                                  skillsScreenValue.userFiveSkills.length <=
                                      maxSkillsLength
                              ? 0.4
                              : 1,
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
