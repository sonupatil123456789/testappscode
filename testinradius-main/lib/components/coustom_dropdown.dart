import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test/theams/coustom_theams.dart';

class CoustomDropdown extends StatefulWidget {
  List dataList;
  Function getValue;
  String hintText;
  double width;
  double height;
  dynamic initialSelecteddata;

  CoustomDropdown({
    super.key,
    required this.dataList,
    required this.initialSelecteddata,
    required this.getValue,
    required this.hintText,
    required this.width,
    required this.height,
  });

  @override
  State<CoustomDropdown> createState() => _CoustomDropdownState();
}

class _CoustomDropdownState extends State<CoustomDropdown> {
  // bool _opendropdown = false;

  final ValueNotifier<String> _selectedItem = ValueNotifier<String>("");
  final ValueNotifier<bool> _opendropdown = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(valueListenable: _opendropdown, builder: (BuildContext context, isOpen, Widget? child) { 
      return InkWell(
      onTap: () {
      _opendropdown.value = !isOpen;
      },
      child: Column(
        children: <Widget>[
          ValueListenableBuilder(
            valueListenable: _selectedItem,
            builder: (BuildContext context, value, Widget? child) {
              return Container(
                width: widget.width,
                height: widget.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: CoustomTheams.white,
                    border: Border.all(color: HexColor("#94929B"), width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: widget.width - width * 0.12,
                      height: height * 0.04,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value == "" ? widget.hintText : value,
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.poppins(
                            color: CoustomTheams.blackShade54,
                            fontSize: width * 0.032,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    const Icon(Icons.arrow_drop_down_circle)
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 2.0),
          Container(
              width: widget.width,
              height: _opendropdown.value == true ? height * 0.18 : 0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: CoustomTheams.white,
                  border: Border.all(color: HexColor("#94929B"), width: 1)),
              child: ValueListenableBuilder(
                valueListenable: _selectedItem,
                builder: (BuildContext context, value, Widget? child) {
                  return ListView.builder(
                    itemCount: widget.dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = widget.dataList[index];
                      return ListTile(
                        title: Text(
                          item,
                          style: GoogleFonts.rubik(
                              color: CoustomTheams.black,
                              fontSize: width * 0.030,
                              fontWeight: FontWeight.w400),
                        ),
                        onTap: () {
                          _selectedItem.value = item;
                          widget.getValue(item);
                          _opendropdown.value = !isOpen;
                        },
                      );
                    },
                  );
                },
              )),
        ],
      ),
    );


     },);
  }
}

