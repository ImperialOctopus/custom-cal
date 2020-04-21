import 'package:flutter/material.dart';
import 'package:prototype_cal/components/animation/flip_direction.dart';
import 'package:prototype_cal/components/animation/portrait_flip.dart';
import 'package:prototype_cal/components/page/page_component.dart';
import 'package:prototype_cal/components/spread/portrait_spread.dart';
import 'package:prototype_cal/model/bookmark.dart';

class AnimatedPortraitSpread extends StatelessWidget {
  final Bookmark startBookmark;
  final Bookmark endBookmark;
  final FlipDirection flipDirection;
  final AnimationController controller;
  final Animation animation;

  const AnimatedPortraitSpread({
    @required this.startBookmark,
    @required this.endBookmark,
    @required this.flipDirection,
    @required this.controller,
    @required this.animation,
  });

  bool get _isFirstPhase => controller.value < 0.5;
  bool get _running => controller.isAnimating;

  @override
  Widget build(BuildContext context) {
    if (_running) {
      return AnimatedBuilder(
        animation: animation,
        builder: (_, __) => PortraitFlip(
          flipDirection: flipDirection,
          animationProgress: animation.value,
          isFirstPhase: _isFirstPhase,
          start: _startPage,
          end: _endPage,
        ),
      );
    } else {
      return PortraitSpread(bookmark: endBookmark);
    }
  }

  Widget get _startPage => PageComponent(
        page: startBookmark.page,
        foldEdge: FoldEdge.none,
      );

  Widget get _endPage => PageComponent(
        page: endBookmark.page,
        foldEdge: FoldEdge.none,
      );
}
