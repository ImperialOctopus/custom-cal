import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../page/page_component.dart';

/// Spread of two pages arranged for landscape viewing.
class LandscapeSpread extends StatelessWidget {
  final Bookmark bookmark;

  const LandscapeSpread({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PageComponent(
            page: bookmark.page,
            foldEdge: FoldEdge.right,
          ),
        ),
        Expanded(
          child: PageComponent(
            page: bookmark.getPageInSection(1),
            foldEdge: FoldEdge.left,
          ),
        ),
      ],
    );
  }
}
