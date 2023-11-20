import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test1/view/components/coustom_slider.dart';
import 'package:test1/view/components/dropdown.dart';

import '../../utils/input_field_utils.dart';
import '../components/card_header.dart';
import '../components/coustom_button.dart';
import '../components/coustom_textfield.dart';
import '../components/filter_chips.dart';

class RefineScreen extends StatelessWidget {
  const RefineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#133C58"),
        title: Text("Refine"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        width: screenwidth,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            CardHeader(
              isVisible: false,
              navigateToList: () {},
              titleText: 'Select Yours Avilibality',
            ),
            Container(
                alignment: Alignment.center,
                width: screenwidth * 0.90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: HexColor("#133C58"), width: 1)),
                child: DropdownBtn()),
            CardHeader(
              isVisible: false,
              navigateToList: () {},
              titleText: 'Add Your Status',
            ),
            Container(
              width: screenwidth * 0.90,
              height: screenhight * 0.08,
              child: CoustomTextfield(
                controller: InputFielUtils.nameController,
                isPasswordTextField: true,
                labelText: '',
                maxline: 1,
                placeholder: 'Hii community ! I am open to new connection 😄',
                width: screenwidth * 0.90,
                FocusNodeNames: InputFielUtils.nameFocusNode,
                changeFocusNode: InputFielUtils.nameFocusNode,
                iconName: Icons.lock,
              ),
            ),
            CardHeader(
              isVisible: false,
              navigateToList: () {},
              titleText: 'Select Local Distance',
            ),
            Container(
                alignment: Alignment.center,
                width: screenwidth * 0.90,
                child: CoustomSlider()),
            CardHeader(
              isVisible: false,
              navigateToList: () {},
              titleText: 'Select Purpose',
            ),
            Container(
                alignment: Alignment.center,
                // color: Colors.amber,
                width: screenwidth * 0.90,
                child: Wrap(
                  children: [FilterChips()],
                )),
            SizedBox(
              height: 30,
            ),
            CommonButton(
                width: screenwidth * 0.50,
                height: screenhight * 0.045,
                btnTitle: "Save & Explore",
                btnColor: HexColor('#133C58'),
                onTapHandler: () {})
          ],
        ),
      )),
    );
  }
}
