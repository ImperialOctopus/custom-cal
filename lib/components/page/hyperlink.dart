import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  /// Target section.
  final int section;

  /// Target page.
  final int page;

  /// The widget to use as the hyperlink.
  final Widget child;

  /// Function called when link pressed - set internally.
  final Function(int, int) onPressed;

  const Hyperlink(
      {@required this.section,
      @required this.page,
      @required this.child,
      this.onPressed});

  Hyperlink copyWith(
      {int section, int page, Widget child, Function(int, int) onPressed}) {
    return Hyperlink(
      section: section ?? this.section,
      page: page ?? this.page,
      child: child ?? this.child,
      onPressed: onPressed ?? this.onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed(page, section);
        }
      },
      child: child,
    );
  }
}
