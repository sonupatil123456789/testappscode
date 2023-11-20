import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test1/models/user_model.dart';

import '../data/base_api.dart';
import '../data/network_api.dart';
import '../utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class userRepository {
  BaseApi _apiServices = networkApi();

  late dynamic apiResponse;
  late UserModel response = UserModel();

// function to fetch all users data from backend fake store api database 
  Future getAllUsersRepo(context) async {
    try {
      apiResponse =
          await _apiServices.getApiResponse(ApiEndpointsUrl.user, context);
      response = UserModel.fromJson(apiResponse);
      if (kDebugMode) {
        print(response);
      }
      return response;
    } catch (ex, stack) {
      if (kDebugMode) {
        print(ex);
      }

      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }


}
