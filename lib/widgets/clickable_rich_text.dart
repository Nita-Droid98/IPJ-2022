import 'package:flutter/material.dart';

class ClickableRichText extends StatelessWidget {
  const ClickableRichText({
    Key? key,
    required this.text,
    required this.underlinedText,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String underlinedText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
          children: [
            TextSpan(text: text),
            TextSpan(
              text: underlinedText,
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
