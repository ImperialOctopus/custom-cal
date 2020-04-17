import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../page/page_component.dart';
import '../../model/bookmark.dart';

/// Spread of two pages arranged for landscape viewing.
class AnimatedLandscapeSpread extends StatelessWidget {
  final Bookmark oldBookmark;
  final Bookmark bookmark;
  final AnimationController controller;
  final Animation animation;

  final double spacing = 2;
  final _perspective = 0.003;
  final _zeroAngle =
      0.0001; // There's something wrong in the perspective transform, I use a very small value instead of zero to temporarily get it around.

  const AnimatedLandscapeSpread({
    @required this.bookmark,
    @required this.oldBookmark,
    @required this.controller,
    @required this.animation,
  });

  bool get _isFirstPhase => controller.value < 0.5;
  bool get _isSecondPhase => !_isFirstPhase;
  bool get _running => controller.isAnimating;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => buildPages(),
    );
  }

  Widget buildPages() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: _buildLeftFlipPanel(),
        ),
        Padding(
          padding: EdgeInsets.only(left: spacing),
        ),
        Expanded(
          child: _buildRightFlipPanel(),
        ),
      ],
    );
  }

  Widget _buildLeftFlipPanel() {
    return Stack(
      children: [
        Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..setEntry(3, 2, _perspective)
            ..rotateX(_zeroAngle),
          child: _leftStartPage,
        ),
        Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..setEntry(3, 2, _perspective)
            ..rotateX(_isFirstPhase ? animation.value : math.pi / 2),
          child: _leftEndPage,
        ),
      ],
    );
  }

  Widget _buildRightFlipPanel() {
    return Stack(
      children: [
        Transform(
          alignment: Alignment.topCenter,
          transform: Matrix4.identity()
            ..setEntry(3, 2, _perspective)
            ..rotateX(_zeroAngle),
          child: _rightEndPage,
        ),
        Transform(
          alignment: Alignment.topCenter,
          transform: Matrix4.identity()
            ..setEntry(3, 2, _perspective)
            ..rotateX(_isSecondPhase ? math.pi / 2 : -animation.value),
          child: _rightStartPage,
        )
      ],
    );
  }

  Widget get _leftStartPage => PageComponent(
        page: oldBookmark.page,
        foldEdge: FoldEdge.right,
      );

  Widget get _leftEndPage => PageComponent(
        page: bookmark.page,
        foldEdge: FoldEdge.right,
      );

  Widget get _rightStartPage => PageComponent(
        page: oldBookmark.nextPage,
        foldEdge: FoldEdge.left,
      );

  Widget get _rightEndPage => PageComponent(
        page: bookmark.nextPage,
        foldEdge: FoldEdge.left,
      );
}
