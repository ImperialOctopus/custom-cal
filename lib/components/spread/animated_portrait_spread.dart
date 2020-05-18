import 'package:flutter/material.dart';

import '../animation/flip_direction.dart';
import '../page/page_component.dart';
import '../spread/portrait_spread.dart';
import '../../model/bookmark.dart';

class AnimatedPortraitSpread extends StatelessWidget {
  final Bookmark startBookmark;
  final Bookmark endBookmark;
  final FlipDirection flipDirection;
  final Animation animation;
  final Function(int, int) hyperlinkFunction;
  final Function(FlipDirection, Animation, Widget, Widget) animationBuilder;

  const AnimatedPortraitSpread({
    @required this.startBookmark,
    @required this.endBookmark,
    @required this.flipDirection,
    @required this.animation,
    @required this.hyperlinkFunction,
    @required this.animationBuilder,
  });

  bool get _running => !animation.isCompleted;

  @override
  Widget build(BuildContext context) {
    if (_running) {
      return AnimatedBuilder(
        animation: animation,
        builder: (_, __) => animationBuilder(
          flipDirection,
          animation,
          _startPage,
          _endPage,
        ),
      );
    } else {
      return PortraitSpread(
        bookmark: endBookmark,
        hyperlinkFunction: hyperlinkFunction,
      );
    }
  }

  Widget get _startPage => PageComponent(
        page: startBookmark.page,
        foldEdge: FoldEdge.none,
        hyperlinkFunction: hyperlinkFunction,
      );

  Widget get _endPage => PageComponent(
        page: endBookmark.page,
        foldEdge: FoldEdge.none,
        hyperlinkFunction: hyperlinkFunction,
      );
}
