import 'package:flutter/material.dart';

class TwoRoundedEdgeContainer extends StatelessWidget {
  const TwoRoundedEdgeContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: child,
    );
  }
}
