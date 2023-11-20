import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/data/gqnetwork.dart';
import 'package:test/models/get_all_location_model.dart';
import 'package:test/queries/flow_screen_queries.dart';
import '../../../../../data/gqbase.dart';

class CitiesListScreenController extends ChangeNotifier {
  GqBase networkClass = GqNetwork();

  GetAllLocationModel _getAllLocation = GetAllLocationModel();
  GetAllLocationModel get getAllLocation => _getAllLocation;

  late String _cityName = "";
  String get cityName => _cityName;

  late String _cityId = "";
  String get cityId => _cityId;

  late dynamic _selectedValue = null;
  dynamic get selectedValue => _selectedValue;

  bool _openToRelocate = false;
  bool get openToRelocate => _openToRelocate;

  bool _loading = false;
  bool get loading => _loading;

  set cityName(String setCityName) {
    _cityName = setCityName;
    notifyListeners();
    if (kDebugMode) {
      print("_cityName = $_cityName");
    }
  }

  set cityId(String setCityId) {
    _cityId = setCityId;
    notifyListeners();
    if (kDebugMode) {
      print("_cityId = $_cityId");
    }
  }

  selectedCardValue(dynamic value) {
    _selectedValue = value;
    notifyListeners();
    if (kDebugMode) {
      print("_selectedValue = $_selectedValue");
    }
  }

  set openToRelocate(bool relocate) {
    _openToRelocate = relocate;
    notifyListeners();
    if (kDebugMode) {
      print("_openToRelocate = $_openToRelocate");
    }
  }

  isLoading(bool load) {
    _loading = load;
  }

  Future getAllLocationController(context) async {
    try {
      isLoading(true);
      QueryResult result = await networkClass.getGraphApiRequest(
          FlowScreenQueries.getAllLocation,
          FetchPolicy.networkOnly,
          Map<String, dynamic>,
          context);

      _getAllLocation =
          GetAllLocationModel.fromJson(result.data as Map<String, dynamic>);

      if (kDebugMode) {
        print("_getAllLocation : ${_getAllLocation.allLocations?.length}");
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
