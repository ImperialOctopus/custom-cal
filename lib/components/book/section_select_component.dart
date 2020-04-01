import 'package:flutter/material.dart';
import 'package:prototype_cal/components/section_select_tab_component.dart';
import 'package:prototype_cal/model/section.dart';

class SectionSelectComponent extends StatelessWidget {
  final List<Section> sections;
  final int activeSection;
  final Function(int) onSectionPressed;
  final double tabHeight;
  final double tabWidth;
  final double tabSpacing;
  final double inset;

  const SectionSelectComponent({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
    this.tabHeight = 64,
    this.tabWidth = 64,
    this.tabSpacing = 0,
    this.inset = 0,
  });

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];

    // Add empty box for left inset
    list.add(SizedBox.fromSize(size: Size(inset, 0)));

    for (int i = 0; i < sections.length; i++) {
      // Add tab component
      list.add(SectionSelectTabComponent(
        label: sections[i].label,
        index: i,
        active: i == activeSection,
        height: tabHeight,
        width: tabWidth,
        onPress: (int i) => onSectionPressed(i),
      ));
      // Add spacer if this isn't the last tab
      if (tabSpacing > 0 && i < sections.length - 1) {
        list.add(SizedBox(width: tabSpacing));
      }
    }

    return Row(children: list);
  }
}
