import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class mainCard extends StatefulWidget {
  const mainCard({super.key});

  @override
  State<mainCard> createState() => _mainCardState();
}

class _mainCardState extends State<mainCard> {
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.90,
      height: height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xff1b2152),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.80,
            height: height * 0.07,
            // color: Colors.amber,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  // color: Color.fromARGB(255, 211, 255, 68),
                  child: CircularPercentIndicator(
                    progressColor: Color.fromARGB(255, 211, 255, 68),
                    animation: true,
                    animationDuration: 2000,
                    radius: 20.0,
                    lineWidth: 2.0,
                    percent:
                        0.4, // totalfinancialloss / totalinvestment * 100 / 100,
                    center: Text(
                      "70",
                      style: TextStyle(
                        color: Color.fromARGB(255, 211, 255, 68),
                      ),
                      selectionColor: Color.fromARGB(255, 211, 255, 68),
                    ),
                  ),
                ),
                SizedBox(
                  width: height * 0.04,
                ),
                SizedBox(
                  width: width * 0.58,
                  height: 38,
                  child: Text(
                    "Please complete your profile to book consultations.\n\n",
                    style:
                        TextStyle(fontSize: width * 0.03, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
