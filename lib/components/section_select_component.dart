import 'package:flutter/material.dart';
import 'package:prototype_cal/components/section_select_button_component.dart';

class SectionSelectComponent extends StatelessWidget {
  final List<Widget> labels;
  final int activeSection;
  final Function(int) onSectionChanged;

  const SectionSelectComponent({
    Key key,
    @required this.labels,
    @required this.activeSection,
    @required this.onSectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        labels.length,
        (int i) => SectionSelectButtonComponent(
          label: labels[i],
          index: i,
          active: i == activeSection,
          onTap: (int i) => onSectionChanged(i),
        ),
      ),
    );
  }
}
