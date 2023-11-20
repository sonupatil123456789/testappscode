import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:socialmedia/components/buttons.dart';
import 'package:socialmedia/components/controllbuttons.dart';
import 'package:video_player/video_player.dart';

bool expandedheight = false;
bool textellips = false;

class PageViewSection extends StatefulWidget {
  var index;
  var videoUrl;
  var username;
  var image_url;
  var title;
  var description;
  var comment_count;
  var count;
  var following;

  PageViewSection(
      {super.key,
      required this.index,
      required this.videoUrl,
      required this.username,
      required this.image_url,
      required this.title,
      required this.description,
      required this.comment_count,
      required this.count,
      required this.following});

  @override
  State<PageViewSection> createState() => _PageViewSectionState();
}

class _PageViewSectionState extends State<PageViewSection> {
  late VideoPlayerController _controller;
  late String videourl;

  var visibleopacity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
      })
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    print("tan again");
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    String discription =
        "Track the location of thw worker near construction site to  lk2m2 l2d2m2 2ldk22 2pdk2[] improve perfomance of the construction bwix ojcep ioij ijo kkkkkk mdksw  cndkod kckc c";
    return Container(
      child: Stack(children: [
        Container(
          height: screenheight,
          width: screenwidth,
          color: Colors.black,
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurpleAccent,
                  strokeWidth: 6,
                )),
        ),
        Positioned(
          bottom: screenheight * 0.08,
          child: Container(
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: screenwidth * 0.035),
                    Container(
                      width: screenwidth * 0.08,
                      height: screenheight * 0.036,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                            // width: screenwidth * 0.02,
                            // height: screenheight * 0.02,
                            widget.image_url == null
                                ? "https://cdn-assets.socialverseapp.com/profile/flic-avatar-83c1fcec0e654eff73f3290c4c33fac3.png"
                                : widget.image_url),
                      ),
                    ),
                    SizedBox(width: screenwidth * 0.025),
                    Text(
                      widget.username == null ? "No data" : widget.username,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: screenwidth * 0.038,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: screenwidth * 0.025),
                    Container(
                      alignment: Alignment.center,
                      width: screenwidth * 0.18,
                      height: screenheight * 0.032,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          )),
                      child: Text(
                        widget.following == true ? "Following" : "Follow",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: screenwidth * 0.028,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenwidth * 0.03),
                Container(
                  // color: Colors.amber,
                  width: screenwidth * 0.70,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(screenwidth * 0.035, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            // discription
                            print(expandedheight);
                            setState(() {
                              expandedheight = !expandedheight;
                              print(expandedheight);
                              textellips = !textellips;
                            });
                          },
                          child: Container(
                            height: expandedheight == false
                                ? screenheight * 0.04
                                : widget.title.length.toDouble(),
                            width: screenwidth * 0.64,
                            // color: Colors.blueAccent,
                            child: Text(
                              widget.title == null ? "No data" : widget.title,
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.ltr,
                              overflow: textellips == false
                                  ? TextOverflow.ellipsis
                                  : TextOverflow.visible,
                              softWrap: true,
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white,
                                  fontSize: screenwidth * 0.028,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: screenheight * 0.14,
            right: 0,
            child: Container(
              // color: Colors.amber,
              width: screenwidth * 0.20,
              height: screenheight * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons(
                    buttonfunction: () {
                      print("helloworld");
                    },
                    buttonname: Icons.favorite,
                    buttonvalue: widget.count == null ? "0" : widget.count,
                  ),
                  buttons(
                    buttonfunction: () {
                      print("helloworld2");
                    },
                    buttonname: Icons.forum,
                    buttonvalue: widget.comment_count == null
                        ? "0"
                        : widget.comment_count,
                  ),
                  buttons(
                    buttonfunction: () {
                      print("helloworld3");
                    },
                    buttonname: Icons.share,
                    buttonvalue: "Share".toString(),
                  ),
                  buttons(
                    buttonfunction: () {
                      print("helloworld4");
                    },
                    buttonname: Icons.fullscreen,
                    buttonvalue: "View".toString(),
                  ),
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              width: screenwidth,
              height: screenheight * 0.08,
              // color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: screenwidth,
                          height: screenheight * 0.01,
                          child: VideoProgressIndicator(_controller,
                              colors: VideoProgressColors(
                                  playedColor: Colors.white),
                              allowScrubbing: true)),
                    ],
                  ),
                  SizedBox(
                    height: screenheight * 0.016,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: screenwidth * 0.066,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.language,
                        size: screenwidth * 0.066,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.person,
                        size: screenwidth * 0.066,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            )),
        Opacity(
            // visible: false,
            opacity: visibleopacity,
            child: Center(
                child: _controller.value.isPlaying == true
                    ? controlButtons(
                        buttonfunction: () {
                          visibleopacity = 1.0;
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              visibleopacity = 0.0;
                            });
                          });
                          setState(() {
                            _controller.pause();
                          });
                        },
                        buttonname: Icons.play_arrow,
                        buttonvalue: 'Play',
                      )
                    : controlButtons(
                        buttonfunction: () {
                          visibleopacity = 1.0;
                          Future.delayed(const Duration(seconds: 1), () {
                            setState(() {
                              visibleopacity = 0.0;
                            });
                          });
                          setState(() {
                            _controller.play();
                          });
                        },
                        buttonname: Icons.pause,
                        buttonvalue: 'Pause',
                      )))
      ]),
    );
  }

  void dispose() {
    //...
    super.dispose();
    // timer.cancel();
    _controller.dispose();
    //...
  }
}
