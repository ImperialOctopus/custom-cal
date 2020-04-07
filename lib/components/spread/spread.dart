import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../../model/page_data.dart';

abstract class Spread extends StatelessWidget {
  final Bookmark bookmark;

  const Spread({@required this.bookmark});

  PageData getPage(int index) {
    if (index < bookmark.pagesInSectionCount) {
      return bookmark.pages[index];
    } else {
      return null;
    }
  }
}
