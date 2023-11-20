import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/flows_screen_const_data.dart';

class Page9Controller extends ChangeNotifier {
  late String _userCurrentAnnualSalary = "0";
  String get userCurrentAnnualSalary => _userCurrentAnnualSalary;

  late String _userExpectedSalary = "0";
  String get userExpectedSalary => _userExpectedSalary;

  bool _loading = false;
  bool get loading => _loading;

  isLoading(bool load) {
    _loading = load;
  }

  set userCurrentAnnualSalary(String currentAnnualSalary) {
    _userCurrentAnnualSalary = currentAnnualSalary;
    notifyListeners();
    if (kDebugMode) {
      print("_userCurrentAnnualSalary = $_userCurrentAnnualSalary");
    }
  }

  set userExpectedSalary(String expectedSalary) {
    _userExpectedSalary = expectedSalary;
    notifyListeners();
    if (kDebugMode) {
      print("_userExpectedSalary = $_userExpectedSalary");
    }
  }

  setSalleryNote(month) {
    if (month == 0 && month <= 6) {
      return FlowScreenConstData.experienceInMonth[0];
    }
    if (month >= 6 && month <= 24) {
      return FlowScreenConstData.experienceInMonth[1];
    }
    if (month >= 25 && month <= 60) {
      return FlowScreenConstData.experienceInMonth[2];
    }
    if (month >= 61 && month <= 96) {
      return FlowScreenConstData.experienceInMonth[3];
    }
    if (month >= 97 && month <= 120) {
      return FlowScreenConstData.experienceInMonth[4];
    }
    else{
      return FlowScreenConstData.experienceInMonth[5];
    }
    // if (month >= 121 || month <= 432) {
    //   return FlowScreenConstData.experienceInMonth[5];
    // }
  }
}
