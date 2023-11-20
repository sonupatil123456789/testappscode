import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colorpallets.dart';
import 'heading_text.dart';

class Card3 extends StatelessWidget {
  String image;
  String name;
  Function onCardClick;
  dynamic categorys;
  dynamic cardType;

  Card3({
    super.key,
    required this.image,
    required this.name,
    required this.onCardClick,
    required this.categorys,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        // onCardClick(categorys.sId);
      },
      child: Container(
        width: screenwidth * 0.22,
        height: screenhight * 0.16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenwidth * 0.20,
              height: screenhight * 0.09,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 239, 239, 239),
                //  color : TheamColors.unselectedChipColor,
              ),

                     child:  Container(
                      alignment: Alignment.center,
                      child: H1text(
                          fonttext: name.substring(0, 1),
                          weight: FontWeight.bold,
                          size: screenwidth * 0.08),
                    )
              
              // child: image == null
              //     ? Container(
              //         alignment: Alignment.center,
              //         child: H1text(
              //             fonttext: name.substring(0, 1),
              //             weight: FontWeight.bold,
              //             size: screenwidth * 0.08),
              //       )
              //     : CachedNetworkImage(
              //         imageUrl: image,
              //         fit: BoxFit.fill,
              //         errorWidget: (context, url, error) => Icon(Icons.error),
              //         fadeOutDuration: const Duration(milliseconds: 1000),
              //         fadeOutCurve: Curves.easeOut,
              //         fadeInDuration: const Duration(milliseconds: 500),
              //       ),
            ),
            SizedBox(height: screenhight * 0.004),
            Container(
                alignment: Alignment.center,
                child: H1text(
                  fonttext: name,
                  size: screenwidth * 0.026,
                  weight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}
