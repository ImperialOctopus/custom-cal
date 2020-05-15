import 'package:flutter/material.dart';

enum ContentsItemStyle {
  large,
  normal,
  small,
}

class ContentsItem extends StatelessWidget {
  final double indentStep = 40.0;

  final int indent;
  final Widget child;
  final ContentsItemStyle style;

  const ContentsItem(
      {this.indent = 0,
      @required this.child,
      this.style = ContentsItemStyle.normal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indentStep * indent),
      child: DefaultTextStyle(
        style: _buildTextStyle(context),
        child: child,
      ),
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    switch (style) {
      case ContentsItemStyle.large:
        return Theme.of(context)
            .textTheme
            .headline6
            .apply(decoration: TextDecoration.underline);
        break;
      case ContentsItemStyle.small:
        return Theme.of(context).textTheme.bodyText1;
        break;
      case ContentsItemStyle.normal:
      default:
        return Theme.of(context).textTheme.bodyText2;
        break;
    }
  }
}
