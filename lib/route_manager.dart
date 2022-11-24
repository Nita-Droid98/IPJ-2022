import 'package:flutter/material.dart';
import 'package:flutter_ipj_project/screens/create_account_page.dart';
import 'package:flutter_ipj_project/screens/edit_profile_screen.dart';
import 'package:flutter_ipj_project/screens/home_screen.dart';
import 'package:flutter_ipj_project/screens/login_screen.dart';
import 'package:flutter_ipj_project/screens/scan_qr_code_screen.dart';
import 'package:flutter_ipj_project/screens/welcome_screen.dart';

import 'screens/qr_code_generator_screen.dart';

class RouteManager {
  static const home = "/";
  static const loginScreen = "/loginScreen";
  static const createAccountScreen = "/createAccountScreen";
  static const welcomePageScreen = "/welcomePageScreen";
  static const editProfileScreen = "/editProfileScreen";
  static const scanQrCodeScreen = "/scanQrCodeScreen";
  static const qrCodeGeneratorScreen = "/qrCodeGeneratorScreen";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case createAccountScreen:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen());
      case welcomePageScreen:
        return MaterialPageRoute(
            builder: (context) => const WelcomePageScreen());
      case editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const EditProfileScreen());
      case scanQrCodeScreen:
        return MaterialPageRoute(
            builder: (context) => const ScanQRCodeScreen());
      case qrCodeGeneratorScreen:
        return MaterialPageRoute(
            builder: (context) => const QrCodeGeneratorScreen());
      default:
        throw Exception("Page not found.");
    }
  }
}
