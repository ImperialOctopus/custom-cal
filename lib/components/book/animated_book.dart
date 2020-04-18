import 'dart:math';
import 'package:flutter/material.dart';

import '../animation/flip_direction.dart';
import '../layout/animated_landscape_layout.dart';
import '../../model/bookmark.dart';

/// Displays a book to the user.
class AnimatedBook extends StatefulWidget {
  final Bookmark startingBookmark;

  final Duration animationDuration = const Duration(milliseconds: 300);

  const AnimatedBook({
    @required this.startingBookmark,
  });

  @override
  State<StatefulWidget> createState() =>
      AnimatedBookState(endBookmark: startingBookmark);
}

class AnimatedBookState extends State<AnimatedBook>
    with SingleTickerProviderStateMixin {
  Bookmark startBookmark;
  Bookmark endBookmark;

  AnimationController _controller;
  Animation _animation;

  AnimatedBookState({@required this.endBookmark}) : startBookmark = endBookmark;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: widget.animationDuration, vsync: this);
    _animation = Tween(begin: 0, end: pi).animate(_controller);
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
      startBookmark: startBookmark,
      endBookmark: endBookmark,
      flipDirection: _flipDirection,
      updateBookmark: _updateBookmark,
      controller: _controller,
      animation: _animation,
    );
  }

  void _updateBookmark(Bookmark newBookmark) {
    setState(() {
      startBookmark = endBookmark;
      endBookmark = newBookmark;
      _controller.forward(from: 0);
    });
  }

  FlipDirection get _flipDirection {
    if (endBookmark.compareTo(startBookmark) >= 0) {
      return FlipDirection.left;
    } else {
      return FlipDirection.right;
    }
  }
}
