import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/department_screen/department_screen_controller.dart';
import 'package:test/theams/coustom_theams.dart';
import '../../page6/page6_controller.dart';

// ignore: must_be_immutable
class DepartmentScreenChoiceChips extends StatelessWidget {
  Color bgColor;
  Color selectColor;
  double textFontSize;

  DepartmentScreenChoiceChips(
      {super.key,
      required this.bgColor,
      required this.selectColor,
      required this.textFontSize});

        Page6Controller page6 = Page6Controller();

  @override
  Widget build(BuildContext context) {
        page6 = Provider.of<Page6Controller>(context, listen: false);


    return Consumer<DepartmentScreenController>(
      builder:
          (BuildContext context, DepartmentScreenController departmentScreenalue, Widget? child) {
        final allDomains = departmentScreenalue.getAllDepartmentModel.allDomains;

        if (allDomains != null) {
          return SingleChildScrollView(
            child: Wrap(
              children: List.generate(allDomains.length, (index) {
                final items = allDomains[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 6, 4),
                  child: ChoiceChip(
                    backgroundColor: bgColor,
                    showCheckmark: true,
                    checkmarkColor: CoustomTheams.white,
                    selectedColor: selectColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    label: Text(
                      items.domain.toString(),
                      style: GoogleFonts.rubik(
                          color: departmentScreenalue.selectedValue == index
                              ? CoustomTheams.white
                              : CoustomTheams.blue,
                          fontSize: textFontSize,
                          fontWeight: FontWeight.w400),
                    ),
                    onSelected: (bool value) async {
                      departmentScreenalue.selectedChipValue(index);
                      departmentScreenalue.userPreferredDepartment =
                          items.domain.toString();
                      departmentScreenalue.userPreferredDepartmentId =
                          items.sId.toString();

                      await page6.filterSubDepartmentWithDepartmentController(
                          items.sId.toString());
                    },
                    selected: departmentScreenalue.selectedValue == index ? true : false,
                  ),
                );
              }),
            ),
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
