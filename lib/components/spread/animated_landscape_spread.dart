import 'package:flutter/material.dart';
import '../animation/flip_direction.dart';
import '../animation/landscape_flip.dart';
import '../spread/landscape_spread.dart';

import '../page/page_component.dart';
import '../../model/bookmark.dart';

/// Spread of two pages arranged for landscape viewing.
class AnimatedLandscapeSpread extends StatelessWidget {
  final Bookmark startBookmark;
  final Bookmark endBookmark;
  final FlipDirection flipDirection;
  final AnimationController controller;
  final Animation animation;

  const AnimatedLandscapeSpread({
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
        builder: (_, __) => LandscapeFlip(
          flipDirection: flipDirection,
          animationProgress: animation.value,
          isFirstPhase: _isFirstPhase,
          leftStart: _leftStartPage,
          leftEnd: _leftEndPage,
          rightStart: _rightStartPage,
          rightEnd: _rightEndPage,
        ),
      );
    } else {
      return LandscapeSpread(bookmark: endBookmark);
    }
  }

  Widget get _leftStartPage => PageComponent(
        page: startBookmark.page,
        foldEdge: FoldEdge.right,
      );

  Widget get _leftEndPage => PageComponent(
        page: endBookmark.page,
        foldEdge: FoldEdge.right,
      );

  Widget get _rightStartPage => PageComponent(
        page: startBookmark.nextPage,
        foldEdge: FoldEdge.left,
      );

  Widget get _rightEndPage => PageComponent(
        page: endBookmark.nextPage,
        foldEdge: FoldEdge.left,
      );
}
