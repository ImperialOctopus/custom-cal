import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import 'spread_two_component.dart';

enum Orientation { portrait, landscape }

class BookComponent extends StatefulWidget {
  final Bookmark bookmark;
  final Orientation orientation;

  const BookComponent({@required this.bookmark, @required this.orientation});

  @override
  State<StatefulWidget> createState() => BookComponentState(bookmark: bookmark);
}

class BookComponentState extends State<BookComponent> {
  Bookmark _bookmark;

  BookComponentState({@required Bookmark bookmark}) : _bookmark = bookmark;

  @override
  Widget build(BuildContext context) {
    switch (widget.orientation) {
      case Orientation.portrait:
        break;
      case Orientation.landscape:
        break;
      default:
    }
  }

  Widget _buildLandscape() {
    return SpreadTwoComponent(
      bookmark: _bookmark,
      onSectionPressed: _changeSection,
      onBackPressed: _pageBack,
      onForwardPressed: _pageForward,
    );
  }

  Widget _buildPortrait() {}

  int get pageChange {
    switch (widget.orientation) {
      case Orientation.portrait:
        return 1;
        break;
      case Orientation.landscape:
        return 2;
        break;
      default:
        throw FallThroughError();
    }
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
