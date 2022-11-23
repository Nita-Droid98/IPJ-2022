import 'package:flutter/material.dart';

import '../widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white38,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Matric Number",
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                    PasswordField(),
                    ElevatedButton(
                      child: const Text("Log In"),
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
