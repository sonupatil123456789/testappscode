// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:test/components/coustom_button_back.dart';
// import 'package:test/mvc/onboarding_screens/flow_screens/pages/page1/page1_controller.dart';
// import 'package:test/mvc/onboarding_screens/flow_screens/pages/page4/page4_controller.dart';
// import 'package:test/mvc/onboarding_screens/flow_screens/pages/page5/page5_controller.dart';
// import 'package:test/mvc/onboarding_screens/flow_screens/pages/page9/page9_controller.dart';
// import 'package:test/theams/coustom_theams.dart';

// class Page15 extends StatelessWidget {
//   PageController pageController;
//   int navigateToPage;



//   Page15(
//       {super.key, required this.pageController, required this.navigateToPage});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       width: width,
//       height: height * 0.70,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//         color: CoustomTheams.white,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//               height: height * 0.55,
//               width: width,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: height * 0.05,
//                   ),

//                   // profile summery
//                   SizedBox(
//                     height: height * 0.28,
//                     width: width * 0.80,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Profile Summary :",
//                           style: GoogleFonts.poppins(
//                               color: CoustomTheams.blackShade54,
//                               fontSize: width * 0.040,
//                               fontWeight: FontWeight.w700),
//                         ),

//                         SizedBox(
//                           height: height * 0.02,
//                         ),

//                         // get your selected city name
//                         Consumer<Page1Controller>(
//                           builder:
//                               (BuildContext context, value, Widget? child) {
//                             return Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: '- Your default city is ',
//                                     style: GoogleFonts.rubik(
//                                         color: CoustomTheams.blackShade54,
//                                         fontSize: width * 0.034,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                   TextSpan(
//                                     text: value.cityName == ""
//                                         ? ""
//                                         : value.cityName,
//                                     style: GoogleFonts.poppins(
//                                         color: CoustomTheams.accentColor,
//                                         fontSize: width * 0.030,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),

//                         // get weather the user is open to relocate or not
//                         Consumer<Page1Controller>(
//                           builder:
//                               (BuildContext context, value, Widget? child) {
//                             return Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: '- Open to relocate ',
//                                     style: GoogleFonts.rubik(
//                                         color: CoustomTheams.blackShade54,
//                                         fontSize: width * 0.034,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                   TextSpan(
//                                     text: value.openToRelocate == true
//                                         ? "Yes I am open to relocate"
//                                         : "No I am not open to relocate",
//                                     style: GoogleFonts.poppins(
//                                         color: CoustomTheams.accentColor,
//                                         fontSize: width * 0.030,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),

//                         // get user priffered Job
//                         Consumer<Page4Controller>(
//                           builder:
//                               (BuildContext context, value, Widget? child) {
//                             return Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text:
//                                         '- Your priffered job industry is \n ',
//                                     style: GoogleFonts.rubik(
//                                         color: CoustomTheams.blackShade54,
//                                         fontSize: width * 0.034,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                   TextSpan(
//                                     text: value.userPreferredIndustry == ""
//                                         ? ""
//                                         : value.userPreferredIndustry,
//                                     style: GoogleFonts.poppins(
//                                         color: CoustomTheams.accentColor,
//                                         fontSize: width * 0.030,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),

//                         // get user priffered Department
//                         Consumer<Page5Controller>(
//                           builder:
//                               (BuildContext context, value, Widget? child) {
//                             return Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text:
//                                         '- Your priffered job industry is \n ',
//                                     style: GoogleFonts.rubik(
//                                         color: CoustomTheams.blackShade54,
//                                         fontSize: width * 0.034,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                   TextSpan(
//                                     text: value.userPreferredDepartment == ""
//                                         ? ""
//                                         : value.userPreferredDepartment,
//                                     style: GoogleFonts.poppins(
//                                         color: CoustomTheams.accentColor,
//                                         fontSize: width * 0.030,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),

//                         // get your user expected salary
//                         Consumer<Page9Controller>(
//                           builder:
//                               (BuildContext context, value, Widget? child) {
//                             return Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: '- Your expected salary is ',
//                                     style: GoogleFonts.rubik(
//                                         color: CoustomTheams.blackShade54,
//                                         fontSize: width * 0.034,
//                                         fontWeight: FontWeight.w300),
//                                   ),
//                                   TextSpan(
//                                     text: value.userExpectedSalary == ""
//                                         ? ""
//                                         : "INR ${value.userExpectedSalary}",
//                                     style: GoogleFonts.poppins(
//                                         color: CoustomTheams.accentColor,
//                                         fontSize: width * 0.030,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(
//                           height: width * 0.01,
//                         ),

//                         Text(
//                           "To edit any details please go back and make the necessary changes .",
//                           style: GoogleFonts.rubik(
//                               color: CoustomTheams.blackShade54,
//                               fontSize: width * 0.034,
//                               fontWeight: FontWeight.w400),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//           SizedBox(
//             width: width * 0.80,
//             height: height * 0.15,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Consumer<Page1Controller>(
//                   builder: (BuildContext context, Page1Controller value,
//                       Widget? child) {
//                     return CoustomButtonBack(
//                       name: 'Go back',
//                       icon: Icons.west,
//                       width: width * 0.80,
//                       height: height * 0.07,
//                       onTapHandler: () {
//                         // pageController.animateToPage(
//                         //   navigateToPage - 2,
//                         //   duration: const Duration(milliseconds: 300),
//                         //   curve: Curves.easeInOut,
//                         // );
//                       },
//                       backgroundColor: CoustomTheams.buttonColor,
//                       fontSize: width * 0.032,
//                       textColor: CoustomTheams.whiteShade,
//                       iconSize: width * 0.05,
//                       iconColor: CoustomTheams.whiteShade,
//                       gradientBackgroundColor: CoustomTheams.buttonGradient,
//                       validateOpacity: 1,
//                     );
//                   },
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
