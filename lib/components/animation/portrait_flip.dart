import 'dart:math';
import 'package:flutter/material.dart';

import '../animation/flip_direction.dart';

class PortraitFlip extends StatelessWidget {
  final FlipDirection flipDirection;
  final Animation animation;

  final Widget start;
  final Widget end;

  final double perspective = 0.0001;

  const PortraitFlip({
    @required this.flipDirection,
    @required this.animation,
    @required this.start,
    @required this.end,
  });

  static PortraitFlip builder(FlipDirection flipDirection, Animation animation,
          Widget start, Widget end) =>
      PortraitFlip(
        flipDirection: flipDirection,
        animation: animation,
        start: start,
        end: end,
      );

  @override
  Widget build(BuildContext context) {
    if (flipDirection == FlipDirection.left) {
      return _buildLeftFlip();
    } else {
      return _buildRightFlip();
    }
  }

  Widget _buildLeftFlip() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Stack(
            children: [
              end,
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, perspective)
                  ..rotateY((animation.value * pi) / 2),
                child: start,
              ),
            ],
          ),
          //child: Container(),
        ),
      ],
    );
  }

  Widget _buildRightFlip() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Stack(
            children: [
              start,
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, perspective)
                  ..rotateY((pi / 2) - ((animation.value * pi) / 2)),
                child: end,
              ),
            ],
          ),
          //child: Container(),
        ),
      ],
    );
  }
}
