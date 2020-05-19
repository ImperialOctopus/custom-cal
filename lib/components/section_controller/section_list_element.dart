import 'package:flutter/material.dart';

class SectionListElement extends StatelessWidget {
  static const double thickness = 60;
  static const double padding = 20;

  final Widget title;
  final Widget leading;
  final Widget trailing;
  final Color color;
  final Function onTap;
  final Orientation orientation;

  const SectionListElement({
    this.title,
    this.leading,
    this.trailing,
    @required this.color,
    this.onTap,
    this.orientation = Orientation.landscape,
  }) : assert(orientation == Orientation.landscape ||
            orientation == Orientation.portrait);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          (orientation == Orientation.portrait) ? double.infinity : thickness,
      width:
          (orientation == Orientation.portrait) ? thickness : double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: color,
          child: Stack(
            alignment: Alignment.center,
            children: (orientation == Orientation.landscape)
                ? [
                    Positioned(
                      left: padding,
                      child: leading ?? Container(),
                    ),
                    title ?? Container(),
                    Positioned(
                      right: padding,
                      child: trailing ?? Container(),
                    ),
                  ]
                : [
                    Positioned(
                      top: padding,
                      child: leading ?? Container(),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: title ?? Container(),
                    ),
                    Positioned(
                      bottom: padding,
                      child: trailing ?? Container(),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

class CloseListElement extends SectionListElement {
  const CloseListElement({
    Function onTap,
    Orientation orientation = Orientation.landscape,
  }) : super(
          title: const Text('Close Book'),
          leading: const Icon(Icons.clear),
          color: Colors.redAccent,
          onTap: onTap,
          orientation: orientation,
        );
}
