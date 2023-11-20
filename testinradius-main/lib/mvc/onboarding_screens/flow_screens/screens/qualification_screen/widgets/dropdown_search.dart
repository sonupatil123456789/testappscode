

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:test/components/chips.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/qualification_screen/qualification_screen_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/input_utils.dart';

class DropdownSearchQualification extends StatefulWidget {
  final String hintText;
  int maxCount;

  DropdownSearchQualification({
    super.key,
    required this.hintText,
    required this.maxCount,
  });

  @override
  _DropdownSearchQualificationState createState() => _DropdownSearchQualificationState();
}

class _DropdownSearchQualificationState extends State<DropdownSearchQualification> {
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
          Consumer<QualificationScreenController>(
            builder: (BuildContext context, QualificationScreenController qualificationScreenValue,
                Widget? child) {
              return SizedBox(
                  width: width * 0.80,
                  child: Wrap(
                      children: List.generate(
                          qualificationScreenValue.userThreeQualification.length, (index) {
                    return CoustomChips(
                        dataName: qualificationScreenValue
                            .userThreeQualification[index].qualification,
                        id: index,
                        deletChip: (dynamic deletIndex) {
                          qualificationScreenValue.removeChips(deletIndex);
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
              child: Consumer<QualificationScreenController>(
                builder: (BuildContext context, QualificationScreenController qualificationScreenValue,
                    Widget? child) {
                  return TextFormField(
                    controller: InputUtils.SEARCH_THREE_QUALIFACATION,
                    autofocus: qualificationScreenValue.openCloseDropdownState == true ? true : false,
                    onTap: () {
                      qualificationScreenValue.openCloseDropdownState =
                          !qualificationScreenValue.openCloseDropdownState;

                      if (qualificationScreenValue.openCloseDropdownState == false) {
                        FocusScope.of(context).unfocus();
                      }

  
                    },
                    onEditingComplete: () {
                      qualificationScreenValue.search =qualificationScreenValue.search;
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
                        qualificationScreenValue.search = "";
                      }
                      qualificationScreenValue.search =
                          value.toString();
                    },
                  );
                },
              )),
          const SizedBox(height: 10.0),
          Consumer<QualificationScreenController>(
            builder: (BuildContext context, QualificationScreenController qualificationScreenValue,
                Widget? child) {
              return AnimatedContainer(
                  curve: Curves.bounceInOut,
                  width: width * 0.80,
                  height: qualificationScreenValue.openCloseDropdownState == true
                      ? height * 0.25
                      : 0,
                  decoration: BoxDecoration(
                      color: CoustomTheams.white,
                      boxShadow: qualificationScreenValue.openCloseDropdownState != false
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
                    itemCount: qualificationScreenValue.qualificationData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item =
                          qualificationScreenValue.qualificationData[index];

                      if (item.qualification != null) {
                        RegExp myPattern = RegExp(
                          qualificationScreenValue.search,
                          caseSensitive: false,
                          multiLine: false,
                        );

                        RegExp specialCharPattern = RegExp(r'[^\w\s]');
                        String cleanedString = item.qualification
                            .toString()
                            .replaceAll(specialCharPattern, '');

                        if (myPattern.hasMatch(cleanedString)) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  item.qualification.toString(),
                                  style: GoogleFonts.rubik(
                                      color: CoustomTheams.black,
                                      fontSize: width * 0.030,
                                      fontWeight: FontWeight.w400),
                                ),
                                onTap: () {
                                  if (qualificationScreenValue
                                          .userThreeQualification.length <=
                                      widget.maxCount) {
                                    qualificationScreenValue.addChips(index);
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
