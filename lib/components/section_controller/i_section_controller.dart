import 'package:flutter/material.dart';

import '../../model/section_data.dart';

abstract class ISectionController {
  final List<SectionData> sections;
  final int activeSection;
  final Function(int) onSectionPressed;

  const ISectionController({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
  });
}
