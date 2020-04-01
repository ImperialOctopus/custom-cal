import 'package:flutter/material.dart';

import '../components/book/landscape_book_component.dart';
import '../model/book.dart';
import '../model/bookmark.dart';

class BookScreen extends StatelessWidget {
  final EdgeInsetsGeometry padding = const EdgeInsets.all(16);
  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  final Book book;

  const BookScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: padding,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: LandscapeBookComponent(
          bookmark: Bookmark.first(book: book),
        ),
      ),
    );
  }
}
