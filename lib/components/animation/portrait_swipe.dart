import 'package:flutter/material.dart';

import 'flip_direction.dart';

class PortraitSwipe extends StatelessWidget {
  final FlipDirection flipDirection;
  final double animationProgress;
  final Widget start;
  final Widget end;

  const PortraitSwipe({
    @required this.flipDirection,
    @required this.animationProgress,
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
              clipper: LeftSwipeClip(progress: animationProgress),
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
              clipper: RightSwipeClip(progress: animationProgress),
              child: start,
            ),
          ],
        );
        break;
    }
  }
}

class LeftSwipeClip extends CustomClipper<Rect> {
  final double progress;

  const LeftSwipeClip({this.progress});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(size.width * progress, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(LeftSwipeClip oldClipper) {
    return oldClipper.progress != progress;
  }
}

class RightSwipeClip extends CustomClipper<Rect> {
  final double progress;

  const RightSwipeClip({this.progress});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width * progress, size.height);
  }

  @override
  bool shouldReclip(RightSwipeClip oldClipper) {
    return oldClipper.progress != progress;
  }
}
