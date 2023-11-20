import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page10Controller extends ChangeNotifier{

  late String _userJoiningStatus = "";
  String get userJoiningStatus => _userJoiningStatus;

  late String _userNoticePeriodDays = "0";
  String get userNoticePeriodDays => _userNoticePeriodDays;

  late String _userLastWorkingDayDate = "";
  String get userLastWorkingDayDate => _userLastWorkingDayDate;

  bool _loading = false ;
  bool get loading => _loading;

  bool _openCloseDropdownState = false;
  bool get openCloseDropdownState => _openCloseDropdownState;



  isLoading(bool load){
    _loading = load ;
  }

  set openCloseDropdownState(bool dropDown) {
    _openCloseDropdownState = dropDown;
    notifyListeners();
    if (kDebugMode) {
      print("_openCloseDropdownState = $_openCloseDropdownState");
    }
  }

  set userJoiningStatus(String joiningStatus) {
    _userJoiningStatus = joiningStatus;
    notifyListeners();
    if (kDebugMode) {
      print("_userJoiningStatus = $_userJoiningStatus");
    }
  }

  set userNoticePeriodDays(String noticePeriodDays) {
    _userNoticePeriodDays = noticePeriodDays;
    notifyListeners();
    if (kDebugMode) {
      print("_userNoticePeriodDays = $_userNoticePeriodDays");
    }
  }

    set userLastWorkingDayDate(String lastWorkingDayDate) {
    _userLastWorkingDayDate = lastWorkingDayDate;
    notifyListeners();
    if (kDebugMode) {
      print("_userLastWorkingDayDate = $_userLastWorkingDayDate");
    }
  }

  




}