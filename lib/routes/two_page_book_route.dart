import 'package:flutter/material.dart';
import 'package:prototype_cal/components/two_page_book_component.dart';
import 'package:prototype_cal/model/bookmark.dart';

class TwoPageBookRoute extends StatelessWidget {
  static const routeName = 'twoPageBookRoute';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as a bookmark.
    final Bookmark bookmark = ModalRoute.of(context).settings.arguments;

    return TwoPageBookComponent(
      bookmark: bookmark,
      onSectionPressed: (int i) => onSectionPressed(context, i, bookmark),
      onBackPressed: () => onBackPressed(context, bookmark),
      onForwardPressed: () => onForwardPressed(context, bookmark),
    );
  }

  void onSectionPressed(BuildContext context, int i, Bookmark bookmark) {
    Bookmark newBookmark = bookmark.copyWith(sectionIndex: i);
    Navigator.pushNamed(context, routeName, arguments: newBookmark);
  }

  void onBackPressed(BuildContext context, Bookmark bookmark) {
    Bookmark newBookmark;
    if (bookmark.pageIndex <= 1) {
      newBookmark = bookmark;
    } else {
      newBookmark = bookmark.copyWith(pageIndex: bookmark.pageIndex - 2);
    }
    Navigator.pushNamed(context, routeName, arguments: newBookmark);
  }

  void onForwardPressed(BuildContext context, Bookmark bookmark) {
    Bookmark newBookmark;
    if (bookmark.pageIndex >= bookmark.pagesInSection - 2) {
      newBookmark = bookmark;
    } else {
      newBookmark = bookmark.copyWith(pageIndex: bookmark.pageIndex + 2);
    }
    Navigator.pushNamed(context, routeName, arguments: newBookmark);
  }
}
