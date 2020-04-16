import 'package:flutter/material.dart';

class NoteBox extends StatelessWidget {
  final Widget child;

  final double verticalMargin = 16;
  final double padding = 4;
  final Color fillColor = Colors.yellow[200];
  final Color borderColor = Colors.yellowAccent[700];
  final double borderThickness = 2;
  final double cornerRadius = 0;

  NoteBox({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(
          color: borderColor,
          width: borderThickness,
        ),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: child,
    );
  }
}
