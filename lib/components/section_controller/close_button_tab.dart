import 'package:flutter/material.dart';

import 'section_tab.dart';

class CloseButtonTab extends SectionTab {
  @override
  final Widget label = Icon(Icons.clear);
  @override
  final Color color = Colors.redAccent;
  @override
  final bool active = false;

  @override
  final double width;
  @override
  final double height;
  @override
  final Function onPress;

  CloseButtonTab({
    @required this.width,
    @required this.height,
    this.onPress,
  });
}
