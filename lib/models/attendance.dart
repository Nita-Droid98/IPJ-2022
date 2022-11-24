class Attendance {
  final String attendanceID;
  final DateTime dateCreated;
  final String studentID;

  Attendance({
    required this.attendanceID,
    required this.dateCreated,
    required this.studentID,
  });

  toJson() => {
        'attendanceID': attendanceID,
        'dateCreated': dateCreated.millisecondsSinceEpoch,
        'studentID': studentID,
      };

  factory Attendance.fromJson(Map<dynamic, dynamic>? map) => Attendance(
        attendanceID: map!["attendanceID"],
        dateCreated: DateTime.fromMillisecondsSinceEpoch(map["dateCreated"]),
        studentID: map["attendanceID"],
      );
}
