import 'package:flutter/material.dart';
import '../widgets/custom_back_back_button.dart';

class ViewAttendanceScreen extends StatelessWidget {
  const ViewAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add Styling and Page content
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomBackButton(),
            Center(child: Text("View Attendance"))
          ],
        ),
      ),
    );
  }
}
