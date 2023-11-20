import 'dart:async';
import 'package:fakestore/repository/firebase_cloudstore_db.dart';
import 'package:fakestore/repository/firebase_realtime%20_db.dart';
import 'package:fakestore/utils/listners_utils.dart';
import 'package:fakestore/utils/routes/routes_name.dart';
import 'package:fakestore/utils/seassion_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/token_utils.dart';

class AuthControllers extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseCloudStoreDataBase firebaseCloudStoreDataBase =
      FirebaseCloudStoreDataBase();
  FirebaseRealTimeDatabase firebaseRealTimeDatabase =
      FirebaseRealTimeDatabase();

  UserCredential? _loginUserData;
  UserCredential? get loginUserData => _loginUserData;

  late String _receivedID = "";
  String get receivedID => _receivedID;

  bool _otpFieldVisibility = false;
  bool get otpFieldVisibility => _otpFieldVisibility;

  late String _authType = "";
  String get authType => _authType;

  bool _loading = false;
  bool get loading => _loading;

  setloading(loading) {
    _loading = loading;
    notifyListeners();
  }

  // signe up with email password
  Future<String?> signUpWithPhoneAuth(context, phoneNumber) async {
    setloading(true);
    try {
      _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber.toString(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          _loginUserData = await _auth.signInWithCredential(credential);
          if (kDebugMode) {
            print("UserCredential Number >>>>>>>>>>$_loginUserData");
          }
          ListnersUtils.showFlushbarMessage(
              "OTP is successfully send to your mobile number ",
              Colors.greenAccent,
              Colors.white,
              "OTP",
              Icons.error,
              context);
          setloading(false);
        },
        verificationFailed: (FirebaseAuthException e) {
          // setloading(false);
          if (kDebugMode) {
            print("error =>> ${e.message}");
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _receivedID = verificationId;
          _otpFieldVisibility = true;
          setloading(false);
           Navigator.pushNamed(context, RoutesName.otpScreen);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      // setloading(false);
    } on FirebaseAuthException catch (e) {
      setloading(false);
      if (kDebugMode) {
        print("error =>> $e");
      }
      if (e.code == 'email-already-in-use') {
        ListnersUtils.showFlushbarMessage(
            "This email is already in use  ",
            Colors.redAccent,
            Colors.white,
            "Please enter different email id",
            Icons.error,
            context);
      } else {
        ListnersUtils.showFlushbarMessage(
            "Error during signeing in please try again !",
            Colors.redAccent,
            Colors.white,
            "SigneUp failed",
            Icons.error,
            context);
      }
    }
    return null;
  }

  // verify otp function
  Future<String?> verifyOtpPhoneAuth(context, OTP) async {
    setloading(true);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID,
        smsCode: OTP.toString(),
      );
      _loginUserData = await _auth.signInWithCredential(credential);


      if (kDebugMode) {
        print("UserCredential Number >>>>>>>>>>${_loginUserData}");
      }

      setloading(false);
      Navigator.pushNamed(context, RoutesName.home);
    } on FirebaseAuthException catch (e) {
      setloading(false);
      if (kDebugMode) {
        print("error =>> $e");
      }
      if (e.code == 'email-already-in-use') {
        ListnersUtils.showFlushbarMessage(
            "This email is already in use  ",
            Colors.redAccent,
            Colors.white,
            "Please enter different email id",
            Icons.error,
            context);
      } else {
        ListnersUtils.showFlushbarMessage(
            "Error during signeing in please try again !",
            Colors.redAccent,
            Colors.white,
            "SigneUp failed",
            Icons.error,
            context);
      }
    }
    return null;
  }
}
