import 'package:flutter/material.dart';

import 'landscape_layout.dart';
import '../animation/flip_direction.dart';
import '../spread/animated_landscape_spread.dart';
import '../../model/bookmark.dart';

class AnimatedLandscapeLayout extends LandscapeLayout {
  final Bookmark lastBookmark;
  final Bookmark bookmark;
  final FlipDirection flipDirection;
  final Function(Bookmark) updateBookmark;
  final AnimationController controller;
  final Animation animation;

  const AnimatedLandscapeLayout({
    @required this.lastBookmark,
    @required this.bookmark,
    @required this.flipDirection,
    @required this.updateBookmark,
    @required this.controller,
    @required this.animation,
  });

  @override
  Widget get spread {
    return AnimatedLandscapeSpread(
      startBookmark: lastBookmark,
      endBookmark: bookmark,
      flipDirection: flipDirection,
      controller: controller,
      animation: animation,
    );
  }
}
