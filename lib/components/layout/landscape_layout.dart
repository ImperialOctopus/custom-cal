import 'package:flutter/material.dart';

import '../decoration/shadow_decoration.dart';
import '../section_controller/tabbed_section_controller.dart';
import '../../model/bookmark.dart';

class LandscapeLayout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;
  final Function(int, int) hyperlinkFunction;
  final Widget spread;
  final List<Function(bool, Function, bool, Function)> controlLayerBuilders;

  const LandscapeLayout({
    @required this.bookmark,
    @required this.updateBookmark,
    @required this.hyperlinkFunction,
    @required this.spread,
    @required this.controlLayerBuilders,
  });

  bool get _backEnabled => bookmark.pageBeforeExists(1);
  Function get _onBackPressed => () => updateBookmark(bookmark.pageBefore(2));
  bool get _forwardEnabled => bookmark.pageAfterExistsInSection(1)
      ? bookmark.pageAfterExists(2)
      : bookmark.pageAfterExists(1);
  Function get _onForwardPressed =>
      () => updateBookmark(bookmark.pageAfterExistsInSection(1)
          ? bookmark.pageAfter(2)
          : bookmark.pageAfter(1));

  Widget get sectionController {
    return TabbedSectionController(
      activeSection: bookmark.sectionIndex,
      onSectionPressed: (section) =>
          updateBookmark(bookmark.changeSection(section)),
      sections: bookmark.sections,
    );
  }

  List<Widget> get controlLayer => controlLayerBuilders
      .map<Widget>((Function(bool, Function, bool, Function) builder) =>
          builder(
              _backEnabled, _onBackPressed, _forwardEnabled, _onForwardPressed))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          sectionController,
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: ShadowDecoration.decoration,
                  child: spread,
                ),
                Stack(
                  fit: StackFit.expand,
                  children: controlLayer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
