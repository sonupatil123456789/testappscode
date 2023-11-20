import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test1/view/components/icon_svg_button.dart';
import 'package:test1/view/components/paragraph_text.dart';
import '../../utils/constants/assets.dart';

class BottomBar extends StatelessWidget {
  Function screen;
  Color backgroundColor;
  Color iconColor;

  ValueNotifier<int> buttonClicked = ValueNotifier<int>(0);

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
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth * 0.02,
                ),
                InkWell(
                  onTap: () {
                    screen(0);
                    buttonClicked.value = 0;
                  },
                  child: Column(
                    children: [
                      IconSvgButton(
                        crowselclick: () {},
                        height: screenhight,
                        width: screenwidth,
                        iconimage: AssetImgLinks.explore,
                        iconImageColor: buttonClicked.value == 0
                            ? iconColor
                            : HexColor("#2B4C62"), //2B4C62
                      ),
                      Text(
                        "Explore",
                        style: TextStyle(
                            color: buttonClicked.value == 0
                                ? iconColor
                                : HexColor("#2B4C62"),
                            fontSize: screenwidth * 0.034,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenwidth * 0.02,
                ),
                InkWell(
                  onTap: () {
                    buttonClicked.value = 1;
                  },
                  child: Column(
                    children: [
                      IconSvgButton(
                        crowselclick: () {},
                        height: screenhight,
                        width: screenwidth,
                        iconimage: AssetImgLinks.home,
                        iconImageColor: buttonClicked.value == 1
                            ? iconColor
                            : HexColor("#2B4C62"),
                      ),
                      Text(
                        "Network",
                        style: TextStyle(
                            color: buttonClicked.value == 1
                                ? iconColor
                                : HexColor("#2B4C62"),
                            fontSize: screenwidth * 0.034,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenwidth * 0.02,
                ),
                InkWell(
                  onTap: () {
                    // screen(0);
                    buttonClicked.value = 2;
                  },
                  child: Column(
                    children: [
                      IconSvgButton(
                        crowselclick: () {
                          buttonClicked.value = 2;
                          // screen(2);
                        },
                        height: screenhight,
                        width: screenwidth,
                        iconimage: AssetImgLinks.chat,
                        iconImageColor: buttonClicked.value == 2
                            ? iconColor
                            : HexColor("#2B4C62"),
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(
                            color: buttonClicked.value == 2
                                ? iconColor
                                : HexColor("#2B4C62"),
                            fontSize: screenwidth * 0.034,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: screenwidth * 0.02,
                ),
                Column(
                  children: [
                    IconSvgButton(
                      crowselclick: () {
                        buttonClicked.value = 3;
                        // screen(2);
                      },
                      height: screenhight,
                      width: screenwidth,
                      iconimage: AssetImgLinks.contacts,
                      iconImageColor: buttonClicked.value == 3
                          ? iconColor
                          : HexColor("#2B4C62"),
                    ),
                    Text(
                      "Contacts",
                      style: TextStyle(
                          color: buttonClicked.value == 3
                              ? iconColor
                              : HexColor("#2B4C62"),
                          fontSize: screenwidth * 0.034,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  width: screenwidth * 0.02,
                ),
                Column(
                  children: [
                    IconSvgButton(
                      crowselclick: () {
                        buttonClicked.value = 4;
                        // screen(3);
                      },
                      height: screenhight,
                      width: screenwidth,
                      iconimage: AssetImgLinks.hash,
                      iconImageColor: buttonClicked.value == 4
                          ? iconColor
                          : HexColor("#2B4C62"),
                    ),
                    Text(
                      "Groups",
                      style: TextStyle(
                          color: buttonClicked.value == 4
                              ? iconColor
                              : HexColor("#2B4C62"),
                          fontSize: screenwidth * 0.034,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  width: screenwidth * 0.02,
                ),
              ],
            );
          },
          valueListenable: buttonClicked,
        ));
  }
}
