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

  PageData get nextPage => getPage(pageIndex + 1);
  PageData get previousPage => getPage(pageIndex - 1);

  // Returns data for page index in current section, or null if page doesn't exist.
  PageData getPage(int index) {
    if (index < pagesInSectionCount) {
      return pages[index];
    } else {
      return null;
    }
  }

  /// True if there is a valid page before the current one.
  bool pagesBeforeExist(int pages) {
    return pageIndex - pages >= 0;
  }

  /// True if there is a valid page following the current one.
  bool pagesAfterExist(int pages) {
    return pageIndex < pagesInSectionCount - pages;
  }

  /// Returns the bookmark corresponding to the previous page spread.
  Bookmark turnBack(int pages) {
    int page = pageIndex - pages;
    if (page < 0) {
      page = 0;
    }
    return copyWith(pageIndex: page);
  }

  /// Returns the bookmark corresponding to the following page spread.
  Bookmark turnForward(int pages) {
    int page = pageIndex + pages;
    if (page > pagesInSectionCount - 1) {
      page = pagesInSectionCount - 1;
    }
    return copyWith(pageIndex: page);
  }

  /// Returns a bookmark at the specified section.
  Bookmark changeSection(int section) {
    return copyWith(sectionIndex: section, pageIndex: 0);
  }
}
