import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test1/utils/constants/colorpallets.dart';

class CrowselSlider extends StatefulWidget {
  Function crowselclick;
  var width;
  var height;
  dynamic data;

  CrowselSlider(
      {super.key,
      required this.crowselclick,
      required this.data,
      required this.width,
      required this.height});

  @override
  State<CrowselSlider> createState() => _CrowselSliderState();
}

class _CrowselSliderState extends State<CrowselSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool end = false;
  var timercontroller;
  var animationdispose;

  @override
  void initState() {
    timercontroller = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage == widget.data.length) {
        end = true;
      } else if (_currentPage == 0) {
        end = false;
      }
      if (end == false) {
        _currentPage++;
      } else {
        _currentPage--;
      }
      animationdispose = _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    timercontroller.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    print("wiedget ran $_currentPage");
    return Stack(
      children: [
        Container(
          // color: Colors.amber,
          height: screenwidth * 0.60,
          width: screenwidth,
          child: PageView.builder(
              padEnds: false,
              itemCount: widget.data.length,
              controller: _pageController,
              pageSnapping: true,
              onPageChanged: (value) {
                setState(() {});
              },
              itemBuilder: (context, pagePosition) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                      // color: Colors.amber,
                      height: screenwidth * 0.60,
                      width: screenwidth,
                      margin: EdgeInsets.all(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://source.unsplash.com/1600x900/?fashion",
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fadeOutDuration: const Duration(milliseconds: 1000),
                        fadeOutCurve: Curves.easeOut,
                        fadeInDuration: const Duration(milliseconds: 500),
                      )
                      ),
                );
              }),
        ),
        Positioned(
          top: screenhight * 0.21,
          right: 30,
          child: Container(
            // color: Colors.blueAccent,
            alignment: Alignment.centerRight,
            height: screenhight * 0.03,
            width: screenwidth * 0.38,
            child: ListView.builder(
              itemCount: widget.data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: _currentPage == index
                              ? TheamColors.primaryColor
                              : TheamColors.backgroundColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
