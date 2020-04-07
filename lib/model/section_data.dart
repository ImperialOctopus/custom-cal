import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'page_data.dart';

class SectionData {
  final String name;
  final Widget label;
  final Color color;
  final bool optional;

  final List<PageData> pages;

  const SectionData({
    @required this.name,
    @required this.label,
    @required this.color,
    @required this.optional,
    @required this.pages,
  });
}
