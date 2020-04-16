import 'package:flutter/material.dart';

import '../../model/bookmark.dart';

abstract class Layout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  const Layout({
    @required this.bookmark,
    @required this.updateBookmark,
  });
}
