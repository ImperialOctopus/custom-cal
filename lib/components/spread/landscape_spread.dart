import 'package:flutter/material.dart';

import '../../model/bookmark.dart';
import '../../model/page_data.dart';
import '../section_controller/tabbed_section_controller.dart';
import '../page/page.dart';
import '../page/page_button.dart';

class LandscapeSpread extends StatelessWidget {
  final Bookmark bookmark;
  final Function(int) onSectionPressed;
  final Function onForwardPressed;
  final Function onBackPressed;

  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  const LandscapeSpread(
      {@required this.bookmark,
      this.onSectionPressed,
      this.onForwardPressed,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Column(
          children: <Widget>[
            TabbedSectionController(
              sections: bookmark.sections,
              activeSection: bookmark.sectionIndex,
              onSectionPressed: onSectionPressed,
              tabHeight: tabHeight,
              tabWidth: tabWidth,
              tabSpacing: tabSpacing,
              inset: tabsInset,
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
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Page(
                              page: getPage(bookmark.pageIndex),
                              foldEdge: FoldEdge.right),
                        ),
                        Expanded(
                          child: Page(
                              page: getPage(bookmark.pageIndex + 1),
                              foldEdge: FoldEdge.left),
                        ),
                      ],
                    ),
                  ),
                  showBackButton
                      ? Positioned(
                          left: 0,
                          bottom: 0,
                          child: PageButton(
                            iconData: Icons.arrow_back,
                            onPressed: onBackPressed,
                          ))
                      : null,
                  showForwardButton
                      ? Positioned(
                          right: 0,
                          bottom: 0,
                          child: PageButton(
                            iconData: Icons.arrow_forward,
                            onPressed: onForwardPressed,
                          ),
                        )
                      : null,
                ].where((value) => value != null).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageData getPage(int index) {
    if (index < bookmark.pagesInSectionCount) {
      return bookmark.pages[index];
    } else {
      return null;
    }
  }

  bool get showForwardButton =>
      bookmark.pageIndex < bookmark.pagesInSectionCount - 2;

  bool get showBackButton => bookmark.pageIndex > 0;
}
