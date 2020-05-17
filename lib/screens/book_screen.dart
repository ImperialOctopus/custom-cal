import 'package:flutter/material.dart';

import '../components/book/animated_book.dart';
import '../model/book_data.dart';
import '../model/bookmark.dart';

class BookScreen extends StatelessWidget {
  static const EdgeInsetsGeometry padding = EdgeInsets.all(16);

  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  final BookData book;

  const BookScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: padding,
          child: AnimatedBook(
            startingBookmark: Bookmark.firstPage(book: book),
          ),
        ),
      ),
    );
  }
}
