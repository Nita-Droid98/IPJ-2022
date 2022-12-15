import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipj_project_2022/constants.dart';

import 'authentication_screen.dart';
import 'verify_email_screen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: authInstance.authStateChanges(),
          builder: (context, snapshot) {
            print("MainPage: $snapshot");
            if (snapshot.hasData) {
              return const VerifyEmailScreen();
            } else {
              return const AuthenticationScreen();
            }
          },
        ),
      );
}
