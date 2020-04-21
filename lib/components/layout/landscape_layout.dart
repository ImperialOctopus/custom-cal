import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/keyboard_control_layer.dart';

import '../control_layer/default_control_layer.dart';
import '../spread/landscape_spread.dart';
import '../../model/bookmark.dart';
import 'default_layout.dart';

class LandscapeLayout extends DefaultLayout {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  const LandscapeLayout({
    @required this.bookmark,
    @required this.updateBookmark,
  });

  @override
  Widget get controlLayer {
    return KeyboardControlLayer(
      backEnabled: bookmark.pageBeforeExists(1),
      onBackPressed: () => updateBookmark(bookmark.pageBefore(2)),
      forwardEnabled: bookmark.pageAfterExistsInSection(1)
          ? bookmark.pageAfterExists(2)
          : bookmark.pageAfterExists(1),
      onForwardPressed: () => updateBookmark(
          bookmark.pageAfterExistsInSection(1)
              ? bookmark.pageAfter(2)
              : bookmark.pageAfter(1)),
    );
  }

  @override
  Widget get spread {
    return LandscapeSpread(
      bookmark: bookmark,
    );
  }
}
