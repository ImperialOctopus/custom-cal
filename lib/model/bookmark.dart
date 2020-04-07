import 'package:flutter/material.dart';

import 'book_data.dart';
import 'section_data.dart';
import 'page_data.dart';

class Bookmark {
  final BookData book;
  final int sectionIndex;
  final int pageIndex;

  const Bookmark(
      {@required this.book,
      @required this.sectionIndex,
      @required this.pageIndex});

  const Bookmark.first({@required BookData book})
      : book = book,
        sectionIndex = 0,
        pageIndex = 0;

  Bookmark copyWith({BookData book, int sectionIndex, int pageIndex}) {
    return Bookmark(
      book: book ?? this.book,
      sectionIndex: sectionIndex ?? this.sectionIndex,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  SectionData get section => book.sections[sectionIndex];
  List<SectionData> get sections => book.sections;
  int get sectionCount => book.sections.length;

  PageData get page => section.pages[pageIndex];
  List<PageData> get pages => section.pages;
  int get pagesInSectionCount => section.pages.length;
}
