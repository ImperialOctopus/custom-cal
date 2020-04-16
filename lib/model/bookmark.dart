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

  /// True if there is a valid page before the current one.
  bool lastPageExists() {
    return pageIndex > 0;
  }

  /// Returns the bookmark corresponding to the previous page spread.
  Bookmark lastPage(int pagesPerSpread) {
    int page = pageIndex - pagesPerSpread;
    if (page < 0) {
      page = 0;
    }
    return copyWith(pageIndex: page);
  }

  /// True if there is a valid page following the current one.
  bool nextPageExists(int pagesPerSpread) {
    return pageIndex < pagesInSectionCount - pagesPerSpread;
  }

  /// Returns the bookmark corresponding to the following page spread.
  Bookmark nextPage(int pagesPerSpread) {
    int page = pageIndex - pagesPerSpread;
    if (page < 0) {
      page = 0;
    }
    return copyWith(pageIndex: page);
  }

  /// Returns a bookmark at the specified section.
  Bookmark changeSection(int section) {
    return copyWith(sectionIndex: section, pageIndex: 0);
  }
}
