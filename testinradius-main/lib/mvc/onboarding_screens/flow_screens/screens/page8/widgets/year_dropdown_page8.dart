import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/page8/page8_controller.dart';
import 'package:test/theams/coustom_theams.dart';

class yearDropdownPage8 extends StatelessWidget {
  List dataList;
  String hintText;
  dynamic initialSelecteddata;

  yearDropdownPage8({
    super.key,
    required this.dataList,
    required this.initialSelecteddata,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<Page8Controller>(
      builder:
          (BuildContext context, Page8Controller page8Value, Widget? child) {
        return InkWell(
          onTap: () {
            page8Value.openCloseDropdownYearState =
                !page8Value.openCloseDropdownYearState;
          },
          child: Column(
            children: <Widget>[
              Container(
                width: width * 0.36,
                height: height * 0.07,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: CoustomTheams.white,
                    border: CoustomTheams.coustomBorder),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.23,
                      height: height * 0.04,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        page8Value.userExperienceInYear == 0
                            ? hintText
                            : page8Value.userExperienceInYear.toString(),
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.poppins(
                            color: CoustomTheams.blackShade54,
                            fontSize: width * 0.032,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    const Icon(Icons.arrow_drop_down_circle)
                  ],
                ),
              ),
              const SizedBox(height: 2.0),
              Container(
                  width: width * 0.36,
                  height: page8Value.openCloseDropdownYearState == true
                      ? height * 0.18
                      : 0,
                  decoration: BoxDecoration(
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      color: CoustomTheams.white,
                        border: CoustomTheams.coustomBorder),
                  child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = dataList[index];
                      return ListTile(
                        title: Text(
                          item.toString(),
                          style: GoogleFonts.rubik(
                              color: CoustomTheams.black,
                              fontSize: width * 0.030,
                              fontWeight: FontWeight.w400),
                        ),
                        onTap: () {
                          page8Value.userExperienceInYear = item ;
                          page8Value.openCloseDropdownYearState =
                              !page8Value.openCloseDropdownYearState;
                        },
                      );
                    },
                  )),
            ],
          ),
        );
      },
    );
  }
}
