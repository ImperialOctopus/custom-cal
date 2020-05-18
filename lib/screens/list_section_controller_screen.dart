import 'package:custom_cal/components/section_controller/section_list_element.dart';
import 'package:custom_cal/model/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListSectionControllerScreen extends StatefulWidget {
  final List<SectionData> sections;
  final int activeSection;
  final Function(int i) onSectionPressed;

  const ListSectionControllerScreen({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
  });

  @override
  _ListSectionControllerScreenState createState() =>
      _ListSectionControllerScreenState(activeSection: activeSection);
}

class _ListSectionControllerScreenState
    extends State<ListSectionControllerScreen> {
  int activeSection;

  _ListSectionControllerScreenState({@required this.activeSection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: List.generate(widget.sections.length, (index) {
              if (index == activeSection) {
                return Hero(
                  tag: 'ActiveSection',
                  child: _buildListElement(context, index),
                );
              } else {
                return _buildListElement(context, index);
              }
            })
              ..add(
                CloseListElement(onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }),
              ),
          ),
        ),
      ),
    );
  }

  SectionListElement _buildListElement(BuildContext context, int index) {
    final section = widget.sections[index];
    return SectionListElement(
      color: section.color,
      leading: section.icon != null ? FaIcon(section.icon) : null,
      title: Text(section.title),
      onTap: () {
        setState(() {
          activeSection = index;
          widget.onSectionPressed(index);
        });
        Navigator.of(context).pop();
      },
    );
  }
}
