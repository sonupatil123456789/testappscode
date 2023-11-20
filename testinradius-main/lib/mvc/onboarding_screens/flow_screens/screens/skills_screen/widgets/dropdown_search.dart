// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:test/components/chips.dart';
// import 'package:test/mvc/onboarding_screens/flow_screens/screens/page7/page7_controller.dart';
// import 'package:test/theams/coustom_theams.dart';
// import 'package:test/utils/input_utils.dart';
// import 'package:test/utils/listners_utils.dart';

// class DropdownSearchPage7 extends StatefulWidget {
//   final String hintText;

//   DropdownSearchPage7({
//     required this.hintText,
//   });

//   @override
//   _DropdownSearchPage7State createState() => _DropdownSearchPage7State();
// }



// class _DropdownSearchPage7State extends State<DropdownSearchPage7> {
//   Color generateRandomLightShadeColor() {
//     Random random = Random();
//     int red = random.nextInt(128) + 128; // 128 to 255 (inclusive)
//     int green = random.nextInt(128) + 128; // 128 to 255 (inclusive)
//     int blue = random.nextInt(128) + 128; // 128 to 255 (inclusive)
//     return Color.fromARGB(255, red, green, blue);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Container(
//       decoration: BoxDecoration(
//         color: CoustomTheams.white,
//       ),
//       child: Column(
//         children: <Widget>[
//           Consumer<Page7Controller>(
//             builder: (BuildContext context, Page7Controller page7Value,
//                 Widget? child) {
//               return SizedBox(
//                   width: width * 0.80,
//                   child: Wrap(
//                       children: List.generate(page7Value.userFiveSkills.length,
//                           (index) {
//                     return CoustomChips(
//                         dataName: page7Value.userFiveSkills[index].skill,
//                         id: index,
//                         deletChip: (dynamic deletIndex) {
//                           page7Value.removeChips(deletIndex);
//                         });
//                   }).toList()));
//             },
//           ),
//           SizedBox(
//               width: width * 0.80,
//               height: height * 0.06,
//               child: Consumer<Page7Controller>(
//                 builder: (BuildContext context, Page7Controller page7Value,
//                     Widget? child) {
//                   return TextFormField(
//                     controller: InputUtils.SEARCH_FIVE_SKILLS,
//                     onTap: () {
//                       page7Value.openCloseDropdownState =
//                           !page7Value.openCloseDropdownState;
//                     },
//                     onEditingComplete: () {
//                       page7Value.search = InputUtils.SEARCH_FIVE_SKILLS.text.toString();
//                     },
//                     decoration: InputDecoration(
//                       hintText: widget.hintText,
//                       labelStyle: TextStyle(color: HexColor("#133C58")),
//                       hintStyle: GoogleFonts.poppins(
//                           color: CoustomTheams.blackShade54,
//                           fontSize: width * 0.032,
//                           fontWeight: FontWeight.w600),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10)),
//                         borderSide: CoustomTheams.fieldsBorderColor,
//                       ),
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.arrow_drop_down_circle),
//                         onPressed: () {
//                           page7Value.openCloseDropdownState =
//                               !page7Value.openCloseDropdownState;
//                         },
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10)),
//                         borderSide: CoustomTheams.fieldsBorderColor,
//                       ),
//                     ),
//                     onChanged: (value) {
//                       if (value.isEmpty) {
//                         page7Value.search = "";
//                       }
//                       page7Value.search = InputUtils.SEARCH_FIVE_SKILLS.text.toString();
//                     },
//                   );
//                 },
//               )),
//           const SizedBox(height: 10.0),
//           Consumer<Page7Controller>(
//             builder: (BuildContext context, Page7Controller page7Value,
//                 Widget? child) {
//               return AnimatedContainer(
//                   curve: Curves.bounceInOut,
//                   width: width * 0.80,
//                   height: page7Value.openCloseDropdownState == true
//                       ? height * 0.16
//                       : 0,
//                   decoration:
//                       BoxDecoration(color: CoustomTheams.white, boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xd6d6d6).withOpacity(0.7),
//                       offset: const Offset(2, 3),
//                       blurRadius: 12,
//                       spreadRadius: 4,
//                     ),
//                   ]),
//                   duration: const Duration(milliseconds: 200),
//                   child: ListView.builder(
//                     itemCount: page7Value.skillsData.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final item = page7Value.skillsData[index].skill;
//                       final maxCount = page7Value.userFiveSkillsMaxLength;
//                       Color randomColor = generateRandomLightShadeColor();

//                       if (item != null) {
//                         if (item
//                             .toLowerCase()
//                             .contains(page7Value.search.toLowerCase())) {
//                           return Column(
//                             children: [
//                               ListTile(
//                                 leading: Container(
//                                   width: width * 0.08,
//                                   height: width * 0.08,
//                                   decoration: BoxDecoration(
//                                       color: randomColor,
//                                       shape: BoxShape.circle),
//                                 ),
//                                 title: Text(
//                                   item,
//                                   style: GoogleFonts.rubik(
//                                       color: CoustomTheams.black,
//                                       fontSize: width * 0.030,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                                 onTap: () {
//                                   if (page7Value.userFiveSkills.length <=
//                                       maxCount) {
//                                     page7Value.addChips(index);
//                                   } else {
//                                     ListnersUtils.showFlushbarMessage(
//                                         'Yoy cannot select more than ${maxCount + 1}',
//                                         Colors.yellowAccent,
//                                         CoustomTheams.blackShade54,
//                                         'Error',
//                                         Icons.error,
//                                         context);
//                                   }
//                                 },
//                               ),
//                               const Divider()
//                             ],
//                           );
//                         }
//                         return child;
//                       }

