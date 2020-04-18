import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/keyboard_control_layer.dart';

import '../animation/flip_direction.dart';
import '../spread/animated_landscape_spread.dart';
import '../control_layer/default_control_layer.dart';
import '../section_controller/tabbed_section_controller.dart';
import '../../model/bookmark.dart';

class AnimatedLandscapeLayout extends StatelessWidget {
  final Bookmark startBookmark;
  final Bookmark endBookmark;
  final FlipDirection flipDirection;
  final Function(Bookmark) updateBookmark;
  final AnimationController controller;
  final Animation animation;

  final int pagesPerSpread = 2;

  const AnimatedLandscapeLayout({
    @required this.startBookmark,
    @required this.endBookmark,
    @required this.flipDirection,
    @required this.updateBookmark,
    @required this.controller,
    @required this.animation,
  });

  Widget get sectionController {
    return TabbedSectionController(
      activeSection: endBookmark.sectionIndex,
      onSectionPressed: (section) =>
          updateBookmark(endBookmark.changeSection(section)),
      sections: endBookmark.sections,
    );
  }

  Widget get controlLayer {
    return KeyboardControlLayer(
      backEnabled: endBookmark.pagesBeforeExist(1),
      onBackPressed: () => updateBookmark(endBookmark.turnBack(pagesPerSpread)),
      forwardEnabled: endBookmark.pagesAfterExist(pagesPerSpread),
      onForwardPressed: () =>
          updateBookmark(endBookmark.turnForward(pagesPerSpread)),
    );
  }

  Widget get spread {
    return AnimatedLandscapeSpread(
      startBookmark: startBookmark,
      endBookmark: endBookmark,
      flipDirection: flipDirection,
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
