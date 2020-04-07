import 'package:flutter/material.dart';
import 'package:prototype_cal/model/section_data.dart';

import 'book.dart';
import '../../model/bookmark.dart';
import '../spread/landscape_spread.dart';
import '../section_controller/tabbed_section_controller.dart';

class LandscapeBook extends Book {
  @override
  final Bookmark bookmark;

  @override
  const LandscapeBook({@required this.bookmark});

  @override
  int get pagesPerSpread => 2;

  @override
  Widget buildSectionController(
          {List<SectionData> sections,
          int activeSection,
          Function(int p1) onSectionPressed}) =>
      TabbedSectionController(
        sections: sections,
        activeSection: activeSection,
        onSectionPressed: onSectionPressed,
      );

  @override
  Widget buildSpread({Bookmark bookmark}) =>
      LandscapeSpread(bookmark: bookmark);
}
