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

  static PortraitSwipe builder(FlipDirection flipDirection, Animation animation,
          Widget start, Widget end) =>
      PortraitSwipe(
        flipDirection: flipDirection,
        animation: animation,
        start: start,
        end: end,
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    switch (flipDirection) {
      case FlipDirection.left:
        return ClipRect(
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(-width * animation.value, 0),
                child: start,
              ),
              Transform.translate(
                offset: Offset(width * (1 - animation.value), 0),
                child: end,
              ),
            ],
          ),
        );
      case FlipDirection.right:
        return ClipRect(
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(width * animation.value, 0),
                child: start,
              ),
              Transform.translate(
                offset: Offset(-width * (1 - animation.value), 0),
                child: end,
              ),
            ],
          ),
        );
      default:
        throw FallThroughError();
    }
  }
}
