class Subject {
  final String subjectID;
  final String subjectCode;
  final String studentID;

  Subject({
    required this.subjectID,
    required this.subjectCode,
    required this.studentID,
  });

  toJson() => {
        'subjectID': subjectID,
        'subjectCode': subjectCode,
        'studentID': studentID,
      };

  factory Subject.fromJson(Map<dynamic, dynamic>? map) => Subject(
        subjectID: map!["subjectID"],
        subjectCode: map["subjectCode"],
        studentID: map["studentID"],
      );
}
