import 'package:flutter/material.dart';

import '../../model/bookmark.dart';

abstract class Layout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(int) changeSection;
  final Function(int) changePage;

  int get pagesPerSpread;

  const Layout({
    @required this.bookmark,
    @required this.changeSection,
    @required this.changePage,
  });
}
