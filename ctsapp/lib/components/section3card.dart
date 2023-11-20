import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Section3Card extends StatefulWidget {
  var discription;
  var title;
  Section3Card({super.key, required this.title, required this.discription});

  @override
  State<Section3Card> createState() => _Section3CardState();
}

class _Section3CardState extends State<Section3Card> {
  final database = FirebaseDatabase.instance.ref("user");

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(
              context,
              widget.title == null ? "loading " : widget.title,
              widget.discription == null ? "loading " : widget.discription),
        );
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: width * 0.90,
              height: height * 0.08,
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80",
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0x4c000000),
                    ),
                  ),
                  SizedBox(width: width * 0.08),
                  Container(
                    width: width * 0.60,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 216,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              color: Color(0xffd4d4d4),
                              fontSize: 12,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        SizedBox(
                          width: 190,
                          height: 25,
                          child: Text(
                            widget.discription,
                            style: TextStyle(
                              color: Color(0xffe1e1e1),
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 28, 45, 1),
            ),
          ],
        ),
      ),
    );
  }

  _buildPopupDialog(BuildContext context, title, discription) {
    return AlertDialog(
        backgroundColor: Color(0xff1b2152),
        title: Text(title),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        actionsOverflowButtonSpacing: 20,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Next")),
        ],
        content: Text(discription),
        contentTextStyle: TextStyle(color: Colors.white54));
  }
}
