import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Page2Controller extends ChangeNotifier{

  late double _jobRadiusRange = 5.0;
  double get jobRadiusRange => _jobRadiusRange;

  late double _locationLatitude = 1.0;
  double get locationLatitude => _locationLatitude;

  late double _locationLongitude = 1.0;
  double get locationLongitude => _locationLongitude;
 
  bool _loading = false ;
  bool get loading => _loading;


  isLoading(bool load){
    _loading = load ;
  }

  jobRadiusRangeValue(double radiousKm) {
    _jobRadiusRange = radiousKm;
    notifyListeners();
    if (kDebugMode) {
      print("_jobRadiusRange = $_jobRadiusRange");
    }
  }

  set locationLongitude(double longitude,) {
    _locationLongitude = longitude;
    notifyListeners();
    if (kDebugMode) {
      print("_locationLongitude = $_locationLongitude");
    }
  }

  set locationLatitude(double latitude,) {
    _locationLatitude = latitude;
    notifyListeners();
    if (kDebugMode) {
      print("_locationLatitude = $_locationLatitude");
    }
  }





}