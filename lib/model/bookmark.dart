import 'package:flutter/material.dart';

import 'book_data.dart';
import 'section_data.dart';
import 'page_data.dart';

class Bookmark implements Comparable<Bookmark> {
  final BookData book;
  final int sectionIndex;
  final int pageIndex;

  const Bookmark({
    @required this.book,
    @required this.sectionIndex,
    @required this.pageIndex,
  });

  const Bookmark.firstPage({@required BookData book})
      : book = book,
        sectionIndex = 0,
        pageIndex = 0;

  Bookmark.lastPage({@required BookData book})
      : book = book,
        sectionIndex = book.sections.length - 1,
        pageIndex = book.sections.last.pages.length - 1;

  List<SectionData> get sections => book.sections;

  SectionData get section => book.sections[sectionIndex];
  PageData get page => section.pages[pageIndex];

  Bookmark _copyWith({BookData book, int sectionIndex, int pageIndex}) {
    return Bookmark(
      book: book ?? this.book,
      sectionIndex: sectionIndex ?? this.sectionIndex,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  // Number of pages in the specified section. Defaults to current section.
  int _pagesInSection({int index}) {
    index ??= sectionIndex;
    return sections[index].pages.length;
  }

  /// Count of pages preceding the current one in the book.
  int get _pagesBefore {
    int total = pageIndex;
    for (int i = sectionIndex - 1; i >= 0; i--) {
      total += _pagesInSection(index: i);
    }
    return total;
  }

  /// Count of pages following the current one in the book.
  int get _pagesAfter {
    int total = _pagesInSection() - (pageIndex + 1);
    for (int i = sectionIndex + 1; i < sections.length; i++) {
      total += _pagesInSection(index: i);
    }
    return total;
  }

  /// True if there are at least the specified number of pages before this one in the section.
  bool pageBeforeExistsInSection(int pages) {
    return pageIndex - pages >= 0;
  }

  /// True if there are at least the specified number of pages after this one in the section.
  bool pageAfterExistsInSection(int pages) {
    return pageIndex + pages < _pagesInSection();
  }

  /// True if there are at least the specified number of pages before this one in the book.
  bool pageBeforeExists(int pages) {
    return _pagesBefore - pages >= 0;
  }

  /// True if there are at least the specified number of pages after this one in the book.
  bool pageAfterExists(int pages) {
    return _pagesAfter - pages >= 0;
  }

  /// Gets the page if it's in this section, if not returns null.
  PageData getPageInSection(int pages) {
    if (pages < 0) {
      return pageBeforeExistsInSection(pages) ? pageBefore(pages).page : null;
    } else if (pages == 0) {
      return page;
    } else {
      return pageAfterExistsInSection(pages) ? pageAfter(pages).page : null;
    }
  }

  /// Returns the bookmark corresponding to the previous page spread.
  Bookmark pageBefore(int pages) {
    if (!pageBeforeExists(pages)) {
      return Bookmark.firstPage(book: book);
    }
    int _section = sectionIndex;
    int _page = pageIndex - pages;

    // Move section back if requested page is in the previous section.
    if (_page < 0) {
      _section--;
      _page = _pagesInSection(index: _section) - pages;
      // Prevent flipping back from skipping sections.
      if (_page < 0) {
        _page = 0;
      }
    }

    return _copyWith(pageIndex: _page, sectionIndex: _section);
  }

  /// Returns the bookmark corresponding to the following page spread.
  Bookmark pageAfter(int pages) {
    if (!pageAfterExists(pages)) {
      return Bookmark.lastPage(book: book);
    }
    int _section = sectionIndex;
    int _page = pageIndex + pages;

    // Move section forward if requested page is in the next section.
    if (_page > _pagesInSection() - 1) {
      _section++;
      _page = 0;
    }

    return _copyWith(pageIndex: _page, sectionIndex: _section);
  }

  /// Returns a bookmark at the specified page.
  Bookmark changePage(int _page) {
    if (_page >= 0 && _page < _pagesInSection()) {
      return _copyWith(pageIndex: _page);
    } else {
      throw ArgumentError(
          "changePage failed: page " + _page.toString() + " does not exist.");
    }
  }

  /// Returns a bookmark at the specified section.
  Bookmark changeSection(int _section) {
    if (_section >= 0 && _section < sections.length) {
      return _copyWith(sectionIndex: _section, pageIndex: 0);
    } else {
      throw ArgumentError("changeSection failed: section " +
          _section.toString() +
          " does not exist.");
    }
  }

  @override
  int compareTo(Bookmark other) {
    if (sectionIndex > other.sectionIndex) {
      return 1;
    }
    if (sectionIndex < other.sectionIndex) {
      return -1;
    }
    if (pageIndex > other.pageIndex) {
      return 1;
    }
    if (pageIndex < other.pageIndex) {
      return -1;
    }
    return 0;
  }
}
