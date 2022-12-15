import 'package:flutter/material.dart';

class PageTopHeader extends StatelessWidget {
  const PageTopHeader({
    Key? key,
    required this.pageText,
  }) : super(key: key);

  final String pageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Text(
          pageText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
