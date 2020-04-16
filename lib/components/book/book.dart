import 'package:flutter/material.dart';

import '../layout/landscape_layout.dart';
import '../layout/portrait_layout.dart';
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
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.landscape:
            return LandscapeLayout(
              bookmark: bookmark,
              updateBookmark: _updateBookmark,
            );
          case Orientation.portrait:
            return PortraitLayout(
              bookmark: bookmark,
              updateBookmark: _updateBookmark,
            );
          default:
            throw FallThroughError();
        }
      },
    );
  }

  void _updateBookmark(Bookmark newBookmark) {
    setState(() {
      bookmark = newBookmark;
    });
  }
}
