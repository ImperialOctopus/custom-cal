import 'dart:math';
import 'package:flutter/material.dart';

import 'flip_direction.dart';

class LandscapeFlip extends StatelessWidget {
  final FlipDirection flipDirection;
  final double animationProgress;
  final bool isFirstPhase;

  final Widget leftStart;
  final Widget leftEnd;
  final Widget rightStart;
  final Widget rightEnd;

  final double perspective = 0.0001;

  const LandscapeFlip({
    @required this.flipDirection,
    @required this.animationProgress,
    @required this.isFirstPhase,
    @required this.leftStart,
    @required this.leftEnd,
    @required this.rightStart,
    @required this.rightEnd,
  });

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
              !isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(animationProgress + pi),
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
              isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(animationProgress),
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
              isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(-animationProgress),
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
              !isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(pi - animationProgress),
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
}
