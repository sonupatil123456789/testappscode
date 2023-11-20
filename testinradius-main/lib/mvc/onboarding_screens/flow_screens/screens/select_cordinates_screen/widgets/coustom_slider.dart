import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/select_cordinates_screen/page2_controller.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomSlider extends StatelessWidget {

  num maxValue; 
  int division;


  CoustomSlider({super.key, required this.maxValue, required this.division});


  @override
  Widget build(BuildContext context) {
    return Consumer<Page2Controller>(builder: (BuildContext context, Page2Controller page2Value, Widget? child) { 
      return Slider(
        value: page2Value.jobRadiusRange,
        max: maxValue as double,
        activeColor: CoustomTheams.accentColor,
        min: 5.0,
        // divisions:division,
        label: page2Value.jobRadiusRange.round().toString(),
        onChanged: (double value) {
          page2Value.jobRadiusRangeValue(value);
        },
      );
     },);
  }
}