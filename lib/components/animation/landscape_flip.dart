import 'dart:math';
import 'package:flutter/material.dart';

import 'flip_direction.dart';

class LandscapeFlip extends StatelessWidget {
  final FlipDirection flipDirection;
  final Animation animation;

  final Widget leftStart;
  final Widget leftEnd;
  final Widget rightStart;
  final Widget rightEnd;

  final double perspective = 0.0001;

  const LandscapeFlip({
    @required this.flipDirection,
    @required this.animation,
    @required this.leftStart,
    @required this.leftEnd,
    @required this.rightStart,
    @required this.rightEnd,
  });

  bool get _isFirstPhase => animation.value < 0.5;

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
              leftStart,
              !_isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY((animation.value * pi) + pi),
                      child: leftEnd,
                    )
                  : Container(),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              rightEnd,
              _isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(animation.value * pi),
                      child: rightStart,
                    )
                  : Container(),
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
              leftEnd,
              _isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(-(animation.value * pi)),
                      child: leftStart,
                    )
                  : Container(),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              rightStart,
              !_isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(pi - (animation.value * pi)),
                      child: rightEnd,
                    )
                  : Container(),
            ],
          ),
          //child: Container(),
        ),
      ],
    );
  }
}
