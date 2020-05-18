import 'package:custom_cal/components/section_controller/section_list_element.dart';
import 'package:custom_cal/model/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListSectionControllerScreen extends StatefulWidget {
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
          padding: ListSectionControllerScreen.padding,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5.0, // has the effect of softening the shadow
                      spreadRadius:
                          0.0, // has the effect of extending the shadow
                      offset: Offset(
                        -3, // horizontal, move right 10
                        3, // vertical, move down 10
                      ),
                    )
                  ],
                ),
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
                  }),
                ),
              ),
            ],
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
