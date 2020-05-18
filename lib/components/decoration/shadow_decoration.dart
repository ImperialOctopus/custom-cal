import 'package:flutter/material.dart';

class ShadowDecoration extends StatelessWidget {
  static const BoxDecoration decoration = BoxDecoration(
    color: Colors.black12,
    boxShadow: [
      BoxShadow(
        color: Colors.black38,
        blurRadius: 5.0, // has the effect of softening the shadow
        spreadRadius: 0.0, // has the effect of extending the shadow
        offset: Offset(
          -3, // horizontal, move right 10
          3, // vertical, move down 10
        ),
      )
    ],
  );

  final Widget child;

  const ShadowDecoration({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: child,
    );
  }
}
