import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  /// Target section.
  final int section;

  /// Target page.
  final int page;

  /// The widget to use as the hyperlink.
  final Widget child;

  const Hyperlink({
    @required this.section,
    this.page = 0,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class HyperlinkInternal extends StatelessWidget {
  final int page;
  final int section;
  final Widget child;
  final Function(int, int) hyperlinkFunction;

  const HyperlinkInternal({
    @required this.page,
    @required this.section,
    @required this.child,
    @required this.hyperlinkFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hyperlinkFunction(page, section),
      child: child,
    );
  }
}
