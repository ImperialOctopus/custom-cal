import 'package:flutter/material.dart';
import 'package:prototype_cal/model/section.dart';

import 'book.dart';
import 'page.dart';

class Bookmark {
  final Book book;
  final int sectionIndex;
  final int pageIndex;

  const Bookmark(
      {@required this.book,
      @required this.sectionIndex,
      @required this.pageIndex});

  Bookmark copyWith({Book book, int sectionIndex, int pageIndex}) {
    return Bookmark(
      book: book ?? this.book,
      sectionIndex: section ?? this.sectionIndex,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  int get sectionCount => book.sections.length;
  int get pagesInSection => section.pages.length;

  Section get section => book.sections[sectionIndex];
  Page get page => section.pages[pageIndex];
}
