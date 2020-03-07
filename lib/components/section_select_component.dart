import 'package:flutter/material.dart';
import 'package:prototype_cal/components/section_select_button_component.dart';
import 'package:prototype_cal/model/section.dart';

class SectionSelectComponent extends StatelessWidget {
  final List<Section> sections;
  final int activeSection;
  final Function(int) onSectionTapped;
  final double sectionTabHeight;
  final double sectionTabWidth;
  final double sectionTabSpacing;

  const SectionSelectComponent({
    Key key,
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionTapped,
    this.sectionTabHeight,
    this.sectionTabWidth,
    this.sectionTabSpacing = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: buildRow(sections));
  }

  List<Widget> buildRow(List<Section> sections) {
    var list = <Widget>[];
    for (int i = 0; i < sections.length; i++) {
      list.add(SectionSelectButtonComponent(
        label: sections[i].label,
        index: i,
        active: i == activeSection,
        height: sectionTabHeight,
        width: sectionTabWidth,
        onTap: (int i) => onSectionTapped(i),
      ));
      if (sectionTabSpacing > 0) {
        list.add(SizedBox(width: sectionTabSpacing));
      }
    }
    return list;
  }
}
