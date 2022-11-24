import 'package:flutter/material.dart';

class WelcomeScreenCard extends StatelessWidget {
  const WelcomeScreenCard({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            child,
            Text(title),
          ],
        ),
      ),
    );
  }
}
