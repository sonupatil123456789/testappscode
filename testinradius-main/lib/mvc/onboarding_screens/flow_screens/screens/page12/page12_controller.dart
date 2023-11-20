import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page12Controller extends ChangeNotifier{

  late String _userPickedFilename = "";
  String get userPickedFilename => _userPickedFilename;



  bool _loading = false ;
  bool get loading => _loading;


  isLoading(bool load){
    _loading = load ;
  }

  set userPickedFilename(String filename) {
    _userPickedFilename = filename;
    notifyListeners();
    if (kDebugMode) {
      print("_userPickedFilename = $_userPickedFilename");
    }
  }


  




}