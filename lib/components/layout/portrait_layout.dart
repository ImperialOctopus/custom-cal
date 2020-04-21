import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/keyboard_control_layer.dart';

import '../section_controller/tabbed_section_controller.dart';
import '../spread/portrait_spread.dart';
import '../../model/bookmark.dart';

class PortraitLayout extends StatelessWidget {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  const PortraitLayout({
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
    return KeyboardControlLayer(
      backEnabled: bookmark.pageBeforeExists(1),
      onBackPressed: () => updateBookmark(bookmark.pageBefore(1)),
      forwardEnabled: bookmark.pageAfterExists(1),
      onForwardPressed: () => updateBookmark(bookmark.pageAfter(1)),
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
