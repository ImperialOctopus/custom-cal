import 'package:flutter/material.dart';
import 'package:prototype_cal/components/spread/animated_landscape_spread.dart';

import '../control_layer/default_control_layer.dart';
import '../section_controller/tabbed_section_controller.dart';
import '../../model/bookmark.dart';

class AnimatedLandscapeLayout extends StatelessWidget {
  final Bookmark oldBookmark;
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;
  final AnimationController controller;
  final Animation animation;

  final int pagesPerSpread = 2;

  const AnimatedLandscapeLayout({
    @required this.oldBookmark,
    @required this.bookmark,
    @required this.updateBookmark,
    @required this.controller,
    @required this.animation,
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
      backEnabled: bookmark.pagesBeforeExist(1),
      onBackPressed: () => updateBookmark(bookmark.turnBack(pagesPerSpread)),
      forwardEnabled: bookmark.pagesAfterExist(pagesPerSpread),
      onForwardPressed: () =>
          updateBookmark(bookmark.turnForward(pagesPerSpread)),
    );
  }

  Widget get spread {
    return AnimatedLandscapeSpread(
      bookmark: bookmark,
      oldBookmark: oldBookmark,
      controller: controller,
      animation: animation,
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
