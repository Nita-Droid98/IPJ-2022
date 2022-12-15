import 'package:flutter/material.dart';
import 'package:ipj_project_2022/constants.dart';
import 'package:ipj_project_2022/helpers/show_snackbar.dart';
import 'package:ipj_project_2022/models/teacher.dart';
import 'package:ipj_project_2022/models/user.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';
import 'package:ipj_project_2022/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../route_manager.dart';

void loginUserHelper(BuildContext context, String email, password) async {
  await context.read<UserProvider>().logUserIn(email, password).then((value) {
    if (value == "OK") {
      //FIXME: edge case that blocks user navigation
      // Navigator.of(context).popAndPushNamed(RouteManager.studentHomeScreen);
    } else {
      showSnackBar(context, value);
    }
  });
}

void logoutHelper(BuildContext context) async {
  await context.read<UserProvider>().logoutUser().then((value) {
    if (value == "OK") {
      //FIXME: edge case that blocks user navigation
      //Navigator.of(context).popAndPushNamed(RouteManager.welcomePageScreen);
    } else {
      showSnackBar(context, value);
    }
  });
}

void createUserHelper(
  BuildContext context, {
  required String name,
  required String surname,
  required String matricNumber,
  required String email,
  required String password,
  required bool isTeacher,
}) async {
  context
      .read<UserProvider>()
      .createUser(email.trim(), password.trim())
      .then((value) async {
    if (value == "OK") {
      showSnackBar(context, "User registered succesfully.");
      //Create student object
      AppUser user = isTeacher
          ? Teacher(
              uid: authInstance.currentUser!.uid,
              name: name,
              surname: surname,
              email: email,
            )
          : Student(
              uid: authInstance.currentUser!.uid,
              name: name,
              surname: surname,
              matricNumber: matricNumber,
              email: email,
            );

      //Save Data to Database
      await fireStoreInstance
          .collection("users")
          .doc(authInstance.currentUser!.uid)
          .set(user.toJson())
          .then(
        (value) {
          //Navigator.of(context).popAndPushNamed(RouteManager.loginScreen);
          showSnackBar(context, "User profile created succesfully.");
        },
      ).onError((error, stackTrace) {
        showSnackBar(context, "Saving User Data: $error");
      });
      //Navigate to homepage
      //Navigator.of(context).popAndPushNamed(RouteManager.loginScreen);
      showSnackBar(context, "User created succesfully.");
    } else {
      showSnackBar(context, value);
    }
  });
}

void resetPasswordHelper(BuildContext context, String email) async {
  context.read<UserProvider>().resetPassword(email.trim()).then((value) {
    if (value == "OK") {
      showSnackBar(context, "Password Reset Email Sent.");
    } else {
      showSnackBar(context, value);
    }
  });
}

void checkUserTypeHelper(BuildContext context) async {
  await context.read<UserProvider>().getUserType().then((value) {
    if (value == "OK") {
      showSnackBar(context, "User Confirmed");
    } else {
      showSnackBar(context, "User Cannot Be Confirmed. Please Contact Support");
    }
  });
}
