import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../../model/section_data.dart';

abstract class Book extends StatefulWidget {
  final Bookmark startingBookmark;

  const Book({@required this.startingBookmark});

  @override
  State<StatefulWidget> createState() => _BookState(bookmark: startingBookmark);

  bool backEnabled(Bookmark bookmark) => bookmark.pageIndex > 0;
  bool forwardEnabled(Bookmark bookmark) =>
      bookmark.pageIndex < bookmark.pagesInSectionCount - pagesPerSpread;

  int get pagesPerSpread;

  Widget buildLayout(Bookmark bookmark, Function(int i) changeSection,
      Function pageBack, Function pageForward);

  Widget buildSpread({
    @required Bookmark bookmark,
  });

  Widget buildSectionController({
    @required List<SectionData> sections,
    @required int activeSection,
    @required Function(int) onSectionPressed,
  });
}

class _BookState extends State<Book> {
  Bookmark bookmark;

  _BookState({@required this.bookmark});

  @override
  Widget build(BuildContext context) =>
      widget.buildLayout(bookmark, _changeSection, _pageBack, _pageForward);

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

class TurnPageButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  const TurnPageButton({
    @required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }
}
