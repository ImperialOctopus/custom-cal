import 'package:flutter/material.dart';

import '../control_layer/swipe_control_layer.dart';
import '../control_layer/button_control_layer.dart';
import 'default_layout.dart';
import '../control_layer/keyboard_control_layer.dart';
import '../spread/landscape_spread.dart';
import '../../model/bookmark.dart';

class LandscapeLayout extends DefaultLayout {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;
  final Function(int, int) hyperlinkFunction;

  const LandscapeLayout({
    @required this.bookmark,
    @required this.updateBookmark,
    @required this.hyperlinkFunction,
  });

  @override
  List<Widget> get controlLayer {
    return [
      KeyboardControlLayer(
        backEnabled: _backEnabled,
        onBackPressed: _onBackPressed,
        forwardEnabled: _forwardEnabled,
        onForwardPressed: _onForwardPressed,
      ),
      ButtonControlLayer(
        backEnabled: _backEnabled,
        onBackPressed: _onBackPressed,
        forwardEnabled: _forwardEnabled,
        onForwardPressed: _onForwardPressed,
      ),
      SwipeControlLayer(
        backEnabled: _backEnabled,
        onBackPressed: _onBackPressed,
        forwardEnabled: _forwardEnabled,
        onForwardPressed: _onForwardPressed,
      ),
    ];
  }

  bool get _backEnabled => bookmark.pageBeforeExists(1);
  Function get _onBackPressed => () => updateBookmark(bookmark.pageBefore(2));
  bool get _forwardEnabled => bookmark.pageAfterExistsInSection(1)
      ? bookmark.pageAfterExists(2)
      : bookmark.pageAfterExists(1);
  Function get _onForwardPressed =>
      () => updateBookmark(bookmark.pageAfterExistsInSection(1)
          ? bookmark.pageAfter(2)
          : bookmark.pageAfter(1));

  @override
  Widget get spread {
    return LandscapeSpread(
      bookmark: bookmark,
      hyperlinkFunction: hyperlinkFunction,
    );
  }
}
