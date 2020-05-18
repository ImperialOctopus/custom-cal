import 'package:flutter/material.dart';

import 'package:custom_cal/components/animation/portrait_swipe.dart';
import 'package:custom_cal/components/layout/landscape_layout.dart';
import 'package:custom_cal/components/layout/portrait_layout.dart';
import 'package:custom_cal/components/spread/animated_portrait_spread.dart';
import 'package:custom_cal/components/spread/landscape_spread.dart';

import '../animation/flip_direction.dart';
import '../../model/bookmark.dart';

class DesktopBook extends StatefulWidget {
  final Bookmark startingBookmark;

  final Duration animationDuration = const Duration(milliseconds: 300);

  const DesktopBook({
    @required this.startingBookmark,
  });

  @override
  State<StatefulWidget> createState() =>
      DesktopBookState(bookmark: startingBookmark);
}

class DesktopBookState extends State<DesktopBook>
    with SingleTickerProviderStateMixin {
  Bookmark lastBookmark;
  Bookmark bookmark;

  AnimationController _controller;
  Animation _animation;

  DesktopBookState({@required this.bookmark}) : lastBookmark = bookmark;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: widget.animationDuration, vsync: this);
    _animation = Tween(begin: 0.0, end: 1).animate(_controller);

    // Rebuild when animation ends
    _controller.addStatusListener((status) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.landscape:
            return LandscapeLayout(
              bookmark: bookmark,
              updateBookmark: _updateBookmark,
              hyperlinkFunction: _hyperlinkFunction,
              spread: LandscapeSpread(
                bookmark: bookmark,
                hyperlinkFunction: _hyperlinkFunction,
              ),
            );
          case Orientation.portrait:
            return PortraitLayout(
              bookmark: bookmark,
              updateBookmark: _updateBookmark,
              hyperlinkFunction: _hyperlinkFunction,
              spread: AnimatedPortraitSpread(
                startBookmark: lastBookmark,
                endBookmark: bookmark,
                flipDirection: _flipDirection,
                animation: _animation,
                hyperlinkFunction: _hyperlinkFunction,
                animationBuilder: PortraitSwipe.builder,
              ),
            );
          default:
            throw FallThroughError();
        }
      },
    );
  }

  void _hyperlinkFunction(int page, int section) {
    _updateBookmark(bookmark.changeSection(section).changePage(page));
  }

  void _updateBookmark(Bookmark newBookmark) {
    if (newBookmark.compareTo(bookmark) != 0) {
      setState(() {
        lastBookmark = bookmark;
        bookmark = newBookmark;
        _controller.forward(from: 0);
      });
    }
  }

  FlipDirection get _flipDirection {
    if (bookmark.compareTo(lastBookmark) >= 0) {
      return FlipDirection.left;
    } else {
      return FlipDirection.right;
    }
  }
}
