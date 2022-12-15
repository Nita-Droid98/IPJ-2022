import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipj_project_2022/helpers/user_helpers.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';
import 'package:ipj_project_2022/widgets/custom_text_field.dart';
import 'package:ipj_project_2022/widgets/password_field.dart';
import 'package:provider/provider.dart';

import '../widgets/page_top_header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController matricNumberController = TextEditingController();
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
                  pageText: "Register",
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
                          hintText: "Name",
                          controller: nameController,
                          prefixIcon: const Icon(Icons.person),
                        ),
                        CustomTextField(
                          hintText: "Surname",
                          controller: surnameController,
                          prefixIcon: const Icon(Icons.person_add),
                        ),
                        if (!isTeacher)
                          CustomTextField(
                            hintText: "Matric Number",
                            controller: matricNumberController,
                            prefixIcon: const Icon(Icons.numbers),
                          ),
                        CustomTextField(
                          hintText: "Email",
                          controller: emailController,
                          prefixIcon: const Icon(Icons.email),
                        ),
                        PasswordField(
                            controller: passwordController,
                            hintText: "Password"),
                        CheckboxListTile(
                          title: const FittedBox(
                              child: Text(
                                  "Are you teacher? Register as a Teacher")),
                          value: isTeacher,
                          onChanged: (value) {
                            setState(
                              () {
                                isTeacher = !isTeacher;
                              },
                            );
                          },
                        ),
                        CupertinoButton.filled(
                          child: const Text("Register"),
                          onPressed: () async {
                            //TODO: ADD Implementation
                            createUserHelper(
                              context,
                              name: nameController.text,
                              surname: surnameController.text,
                              matricNumber: matricNumberController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              isTeacher: isTeacher,
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
