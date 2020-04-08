import 'package:flutter/material.dart';

import '../spread/spread.dart';
import '../control_layer/control_layer.dart';
import '../layout/layout.dart';
import '../section_controller/section_controller.dart';
import '../../model/bookmark.dart';
import '../../model/section_data.dart';

abstract class Book extends StatefulWidget {
  final Bookmark startingBookmark;

  const Book({@required this.startingBookmark});

  int get pagesPerSpread;

  Layout buildLayout({
    @required SectionController sectionController,
    @required Spread spread,
    @required ControlLayer controlLayer,
  });

  SectionController buildSectionController({
    @required List<SectionData> sections,
    @required int activeSection,
    @required Function(int) onSectionPressed,
  });

  Spread buildSpread({
    @required Bookmark bookmark,
  });

  ControlLayer buildControlLayer({
    bool backEnabled,
    Function onBackPressed,
    bool forwardEnabled,
    Function onForwardPressed,
  });

  bool backEnabled(Bookmark bookmark) => bookmark.pageIndex > 0;
  bool forwardEnabled(Bookmark bookmark) =>
      bookmark.pageIndex < bookmark.pagesInSectionCount - pagesPerSpread;

  @override
  State<StatefulWidget> createState() => _BookState(bookmark: startingBookmark);
}

class _BookState extends State<Book> {
  Bookmark bookmark;

  _BookState({@required this.bookmark});

////TODO this
  @override
  Widget build(BuildContext context) => widget.buildLayout(
        sectionController: widget.buildSectionController(
          sections: null,
          activeSection: null,
          onSectionPressed: null,
        ),
        spread: widget.buildSpread(
          bookmark: null,
        ),
        controlLayer: widget.buildControlLayer(),
      );

  void _changeSection(int i) {
    setState(() {
      bookmark = bookmark.copyWith(sectionIndex: i, pageIndex: 0);
    });
  }

  void _pageBack() {
    setState(() {
      if (widget.backEnabled(bookmark)) {
        bookmark = bookmark.copyWith(
            pageIndex: bookmark.pageIndex - widget.pagesPerSpread);
      }
    });
  }

  void _pageForward() {
    setState(() {
      if (widget.forwardEnabled(bookmark)) {
        bookmark = bookmark.copyWith(
            pageIndex: bookmark.pageIndex + widget.pagesPerSpread);
      }
    });
  }
}
