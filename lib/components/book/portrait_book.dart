import 'package:flutter/material.dart';
import 'package:prototype_cal/model/section_data.dart';

import 'book.dart';
import '../../model/bookmark.dart';
import '../spread/portrait_spread.dart';
import '../section_controller/tabbed_section_controller.dart';

class PortraitBook extends Book {
  @override
  final Bookmark bookmark;

  @override
  const PortraitBook({@required this.bookmark});

  @override
  int get pagesPerSpread => 1;

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
  Widget buildSpread({Bookmark bookmark}) => PortraitSpread(bookmark: bookmark);
}
