import 'package:flutter/material.dart';

class SectionSelectButtonComponent extends StatelessWidget {
  final Widget label;
  final int index;
  final double width;
  final double height;
  final bool active;
  final Function(int) onTap;

  const SectionSelectButtonComponent({
    Key key,
    @required this.label,
    @required this.index,
    this.width = 64,
    this.height = 64,
    this.active = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(width, height),
      child: GestureDetector(
        child: Container(
          color: active ? Colors.orange : Colors.pink,
          child: Center(
            child: label,
          ),
        ),
        onTap: () => onTap(index),
      ),
    );
  }
}
