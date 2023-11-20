import 'package:flutter/foundation.dart';


class Page13Controller extends ChangeNotifier{

  late String _userPhoneNumber= "" ;
  String get userPhoneNumber => _userPhoneNumber;



  bool _loading = false ;
  bool get loading => _loading;


  isLoading(bool load){
    _loading = load ;
  }

  set userPhoneNumber(dynamic Phoneumber) {
    _userPhoneNumber = Phoneumber;
    notifyListeners();
    if (kDebugMode) {
      print("_userPhoneNumber = $_userPhoneNumber");
    }
  }


  




}