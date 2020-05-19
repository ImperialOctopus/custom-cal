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
    return Positioned.fill(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          print(details);

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
      ),
    );
  }

  static Widget builder(bool backEnabled, Function onBackPressed,
          bool forwardEnabled, Function onForwardPressed) =>
      SwipeControlLayer(
        backEnabled: backEnabled,
        onBackPressed: onBackPressed,
        forwardEnabled: forwardEnabled,
        onForwardPressed: onForwardPressed,
      );
}
