import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? user;
  UserCredential? userCredential;
  AppUser? appUser;

  void clearUser() => user = null;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void toggleLoadingStatus() {
    _isLoading = !isLoading;
    notifyListeners();
  }

  Future<String> getUserType() async {
    String result = "OK";

    toggleLoadingStatus();
    try {
      await fireStoreInstance
          .collection("users")
          .doc(authInstance.currentUser!.uid)
          .get()
          .timeout(const Duration(seconds: 10))
          .then(
        (snapshot) {
          //Navigator.of(context).popAndPushNamed(RouteManager.loginScreen);
          print("getUserType:  ${snapshot.data()}");
          if (snapshot.data() != null) {
            appUser = AppUser.fromJson(snapshot.data()!);
          } else {
            result = "getUserType:  there's an error";
            print("getUserType:  there's an error");
          }
        },
      );
    } on TimeoutException catch (e) {
      result = "Request Timeout: Connect to the internet or try again...";
    } catch (e) {
      result = e.toString();
    }

    toggleLoadingStatus();

    return result;
  }

  Future<String> logUserIn(String email, String password) async {
    String result = "OK";

    toggleLoadingStatus();

    try {
      await authInstance
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          )
          .timeout(const Duration(seconds: 10))
          .then((credentialInfo) {
        print(credentialInfo);
        //Capture User Credentials
        print(credentialInfo);
        userCredential = credentialInfo;
        user = credentialInfo.user;
        getUserType();
      }).onError((error, stackTrace) {
        result = error.toString();
        print("Sign in: $result");
      });
    } on TimeoutException catch (e) {
      result = "Request Timeout: Connect to the internet or try again...";
    } catch (e) {
      result = e.toString();
    }

    toggleLoadingStatus();

    return result;
  }

  Future<String> logoutUser() async {
    String result = "OK";

    toggleLoadingStatus();

    try {
      await authInstance.signOut().then((value) {
        user = null;
        userCredential = null;
        appUser = null;
      });
    } on TimeoutException catch (e) {
      result = "Request Timeout: Connect to the internet or try again...";
    } catch (e) {
      result = e.toString();
    }

    toggleLoadingStatus();

    return result;
  }

  Future<String> createUser(String email, String password) async {
    String result = "OK";

    //toggle loading
    toggleLoadingStatus();
    try {
      await authInstance
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 10))
          .then(
        (credentialInfo) {
          print(credentialInfo);
          userCredential = credentialInfo;
          user = credentialInfo.user;
        },
      );
    } on TimeoutException catch (e) {
      result = "Request Timeout: Connect to the internet or try again...";
    } catch (e) {
      result = e.toString();
    }

    toggleLoadingStatus();

    return result;
  }

  Future<String> resetPassword(String email) async {
    String result = "OK";

    toggleLoadingStatus();

    try {
      await authInstance
          .sendPasswordResetEmail(email: email)
          .timeout(const Duration(seconds: 10));
    } on TimeoutException catch (e) {
      result = "Request Timeout: Connect to the internet or try again...";
    } catch (e) {
      result = e.toString();
    }

    toggleLoadingStatus();

    return result;
  }
}
