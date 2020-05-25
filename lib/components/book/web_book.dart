import 'package:dog_breeds/components/animation/portrait_swipe.dart';
import 'package:dog_breeds/components/control_layer/button_control_layer.dart';
import 'package:dog_breeds/components/control_layer/keyboard_control_layer.dart';
import 'package:dog_breeds/components/layout/landscape_layout.dart';
import 'package:dog_breeds/components/layout/portrait_layout.dart';
import 'package:dog_breeds/components/spread/animated_portrait_spread.dart';
import 'package:dog_breeds/components/spread/landscape_spread.dart';
import 'package:flutter/material.dart';

import '../animation/flip_direction.dart';
import '../../model/bookmark.dart';

class WebBook extends StatefulWidget {
  final Bookmark startingBookmark;

  final Duration animationDuration = const Duration(milliseconds: 300);

  const WebBook({
    @required this.startingBookmark,
  });

  @override
  State<StatefulWidget> createState() =>
      WebBookState(bookmark: startingBookmark);
}

class WebBookState extends State<WebBook> with SingleTickerProviderStateMixin {
  Bookmark lastBookmark;
  Bookmark bookmark;

  AnimationController _controller;
  Animation _animation;

  WebBookState({@required this.bookmark}) : lastBookmark = bookmark;

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
              controlLayerBuilders: [
                ButtonControlLayer.builder,
                KeyboardControlLayer.builder,
              ],
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
              controlLayerBuilders: [
                ButtonControlLayer.builder,
                KeyboardControlLayer.builder,
              ],
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
