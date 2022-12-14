import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipj_project_2022/constants.dart';
import 'package:ipj_project_2022/helpers/user_helpers.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';

import 'package:ipj_project_2022/route_manager.dart';
import 'package:ipj_project_2022/widgets/clickable_rich_text.dart';
import 'package:ipj_project_2022/widgets/custom_text_field.dart';
import 'package:ipj_project_2022/widgets/password_field.dart';
import 'package:provider/provider.dart';

import '../helpers/show_snackbar.dart';
import '../widgets/page_top_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isTeacher = false;

  @override
  Widget build(BuildContext context) {
    return context.watch<UserProvider>().isLoading
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text("Authenticating..."),
              ),
            ],
          ))
        : SingleChildScrollView(
            child: Column(
              children: [
                const PageTopHeader(
                  pageText: "Login",
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Email",
                          controller: emailController,
                          prefixIcon: const Icon(Icons.email),
                        ),
                        PasswordField(
                            controller: passwordController,
                            hintText: "Password"),
                        TextButton(
                          child: const Text(
                            "Forgot Password",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          onPressed: () async {
                            //TODO: ADD Implementation
                            resetPasswordHelper(
                                context, emailController.text.trim());
                          },
                        ),
                        CupertinoButton.filled(
                          child: const Text("Login"),
                          onPressed: () async {
                            //TODO: ADD Implementation
                            loginUserHelper(
                              context,
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
