import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../../model/section_data.dart';

abstract class Book extends StatefulWidget {
  final Bookmark bookmark;

  const Book({@required this.bookmark});

  @override
  State<StatefulWidget> createState() => _BookState(bookmark: bookmark);

  bool get backEnabled => bookmark.pageIndex > 0;
  bool get forwardEnabled =>
      bookmark.pageIndex < bookmark.pagesInSectionCount - pagesPerSpread;

  int get pagesPerSpread;

  Widget buildSpread({
    @required Bookmark bookmark,
  });

  Widget buildSectionController({
    @required List<SectionData> sections,
    @required int activeSection,
    @required Function(int) onSectionPressed,
  });
}

class _BookState extends State<Book> {
  Bookmark bookmark;

  _BookState({@required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Column(
          children: <Widget>[
            widget.buildSectionController(
              sections: bookmark.sections,
              activeSection: bookmark.sectionIndex,
              onSectionPressed: _changeSection,
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius:
                              5.0, // has the effect of softening the shadow
                          spreadRadius:
                              0.0, // has the effect of extending the shadow
                          offset: Offset(
                            -3, // horizontal, move right 10
                            3, // vertical, move down 10
                          ),
                        )
                      ],
                    ),
                    child: widget.buildSpread(bookmark: bookmark),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: TurnPageButton(
                        iconData: Icons.arrow_back,
                        onPressed: widget.backEnabled ? _pageBack : null,
                      )),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: TurnPageButton(
                      iconData: Icons.arrow_forward,
                      onPressed: widget.forwardEnabled ? _pageForward : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeSection(int i) {
    setState(() {
      bookmark = bookmark.copyWith(sectionIndex: i, pageIndex: 0);
    });
  }

  void _pageBack() {
    setState(() {
      if (bookmark.pageIndex > 1) {
        bookmark = bookmark.copyWith(
            pageIndex: bookmark.pageIndex - widget.pagesPerSpread);
      }
    });
  }

  void _pageForward() {
    setState(() {
      if (bookmark.pageIndex <
          bookmark.pagesInSectionCount - widget.pagesPerSpread) {
        bookmark = bookmark.copyWith(
            pageIndex: bookmark.pageIndex + widget.pagesPerSpread);
      }
    });
  }
}

class TurnPageButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  const TurnPageButton({
    @required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }
}
