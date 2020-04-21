import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/keyboard_control_layer.dart';
import 'package:prototype_cal/components/layout/default_layout.dart';

import '../spread/portrait_spread.dart';
import '../../model/bookmark.dart';

class PortraitLayout extends DefaultLayout {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;
  final Function(int, int) hyperlinkFunction;

  const PortraitLayout({
    @required this.bookmark,
    @required this.updateBookmark,
    @required this.hyperlinkFunction,
  });

  @override
  Widget get controlLayer {
    return KeyboardControlLayer(
      backEnabled: bookmark.pageBeforeExists(1),
      onBackPressed: () => updateBookmark(bookmark.pageBefore(1)),
      forwardEnabled: bookmark.pageAfterExists(1),
      onForwardPressed: () => updateBookmark(bookmark.pageAfter(1)),
    );
  }

  @override
  Widget get spread {
    return PortraitSpread(
      bookmark: bookmark,
      hyperlinkFunction: hyperlinkFunction,
    );
  }
}
