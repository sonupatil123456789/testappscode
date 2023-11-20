import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test1/view/components/heading_text.dart';

import '../../utils/constants/colorpallets.dart';

class Card4 extends StatefulWidget {
  late String productId;
  late String thumbnailImage;
  late String title;
  late String discription;
  late String price;
  late Function addToCart;
  // dynamic likes;

  Card4({
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
  State<Card4> createState() => _Card4State();
}

class _Card4State extends State<Card4> {


  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: Container(
        width: screenwidth * 0.40,
        height: screenhight * 0.20,
        decoration: BoxDecoration(
            color: TheamColors.cardColor,
            // color: Colors.amber,
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
                  width: screenwidth * 0.38,
                  height: screenhight * 0.16,
                  alignment: Alignment.center,
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
                  width: screenwidth * 0.38,
                  height: screenhight * 0.10,
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
