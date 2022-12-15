import 'package:flutter/material.dart';
import 'package:ipj_project_2022/screens/authentication_screen.dart';
import 'screens/welcome_screen.dart';

class RouteManager {
  static const welcomePageScreen = "/";
  static const authenticationScreen = "/authenticationScreen";
  static const registerScreen = "/registerScreen";
  static const studentHomeScreen = "/studentHomeScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authenticationScreen:
        return MaterialPageRoute(
            builder: (context) => const AuthenticationScreen());
      case welcomePageScreen:
        return MaterialPageRoute(
            builder: (context) => const WelcomePageScreen());
      default:
        throw Exception("Route not found");
    }
  }
}
