
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/authantication/auth_screen/auth_controller.dart';
import 'package:test/mvc/onboarding_screens/Introduction_screen/Introduction_screen.dart'; 
import 'package:test/mvc/onboarding_screens/flow_screens/screens/cities_list_screen/cities_list_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page10/page10_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page11/page11_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page12/page12_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page14/page14_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/page2_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/qualification_screen/qualification_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/industry_screen/industry_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/department_screen/department_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page6/page6_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/skills_screen/skills_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page8/page8_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page9/page9_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'mvc/onboarding_screens/flow_screens/screens/page13/page13_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [         
        ChangeNotifierProvider(create: (context)=>AuthController() ) , 

        
        ChangeNotifierProvider(create: (context)=>CitiesListScreenController()) ,
        ChangeNotifierProvider(create: (context)=>Page2Controller()), 
        ChangeNotifierProvider(create: (context)=>QualificationScreenController()) , 
        ChangeNotifierProvider(create: (context)=>IndustryScreenController()) , 
        ChangeNotifierProvider(create: (context)=>DepartmentScreenController()),
        ChangeNotifierProvider(create: (context)=>Page6Controller()),
        ChangeNotifierProvider(create: (context)=>SkillsScreenController()),
        ChangeNotifierProvider(create: (context)=>Page8Controller()),
        ChangeNotifierProvider(create: (context)=>Page9Controller()),
        ChangeNotifierProvider(create: (context)=>Page10Controller()),
        ChangeNotifierProvider(create: (context)=>Page11Controller()),
        ChangeNotifierProvider(create: (context)=>Page12Controller()),
        ChangeNotifierProvider(create: (context)=>Page13Controller()),
        ChangeNotifierProvider(create: (context)=>Page14Controller()), 
      ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        chipTheme: ChipThemeData(
          side: BorderSide(width: 1 ,
          
          color: CoustomTheams.dissabledColor
          ),
          showCheckmark: true
        ),
          inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue, width: 6.0),     
          ),
        ),
        useMaterial3: true,
      ),
        home: const IntroductionScreen() ,
        // home: AuthScreen(),
      ),
    );
  }
}


