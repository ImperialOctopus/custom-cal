import 'package:flutter/material.dart';

class SectionTabLabel extends StatelessWidget {
  final IconData iconData;
  final String label;

  const SectionTabLabel({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconData != null ? Icon(iconData) : Container(),
        label != null
            ? FittedBox(fit: BoxFit.fitWidth, child: Text(label))
            : Container(),
      ],
    );
  }
}
