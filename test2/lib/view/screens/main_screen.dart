import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/card2.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/constants/static_data.dart';
import '../components/card.dart';
import '../components/card3.dart';
import '../components/card_header.dart';
import '../components/crowsel.dart';
import '../components/heading_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ProductController productController = ProductController();

  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    productController.getAllProductsController(context);
    productController.getAllCategoryController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
          color: TheamColors.backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              CrowselSlider(
                crowselclick: () {},
                data: StaticData.crowsellist,
                height: screenhight,
                width: screenwidth,
              ),

              ////////////////////////////////////////////////////////// categorys section
              CardHeader(
                titleText: "Shop By Category",
                navigateToList: () {},
                isVisible: false,
              ),
              Consumer<ProductController>(
                  builder: (BuildContext context, value, Widget? child) {
                var items = value.categoryList;
                return Container(
                    width: screenwidth * 0.90,
                    height: screenhight * 0.15,
                    // alignment: Alignment.center,
                    // color: Color.fromARGB(255, 214, 83, 83),
                    child: value.loading == true || items == null
                        ? Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.green.shade900,
                            ))
                        : items.length == 0
                            ? Center(
                                child: H1text(
                                  fonttext: "No category present ",
                                  size: screenwidth * 0.028,
                                  weight: FontWeight.w500,
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.categoryList.length,
                                itemBuilder: (context, index) {
                                  var items = value.categoryList[index];
                                  return Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Card3(
                                        image: items.toString(),
                                        name: items.toString(),
                                        onCardClick: (categoryValue) {},
                                        categorys: items,
                                        cardType: "CategoryScreen",
                                      ),
                                    ],
                                  );
                                },
                              ));
              }),
              /////////////////////////////////////////////////////////////////////////////

              CardHeader(
                titleText: "Recommanded For You",
                navigateToList: () {},
                isVisible: false,
              ),
              Consumer<ProductController>(
                  builder: (BuildContext context, value, Widget? child) {
                var items = value.products.products;
                return Container(
                    width: screenwidth * 0.90,
                    height: screenhight * 0.36,
                    alignment: Alignment.center,
                    // color: Color.fromARGB(255, 214, 83, 83),
                    child: value.loading == true || items == null
                        ? Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.green.shade900,
                            ))
                        : items.length == 0
                            ? Center(
                                child: H1text(
                                  fonttext: "No products",
                                  size: screenwidth * 0.028,
                                  weight: FontWeight.w500,
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.products.products!.length,
                                itemBuilder: (context, index) {
                                  var items = value.products.products![index];
                                  return Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Card1(
                                        addToCart: () {},
                                        discription: "Lowest Asked",
                                        price: items.price.toString(),
                                        thumbnailImage:
                                            items.thumbnail.toString(),
                                        title: items.title.toString(),
                                        productId: items.id.toString(),
                                      ),
                                    ],
                                  );
                                },
                              ));
              }),

/////////////////////////////////////////////////// brand section
              CardHeader(
                titleText: "Top Brands ",
                navigateToList: () {},
                isVisible: false,
              ),
              Consumer<ProductController>(
                  builder: (BuildContext context, value, Widget? child) {
                return Container(
                    width: screenwidth * 0.90,
                    height: screenhight * 0.20,
                    alignment: Alignment.center,
                    // color: Color.fromARGB(255, 214, 83, 83),
                    child: value.loading == true ||
                            value.products.products! == null
                        ? Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.green.shade900,
                            ))
                        : value.products.products!.length == 0
                            ? Center(
                                child: H1text(
                                  fonttext: "No products",
                                  size: screenwidth * 0.028,
                                  weight: FontWeight.w500,
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.products.products!.length,
                                itemBuilder: (context, index) {
                                  var items = value.products.products![index];

                                  print(items.brand);

                                  return Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Card2(
                                          productId: "",
                                          thumbnailImage:
                                              "https://source.unsplash.com/1600x900/?shoes",
                                          title: "random",
                                          discription: "random disc",
                                          price: items.brand.toString()),
                                    ],
                                  );
                                },
                              ));
              }),
              ////////////////////////////////////////////////////////////////////// Trending section
              CardHeader(
                titleText: "Trending Products",
                navigateToList: () {},
                isVisible: false,
              ),
              Consumer<ProductController>(
                  builder: (BuildContext context, value, Widget? child) {
                var items = value.products.products;
                return Container(
                    width: screenwidth * 0.90,
                    height: screenhight * 0.36,
                    alignment: Alignment.center,
                    // color: Color.fromARGB(255, 214, 83, 83),
                    child: value.loading == true || items == null
                        ? Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.green.shade900,
                            ))
                        : items.length == 0
                            ? Center(
                                child: H1text(
                                  fonttext: "No products",
                                  size: screenwidth * 0.028,
                                  weight: FontWeight.w500,
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.products.products!.length,
                                itemBuilder: (context, index) {
                                  var items = value.products.products![index];
                                  return Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Card1(
                                        addToCart: () {},
                                        discription: "Lowest Asked",
                                        price:
                                            Random().nextInt(10000).toString(),
                                        thumbnailImage:
                                            items.thumbnail.toString(),
                                        title: items.title.toString(),
                                        productId: items.id.toString(),
                                      ),
                                    ],
                                  );
                                },
                              ));
              }),
            ]),
          )),
    );
  }
}
