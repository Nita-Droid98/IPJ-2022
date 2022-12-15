import 'package:flutter/material.dart';
import 'package:ipj_project_2022/providers/assessment_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/assessment.dart';

class ShowQrCodeScreen extends StatelessWidget {
  const ShowQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Selector<AssessmentProvider, Assessment>(
                selector: (context, value) => value.newCreated,
                builder: (context, value, child) {
                  //TODO: generate subjects from database and ensure information corresponds
                  //Subject, Module, Date, Student, Teacher

                  print(value.toJson());

                  return QrImage(
                    data: value.uid,
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
