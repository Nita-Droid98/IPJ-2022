import 'package:flutter/material.dart';
import 'package:flutter_ipj_project/route_manager.dart';
import 'package:flutter_ipj_project/widgets/clickable_rich_text.dart';

import '../widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController matricNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      "Log In",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Sign In to continue',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    CustomTextField(
                      controller: matricNumberController,
                      hintText: "Matric Number",
                    ),
                    PasswordField(
                      hintText: "Password",
                      controller: passwordController,
                    ),
                    ElevatedButton(
                      child: const Text("Log In"),
                      //TODO: Add Functionality
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteManager.home);
                      },
                    ),
                    TextButton(
                      //TODO: Add Functionality
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                    const SizedBox(height: 60),
                    ClickableRichText(
                      text: "Don't have an account?",
                      underlinedText: " Sign Up here",
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManager.createAccountScreen);
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white38,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
