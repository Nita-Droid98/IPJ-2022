import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:ipj_project_2022/constants.dart';
import 'package:ipj_project_2022/helpers/database_helpers.dart';
import 'package:ipj_project_2022/models/assessment.dart';
import 'package:ipj_project_2022/providers/assessment_provider.dart';
import 'package:ipj_project_2022/widgets/custom_text_field.dart';
import 'package:ipj_project_2022/widgets/page_top_header.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGeneratorScreen extends StatefulWidget {
  const QrCodeGeneratorScreen({super.key});

  @override
  State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
}

class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
  TextEditingController subjectCodeController = TextEditingController();
  TextEditingController subjectNameController = TextEditingController();
  TextEditingController assessmentNameController = TextEditingController();
  TextEditingController dateOfAssessmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: context.watch<AssessmentProvider>().isLoadingData
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text("Creating Test Entry..."),
                  ),
                ],
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const PageTopHeader(
                        pageText: "Generate QR Code For Assesment"),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: "Subject Code",
                              controller: subjectCodeController,
                              prefixIcon: const Icon(Icons.book),
                            ),
                            CustomTextField(
                              hintText: "Subject Name",
                              controller: subjectNameController,
                              prefixIcon: const Icon(Icons.book),
                            ),
                            CustomTextField(
                              hintText: "Assessment Name",
                              controller: assessmentNameController,
                              prefixIcon: const Icon(Icons.book),
                            ),
                            DateTimeField(
                              controller: dateOfAssessmentController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.date_range),
                                enabled: true,
                                fillColor: Colors.white38,
                                filled: true,
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white38),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Date",
                                alignLabelWithHint: true,
                              ),
                              validator: (dateTime) =>
                                  dateTime == null ? 'Not valid input' : null,
                              format: DateFormat('yyyy-MM-dd'),
                              onShowPicker: (context, currentValue) =>
                                  showDatePicker(
                                context: context,
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2100),
                                initialDate: currentValue ?? DateTime.now(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CupertinoButton.filled(
                                child: const Text("Create Assessment"),
                                onPressed: () {
                                  createAssessmentHelper(
                                    context,
                                    subjectCodeController.text.trim(),
                                    subjectNameController.text.trim(),
                                    assessmentNameController.text.trim(),
                                    authInstance.currentUser!.uid,
                                    DateTime.parse(
                                        dateOfAssessmentController.text),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
