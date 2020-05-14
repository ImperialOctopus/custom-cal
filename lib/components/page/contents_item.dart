import 'package:flutter/material.dart';

class ContentsItem extends StatelessWidget {
  final double indentStep = 40.0;

  final int indent;
  final int section;
  final int page;
  final Widget child;

  const ContentsItem(
      {this.indent = 0,
      @required this.section,
      @required this.page,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indentStep * indent),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText1.apply(fontSizeDelta: 2),
        child: child,
      ),
    );
  }

  ContentsItem copyWith({
    int indent,
    int section,
    int page,
    Widget child,
  }) {
    return ContentsItem(
      indent: indent ?? this.indent,
      section: section ?? this.section,
      page: page ?? this.page,
      child: child ?? this.child,
    );
  }
}
