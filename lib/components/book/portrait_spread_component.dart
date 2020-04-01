import 'package:flutter/material.dart';

import '../../model/page.dart';
import '../../model/bookmark.dart';
import '../page/page_back_button_component.dart';
import '../page/page_component.dart';
import '../page/page_forward_button_component.dart';
import 'section_select_component.dart';

class PortraitSpreadComponent extends StatelessWidget {
  final Bookmark bookmark;
  final Function(int) onSectionPressed;
  final Function onForwardPressed;
  final Function onBackPressed;

  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  const PortraitSpreadComponent(
      {@required this.bookmark,
      this.onSectionPressed,
      this.onForwardPressed,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SectionSelectComponent(
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
                PageComponent(
                    page: getPage(bookmark.pageIndex), foldEdge: FoldEdge.none),
                showBackButton
                    ? Positioned(
                        left: 0,
                        bottom: 0,
                        child: PageBackButtonComponent(
                          onPressed: onBackPressed,
                        ))
                    : null,
                showForwardButton
                    ? Positioned(
                        right: 0,
                        bottom: 0,
                        child: PageForwardButtonComponent(
                          onPressed: onForwardPressed,
                        ),
                      )
                    : null,
              ].where((value) => value != null).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Page getPage(int index) {
    if (index < bookmark.pagesInSectionCount) {
      return bookmark.pages[index];
    } else {
      return null;
    }
  }

  bool get showForwardButton =>
      bookmark.pageIndex < bookmark.pagesInSectionCount - 1;

  bool get showBackButton => bookmark.pageIndex > 0;
}
