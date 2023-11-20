import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:test/constants/assets_links.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/flow_screen.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/cities_list_screen/cities_list_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/qualification_screen/qualification_screen_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import '../flow_screens/screens/industry_screen/industry_screen_controller.dart';
import '../flow_screens/screens/department_screen/department_screen_controller.dart';
import '../flow_screens/screens/page6/page6_controller.dart';
import '../flow_screens/screens/skills_screen/skills_screen_controller.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  CitiesListScreenController citiesListScreenController = CitiesListScreenController();
  QualificationScreenController qualificationScreenController = QualificationScreenController();
  IndustryScreenController industryScreenController = IndustryScreenController();
  DepartmentScreenController departmentScreenController = DepartmentScreenController();
  Page6Controller page6 = Page6Controller();
  SkillsScreenController skillsScreenController = SkillsScreenController();

  @override
  void initState() {
     initialFunctionData();
     navigateToFlowScreen();
    super.initState();
  }

  Future initialFunctionData() async {
    citiesListScreenController = Provider.of<CitiesListScreenController>(context, listen: false);
    qualificationScreenController = Provider.of<QualificationScreenController>(context, listen: false);
    industryScreenController = Provider.of<IndustryScreenController>(context, listen: false);
    departmentScreenController = Provider.of<DepartmentScreenController>(context, listen: false);
    page6 = Provider.of<Page6Controller>(context, listen: false);
    skillsScreenController = Provider.of<SkillsScreenController>(context, listen: false);

    await citiesListScreenController.getAllLocationController(context);
    await qualificationScreenController.getAllQualifacationController(context);
    await industryScreenController.getAllJobIndustriesController(context);
    await departmentScreenController.getAllDepartmentModelController(context);
    await page6.getAllSubDepartmentModelController(context);
    await page6.maxSubDepartmentLengthController(context);
    await skillsScreenController.getAllSkillsController(context);
    await skillsScreenController.userFiveSkillsMaxLengthController(context);
  }

  Future navigateToFlowScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return FlowScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          color: CoustomTheams.lightPurpleColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    width: width * 0.18,
                    height: width * 0.18,
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
                          width: width * 0.18,
                          height: width * 0.18,
                        )),
                      ],
                    )),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                width: width * 0.80,
                height: width * 0.06,
                alignment: Alignment.center,
                child: Text(
                  "Hi my name is darshan vyas",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: CoustomTheams.black,
                      fontSize: width * 0.048,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: width * 0.80,
                height: width * 0.06,
                alignment: Alignment.center,
                child: Text(
                  "Let's find job closer to your home ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: CoustomTheams.blackShade54,
                      fontSize: width * 0.030,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
