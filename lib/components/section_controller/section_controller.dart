import 'package:flutter/material.dart';

import '../../model/section_data.dart';

abstract class SectionController extends StatelessWidget {
  final List<SectionData> sections;
  final int activeSection;
  final Function(int) onSectionPressed;

  const SectionController({
    @required this.sections,
    @required this.activeSection,
    @required this.onSectionPressed,
  });
}
