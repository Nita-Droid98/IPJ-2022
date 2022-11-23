import 'package:flutter/material.dart';
import 'package:flutter_ipj_project/screens/create_account_page.dart';
import 'package:flutter_ipj_project/screens/login_screen.dart';
import 'package:flutter_ipj_project/screens/welcome_screen.dart';

class RouteManager {
  static const home = "/";
  static const loginScreen = "/loginScreen";
  static const createAccountScreen = "/createAccountScreen";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (context) => const WelcomePageScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case createAccountScreen:
        return MaterialPageRoute(
            builder: (context) => const CreaeteAccountScreen());
      default:
        throw Exception("Page not found.");
    }
  }
}
