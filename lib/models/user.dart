import 'package:firebase_auth/firebase_auth.dart';
import 'package:ipj_project_2022/models/student.dart';
import 'package:ipj_project_2022/models/teacher.dart';

class AppUser {
  final String uid;
  final String name;
  final String surname;
  final String email;

  AppUser(
      {required this.uid,
      required this.name,
      required this.surname,
      required this.email});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "surname": surname,
        "email": email,
      };

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return json["type"] == "STUDENT"
        ? Student(
            uid: json["uid"],
            name: json["name"],
            surname: json["surname"],
            email: json["email"],
            matricNumber: json["matricNumber"],
          )
        : Teacher(
            uid: json["uid"],
            name: json["name"],
            surname: json["surname"],
            email: json["email"],
          );
  }
}
