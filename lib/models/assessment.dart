import 'package:cloud_firestore/cloud_firestore.dart';

class Assessment {
  String uid;
  final String assessmentName;
  final String subjectCode;
  final String subjectName;
  final String teacherUid;
  final DateTime dateOfAssessment;

  Assessment({
    required this.assessmentName,
    required this.uid,
    required this.subjectCode,
    required this.subjectName,
    required this.teacherUid,
    required this.dateOfAssessment,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "subjectCode": subjectCode,
        "assessmentName": assessmentName,
        "subjectName": subjectName,
        "dateOfAssessment": dateOfAssessment
      };

  factory Assessment.fromJson(Map<String, dynamic> json) => Assessment(
        uid: json["uid"],
        assessmentName: json["assessmentName"],
        subjectCode: json["subjectCode"],
        subjectName: json["subjectName"],
        teacherUid: json["teacherUid"],
        dateOfAssessment: (json["dateOfAssessment"] as Timestamp).toDate(),
      );
}
