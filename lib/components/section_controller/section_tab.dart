import 'package:flutter/material.dart';

class SectionTab extends StatelessWidget {
  final Widget label;
  final Color color;

  final double width;
  final double height;
  final bool active;
  final Function onPress;

  const SectionTab({
    @required this.label,
    @required this.color,
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
          decoration: BoxDecoration(
            border: active
                ? Border(
                    top: BorderSide(color: Colors.black54, width: 2),
                    left: BorderSide(color: Colors.black54, width: 2),
                    right: BorderSide(color: Colors.black54, width: 2),
                  )
                : null,
            color: color,
          ),
          child: Center(
            child: label,
          ),
        ),
        onTap: onPress,
      ),
    );
  }
}
