import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ipj_project_2022/screens/login_screen.dart';
import 'package:ipj_project_2022/screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../widgets/clickable_rich_text.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isTeacher = false;
  bool isLoginScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            isLoginScreen ? LoginScreen() : RegisterScreen(),
            if (!context.watch<UserProvider>().isLoading)
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClickableRichText(
                  text: isLoginScreen
                      ? "Already have an account? "
                      : "Dont have an account? ",
                  underlinedText:
                      isLoginScreen ? "Login here" : "Create one here",
                  onPressed: () {
                    setState(() {
                      isLoginScreen = !isLoginScreen;
                    });
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
