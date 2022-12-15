import 'package:flutter/material.dart';
import 'package:ipj_project_2022/models/user.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';
import 'package:ipj_project_2022/screens/qr_code_generator_screen.dart';
import 'package:ipj_project_2022/screens/view_profile_screen.dart';
import 'package:ipj_project_2022/widgets/edit_student_profile_screen_content.dart';
import 'package:provider/provider.dart';

import 'home_screen_action_row.dart';
import 'two_rounded_edge_container.dart';
import 'welcome_screen_card.dart';

class TeacherHomeScreenContent extends StatelessWidget {
  const TeacherHomeScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<UserProvider, AppUser>(
      selector: (context, viewProvider) => viewProvider.appUser!,
      builder: (context, appUser, child) => Column(
        children: [
          HomeScreenActionRow(
            nameAndSurname:
                "Logged in as, \n${appUser.name} ${appUser.surname}",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32,
            ),
            child: FittedBox(
              child: Text(
                "Welcome, ${appUser.name}",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Text(
            appUser.runtimeType.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          // Text(
          //   //TODO: Add Name Retrieval Code, Selector Prolly
          //   context.read<UserProvider>().user?.email ?? "Student",
          //   style: Theme.of(context).textTheme.headline4,
          // ),
          const Spacer(),
          TwoRoundedEdgeContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WelcomeScreenCard(
                  //TODO: Navigate to Edit Profile Page
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewProfileScreen()));
                  },
                  title: "Edit Profile",
                  child: const SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      radius: 50,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WelcomeScreenCard(
                      //TODO: Navigate to ScanQR
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QrCodeGeneratorScreen()));
                      },
                      title: "Generate QR Code",
                      child: const SizedBox(
                        child: Icon(
                          Icons.qr_code_scanner_sharp,
                          size: 60,
                        ),
                      ),
                    ),
                    WelcomeScreenCard(
                      //TODO: Navigate to Attendance Page
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushNamed(RouteManager.viewAttendanceScreen);
                      },
                      title: "View Attendance",
                      child: const SizedBox(
                        child: Icon(
                          Icons.checklist_rtl,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
