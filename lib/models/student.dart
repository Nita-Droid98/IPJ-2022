import 'package:ipj_project_2022/models/user.dart';

class Student extends AppUser {
  final String matricNumber;

  Student({
    required uid,
    required name,
    required surname,
    required email,
    required this.matricNumber,
  }) : super(uid: uid, name: name, surname: surname, email: email);

  @override
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "surname": surname,
        "matricNumber": matricNumber,
        "email": email,
        "type": "STUDENT",
      };
}
