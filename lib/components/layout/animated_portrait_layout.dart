import 'package:flutter/material.dart';
import 'package:prototype_cal/components/animation/flip_direction.dart';
import 'package:prototype_cal/components/layout/portrait_layout.dart';
import 'package:prototype_cal/components/spread/animated_portrait_spread.dart';
import 'package:prototype_cal/model/bookmark.dart';

class AnimatedPortraitLayout extends PortraitLayout {
  final Bookmark lastBookmark;
  final Bookmark bookmark;
  final FlipDirection flipDirection;
  final Function(Bookmark) updateBookmark;
  final AnimationController controller;
  final Animation animation;

  const AnimatedPortraitLayout({
    @required this.lastBookmark,
    @required this.bookmark,
    @required this.flipDirection,
    @required this.updateBookmark,
    @required this.controller,
    @required this.animation,
  });

  @override
  Widget get spread {
    return AnimatedPortraitSpread(
      startBookmark: lastBookmark,
      endBookmark: bookmark,
      flipDirection: flipDirection,
      controller: controller,
      animation: animation,
    );
  }
}
