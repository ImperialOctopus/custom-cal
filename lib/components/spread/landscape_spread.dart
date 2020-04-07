import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../page/page.dart';
import 'spread.dart';

class LandscapeSpread extends Spread {
  @override
  final Bookmark bookmark;

  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  @override
  const LandscapeSpread({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child:
              Page(page: getPage(bookmark.pageIndex), foldEdge: FoldEdge.right),
        ),
        Expanded(
          child: Page(
              page: getPage(bookmark.pageIndex + 1), foldEdge: FoldEdge.left),
        ),
      ],
    );
  }
}
