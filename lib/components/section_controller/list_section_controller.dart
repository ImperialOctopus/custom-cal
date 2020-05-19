import 'package:custom_cal/screens/list_section_controller_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/section_data.dart';
import 'section_list_element.dart';

class ListSectionController extends StatelessWidget {
  final List<SectionData> sections;
  final int activeSection;
  final Function(int i) onSectionPressed;
  final Orientation orientation;
  final bool hero;

  const ListSectionController({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
    this.orientation = Orientation.landscape,
    this.hero = true,
  });

  @override
  Widget build(BuildContext context) {
    return hero
        ? Hero(
            tag: 'ActiveSection',
            flightShuttleBuilder: _flightShuttleBuilder,
            child: _buildListElement(context),
          )
        : _buildListElement(context);
  }

  Widget _buildListElement(BuildContext context) {
    return SectionListElement(
      color: sections[activeSection].color,
      leading: FaIcon(sections[activeSection].icon),
      title: Text(sections[activeSection].title),
      trailing: FaIcon(Icons.menu),
      orientation: orientation,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ListSectionControllerScreen(
            sections: sections,
            activeSection: activeSection,
            onSectionPressed: onSectionPressed,
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
