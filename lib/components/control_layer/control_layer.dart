import 'package:flutter/material.dart';

abstract class ControlLayer extends StatelessWidget {
  final bool backEnabled;
  final Function onBackPressed;
  final bool forwardEnabled;
  final Function onForwardPressed;

  const ControlLayer({
    this.backEnabled,
    this.onBackPressed,
    this.forwardEnabled,
    this.onForwardPressed,
  });
}
