import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/bottom_sheet.dart';
import 'package:test1/view/components/heading_text.dart';
import 'package:test1/view/components/icon_svg_button.dart';
import 'package:test1/view/components/paragraph_text.dart';
import '../../controllers/filter_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';

class Navbar extends StatefulWidget {
  String title;
  bool isVisible;
  String subtitle;
  bool filter;
  bool search;
  bool cart;
  bool backButton;
  dynamic cartCount;

  Navbar({
    super.key,
    required this.title,
    required this.isVisible,
    required this.subtitle,
    required this.filter,
    required this.search,
    required this.cart,
    required this.backButton,
    required this.cartCount,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late FiltersController filtersController = FiltersController();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    filtersController = Provider.of<FiltersController>(context, listen: false);
    filtersController.allFiltersListController(context);

    List<String> condition = [];
    List<String>? make = [];
    List<String> ram = [];
    List<String> storage = [];

    return Container(
      width: screenwidth,
      height: screenhight * 0.07,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: screenwidth * 0.11,
                height: screenhight * 0.05,
                decoration: BoxDecoration(
                  // color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: widget.backButton == true
                    ? InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: screenwidth * 0.11,
                          height: screenhight * 0.05,
                          // color: TheamColors.primaryColor,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: screenwidth * 0.05,
                            color: TheamColors.primaryColor,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Lottie.asset(
                          AssetImgLinks.profilepic,
                          fit: BoxFit.fill,
                        )),
              ),
            ],
          ),
          Container(
            width: screenwidth * 0.44,
            // color: Colors.amberAccent,
            child: widget.isVisible == false
                ? Row(
                    children: [
                      H1text(
                        fonttext: widget.title,
                        size: screenwidth * 0.040,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Ptext(
                        fonttext: widget.subtitle,
                        size: screenwidth * 0.032,
                        weight: FontWeight.w400,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      H1text(
                        fonttext: widget.subtitle,
                        size: screenwidth * 0.042,
                        weight: FontWeight.w500,
                      ),
                      Ptext(
                        fonttext: widget.title,
                        size: screenwidth * 0.032,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
          ),
          Visibility.maintain(
            visible: widget.filter,
            child: Container(
                width: screenwidth * 0.06,
                height: screenhight * 0.02,
                child: Consumer<FiltersController>(
                  builder: (context, value, child) {
                    return IconSvgButton(
                      crowselclick: () async {
                        // if (value.filters.filters!.condition != null) {

                        print(value.filters.filters!.condition);
                        condition =
                            value.filters.filters!.condition as List<String> ??
                                [];
                        make =
                            value.filters.filters!.make as List<String> ?? [];
                        ram = value.filters.filters!.ram as List<String> ?? [];
                        storage =
                            value.filters.filters!.storage as List<String> ??
                                [];

                        await showCoustomBottomSheet(context, screenwidth,
                            screenhight, condition, make, ram, storage);
                        // }
                      },
                      height: screenhight,
                      width: screenwidth,
                      iconimage: AssetImgLinks.filter,
                      iconImageColor: TheamColors.primaryColor,
                    );
                  },
                )),
          ),
          Visibility.maintain(
            visible: widget.search,
            child: IconSvgButton(
              crowselclick: () {
                Navigator.pushNamed(context, RoutesName.searchScreen);
              },
              height: screenhight,
              width: screenwidth,
              iconimage: AssetImgLinks.search,
              iconImageColor: TheamColors.primaryColor,
            ),
          ),
          Visibility.maintain(
            visible: widget.cart,
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    child: Container(
                        alignment: Alignment.center,
                        width: screenwidth * 0.035,
                        height: screenhight * 0.016,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 73, 73),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          "0",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white70),
                        ))),
                IconSvgButton(
                  crowselclick: () {
                    // Navigator.pushNamed(context, RoutesName.myCart);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.cart,
                  iconImageColor: TheamColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
