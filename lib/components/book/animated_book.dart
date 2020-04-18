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

  AnimatedBookState({@required this.bookmark}) : oldBookmark = bookmark;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: _duration, vsync: this);
    _animation = Tween(begin: 0, end: math.pi).animate(_controller);
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
