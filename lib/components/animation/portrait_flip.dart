import 'dart:math';
import 'package:flutter/material.dart';
import 'package:prototype_cal/components/animation/flip_direction.dart';

class PortraitFlip extends StatelessWidget {
  final FlipDirection flipDirection;
  final double animationProgress;
  final bool isFirstPhase;

  final Widget start;
  final Widget end;

  final double perspective = 0.0001;

  const PortraitFlip({
    @required this.flipDirection,
    @required this.animationProgress,
    @required this.isFirstPhase,
    @required this.start,
    @required this.end,
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
              end,
              isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(animationProgress),
                      child: start,
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
              start,
              !isFirstPhase
                  ? Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, perspective)
                        ..rotateY(pi - animationProgress),
                      child: end,
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
