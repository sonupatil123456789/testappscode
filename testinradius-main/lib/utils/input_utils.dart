import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';

class InputUtils {

  static final TextEditingController SEARCH_FIVE_SKILLS = TextEditingController();
  static final TextEditingController SEARCH_THREE_QUALIFACATION = TextEditingController();
  static final TextEditingController CURRENT_ANNUAL_SALERY = TextEditingController();
  static final TextEditingController SALARY_EXPECTTION = TextEditingController();
  static final TextEditingController NOTICE_PERIOD_DAYS = TextEditingController();
  static final  TextEditingController USER_PHONE_NO = TextEditingController();
  static final TextEditingController SEARCH_LOCATIONS = TextEditingController();









  static Future getMyFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType
            .custom, // Specify the file types you want to pick (e.g., FileType.image, FileType.audio)
        allowedExtensions: [
          'jpg',
          'pdf',
          'doc'
        ], // Specify allowed file extensions
      );

      if (result != null) {
        // Handle the picked files
        PlatformFile file = result.files.first;
        print('File picked: ${file.name}');
        print('File path: ${file.path}');
        print('File size: ${file.size}');

        return file.name;
      } else {
        // User canceled the file picker
        print('File picking canceled');
      }
    } catch (e) {
      // Handle errors if any
      print('Error picking file: $e');
    }
  }
}
