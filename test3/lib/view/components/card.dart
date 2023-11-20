import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Card1 extends StatefulWidget {
  String MId;
  String thumbnailImage;
  String title;
  String discription;
  num progressBar;
  String address;
  String univercity;
  num age;

  dynamic likes;

  Card1(
      {super.key,
      required this.MId,
      required this.thumbnailImage,
      required this.title,
      required this.discription,
      required this.progressBar,
      required this.address,
      required this.age,
      required this.univercity});

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          height: 220,
          width: screenwidth,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                width: screenwidth * 0.88,
                height: 206,
                decoration: BoxDecoration(
                  color: HexColor('#FFFFFF'),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x337c99b3),
                      blurRadius: 30,
                      offset: Offset(6, 6),
                    ),
                    BoxShadow(
                      color: Color(0x1c5690c5),
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // top: 6,
                      right: 20,
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          alignment: Alignment.center,
                          width: screenwidth * 0.25,
                          height: screenhight * 0.045,
                          decoration: BoxDecoration(
                              // color: HexColor('#948EFF'),
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: screenhight * 0.02,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Invite",
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.036,
                                    color: HexColor('#455F70')),
                              ),
                            ],
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // color: Color.fromARGB(255, 83, 229, 127),
                                width: screenwidth * 0.70,
                                height: screenhight * 0.145,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.title ?? "Pravin Kumar",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenwidth * 0.036,
                                            color: HexColor('#123D5B')),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        widget.address +
                                                " | " +
                                                widget.discription +
                                                " | " +
                                                "Within : ${widget.progressBar.toInt().toString()} KM" ??
                                            "Pune | Web developer | Within : 36.5 Km",
                                        style: GoogleFonts.notoSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: screenwidth * 0.032,
                                            color: HexColor('#455F70')),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      LinearPercentIndicator(
                                        width: 120.0,
                                        lineHeight: 16,
                                        barRadius: Radius.circular(10),
                                        animation: true,
                                        animationDuration: 500,
                                        percent: widget.age / 100 * 100 / 100,
                                        progressColor: HexColor("#455F70"),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        // color: Colors.amber,
                                        height: screenhight * 0.05,
                                        width: screenwidth * 0.30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: screenwidth * 0.09,
                                              width: screenwidth * 0.09,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: HexColor("#0D2A3C"),
                                              ),
                                              child: Icon(
                                                Icons.person_add,
                                                color: Colors.white,
                                                size: screenwidth * 0.042,
                                              ),
                                            ),
                                            Container(
                                              height: screenwidth * 0.09,
                                              width: screenwidth * 0.09,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: HexColor("#0D2A3C"),
                                              ),
                                              child: Icon(
                                                Icons.call,
                                                color: Colors.white,
                                                size: screenwidth * 0.042,
                                              ),
                                            ),
                                            Container(
                                              height: screenwidth * 0.09,
                                              width: screenwidth * 0.09,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: HexColor("#0D2A3C"),
                                              ),
                                              child: Icon(
                                                Icons.pin_drop,
                                                color: Colors.white,
                                                size: screenwidth * 0.042,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ]),
                        Container(
                          height: screenhight * 0.046,
                          width: screenwidth * 0.75,
                          // color: Colors.blueAccent,
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.univercity + " " + "😄" ??
                                      "Death thi is the time pas stext pc to check the wraping of the text inside the container",
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  style: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenwidth * 0.032,
                                      color: HexColor('#455F70')),
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
              Positioned(
                top: 40,
                left: 6,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: screenwidth * 0.16,
                      height: screenhight * 0.09,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HexColor('#C8D1D6'),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x337c99b3),
                            blurRadius: 30,
                            offset: Offset(6, 6),
                          ),
                          BoxShadow(
                            color: Color(0x1c5690c5),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: widget.thumbnailImage == null
                          ? Text(
                              widget.title.substring(0, 2),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenwidth * 0.056,
                                  color: HexColor('#123D5B')),
                            )
                          : CachedNetworkImage(
                              imageUrl: widget.thumbnailImage,
                              fit: BoxFit.contain,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fadeOutDuration:
                                  const Duration(milliseconds: 1000),
                              fadeOutCurve: Curves.easeOut,
                              fadeInDuration: const Duration(milliseconds: 500),
                            )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
