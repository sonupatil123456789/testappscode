import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:socialmedia/api/api.dart';
import 'package:socialmedia/components/pageviewsection.dart';

class videoSection extends StatefulWidget {
  const videoSection({super.key});

  @override
  State<videoSection> createState() => _videoSectionState();
}

class _videoSectionState extends State<videoSection> {
  late int pagedotno;

  List userdata = [];

  getalldata() async {
    userdata = await getVideo()
        .getallvideoes("https://api.socialverseapp.com/feed?page=1");
    setState(() {});
    //  _displayVideo(videourl: userdata[index]["video_link"].toString())
    print(userdata.length);
  }

  @override
  void initState() {
    super.initState();
    getalldata();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: screenwidth,
              height: screenheight * 0.80,
              child: PageView.builder(
                itemCount: userdata.length,
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  setState(() {
                    pagedotno = value;
                  });
                  print("  value = $value page no is ${value + 1}");
                },
                itemBuilder: (BuildContext context, int index) {
                  return PageViewSection(
                    index: index,
                    username: userdata[index]["username"].toString(),
                    videoUrl: userdata[index]["video_link"].toString(),
                    comment_count: userdata[index]["comment_count"].toString(),
                    title: userdata[index]["title"].toString(),
                    following: userdata[index]["following"].toString(),
                    description:
                        userdata[index]["category"]["description"].toString(),
                    count: userdata[index]["category"]["count"].toString(),
                    image_url:
                        userdata[index]["category"]["image_url"].toString(),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
