import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/data/gqbase.dart';
import 'package:test/data/gqnetwork.dart';
import 'package:test/models/get_all_qualification_model.dart';
import 'package:test/queries/flow_screen_queries.dart';

class QualificationScreenController extends ChangeNotifier {
  GqBase networkClass = GqNetwork();

  GetAllQualificationsModel _getAllQualificationsModel =
      GetAllQualificationsModel();
  GetAllQualificationsModel get getAllQualificationsModel =>
      _getAllQualificationsModel;

  List<AllQualifications> _qualificationData = [];
  List<AllQualifications> get qualificationData => _qualificationData;

  List<AllQualifications> _userThreeQualification = [];
  List<AllQualifications> get userThreeQualification => _userThreeQualification;

  String _search = "";
  String get search => _search;

  bool _openCloseDropdownState = false;
  bool get openCloseDropdownState => _openCloseDropdownState;

  bool _loading = false;
  bool get loading => _loading;

  isLoading(bool load) {
    _loading = load;
  }

  set openCloseDropdownState(bool dropDown) {
    _openCloseDropdownState = dropDown;
    notifyListeners();
    if (kDebugMode) {
      print("_openCloseDropdownState = $_openCloseDropdownState");
    }
  }

  Future addChips(int index) async {
    userThreeQualification.add(qualificationData[index]);
    qualificationData.removeAt(index);
    notifyListeners();
    if (kDebugMode) {
      print(userThreeQualification);
    }
  }

  removeChips(int index) {
    var filterData = userThreeQualification.removeAt(index);
    qualificationData.insert(0, filterData);
    notifyListeners();
  }

  set search(String searchData) {
    _search = searchData;
    notifyListeners();
    if (kDebugMode) {
      print("_search = $_search");
    }
  }

  Future getAllQualifacationController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getAllQualifications,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _getAllQualificationsModel = GetAllQualificationsModel.fromJson(
          result.data as Map<String, dynamic>);

      _qualificationData = [...?_getAllQualificationsModel.allQualifications];

      if (kDebugMode) {
        print(
            "_getAllQualificationsModel : ${_getAllQualificationsModel.allQualifications?.length}");
      }

      isLoading(false);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error : === $e ");
      }
    }
  }
}
