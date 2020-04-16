import 'package:flutter/material.dart';

import '../control_layer/default_control_layer.dart';
import '../section_controller/tabbed_section_controller.dart';
import '../spread/portrait_spread.dart';
import '../../model/bookmark.dart';
import '../layout/layout.dart';

class PortraitLayout extends Layout {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  @override
  final int pagesPerSpread = 1;

  @override
  const PortraitLayout({
    @required this.bookmark,
    @required this.updateBookmark,
  });

  Widget get sectionController {
    return TabbedSectionController(
      activeSection: bookmark.sectionIndex,
      onSectionPressed: (section) => bookmark.changeSection(section),
      sections: bookmark.sections,
    );
  }

  Widget get controlLayer {
    return DefaultControlLayer(
      backEnabled: bookmark.lastPageExists(),
      onBackPressed: () => updateBookmark(bookmark.lastPage(pagesPerSpread)),
      forwardEnabled: bookmark.nextPageExists(pagesPerSpread),
      onForwardPressed: () => updateBookmark(bookmark.nextPage(pagesPerSpread)),
    );
  }

  Widget get spread {
    return PortraitSpread(
      bookmark: bookmark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          sectionController,
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
                  child: spread,
                ),
                controlLayer,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
