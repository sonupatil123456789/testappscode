import 'package:flutter/material.dart';
import 'package:test1/view/components/icon_svg_button.dart';
import 'package:test1/view/components/paragraph_text.dart';
import '../../utils/constants/assets.dart';

class BottomBar extends StatelessWidget {
  Function screen;
  Color backgroundColor;
  Color iconColor;

  BottomBar({
    super.key,
    required this.screen,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      height: screenhight * 0.07,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: const Border(
            top: BorderSide(
              color: Color.fromARGB(255, 214, 214, 214),
              width: 0.2,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenwidth * 0.02,
          ),
          IconSvgButton(
            crowselclick: () {
              screen(0);
            },
            height: screenhight,
            width: screenwidth,
            iconimage: AssetImgLinks.home,
            iconImageColor: iconColor,
          ),
          SizedBox(
            width: screenwidth * 0.02,
          ),
          IconSvgButton(
            crowselclick: () {
              screen(1);
            },
            height: screenhight,
            width: screenwidth,
            iconimage: AssetImgLinks.search,
            iconImageColor: iconColor,
          ),
          SizedBox(
            width: screenwidth * 0.02,
          ),
          IconSvgButton(
            crowselclick: () {
              // screen(2);
            },
            height: screenhight,
            width: screenwidth,
            iconimage: AssetImgLinks.notifacation,
            iconImageColor: iconColor,
          ),
          SizedBox(
            width: screenwidth * 0.02,
          ),
          IconSvgButton(
            crowselclick: () {
              // screen(3);
            },
            height: screenhight,
            width: screenwidth,
            iconimage: AssetImgLinks.user,
            iconImageColor: iconColor,
          ),
          SizedBox(
            width: screenwidth * 0.02,
          ),
        ],
      ),
    );
  }
}
