import 'package:flutter/material.dart';

import '../layout/oriented_layout.dart';
import '../../model/bookmark.dart';

/// Displays a book to the user.
class Book extends StatefulWidget {
  final Bookmark startingBookmark;

  const Book({
    @required this.startingBookmark,
  });

  @override
  State<StatefulWidget> createState() => BookState(bookmark: startingBookmark);
}

class BookState extends State<Book> {
  Bookmark bookmark;

  BookState({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return OrientedLayout(
      bookmark: bookmark,
      updateBookmark: _updateBookmark,
    );
  }

  void _updateBookmark(Bookmark newBookmark) {
    if (newBookmark.compareTo(bookmark) != 0) {
      setState(() {
        bookmark = newBookmark;
      });
    }
  }
}
