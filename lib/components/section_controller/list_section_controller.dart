import 'package:custom_cal/screens/list_section_controller_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/section_data.dart';
import 'section_list_element.dart';

class ListSectionController extends StatelessWidget {
  final List<SectionData> sections;
  final int activeSection;
  final Function(int i) onSectionPressed;

  const ListSectionController({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ActiveSection',
      flightShuttleBuilder: _flightShuttleBuilder,
      child: SectionListElement(
        color: sections[activeSection].color,
        leading: FaIcon(sections[activeSection].icon),
        title: Text(sections[activeSection].title),
        trailing: FaIcon(Icons.menu),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ListSectionControllerScreen(
              sections: sections,
              activeSection: activeSection,
              onSectionPressed: onSectionPressed,
            ),
          ),
        ),
      ),
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }
}
