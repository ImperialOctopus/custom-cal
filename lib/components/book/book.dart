import 'package:flutter/material.dart';
import 'package:prototype_cal/components/layout/landscape_layout.dart';

import '../../model/bookmark.dart';

class Book extends StatefulWidget {
  final Bookmark startingBookmark;

  const Book({@required this.startingBookmark});

  @override
  State<StatefulWidget> createState() => BookState(bookmark: startingBookmark);
}

class BookState extends State<Book> {
  Bookmark bookmark;

  BookState({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return LandscapeLayout(
      bookmark: bookmark,
      changeSection: _changeSection,
      changePage: _changePage,
    );
  }

  void _changeSection(int i) {
    setState(() {
      bookmark = bookmark.copyWith(sectionIndex: i, pageIndex: 0);
    });
  }

  void _changePage(int i) {
    setState(() {
      bookmark = bookmark.copyWith(pageIndex: i);
    });
  }
}
