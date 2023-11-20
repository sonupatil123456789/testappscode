import 'package:ctsapp/components/bottombar.dart';
import 'package:ctsapp/components/maincard.dart';
import 'package:ctsapp/components/navbar.dart';
import 'package:ctsapp/components/section1cards.dart';
import 'package:ctsapp/components/section2card.dart';
import 'package:ctsapp/components/section3card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class mainSection extends StatefulWidget {
  const mainSection({super.key});

  @override
  State<mainSection> createState() => _mainSectionState();
}

class _mainSectionState extends State<mainSection> {
  final database = FirebaseDatabase.instance.ref("user");
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff02012d),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: width * 100,
              height: height * 100,
              // color: Color(0xff02012d),
              child: Column(
                // alignment: Alignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  navbar(),
                  SizedBox(
                    height: 18,
                  ),
                  mainCard(),
                  Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 25),
                    height: 40,
                    child: const Text(
                      "Firebase Cta list",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.145,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          // flex: 1,
                          child: FirebaseAnimatedList(
                            itemBuilder: (BuildContext context,
                                DataSnapshot snapshot,
                                Animation<double> animation,
                                int index) {
                              return Container(
                                // color: Colors.amber,
                                child: section1Card(
                                  cta: snapshot.value.toString(),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            query: database.child("ctalist"),
                            duration: Duration(seconds: 3),
                            defaultChild: Center(
                                child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 227, 38, 38),
                              strokeWidth: 6,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 25),
                    height: 40,
                    child: const Text(
                      "Section Title 2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                      width: width,
                      alignment: Alignment.center,
                      child: section2Card()),
                  Expanded(
                    child: Container(
                      width: width,
                      // color: Color.fromARGB(255, 157, 158, 168),
                      height: height * 0.34,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.90,
                            height: height * 0.32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xff1b2152),
                            ),
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 11.88),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  width: width * 0.90,
                                  height: 22,
                                  // color: Color.fromARGB(255, 165, 171, 212),
                                  child: Text(
                                    "Firebase Task list",
                                    style: TextStyle(
                                      color: Color(0xffe8e8e8),
                                      fontSize: 16,
                                      fontFamily: "Outfit",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 11.88),
                                Expanded(
                                  child: FirebaseAnimatedList(
                                    query: database.child("tasks"),
                                    duration: Duration(seconds: 3),
                                    defaultChild: Center(
                                        child: CircularProgressIndicator(
                                      color: Color.fromARGB(255, 227, 38, 38),
                                      strokeWidth: 6,
                                    )),
                                    itemBuilder: (BuildContext context,
                                        DataSnapshot snapshot,
                                        Animation<double> animation,
                                        int index) {
                                      return Container(
                                        child: Section3Card(
                                          discription: snapshot
                                              .child("discription")
                                              .value
                                              .toString(),
                                          title: snapshot
                                              .child("title")
                                              .value
                                              .toString(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // SizedBox(height: 11.88),
                                Container(
                                  // color: Colors.amber,
                                  width: width * 0.90,
                                  height: height * 0.07,
                                  child: Container(
                                    width: width * 0.90,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: width * 0.30,
                                          height: height * 0.04,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color(0xff1051e3),
                                          ),
                                          child: Text(
                                            "View More",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "Outfit",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottomBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
