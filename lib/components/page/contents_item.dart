import 'package:flutter/material.dart';

class ContentsItem extends StatelessWidget {
  final int indent;
  final Widget child;

  const ContentsItem({this.indent = 0, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0 * indent),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline6,
        child: child,
      ),
    );
  }
}
