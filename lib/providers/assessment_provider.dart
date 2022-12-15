import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../models/assessment.dart';

class AssessmentProvider with ChangeNotifier {
  Assessment? _newCreated;
  Assessment get newCreated => _newCreated!;

  bool _isLoadingData = false;
  bool get isLoadingData => _isLoadingData;

  toggleDataLoadingStatus() {
    _isLoadingData = !_isLoadingData;
    notifyListeners();
  }

  Future<String> createAssessment(
      String subjectCode,
      String subjectName,
      String assessmentName,
      String teacherUid,
      DateTime dateOfAssessment) async {
    String result = "OK";

    try {
      toggleDataLoadingStatus();
      final docAssessment = fireStoreInstance.collection('assessments').doc();

      Assessment assessment = Assessment(
        uid: docAssessment.id,
        assessmentName: assessmentName,
        subjectCode: subjectCode,
        subjectName: subjectName,
        teacherUid: teacherUid,
        dateOfAssessment: dateOfAssessment,
      );

      await docAssessment.set(assessment.toJson()).then((value) {
        _newCreated = assessment;
      }).timeout(const Duration(seconds: 10));
    } on TimeoutException catch (e) {
      result = "Request Timeout: Connect to the internet or try again...";
    } catch (e) {
      result = e.toString();
    }

    toggleDataLoadingStatus();

    return result;
  }
}
