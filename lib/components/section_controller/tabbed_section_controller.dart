import 'package:flutter/material.dart';

import '../../model/section_data.dart';
import 'section_tab.dart';

class TabbedSectionController extends StatelessWidget {
  final List<SectionData> sections;
  final int activeSection;
  final Function(int i) onSectionPressed;

  final double tabHeight = 64;
  final double tabWidth = 64;

  final double tabSpacing = 2;
  final double padding = 8;

  final Color background = const Color(0xFFE0E0E0);

  const TabbedSectionController({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
  });

  @override
  Widget build(BuildContext context) {
    final sectionTabList = Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        sections.length,
        (i) => Padding(
            padding: EdgeInsets.symmetric(horizontal: tabSpacing),
            child: SectionTab(
              label: sections[i].label,
              icon: sections[i].icon,
              color: sections[i].color,
              active: i == activeSection,
              height: tabHeight,
              width: tabWidth,
              onTap: () => onSectionPressed(i),
            )),
      ),
    );

    final closeButton = CloseButtonTab(
      height: tabHeight,
      width: tabWidth,
      onTap: () => Navigator.pop(context),
    );

    return Container(
      color: background,
      padding: EdgeInsets.only(
        top: padding,
        left: padding - tabSpacing,
        right: padding - tabSpacing,
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 300),
                  child: sectionTabList,
                )),
          ),
          closeButton,
        ],
      ),
    );
  }
}
