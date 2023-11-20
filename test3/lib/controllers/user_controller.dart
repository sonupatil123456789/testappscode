import 'package:flutter/foundation.dart';
import 'package:test1/models/user_model.dart';
import 'package:test1/repository/user_repo.dart';

class UserController with ChangeNotifier {
  final usertRepo = userRepository() ;

  bool _loading = false;
  bool get loading => _loading;

  late UserModel _users = UserModel();
  UserModel get users => _users;


  setLoadingState(bool val) {
    _loading = val;
  }

  // product  controller for fetching all products and displaying it to frountend
  Future getAllUsersController(context) async {
    try {
      setLoadingState(true);
      var userRes = await usertRepo.getAllUsersRepo(context);
      _users = userRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_users : ${_users.limit}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

// product  controller for fetching all categorys and displaying it to frountend

}