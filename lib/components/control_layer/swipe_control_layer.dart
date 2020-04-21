import 'package:flutter/material.dart';

class SwipeControlLayer extends StatelessWidget {
  final bool backEnabled;
  final Function onBackPressed;
  final bool forwardEnabled;
  final Function onForwardPressed;

  const SwipeControlLayer({
    @required this.backEnabled,
    @required this.onBackPressed,
    @required this.forwardEnabled,
    @required this.onForwardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          if (forwardEnabled) {
            onForwardPressed();
          }
        } else {
          if (backEnabled) {
            onBackPressed();
          }
        }
      },
    );
  }
}
