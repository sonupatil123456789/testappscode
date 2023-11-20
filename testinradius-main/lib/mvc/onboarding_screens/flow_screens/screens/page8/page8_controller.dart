import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page8Controller extends ChangeNotifier {
  late int _userExperienceInMonth = 0;
  int get userExperienceInMonth => _userExperienceInMonth;

  late int _userExperienceInYear = 0;
  int get userExperienceInYear => _userExperienceInYear;

    late int _totalExperienceInMonth = 0;
  int get totalExperienceInMonth => _totalExperienceInMonth;

 


  bool _isUserFresher = false;
  bool get isUserFresher => _isUserFresher;

  bool _loading = false;
  bool get loading => _loading;

  bool _openCloseDropdownYearState = false;
  bool get openCloseDropdownYearState => _openCloseDropdownYearState;

  bool _openCloseDropdownMonthState = false;
  bool get openCloseDropdownMonthState => _openCloseDropdownMonthState;

  isLoading(bool load) {
    _loading = load;
  }

  set openCloseDropdownYearState(bool dropDown) {
    _openCloseDropdownYearState = dropDown;
    notifyListeners();
    if (kDebugMode) {
      print("_openCloseDropdownYearState = $_openCloseDropdownYearState");
    }
  }

  set openCloseDropdownMonthState(bool dropDown) {
    _openCloseDropdownMonthState = dropDown;
    notifyListeners();
    if (kDebugMode) {
      print("_openCloseDropdownMonthState = $_openCloseDropdownMonthState");
    }
  }

  set isUserFresher(bool Fresher) {
    _isUserFresher = Fresher;
    notifyListeners();
    if (kDebugMode) {
      print("_isUserFresher = $_isUserFresher");
    }
  }

  set userExperienceInMonth(int experienceInMonth) {
    _userExperienceInMonth = experienceInMonth;
     _totalExperienceInMonth= userExperienceInMonth + (userExperienceInYear*12);
    notifyListeners();
    if (kDebugMode) {
      print("_userExperienceInMonth = $_userExperienceInMonth");
    }
  }

  set userExperienceInYear(int experienceInYear) {
    _userExperienceInYear = experienceInYear;
     _totalExperienceInMonth= userExperienceInMonth + (userExperienceInYear*12);
    notifyListeners();
    if (kDebugMode) {
      print("_userExperienceInYear = $_userExperienceInYear");
    }
  }
}
