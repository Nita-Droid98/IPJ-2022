import 'package:flutter/material.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import 'custom_back_back_button.dart';
import 'custom_text_field.dart';
import 'two_rounded_edge_container.dart';

class EditStudentProfileScreenContent extends StatefulWidget {
  const EditStudentProfileScreenContent({super.key});

  @override
  State<EditStudentProfileScreenContent> createState() =>
      _EditStudentProfileScreenContentState();
}

class _EditStudentProfileScreenContentState
    extends State<EditStudentProfileScreenContent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController matricNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //TODO: from online server Create Function to pull data
  void setUserData() {
    nameController.text = context.read<UserProvider>().appUser!.name;
    surnameController.text = context.read<UserProvider>().appUser!.surname;
    matricNumberController.text =
        (context.read<UserProvider>().appUser! as Student).matricNumber;
    emailController.text = context.read<UserProvider>().appUser!.email;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TwoRoundedEdgeContainer(
        height: 0.9,
        isBottomEdged: true,
        child: ListView(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomBackButton(),
                ),
                Spacer(),
              ],
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      "View Profile",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.white),
                    ),
                    CustomTextField(
                      hintText: "Matric Number",
                      controller: matricNumberController,
                      isEnabled: false,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    CustomTextField(
                      hintText: "E-mail",
                      controller: emailController,
                      isEnabled: false,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    CustomTextField(
                      hintText: "Name",
                      controller: nameController,
                      isEnabled: true,
                      prefixIcon: const Icon(Icons.abc),
                    ),
                    CustomTextField(
                      hintText: "Surname",
                      controller: surnameController,
                      isEnabled: true,
                      prefixIcon: const Icon(Icons.abc_outlined),
                    ),
                    CustomTextField(
                      hintText: "Password",
                      controller: passwordController,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    CustomTextField(
                      hintText: "Confirm Password",
                      controller: confirmPasswordController,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    ElevatedButton(
                      child: const Text("Edit Profile"),
                      //TODO: Add Functionality
                      onPressed: () {
                        //TODO: Send database query to update data and then refresh screens with updated data
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
