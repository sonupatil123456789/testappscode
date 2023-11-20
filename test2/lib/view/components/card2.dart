import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/heading_text.dart';
import 'package:test1/view/components/paragraph_text.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/colorpallets.dart';

class Card2 extends StatefulWidget {
  String productId;
  String thumbnailImage;
  String title;
  String discription;
  String price;

  dynamic likes;

  Card2({
    super.key,
    required this.productId,
    required this.thumbnailImage,
    required this.title,
    required this.discription,
    required this.price,
  });

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  late Map inputFieldData = {};
  late ProductController productController = ProductController();

  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    super.initState();
  }

  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(4),
        width: screenwidth * 0.40,
        height: screenhight * 0.10,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(16),
          color: TheamColors.cardColor,
        ),
        child: Stack(
          children: [
            Container(
                width: screenwidth * 0.40,
                height: screenhight * 0.10,
                child: CachedNetworkImage(
                  // imageUrl: "https://source.unsplash.com/1600x900/?sh",
                  imageUrl: widget.thumbnailImage.toString(),
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fadeOutDuration: const Duration(milliseconds: 1000),
                  fadeOutCurve: Curves.easeOut,
                  fadeInDuration: const Duration(milliseconds: 500),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                color: const Color.fromARGB(196, 255, 255, 255),
                height: screenhight * 0.025,
                width: screenwidth * 0.40,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    H1text(
                      fonttext: " \u{20B9} ${widget.price}",
                      size: screenwidth * 0.032,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.ac_unit_outlined,
                      size: screenwidth * 0.04,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
