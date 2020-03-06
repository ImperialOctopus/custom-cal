import 'package:flutter/material.dart';
import 'package:prototype_cal/components/section_select_component.dart';

class LandscapeBookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandscapeBookScreenState();
}

class _LandscapeBookScreenState extends State<LandscapeBookScreen> {
  int activeSection = 0;

  @override
  Widget build(BuildContext context) {
    return SectionSelectComponent(
      labels: <Widget>[
        Text('1'),
        Text('2'),
        Text('3'),
      ],
      activeSection: activeSection,
      onSectionChanged: onSectionChanged,
    );
  }

  void onSectionChanged(int i) {
    setState(() {
      activeSection = i;
    });
  }
}
