import 'package:flutter/material.dart';

import 'section_tab.dart';

class CloseButtonTab extends SectionTab {
  @override
  final String label = 'Close';
  @override
  final IconData icon = Icons.clear;
  @override
  final Color color = Colors.redAccent;
  @override
  final bool active = false;

  @override
  final double width;
  @override
  final double height;
  @override
  final Function onTap;

  CloseButtonTab({
    @required this.width,
    @required this.height,
    this.onTap,
  });
}
