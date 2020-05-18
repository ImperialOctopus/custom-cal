import 'package:flutter/material.dart';

import '../../model/section_data.dart';
import 'section_tab.dart';

class TabbedSectionController extends StatelessWidget {
  final List<SectionData> sections;
  final int activeSection;
  final Function(int i) onSectionPressed;

  final bool showCloseButton;

  final double tabHeight = 64;
  final double tabWidth = 64;
  final double tabSpacing = 4;
  final double inset = 8;
  final Color background = const Color(0xFFE0E0E0);

  const TabbedSectionController({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];

    // Add empty box for left inset
    list.add(SizedBox.fromSize(size: Size(inset, 0)));

    for (var i = 0; i < sections.length; i++) {
      // Add tab component
      list.add(
        SectionTab(
          label: sections[i].label,
          icon: sections[i].icon,
          color: sections[i].color,
          active: i == activeSection,
          height: tabHeight,
          width: tabWidth,
          onTap: () => onSectionPressed(i),
        ),
      );
      // Add spacer if this isn't the last tab
      if (tabSpacing > 0 && i < sections.length - 1) {
        list.add(SizedBox(width: tabSpacing));
      }
    }

    if (showCloseButton) {
      list.add(Spacer());
      list.add(
        CloseButtonTab(
          height: tabHeight,
          width: tabWidth,
          onTap: () => Navigator.pop(context),
        ),
      );
      list.add(SizedBox.fromSize(size: Size(inset, 0)));
    }

    return Container(
      color: background,
      child: Row(children: list),
    );
  }
}
