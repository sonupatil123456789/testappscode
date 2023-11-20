import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../repository/product_repo.dart';

class ProductController with ChangeNotifier {
  final productRepo = ProductRepository();

  bool _loading = false;
  bool get loading => _loading;

  late ProductModel _products = ProductModel();
  ProductModel get products => _products;

  late dynamic categoryList= [];

  setLoadingState(bool val) {
    _loading = val;
  }

  // product  controller for fetching all products and displaying it to frountend
  Future getAllProductsController(context) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.getAllProductsRepo(context);
      _products = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_products : ${_products.total}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

// product  controller for fetching all categorys and displaying it to frountend
  Future getAllCategoryController(context) async {
    try {
      setLoadingState(true);
      var categoryRes = await productRepo.getAllCategoryRepo(context);
      categoryList = categoryRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("category : $categoryRes");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }
}
