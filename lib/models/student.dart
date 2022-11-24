class Student {
  final String studentName;
  final String studentSurname;
  final String email;
  final String matricNumber;
  final String studentID;

  Student({
    required this.studentSurname,
    required this.studentName,
    required this.email,
    required this.matricNumber,
    required this.studentID,
  });

  toJson() => {
        'studentName': studentName,
        'studentSurname': studentSurname,
        'dateCreated': email,
        'studentID': studentID,
        "matricNumber": matricNumber,
      };

  factory Student.fromJson(Map<dynamic, dynamic>? map) => Student(
        studentName: map!["studentstudentNameSurname"],
        studentSurname: map["studentSurname"],
        email: map["email"],
        matricNumber: map["matricNumber"],
        studentID: map["attendanceID"],
      );
}
