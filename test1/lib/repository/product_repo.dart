import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test1/models/filter_model.dart';
import 'package:test1/models/search_model.dart';
import '../data/base_api.dart';
import '../data/network_api.dart';
import '../models/product_model.dart';
import '../utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class ProductRepository {
  BaseApi _apiServices = networkApi();

  late dynamic apiResponse;
  late ProductModel response = ProductModel();
  late SearchModel searchResponse = SearchModel();
  late FilterModel filterResponse = FilterModel();

// function to fetch all products from backend database with two parameters (page , limit) ?page=1&limit=10
  Future getAllProductsRepo(context, query) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.products + query, context);
      response = ProductModel.fromJson(apiResponse);
      if (kDebugMode) {
        print(response.message);
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

  // function to search a perticular product from backend database
  Future productsSearchRepo(context, data) async {
    try {
      apiResponse = await _apiServices.postApiResponse(
          ApiEndpointsUrl.search, data, context);
      searchResponse = SearchModel.fromJson(apiResponse);
      if (kDebugMode) {
        print(searchResponse.message);
      }
      return searchResponse;
    } catch (ex, stack) {
      if (kDebugMode) {
        print(ex);
      }
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }
}
