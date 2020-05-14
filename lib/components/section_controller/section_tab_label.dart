import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionTabLabel extends StatelessWidget {
  final IconData iconData;
  final String label;

  const SectionTabLabel({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconData != null ? FaIcon(iconData) : Container(),
        label != null
            ? FittedBox(fit: BoxFit.fitWidth, child: Text(label))
            : Container(),
      ],
    );
  }
}
