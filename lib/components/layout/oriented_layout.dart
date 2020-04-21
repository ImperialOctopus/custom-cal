import 'package:flutter/material.dart';

import 'landscape_layout.dart';
import 'portrait_layout.dart';
import '../../model/bookmark.dart';

class OrientedLayout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;
  final Function(int, int) hyperlinkFunction;

  const OrientedLayout({
    @required this.bookmark,
    @required this.updateBookmark,
    @required this.hyperlinkFunction,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.landscape:
            return LandscapeLayout(
              bookmark: bookmark,
              updateBookmark: updateBookmark,
              hyperlinkFunction: hyperlinkFunction,
            );
          case Orientation.portrait:
            return PortraitLayout(
              bookmark: bookmark,
              updateBookmark: updateBookmark,
              hyperlinkFunction: hyperlinkFunction,
            );
          default:
            throw FallThroughError();
        }
      },
    );
  }
}
