import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/data/gqbase.dart';
import 'package:test/data/gqnetwork.dart';
import 'package:test/mvc/authantication/auth_screen/auth_scheema.dart';
import 'package:test/utils/seassion_manager.dart';

class AuthController with ChangeNotifier {
  GqBase networkClass = GqNetwork();

  SeassionManager userSeassion = SeassionManager();

  bool _loading = false;
  bool get loading => _loading;

  late dynamic _userName ;
 dynamic get userName =>  _userName ;

  setLoadingState(bool val) {
    _loading = val;
  }


// function to login user 
  Future logInUser(context, mutation) async {
    try {
      if (kDebugMode) {
        print(mutation);
      }
      setLoadingState(true);
      QueryResult result = await networkClass.postGraphApiRequest(
          AuthScheema.loginScheema, FetchPolicy.networkOnly, mutation, context);

      String cookie = result.context
              .entry<HttpLinkResponseContext>()
              ?.headers!['set-cookie']
              .toString() ??
          "";
          
      await userSeassion.setAccessToken(
          "accessToken", cookie);
      if (kDebugMode) {
        print("Data : ${result.data}");
        print("Cookie  : ${await userSeassion.getAccessToken("accessToken")}");
      }

      setLoadingState(false);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error : === $e ");
      }
    }
  }


// Function to authanticate if the user is valid or not 
    Future authanticateUser(context, mutation) async {
    try {
      if (kDebugMode) {
        print(mutation);
      }
      setLoadingState(true);
      QueryResult result = await networkClass.postGraphApiRequest(
          AuthScheema.authanticateUser, FetchPolicy.networkOnly, mutation, context);
          _userName = result.data!['me']['firstName'] ;
      if (kDebugMode) {
        print("Data : ${result.data}");
      }
      setLoadingState(false);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error : === $e ");
      }
    }
  }
}
