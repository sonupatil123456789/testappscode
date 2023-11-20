import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page11Controller extends ChangeNotifier{

  late dynamic _userCoverLetter = "";
  String get userCoverLetter => _userCoverLetter;



  bool _loading = false ;
  bool get loading => _loading;


  isLoading(bool load){
    _loading = load ;
  }

  set userCoverLetter(String coverLetter) {
    _userCoverLetter = coverLetter;
    notifyListeners();
    if (kDebugMode) {
      print("_userCoverLetter = $_userCoverLetter");
    }
  }


  




}