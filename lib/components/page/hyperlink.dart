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
    @required this.page,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class HyperlinkInternal extends StatelessWidget {
  final Hyperlink hyperlink;
  final Function(int, int) hyperlinkFunction;

  const HyperlinkInternal({
    @required this.hyperlink,
    @required this.hyperlinkFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hyperlinkFunction(hyperlink.page, hyperlink.section),
      child: hyperlink.child,
    );
  }
}
