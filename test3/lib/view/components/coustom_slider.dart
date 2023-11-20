import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CoustomSlider extends StatefulWidget {
  const CoustomSlider({super.key});

  @override
  State<CoustomSlider> createState() => _CoustomSliderState();
}

class _CoustomSliderState extends State<CoustomSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      activeColor: HexColor('#133C58'),
      max: 100,
      autofocus: true,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
