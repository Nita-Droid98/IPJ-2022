import 'package:flutter/material.dart';

class TwoRoundedEdgeContainer extends StatelessWidget {
  const TwoRoundedEdgeContainer(
      {Key? key, required this.child, this.isBottomEdged = false, this.height})
      : super(key: key);
  final Widget child;
  final bool isBottomEdged;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (height ?? 0.5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: isBottomEdged
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
      ),
      child: child,
    );
  }
}
