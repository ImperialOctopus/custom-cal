import 'package:flutter/material.dart';

import 'section_tab.dart';

class CloseButtonTab extends SectionTab {
  final Widget label = Icon(Icons.clear);
  final Color color = Colors.redAccent;
  final bool active = false;

  final double width;
  final double height;
  final Function onPress;

  CloseButtonTab({
    @required this.width,
    @required this.height,
    this.onPress,
  });
}
