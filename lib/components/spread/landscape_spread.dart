import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../page/page_component.dart';
import 'spread.dart';

/// Spread of two pages arranged for landscape viewing.
class LandscapeSpread extends Spread {
  final Bookmark bookmark;

  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  const LandscapeSpread({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PageComponent(
              page: getPage(bookmark.pageIndex), foldEdge: FoldEdge.right),
        ),
        Expanded(
          child: PageComponent(
              page: getPage(bookmark.pageIndex + 1), foldEdge: FoldEdge.left),
        ),
      ],
    );
  }
}
