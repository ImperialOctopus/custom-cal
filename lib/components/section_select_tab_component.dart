import 'package:flutter/material.dart';

class SectionSelectTabComponent extends StatelessWidget {
  final Widget label;
  final int index;
  final double width;
  final double height;
  final bool active;
  final Function(int) onPress;

  const SectionSelectTabComponent({
    @required this.label,
    @required this.index,
    @required this.width,
    @required this.height,
    this.active = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        child: Container(
          color: active ? Colors.orange : Colors.pink,
          child: Center(
            child: label,
          ),
        ),
        onTap: () => onPress(index),
      ),
    );
  }
}
