import 'package:ipj_project_2022/models/user.dart';

class Teacher extends AppUser {
  Teacher({
    required uid,
    required name,
    required surname,
    required email,
  }) : super(uid: uid, name: name, surname: surname, email: email);

  @override
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "surname": surname,
        "email": email,
        "type": "TEACHER",
      };
}
