import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../spread/portrait_spread.dart';

class PortraitBook extends StatefulWidget {
  final Bookmark bookmark;

  const PortraitBook({@required this.bookmark});

  @override
  State<StatefulWidget> createState() => _PortraitBookState(bookmark: bookmark);
}

class _PortraitBookState extends State<PortraitBook> {
  static const pageChange = 2;

  Bookmark _bookmark;

  _PortraitBookState({@required Bookmark bookmark}) : _bookmark = bookmark;

  @override
  Widget build(BuildContext context) {
    return PortraitSpread(
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
