import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomSwitch extends StatefulWidget {
  Function switchValue;

  CoustomSwitch({super.key, required this.switchValue});

  @override
  State<CoustomSwitch> createState() => _CoustomSwitchState();
}

class _CoustomSwitchState extends State<CoustomSwitch> {
  bool _isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
   
      width: MediaQuery.of(context).size.width*0.12,
      height:  MediaQuery.of(context).size.width*0.08,

      child: Switch(
          value: _isToggled,       
          inactiveTrackColor :   CoustomTheams.white,     
          activeColor: CoustomTheams.accentColor,// fc4102
          onChanged: (value) {
            setState(() {
              _isToggled = value;
              widget.switchValue(value);
            });
          }),
    );
  }
}
