import 'package:flutter/material.dart';
import 'package:prototype_cal/model/book.dart';
import 'package:prototype_cal/model/bookmark.dart';
import 'package:prototype_cal/routes/two_page_book_route.dart';

class LandscapeBookScreen extends StatelessWidget {
  final EdgeInsetsGeometry padding = const EdgeInsets.all(16);
  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  final Book book;

  const LandscapeBookScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: padding,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Navigator(
          onGenerateRoute: (RouteSettings routeSettings) {
            return TwoPageBookRoute(
              bookmark: Bookmark(
                book: book,
                pageIndex: 0,
                sectionIndex: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
