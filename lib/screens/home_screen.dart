import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:ipj_project_2022/helpers/user_helpers.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';
import 'package:ipj_project_2022/widgets/student_home_page_content.dart';
import 'package:ipj_project_2022/widgets/teacher_home_screen_content.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../models/teacher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserTypeHelper(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: value.appUser is Student
              ? const StudentHomePageContent()
              : value.appUser is Teacher
                  ? const TeacherHomeScreenContent()
                  : Text("Value might be null"),
        ),
      ),
    );
  }
}
