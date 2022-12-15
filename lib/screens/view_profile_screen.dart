import 'package:flutter/material.dart';
import 'package:ipj_project_2022/models/student.dart';
import 'package:ipj_project_2022/models/teacher.dart';
import 'package:ipj_project_2022/models/user.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';
import 'package:ipj_project_2022/widgets/edit_student_profile_screen_content.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/edit_teacher_profile_screen_content.dart';

class ViewProfileScreen extends StatelessWidget {
  ViewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<UserProvider, AppUser>(
        selector: (context, value) => value.appUser!,
        builder: (context, appUser, child) => appUser is Student
            ? EditStudentProfileScreenContent()
            : appUser is Teacher
                ? EditTeacherProfileScreenContent()
                : Center(child: Text("User might be null")),
      ),
    );
  }
}
