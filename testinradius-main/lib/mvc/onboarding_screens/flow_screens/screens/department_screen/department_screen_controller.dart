import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/data/gqnetwork.dart';
import 'package:test/models/get_all_department_model.dart';
import 'package:test/queries/flow_screen_queries.dart';
import '../../../../../data/gqbase.dart';




class DepartmentScreenController extends ChangeNotifier{
  GqBase networkClass = GqNetwork();

  GetAllDepartmentModel _getAllDepartmentModel = GetAllDepartmentModel();
  GetAllDepartmentModel get getAllDepartmentModel => _getAllDepartmentModel;

  late String _userPreferredDepartment = "";
  String get userPreferredDepartment => _userPreferredDepartment;

  late String _userPreferredDepartmentId = "";
  String get userPreferredDepartmentId => _userPreferredDepartmentId;

    late dynamic _selectedValue = null;
  dynamic get selectedValue => _selectedValue;

  bool _loading = false ;
  bool get loading => _loading;


  isLoading(bool load){
    _loading = load ;
  }

  set userPreferredDepartment(String preferredDepartment) {
    _userPreferredDepartment = preferredDepartment;
    notifyListeners();
    if (kDebugMode) {
      print("_userPreferredDepartment = $_userPreferredDepartment");
    }
  }

    set userPreferredDepartmentId(String preferredDepartmentId)  {
    _userPreferredDepartmentId = preferredDepartmentId;
    notifyListeners();
    if (kDebugMode) {
      print("_userPreferredDepartmentId = $_userPreferredDepartmentId");
    }
  }

    selectedChipValue(dynamic value) {
    _selectedValue = value;
    notifyListeners();
    if (kDebugMode) {
      print("_selectedValue = $_selectedValue");
    }
  }

    Future getAllDepartmentModelController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getAllDepartment,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _getAllDepartmentModel =
          GetAllDepartmentModel.fromJson(result.data as Map<String, dynamic>);

      if (kDebugMode) {
        print(
            "_getAllDepartmentModel : ${_getAllDepartmentModel.allDomains?.length}");
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