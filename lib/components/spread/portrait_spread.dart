import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../page/page_component.dart';

class PortraitSpread extends StatelessWidget {
  final Bookmark bookmark;

  const PortraitSpread({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PageComponent(
            page: bookmark.page,
            foldEdge: FoldEdge.none,
          ),
        ),
      ],
    );
  }
}
