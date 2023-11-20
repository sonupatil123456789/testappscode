import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/heading_text.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/colorpallets.dart';

class Card1 extends StatefulWidget {
  String productId;
  String thumbnailImage;
  String title;
  String discription;
  String price;
  Function addToCart;
  // dynamic likes;

  Card1({
    super.key,
    required this.productId,
    required this.thumbnailImage,
    required this.title,
    required this.discription,
    required this.price,
    required this.addToCart,
    // required this.likes,
  });

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {

  late Map inputFieldData = {};
  late ProductController productController = ProductController();

  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, RoutesName.productsDetail,
        //     arguments: {"SingleProduct": widget.SingleProduct});
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(2, 0, 6, 0),
        width: screenwidth * 0.40,
        height: screenhight * 0.34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: TheamColors.cardColor,
            border: Border.all(
              width: 1.0,
              color: const Color.fromARGB(255, 214, 214, 214),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: screenwidth * 0.36,
                  height: screenhight * 0.16,
                  // alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: widget.thumbnailImage,
                    width: screenwidth * 0.40,
                    height: screenhight * 0.16,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fadeOutDuration: const Duration(milliseconds: 1000),
                    fadeOutCurve: Curves.easeOut,
                    fadeInDuration: const Duration(milliseconds: 500),
                  ),
                ),
                SizedBox(
                  height: screenhight * 0.01,
                ),
                Container(
                  width: screenwidth * 0.36,
                  height: screenhight * 0.15,
                  // color: Colors.blueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: screenwidth * 0.38,
                        height: screenhight * 0.03,
                        child: H1text(
                          fonttext: widget.title,
                          size: screenwidth * 0.036,
                          weight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: screenwidth * 0.36,
                        height: screenhight * 0.03,
                        // color: Colors.amberAccent,
                        child: Text(
                          widget.discription,
                          style: TextStyle(
                              fontSize: screenwidth * 0.028,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 181, 181, 181)),
                          //  screenwidth * 0.028,
                          // weight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        child: H1text(
                          fonttext: " \$ ${widget.price}",
                          size: screenwidth * 0.045,
                          weight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: screenhight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: const Color.fromARGB(255, 239, 239, 239),
                            width: screenwidth * 0.30,
                            height: screenhight * 0.035,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade900,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(50),
                                      )),
                                ),
                                H1text(
                                  fonttext: "Last Sale : \$ ${widget.price}",
                                  size: screenwidth * 0.028,
                                  weight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
