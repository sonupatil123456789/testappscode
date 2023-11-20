import 'dart:async';

import 'package:flutter/foundation.dart';



class Page14Controller extends ChangeNotifier {
  late String _userOtp = "";
  String get userOtp => _userOtp;

  bool _loading = false ;
  bool get loading => _loading;




  isLoading(bool load){
    _loading = load ;
  }

  set userOtp(String otp) {
    _userOtp = otp;
    notifyListeners();
    if (kDebugMode) {
      print("_userOtp = $_userOtp");
    }
  }

  


}
