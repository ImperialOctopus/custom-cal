import 'package:flutter/material.dart';

import '../../model/section_data.dart';
import 'section_controller.dart';

class TabbedSectionController extends SectionController {
  @override
  final List<SectionData> sections;
  @override
  final int activeSection;
  @override
  final Function(int i) onSectionPressed;

  final double tabHeight;
  final double tabWidth;
  final double tabSpacing;
  final double inset;

  const TabbedSectionController({
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
      list.add(SectionTab(
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

class SectionTab extends StatelessWidget {
  final Widget label;
  final int index;
  final double width;
  final double height;
  final bool active;
  final Function(int) onPress;

  const SectionTab({
    @required this.label,
    @required this.index,
    @required this.width,
    @required this.height,
    this.active = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        child: Container(
          color: active ? Colors.orange : Colors.pink,
          child: Center(
            child: label,
          ),
        ),
        onTap: () => onPress(index),
      ),
    );
  }
}
