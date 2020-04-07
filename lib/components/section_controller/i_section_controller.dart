import 'package:flutter/material.dart';
import 'package:prototype_cal/model/section.dart';

abstract class ISectionController {
  final List<Section> sections;
  final int activeSection;
  final Function(int) onSectionPressed;

  const ISectionController({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
  });
}
