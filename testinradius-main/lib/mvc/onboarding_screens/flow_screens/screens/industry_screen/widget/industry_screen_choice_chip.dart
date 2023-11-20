import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/industry_screen/industry_screen_controller.dart';
import 'package:test/theams/coustom_theams.dart';

// ignore: must_be_immutable
class IndustryScreenChoiceChips extends StatelessWidget {
  Color bgColor;
  Color selectColor;
  double textFontSize;

  IndustryScreenChoiceChips({
    super.key,
    required this.bgColor,
    required this.selectColor,
    required this.textFontSize
  });



  @override
  Widget build(BuildContext context) {
    return Consumer<IndustryScreenController>(builder: (BuildContext context, IndustryScreenController industryScreenValue, Widget? child) { 

      final allJobIndustry = industryScreenValue.getAllJobIndustryModel.allIndustries;
      

      if (allJobIndustry != null) {
         return SingleChildScrollView(
      child: Wrap(
        children: List.generate(
            allJobIndustry.length,
            (index) {
    
              final items = allJobIndustry[index];
              return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 6, 4),
                  child: ChoiceChip(
                    backgroundColor:bgColor,
                    showCheckmark: true,
                    checkmarkColor: CoustomTheams.white,
                    selectedColor: selectColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    label: Text(
                      items.industry.toString(),
                           style: GoogleFonts.rubik(
                              color: industryScreenValue.selectedValue == index ? CoustomTheams.white : CoustomTheams.blue,
                              fontSize:textFontSize,
                              fontWeight: FontWeight.w400
                              ),
                    ),
                    onSelected: (bool value) {
                      industryScreenValue.selectedChipValue(index);
                      industryScreenValue.userPreferredIndustry =items.industry.toString();
                        industryScreenValue.userPreferredIndustryId = items.sId.toString();
                    }, selected: industryScreenValue.selectedValue == index ? true : false ,
                  ),
                );
            }
                ),
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

     },);
   
  }
}
