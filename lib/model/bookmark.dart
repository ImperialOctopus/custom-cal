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

  Section get section => book.sections[sectionIndex];
  List<Section> get sections => book.sections;
  int get sectionCount => book.sections.length;

  Page get page => section.pages[pageIndex];
  List<Page> get pages => section.pages;
  int get pagesInSectionCount => section.pages.length;
}
