import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/data/gqbase.dart';
import 'package:test/data/gqnetwork.dart';
import 'package:test/models/get_all_subdepartment_model.dart';
import 'package:test/mvc/onboarding_screens/flow_screens/screens/department_screen/department_screen_controller.dart';
import 'package:test/queries/flow_screen_queries.dart';

class Page6Controller extends ChangeNotifier {
  GqBase networkClass = GqNetwork();
  DepartmentScreenController page5 = DepartmentScreenController();

  GetAllSubDepartmentModel _getAllSubDepartmentModel =
      GetAllSubDepartmentModel();



  List<AllSubDomains> _filters = [];
  List get filters => _filters;

  
  List<AllSubDomains> _SelectedSubFunction = [];
  List get SelectedSubFunction => _SelectedSubFunction;



  int _userPreferredSubDepartmentMaxLength = 0;
  int get userPreferredSubDepartmentMaxLength =>
      _userPreferredSubDepartmentMaxLength;

  bool _loading = false;
  bool get loading => _loading;

  isLoading(bool load) {
    _loading = load;
  }



  addSubFunction(dynamic subDepartmentList) {
    _SelectedSubFunction.add(subDepartmentList);
    notifyListeners();
    if (kDebugMode) {
      print("_SelectedSubFunction = $_SelectedSubFunction");
    }
  }

  removeSubFunction(dynamic subDepartmentList) {
    _SelectedSubFunction.remove(subDepartmentList);
    notifyListeners();
    if (kDebugMode) {
      print("_SelectedSubFunction = $_SelectedSubFunction");
    }
  }

  Future getAllSubDepartmentModelController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getAllSubDepartment,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _getAllSubDepartmentModel = GetAllSubDepartmentModel.fromJson(
          result.data as Map<String, dynamic>);

      if (kDebugMode) {
        print(
            "_getAllSubDepartmentModel : ${_getAllSubDepartmentModel.allSubDomains?.length}");
      }

      isLoading(false);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error : === $e ");
      }
    }
  }

  filterSubDepartmentWithDepartmentController(departmentId) {
    try {
      for (var i = 0;
          i < _getAllSubDepartmentModel.allSubDomains!.length;
          i++) {
        if (_getAllSubDepartmentModel.allSubDomains?[i].domain?.sId ==
            departmentId) {
          _filters.add(_getAllSubDepartmentModel.allSubDomains![i]);
          if (kDebugMode) {
            print("_filters : ${_filters.length}");
          }
        } else {}
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error : === $e ");
      }
    }
  }

  Future maxSubDepartmentLengthController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getSubDepartmentLength,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _userPreferredSubDepartmentMaxLength =result.data?['maxSubdomains'];

      if (kDebugMode) {
        print(
            "_userPreferredSubDepartmentMaxLength : $_userPreferredSubDepartmentMaxLength");
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
