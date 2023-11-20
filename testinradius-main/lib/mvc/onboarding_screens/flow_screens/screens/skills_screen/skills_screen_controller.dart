import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/data/gqbase.dart';
import 'package:test/data/gqnetwork.dart';
import 'package:test/models/get_all_skills_model.dart';
import 'package:test/queries/flow_screen_queries.dart';

class SkillsScreenController extends ChangeNotifier {
  GqBase networkClass = GqNetwork();

  GetAllSkillsModel _getAllSkillsModel = GetAllSkillsModel();
  GetAllSkillsModel get getAllSkillsModel => _getAllSkillsModel;

  late List<AllSkills> _userFiveSkills = [];
  List<AllSkills> get userFiveSkills => _userFiveSkills;

  List<AllSkills> _skillsData = [];
  List<AllSkills> get skillsData => _skillsData;

  String _search = "";
  String get search => _search;

  bool _openCloseDropdownState = false;
  bool get openCloseDropdownState => _openCloseDropdownState;

  int _userFiveSkillsMaxLength = 0;
  int get userFiveSkillsMaxLength => _userFiveSkillsMaxLength;

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

  set userFiveSkills(List<AllSkills> fiveSkills) {
    _userFiveSkills = fiveSkills;
    notifyListeners();
    if (kDebugMode) {
      print("_userFiveSkills = $_userFiveSkills");
    }
  }

    Future addChips(int index ) async {
    _userFiveSkills.add( skillsData[index] );
    skillsData.removeAt(index);
    notifyListeners();
    if (kDebugMode) {
      print(_userFiveSkills);
    }
  }

  removeChips(int index) {
    var filterData = _userFiveSkills.removeAt(index);
    _skillsData.insert(0, filterData);
    notifyListeners();
  }

   set search(String searchData) {
    _search = searchData;
    notifyListeners();
    if (kDebugMode) {
      print("_search = $_search");
    }
  }

  Future getAllSkillsController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getAllSkills,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _getAllSkillsModel =
          GetAllSkillsModel.fromJson(result.data as Map<String, dynamic>);

                _skillsData = [...?_getAllSkillsModel.allSkills];

      if (kDebugMode) {
        print("_getAllSkillsModel : ${_getAllSkillsModel.allSkills?.length}");
      }

      isLoading(false);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error : === $e ");
      }
    }
  }

  Future userFiveSkillsMaxLengthController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getSkillsLength,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _userFiveSkillsMaxLength = result.data?['maxSkills'];

      if (kDebugMode) {
        print("_userFiveSkillsMaxLength : $_userFiveSkillsMaxLength");
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
