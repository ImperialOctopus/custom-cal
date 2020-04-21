import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/keyboard_control_layer.dart';
import 'package:prototype_cal/components/layout/landscape_layout.dart';

import '../animation/flip_direction.dart';
import '../spread/animated_landscape_spread.dart';
import '../../model/bookmark.dart';

class AnimatedLandscapeLayout extends LandscapeLayout {
  final Bookmark startBookmark;
  final Bookmark endBookmark;
  final FlipDirection flipDirection;
  final Function(Bookmark) updateBookmark;
  final AnimationController controller;
  final Animation animation;

  const AnimatedLandscapeLayout({
    @required this.startBookmark,
    @required this.endBookmark,
    @required this.flipDirection,
    @required this.updateBookmark,
    @required this.controller,
    @required this.animation,
  });

  @override
  Bookmark get bookmark => endBookmark;

  @override
  Widget get spread {
    return AnimatedLandscapeSpread(
      startBookmark: startBookmark,
      endBookmark: endBookmark,
      flipDirection: flipDirection,
      controller: controller,
      animation: animation,
    );
  }
}
