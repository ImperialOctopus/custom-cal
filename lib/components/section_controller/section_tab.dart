import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final double width;
  final double height;
  final bool active;
  final Function onTap;

  const SectionTab({
    this.label,
    this.icon,
    @required this.color,
    @required this.width,
    @required this.height,
    this.active = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: onTap,
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
            child: SectionTabLabel(
              iconData: icon,
              label: label,
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTabLabel extends StatelessWidget {
  final IconData iconData;
  final String label;

  const SectionTabLabel({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconData != null ? FaIcon(iconData) : Container(),
        label != null
            ? FittedBox(fit: BoxFit.fitWidth, child: Text(label))
            : Container(),
      ],
    );
  }
}
