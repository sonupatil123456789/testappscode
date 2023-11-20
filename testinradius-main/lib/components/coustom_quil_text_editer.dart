// CoustomQuillTextediter

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:test/theams/coustom_theams.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class CoustomQuillTextediter extends StatefulWidget {
  // double width ;
  Function getEditerData;

  CoustomQuillTextediter({super.key, required this.getEditerData});

  @override
  State<CoustomQuillTextediter> createState() => _CoustomQuillTextediterState();
}

class _CoustomQuillTextediterState extends State<CoustomQuillTextediter> {
  QuillController quilEditerController = QuillController.basic();

  ScrollController scrollController = ScrollController(); 

  FocusNode keyboardListnerFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    quilEditerController.addListener(() {
      final cursorPosition = quilEditerController.selection.baseOffset;
      final deltaJson = quilEditerController.document.toDelta().toJson();
      final converter = QuillDeltaToHtmlConverter(
        List.castFrom(deltaJson),
        ConverterOptions.forEmail(),
      );
      dynamic html = converter.convert();
      dynamic  htmldata = '$html';
      widget.getEditerData(htmldata);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: width * 0.80,
          height: height * 0.06,
          alignment: Alignment.centerLeft,
          color: CoustomTheams.lightPurpleColor,
          child: QuillToolbar.basic(
            showDividers: false,
            showHeaderStyle: false,
            showLink: false,
            showSuperscript: false,
            showIndent: false,
            showColorButton: false,
            showSearchButton: false,
            showCodeBlock: false,
            showStrikeThrough: false,
            showListNumbers: false,
            showInlineCode: false,
            showBackgroundColorButton: false,
            showUndo: false,
            showRedo: false,
            showClearFormat: false,
            showQuote: false,
            showSubscript: false,
            showFontSize: false,
            showListCheck: false,
            showFontFamily: false,
            sectionDividerColor: CoustomTheams.lightPurpleColor,
            iconTheme: QuillIconTheme(
              iconUnselectedFillColor: CoustomTheams.lightPurpleColor,
            ),
            afterButtonPressed: () {},
            controller: quilEditerController,
            axis: Axis.horizontal,
          ),
        ),
        Container(
          height: height * 0.30,
          child: QuillEditor(

            focusNode: keyboardListnerFocusNode,
            placeholder:
                'Tell the employers about yourself . Highlight your skills , experience , and your goals',
            controller: quilEditerController,
            readOnly: false, scrollController: scrollController, scrollable: true, padding:const EdgeInsets.all(6), autoFocus: false, expands: false, // true for view only mode
          ),
        ),
      ],
    );
  }
}
