import 'package:flutter/material.dart';

class SectionListElement extends StatelessWidget {
  static const double height = 60;
  static const double padding = 20;

  final Widget title;
  final Widget leading;
  final Widget trailing;
  final Color color;
  final Function onTap;

  const SectionListElement({
    this.title,
    this.leading,
    this.trailing,
    @required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: color,
          child: Padding(
            padding: EdgeInsets.only(
              left: padding,
              right: padding,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: padding,
                  child: leading ?? Container(),
                ),
                title ?? Container(),
                Positioned(
                  right: padding,
                  child: trailing ?? Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CloseListElement extends SectionListElement {
  const CloseListElement({Function onTap})
      : super(
          title: const Text('Close Book'),
          leading: const Icon(Icons.clear),
          color: Colors.redAccent,
          onTap: onTap,
        );
}
