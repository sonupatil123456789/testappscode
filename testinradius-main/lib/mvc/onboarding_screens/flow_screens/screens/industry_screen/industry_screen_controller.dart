import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/data/gqbase.dart';
import 'package:test/data/gqnetwork.dart';
import 'package:test/models/get_all_job_industry_model.dart';
import 'package:test/queries/flow_screen_queries.dart';

class IndustryScreenController extends ChangeNotifier {
  GqBase networkClass = GqNetwork();

  GetAllJobIndustryModel _getAllJobIndustryModel = GetAllJobIndustryModel();
  GetAllJobIndustryModel get getAllJobIndustryModel => _getAllJobIndustryModel;

  late String _userPreferredIndustry = "";
  String get userPreferredIndustry => _userPreferredIndustry;

  late String _userPreferredIndustryId = "";
  String get userPreferredIndustryId => _userPreferredIndustryId;

  late dynamic _selectedValue = null;
  dynamic get selectedValue => _selectedValue;

  bool _loading = false;
  bool get loading => _loading;

  isLoading(bool load) {
    _loading = load;
  }

  set userPreferredIndustry(String preferredIndustry) {
    _userPreferredIndustry = preferredIndustry;
    notifyListeners();
    if (kDebugMode) {
      print("_userPreferredIndustry = $_userPreferredIndustry");
    }
  }

    set userPreferredIndustryId(String preferredIndustryId) {
    _userPreferredIndustryId = preferredIndustryId;
    notifyListeners();
    if (kDebugMode) {
      print("_userPreferredIndustryId = $_userPreferredIndustryId");
    }
  }

  selectedChipValue(dynamic value) {
    _selectedValue = value;
    notifyListeners();
    if (kDebugMode) {
      print("_selectedValue = $_selectedValue");
    }
  }

  Future getAllJobIndustriesController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getAllJobIndustries,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _getAllJobIndustryModel =
          GetAllJobIndustryModel.fromJson(result.data as Map<String, dynamic>);

      if (kDebugMode) {
        print(
            "_getAllJobIndustryModel : ${_getAllJobIndustryModel.allIndustries?.length}");
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
