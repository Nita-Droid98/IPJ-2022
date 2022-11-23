import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        obscureText: isHidden,
        decoration: InputDecoration(
          fillColor: Colors.white38,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Password",
          alignLabelWithHint: true,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
              child: Icon(isHidden ? Icons.lock : Icons.lock_open)),
        ),
      ),
    );
  }
}
