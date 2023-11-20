import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({super.key});

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.10,
      color: Color(0xff03022e),
      // padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.90,
            height: height * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Color(0xff2e2c71),
            ),
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (() {}),
                        icon: Icon(Icons.home,
                            size: width * 0.06, color: Colors.white),
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: Color(0xffe1e1e1),
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (() {}),
                        icon: Icon(Icons.person_add,
                            size: width * 0.06, color: Colors.white),
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                          color: Color(0xffe1e1e1),
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (() {}),
                        icon: Icon(Icons.medical_information,
                            size: width * 0.06, color: Colors.white),
                      ),
                      Text(
                        "List",
                        style: TextStyle(
                          color: Color(0xffe1e1e1),
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (() {}),
                        icon: Icon(Icons.edit_calendar,
                            size: width * 0.06, color: Colors.white),
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xffe1e1e1),
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
