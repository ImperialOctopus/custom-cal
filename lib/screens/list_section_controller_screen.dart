import 'package:custom_cal/components/section_controller/section_list_element.dart';
import 'package:custom_cal/model/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListSectionControllerScreen extends StatelessWidget {
  static const EdgeInsetsGeometry padding = EdgeInsets.all(16);

  final List<SectionData> sections;
  final int activeSection;
  final Function(int i) onSectionPressed;

  const ListSectionControllerScreen({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: padding,
          child: Column(
            children: List.generate(sections.length, (index) {
              if (index == activeSection) {
                return Hero(
                  tag: 'ActiveSection',
                  child: _buildListElement(context, index),
                );
              } else {
                return _buildListElement(context, index);
              }
            }),
          ),
        ),
      ),
    );
  }

  SectionListElement _buildListElement(BuildContext context, int index) {
    final section = sections[index];
    return SectionListElement(
      color: section.color,
      leading: section.icon != null ? FaIcon(section.icon) : null,
      title: Text(section.title),
      onTap: () {
        onSectionPressed(index);
        Navigator.of(context).pop();
      },
    );
  }
}
