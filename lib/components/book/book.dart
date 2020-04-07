import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../spread/i_spread.dart';

abstract class Book extends StatefulWidget {
  final Bookmark bookmark;

  const Book({@required this.bookmark});

  @override
  State<StatefulWidget> createState() => _BookState();

  Widget buildSpread(Bookmark bookmark);
}

class _BookState extends State<Book> {
  _BookState();

  @override
  Widget build(BuildContext context) => widget.buildSpread(widget.bookmark);

  void _changeSection(int i) {
    setState(() {
      _bookmark = _bookmark.copyWith(sectionIndex: i, pageIndex: 0);
    });
  }

  void _pageBack() {
    setState(() {
      if (_bookmark.pageIndex > 1) {
        _bookmark =
            _bookmark.copyWith(pageIndex: _bookmark.pageIndex - pageChange);
      }
    });
  }

  void _pageForward() {
    setState(() {
      if (_bookmark.pageIndex < _bookmark.pagesInSectionCount - pageChange) {
        _bookmark =
            _bookmark.copyWith(pageIndex: _bookmark.pageIndex + pageChange);
      }
    });
  }
}
