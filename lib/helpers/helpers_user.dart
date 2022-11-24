import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipj_project/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

import '../route_manager.dart';
import 'show_snackbar.dart';

void createNewUserInUI(BuildContext context,
    {required String email,
    required String password,
    required String name,
    required String surname,
    required String matricNumber}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  if (email.isEmpty || name.isEmpty || password.isEmpty) {
    showSnackBar(
      context,
      'Please enter all fields!',
    );
  } else {
    BackendlessUser user = BackendlessUser()
      ..email = email.trim()
      ..password = password.trim()
      ..putProperties(
        {},
      );

    String result = await context.read<UserViewModel>().createUser(user);
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      showSnackBar(context, 'New user successfully created!');
      Navigator.pop(context);
    }
  }
}

void loginUserInUI(BuildContext context,
    {required String email, required String password}) async {
  FocusManager.instance.primaryFocus?.unfocus();
  if (email.isEmpty || password.isEmpty) {
    showSnackBar(context, 'Please enter both fields!');
  } else {
    String result = await context
        .read<UserViewModel>()
        .loginUser(email.trim(), password.trim());
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      Navigator.of(context).popAndPushNamed(RouteManager.home);
    }
  }
}

void resetPasswordInUI(BuildContext context, {required String email}) async {
  if (email.isEmpty) {
    showSnackBar(context,
        'Please enter your email address then click on Reset Password again!');
  } else {
    String result =
        await context.read<UserViewModel>().resetPassword(email.trim());
    if (result == 'OK') {
      showSnackBar(
          context, 'Successfully sent password reset. Please check your mail');
    } else {
      showSnackBar(context, result);
    }
  }
}

void logoutUserInUI(BuildContext context) async {
  String result = await context.read<UserViewModel>().logoutUser();
  if (result == 'OK') {
    context.read<UserViewModel>().setCurrentUserNull();
    Navigator.popAndPushNamed(context, RouteManager.welcomePageScreen);
  } else {
    showSnackBar(context, result);
  }
}
