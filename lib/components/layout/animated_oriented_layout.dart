import 'package:flutter/material.dart';

import '../animation/flip_direction.dart';
import '../../model/bookmark.dart';
import 'animated_landscape_layout.dart';
import 'animated_portrait_layout.dart';

class AnimatedOrientedLayout extends StatelessWidget {
  final Bookmark lastBookmark;
  final Bookmark bookmark;
  final FlipDirection flipDirection;
  final Function(Bookmark) updateBookmark;
  final AnimationController controller;
  final Animation animation;
  final Function(int, int) hyperlinkFunction;

  const AnimatedOrientedLayout({
    @required this.lastBookmark,
    @required this.bookmark,
    @required this.flipDirection,
    @required this.updateBookmark,
    @required this.controller,
    @required this.animation,
    @required this.hyperlinkFunction,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.landscape:
            return AnimatedLandscapeLayout(
              lastBookmark: lastBookmark,
              bookmark: bookmark,
              flipDirection: flipDirection,
              updateBookmark: updateBookmark,
              controller: controller,
              animation: animation,
              hyperlinkFunction: hyperlinkFunction,
            );
          case Orientation.portrait:
            return AnimatedPortraitLayout(
              lastBookmark: lastBookmark,
              bookmark: bookmark,
              flipDirection: flipDirection,
              updateBookmark: updateBookmark,
              controller: controller,
              animation: animation,
              hyperlinkFunction: hyperlinkFunction,
            );
          default:
            throw FallThroughError();
        }
      },
    );
  }
}
