import 'package:flutter/material.dart';
import 'package:ipj_project_2022/helpers/show_snackbar.dart';

import 'package:ipj_project_2022/providers/assessment_provider.dart';
import 'package:ipj_project_2022/screens/show_qr_code_screen.dart';
import 'package:provider/provider.dart';

void createAssessmentHelper(
  BuildContext context,
  String subjectCode,
  String subjectName,
  String assessmentName,
  String teacherUid,
  DateTime dateOfAssessment,
) async {
  await context
      .read<AssessmentProvider>()
      .createAssessment(
        subjectCode,
        subjectName,
        assessmentName,
        teacherUid,
        dateOfAssessment,
      )
      .then(
    (result) {
      if (result == "OK") {
        showSnackBar(context, "Assessment Created");
        Navigator.of(context).pop();
      } else {
        showSnackBar(context, result);
      }
    },
  ).onError((error, stackTrace) {
    showSnackBar(context, error.toString());
  });
}
