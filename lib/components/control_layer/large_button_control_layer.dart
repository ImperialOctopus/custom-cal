import 'package:flutter/material.dart';

class LargeButtonControlLayer extends StatelessWidget {
  final bool backEnabled;
  final Function onBackPressed;
  final bool forwardEnabled;
  final Function onForwardPressed;

  const LargeButtonControlLayer({
    @required this.backEnabled,
    @required this.onBackPressed,
    @required this.forwardEnabled,
    @required this.onForwardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: backEnabled ? onBackPressed : null,
          ),
        ),
        Spacer(),
        Expanded(
          child: GestureDetector(
            onTap: forwardEnabled ? onForwardPressed : null,
          ),
        ),
      ],
    );
  }
}
