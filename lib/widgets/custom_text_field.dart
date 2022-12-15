import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isEnabled = true,
    required this.prefixIcon,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Icon prefixIcon;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          enabled: isEnabled,
          fillColor: isEnabled ? Colors.white38 : Colors.white12,
          filled: true,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isEnabled ? Colors.white38 : Colors.white12),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
