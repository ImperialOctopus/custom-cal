import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import 'landscape_layout.dart';
import 'portrait_layout.dart';

class OrientedLayout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  const OrientedLayout({
    @required this.bookmark,
    @required this.updateBookmark,
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
            );
          case Orientation.portrait:
            return PortraitLayout(
              bookmark: bookmark,
              updateBookmark: updateBookmark,
            );
          default:
            throw FallThroughError();
        }
      },
    );
  }
}
