import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:prototype_cal/components/spread/landscape_spread.dart';

import '../page/page_component.dart';
import '../../model/bookmark.dart';

/// Spread of two pages arranged for landscape viewing.
class AnimatedLandscapeSpread extends StatelessWidget {
  final Bookmark oldBookmark;
  final Bookmark bookmark;
  final AnimationController controller;
  final Animation animation;

  final double spacing = 0;
  final double _perspective = 0.0001;
  final double _zeroAngle =
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
    if (_running) {
      return AnimatedBuilder(
        animation: animation,
        builder: (_, __) => buildPages(),
      );
    } else {
      return LandscapeSpread(bookmark: bookmark);
    }
  }

  Widget buildPages() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: _buildLeftFlipPanel(),
        ),
        Expanded(
          child: _buildRightFlipPanel(),
          //child: Container(),
        ),
      ],
    );
  }

  Widget _buildLeftFlipPanel() {
    return Stack(
      children: [
        _leftStartPage,
        _isSecondPhase
            ? Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, _perspective)
                  ..rotateY(animation.value + math.pi),
                child: _leftEndPage,
              )
            : Container(),
      ],
    );
  }

  Widget _buildRightFlipPanel() {
    return Stack(
      children: [
        _rightEndPage,
        _isFirstPhase
            ? Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, _perspective)
                  ..rotateY(animation.value),
                child: _rightStartPage,
              )
            : Container(),
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
