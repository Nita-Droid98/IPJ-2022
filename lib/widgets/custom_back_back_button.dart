import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
