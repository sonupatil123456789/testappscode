import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InputFielUtils {
  late String ImagePath = "";
  late String ImageName = "";
  late File imageFile = File("");
  late Map imageDetails = <dynamic, dynamic>{};

  late Map<String, String> inputFieldData;

  // login trextfield controllers
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passowrdController = TextEditingController();
   static TextEditingController numberController = TextEditingController();

  static FocusNode emailFocusNode = FocusNode();
  static FocusNode passwordFocusNode = FocusNode();
  static FocusNode nameFocusNode = FocusNode();
  static FocusNode numberFocusNode = FocusNode();

  void disposeControllers() {
    InputFielUtils.passowrdController.dispose();
    InputFielUtils.emailController.dispose();
    InputFielUtils.nameController.dispose();
  }


}
