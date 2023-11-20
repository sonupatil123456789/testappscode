import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page6/page6_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:test/utils/listners_utils.dart';

// ignore: must_be_immutable
class MultipalChipsPage6 extends StatelessWidget {
  Color bgColor;
  Color selectColor;
  double textFontSize;

  MultipalChipsPage6({
    super.key,
    // required this.index,
    required this.bgColor,
    required this.selectColor,
    required this.textFontSize,
  });



  @override
  Widget build(BuildContext context) {
    return Consumer<Page6Controller>(
      builder:
          (BuildContext context, Page6Controller page6value, Widget? child) {
        final subFunction = page6value.filters;

        if (subFunction != null) {
          return SingleChildScrollView(
            child: Wrap(
                children: List.generate(subFunction.length, (index) {
              final data = subFunction[index];
              final maxCount = page6value.userPreferredSubDepartmentMaxLength-1;

              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 6, 4),
                child: FilterChip(
                  selectedColor: selectColor,
                  checkmarkColor: CoustomTheams.white,
                  showCheckmark: true,
                  backgroundColor: bgColor,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: HexColor("#FFFFFF"),
                          width: 0,
                          style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(20)),
                  label: Text(
                    data.subDomain,
                    style: GoogleFonts.rubik(
                        color: page6value.SelectedSubFunction.contains(
                                page6value.filters[index])
                            ? CoustomTheams.white
                            : CoustomTheams.blue,
                        fontSize: textFontSize,
                        fontWeight: FontWeight.w400),
                  ),
                  selected: page6value.SelectedSubFunction.contains(
                      page6value.filters[index]),
                  onSelected: (bool selected) {
                    if (page6value.SelectedSubFunction.contains(
                        page6value.filters[index])) {
                      page6value.removeSubFunction(page6value.filters[index]);
                    } else {
                      if (page6value.SelectedSubFunction.length <= maxCount) {
                        page6value.addSubFunction(page6value.filters[index]);
                      } else {
                        ListnersUtils.showFlushbarMessage(
                            'Yoy cannot select more than ${maxCount+1}',
                            Colors.yellowAccent,
                            CoustomTheams.blackShade54,
                            'Error',
                            Icons.error,
                            context);
                      }
                    }
                  },
                ),
              );
            }).toList()),
          );
        } else {
          return Text("No data",
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black87,
              ));
        }
      },
    );
  }
}
