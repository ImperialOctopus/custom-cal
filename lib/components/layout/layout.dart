import 'package:flutter/material.dart';

import '../../model/bookmark.dart';

/// Takes the bookmark and functions for changing section and pages and builds the current page spread.
abstract class Layout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  int get pagesPerSpread;

  const Layout({
    @required this.bookmark,
    @required this.updateBookmark,
  });
}