//                       return child;
//                     },
//                   ));
//             },
//             child: const SizedBox.shrink(),
//           )
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:test/components/chips.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/qualification_screen/qualification_screen_controller.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/skills_screen/skills_screen_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/input_utils.dart';

class DropdownSearchSkills  extends StatefulWidget {
  final String hintText;


  DropdownSearchSkills({
    super.key,
    required this.hintText,

  });

  @override
  _DropdownSearchSkillsState createState() => _DropdownSearchSkillsState();
}

class _DropdownSearchSkillsState extends State<DropdownSearchSkills> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: CoustomTheams.white,
      ),
      child: Column(
        children: <Widget>[
          Consumer<SkillsScreenController>(
            builder: (BuildContext context, SkillsScreenController skillsScreenValue,
                Widget? child) {
              return SizedBox(
                  width: width * 0.80,
                  child: Wrap(
                      children: List.generate(skillsScreenValue.userFiveSkills.length,
                          (index) {
                    return CoustomChips(
                        dataName: skillsScreenValue.userFiveSkills[index].skill,
                        id: index,
                        deletChip: (dynamic deletIndex) {
                          skillsScreenValue.removeChips(deletIndex);
                        });
                  }).toList()));
            },
          ),
                 Container(
                      width: width * 0.80,
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.hintText,
                        style: GoogleFonts.rubik(
                            color: CoustomTheams.blackShade54,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 10,),
          SizedBox(
              width: width * 0.80,
              height: height * 0.06,
              child: Consumer<SkillsScreenController>(
                builder: (BuildContext context, SkillsScreenController skillsScreenValue,
                    Widget? child) {
                  return TextFormField(
                    controller: InputUtils.SEARCH_THREE_QUALIFACATION,
                    autofocus: skillsScreenValue.openCloseDropdownState == true ? true : false,
                    onTap: () {
                      skillsScreenValue.openCloseDropdownState =
                          !skillsScreenValue.openCloseDropdownState;

                      if (skillsScreenValue.openCloseDropdownState == false) {
                        FocusScope.of(context).unfocus();
                      }

  
                    },
                    onEditingComplete: () {
                      skillsScreenValue.search = skillsScreenValue.search;
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      labelStyle: TextStyle(color: HexColor("#133C58")),
                      hintStyle: GoogleFonts.poppins(
                          color: CoustomTheams.blackShade54,
                          fontSize: width * 0.032,
                          fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: CoustomTheams.fieldsBorderColor,
                      ),
                      suffixIcon: const Icon(Icons.arrow_drop_down_circle),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: CoustomTheams.fieldsBorderColor,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        skillsScreenValue.search = "";
                      }
                     skillsScreenValue.search = value.toString();
                    },
                  );
                },
              )),
          const SizedBox(height: 10.0),
          Consumer<SkillsScreenController>(
            builder: (BuildContext context,  SkillsScreenController skillsScreenValue,
                Widget? child) {
              return AnimatedContainer(
                  curve: Curves.bounceInOut,
                  width: width * 0.80,
                  height: skillsScreenValue.openCloseDropdownState == true
                      ? height * 0.16
                      : 0,
                  decoration: BoxDecoration(
                      color: CoustomTheams.white,
                      boxShadow: skillsScreenValue.openCloseDropdownState != false
                          ? [
                              BoxShadow(
                                color: const Color(0xd6d6d6).withOpacity(0.7),
                                offset: const Offset(2, 3),
                                blurRadius: 12,
                                spreadRadius: 4,
                              )
                            ]
                          : []),
                  duration: const Duration(milliseconds: 200),
                  child: ListView.builder(
                    itemCount: skillsScreenValue.skillsData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item =
                           skillsScreenValue.skillsData[index];
                           final maxCount = skillsScreenValue.userFiveSkillsMaxLength-1;

                      if (item.skill != null) {
                        RegExp myPattern = RegExp(
                          skillsScreenValue.search,
                          caseSensitive: false,
                          multiLine: false,
                        );

                        RegExp specialCharPattern = RegExp(r'[^\w\s]');
                        String cleanedString = item.skill
                            .toString()
                            .replaceAll(specialCharPattern, '');

                        if (myPattern.hasMatch(cleanedString)) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  item.skill.toString(),
                                  style: GoogleFonts.rubik(
                                      color: CoustomTheams.black,
                                      fontSize: width * 0.030,
                                      fontWeight: FontWeight.w400),
                                ),
                                onTap: () {
                                  if (skillsScreenValue.userFiveSkills.length <=
                                      maxCount) {
                                    skillsScreenValue.addChips(index);
                                  } else {
                                    return;
                                  }
                                },
                              ),
                              const Divider()
                            ],
                          );
                        }

                        return child;
                      }

                      return child;
                    },
                  ));
            },
            child: const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}

