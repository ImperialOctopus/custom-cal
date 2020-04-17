import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:prototype_cal/components/layout/animated_landscape_layout.dart';

import '../../model/bookmark.dart';

/// Displays a book to the user.
class AnimatedBook extends StatefulWidget {
  final Bookmark startingBookmark;

  const AnimatedBook({
    @required this.startingBookmark,
  });

  @override
  State<StatefulWidget> createState() =>
      AnimatedBookState(bookmark: startingBookmark);
}

class AnimatedBookState extends State<AnimatedBook>
    with SingleTickerProviderStateMixin {
  Bookmark oldBookmark;
  Bookmark bookmark;

  AnimationController _controller;
  Animation _animation;

  Duration _duration = Duration(seconds: 1);
  final _zeroAngle =
      0.0001; // There's something wrong in the perspective transform, I use a very small value instead of zero to temporarily get it around.

  AnimatedBookState({@required this.bookmark}) : oldBookmark = bookmark;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: _duration, vsync: this);
    _animation =
        Tween(begin: _zeroAngle, end: math.pi / 2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLandscapeLayout(
      oldBookmark: oldBookmark,
      bookmark: bookmark,
      updateBookmark: _updateBookmark,
      controller: _controller,
      animation: _animation,
    );
  }

  void _updateBookmark(Bookmark newBookmark) {
    setState(() {
      oldBookmark = bookmark;
      bookmark = newBookmark;
      _controller.forward(from: 0);
    });
  }
}
