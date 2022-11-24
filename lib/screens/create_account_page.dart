import 'package:flutter/material.dart';
import 'package:flutter_ipj_project/route_manager.dart';
import 'package:flutter_ipj_project/screens/login_screen.dart';

import '../widgets/clickable_rich_text.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController matricNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
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
                      "Create New Account",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.white),
                    ),
                    ClickableRichText(
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed(RouteManager.loginScreen);
                      },
                      text: "Already Registered? ",
                      underlinedText: "Login Here",
                    ),
                    CustomTextField(
                        hintText: "Name", controller: nameController),
                    CustomTextField(
                        hintText: "Surname", controller: surnameController),
                    CustomTextField(
                        hintText: "Matric Number",
                        controller: matricNumberController),
                    CustomTextField(
                        hintText: "E-mail", controller: emailController),
                    CustomTextField(
                        hintText: "Password", controller: passwordController),
                    ElevatedButton(
                      child: const Text("Sign Up"),
                      //TODO: Add Functionality
                      onPressed: () {},
                    ),
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
