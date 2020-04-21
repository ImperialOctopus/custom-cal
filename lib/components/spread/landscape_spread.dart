import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../page/page_component.dart';

/// Spread of two pages arranged for landscape viewing.
class LandscapeSpread extends StatelessWidget {
  final Bookmark bookmark;
  final Function(int, int) hyperlinkFunction;

  const LandscapeSpread({
    @required this.bookmark,
    @required this.hyperlinkFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PageComponent(
            page: bookmark.page,
            foldEdge: FoldEdge.right,
            hyperlinkFunction: hyperlinkFunction,
          ),
        ),
        Expanded(
          child: PageComponent(
            page: bookmark.getPageInSection(1),
            foldEdge: FoldEdge.left,
            hyperlinkFunction: hyperlinkFunction,
          ),
        ),
      ],
    );
  }
}
