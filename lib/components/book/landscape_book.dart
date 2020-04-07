import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../spread/landscape_spread.dart';

class LandscapeBook extends StatefulWidget {
  final Bookmark bookmark;

  const LandscapeBook({@required this.bookmark});

  @override
  State<StatefulWidget> createState() =>
      _LandscapeBookState(bookmark: bookmark);
}

class _LandscapeBookState extends State<LandscapeBook> {
  static const pageChange = 2;

  Bookmark _bookmark;

  _LandscapeBookState({@required Bookmark bookmark}) : _bookmark = bookmark;

  @override
  Widget build(BuildContext context) {
    return LandscapeSpread(
      bookmark: _bookmark,
      onSectionPressed: _changeSection,
      onBackPressed: _pageBack,
      onForwardPressed: _pageForward,
    );
  }

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
