import 'package:flutter/material.dart';
import 'package:prototype_cal/components/book/book.dart';

import '../model/book_data.dart';
import '../model/bookmark.dart';

class BookScreen extends StatelessWidget {
  final EdgeInsetsGeometry padding = const EdgeInsets.all(16);
  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  final BookData book;

  const BookScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: padding,
        child: Book(
          startingBookmark: Bookmark.firstPage(book: book),
        ),
      ),
    );
  }
}
