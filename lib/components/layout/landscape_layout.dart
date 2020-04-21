import 'package:flutter/material.dart';

import '../control_layer/default_control_layer.dart';
import '../section_controller/tabbed_section_controller.dart';
import '../spread/landscape_spread.dart';
import '../../model/bookmark.dart';

class LandscapeLayout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  const LandscapeLayout({
    @required this.bookmark,
    @required this.updateBookmark,
  });

  Widget get sectionController {
    return TabbedSectionController(
      activeSection: bookmark.sectionIndex,
      onSectionPressed: (section) =>
          updateBookmark(bookmark.changeSection(section)),
      sections: bookmark.sections,
    );
  }

  Widget get controlLayer {
    return DefaultControlLayer(
      backEnabled: bookmark.pageBeforeExists(1),
      onBackPressed: () => updateBookmark(bookmark.pageBefore(2)),
      forwardEnabled: bookmark.pageAfterExistsInSection(1)
          ? bookmark.pageAfterExists(2)
          : bookmark.pageAfterExists(1),
      onForwardPressed: () => updateBookmark(
          bookmark.pageAfterExistsInSection(1)
              ? bookmark.pageAfter(2)
              : bookmark.pageAfter(1)),
    );
  }

  Widget get spread {
    return LandscapeSpread(
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
