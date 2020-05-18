import 'package:flutter/material.dart';

import 'flip_direction.dart';

class PortraitSwipe extends StatelessWidget {
  final FlipDirection flipDirection;
  final Animation animation;
  final Widget start;
  final Widget end;

  const PortraitSwipe({
    @required this.flipDirection,
    @required this.animation,
    @required this.start,
    @required this.end,
  });

  @override
  Widget build(BuildContext context) {
    switch (flipDirection) {
      case FlipDirection.left:
        return Stack(
          children: [
            end,
            ClipRect(
              clipper: LeftSwipeClip(progress: animation.value),
              child: start,
            ),
          ],
        );
        break;
      case FlipDirection.right:
      default:
        return Stack(
          children: [
            end,
            ClipRect(
              clipper: RightSwipeClip(progress: animation.value),
              child: start,
            ),
          ],
        );
        break;
    }
  }
}
