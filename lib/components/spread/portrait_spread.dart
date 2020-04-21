import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../page/page_component.dart';

class PortraitSpread extends StatelessWidget {
  final Bookmark bookmark;
  final Function(int, int) hyperlinkFunction;

  const PortraitSpread({
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
            foldEdge: FoldEdge.none,
            hyperlinkFunction: hyperlinkFunction,
          ),
        ),
      ],
    );
  }
}
