import 'package:custom_cal/components/control_layer/button_control_layer.dart';
import 'package:custom_cal/components/control_layer/keyboard_control_layer.dart';
import 'package:custom_cal/components/layout/landscape_layout.dart';
import 'package:custom_cal/components/layout/portrait_layout.dart';
import 'package:custom_cal/components/spread/landscape_spread.dart';
import 'package:custom_cal/components/spread/portrait_spread.dart';
import 'package:flutter/material.dart';

import '../../model/bookmark.dart';

class Book extends StatefulWidget {
  final Bookmark startingBookmark;

  const Book({
    @required this.startingBookmark,
  });

  @override
  State<StatefulWidget> createState() => BookState(bookmark: startingBookmark);
}

class BookState extends State<Book> {
  Bookmark bookmark;

  BookState({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.landscape:
            return LandscapeLayout(
              bookmark: bookmark,
              updateBookmark: _updateBookmark,
              hyperlinkFunction: _hyperlinkFunction,
              spread: LandscapeSpread(
                bookmark: bookmark,
                hyperlinkFunction: _hyperlinkFunction,
              ),
              controlLayerBuilders: [
                ButtonControlLayer.builder,
                KeyboardControlLayer.builder,
              ],
            );
          case Orientation.portrait:
            return PortraitLayout(
              bookmark: bookmark,
              updateBookmark: _updateBookmark,
              hyperlinkFunction: _hyperlinkFunction,
              spread: PortraitSpread(
                bookmark: bookmark,
                hyperlinkFunction: _hyperlinkFunction,
              ),
              controlLayerBuilders: [
                ButtonControlLayer.builder,
                KeyboardControlLayer.builder,
              ],
            );
          default:
            throw FallThroughError();
        }
      },
    );
  }

  void _hyperlinkFunction(int page, int section) {
    _updateBookmark(bookmark.changeSection(section).changePage(page));
  }

  void _updateBookmark(Bookmark newBookmark) {
    if (newBookmark.compareTo(bookmark) != 0) {
      setState(() {
        bookmark = newBookmark;
      });
    }
  }
}
