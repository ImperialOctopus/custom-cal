import 'package:flutter/material.dart';

import 'book.dart';
import '../control_layer/control_layer.dart';
import '../control_layer/default_control_layer.dart';
import '../layout/layout.dart';
import '../layout/portrait_layout.dart';
import '../section_controller/tabbed_section_controller.dart';
import '../section_controller/section_controller.dart';
import '../spread/spread.dart';
import '../spread/portrait_spread.dart';
import '../../model/bookmark.dart';
import '../../model/section_data.dart';

class PortraitBook extends Book {
  final Bookmark startingBookmark;

  const PortraitBook({@required this.startingBookmark});

  @override
  int get pagesPerSpread => 1;

  @override
  SectionController buildSectionController({
    @required List<SectionData> sections,
    @required int activeSection,
    @required Function(int p1) onSectionPressed,
  }) =>
      TabbedSectionController(
        sections: sections,
        activeSection: activeSection,
        onSectionPressed: onSectionPressed,
      );

  @override
  Spread buildSpread({
    @required Bookmark bookmark,
  }) =>
      PortraitSpread(
        bookmark: bookmark,
      );

  @override
  ControlLayer buildControlLayer({
    bool backEnabled,
    Function onBackPressed,
    bool forwardEnabled,
    Function onForwardPressed,
  }) =>
      DefaultControlLayer(
        backEnabled: backEnabled,
        onBackPressed: onBackPressed,
        forwardEnabled: forwardEnabled,
        onForwardPressed: onForwardPressed,
      );

  @override
  Layout buildLayout({
    @required SectionController sectionController,
    @required Spread spread,
    @required ControlLayer controlLayer,
  }) =>
      PortraitLayout(
        sectionController: sectionController,
        spread: spread,
        controlLayer: controlLayer,
      );
}
