import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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


// function to fetch all products from backend fake store api database with two parameters 
  Future getAllProductsRepo(context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.products , context);
      response = ProductModel.fromJson(apiResponse);
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

  // function to fetch all category products from backend fake store api database with two parameters 
  Future getAllCategoryRepo(context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.category , context);

      return apiResponse;
    } catch (ex, stack) {
      if (kDebugMode) {
        print(ex);
      }
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }



}
