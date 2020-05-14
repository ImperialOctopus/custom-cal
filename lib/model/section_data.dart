import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'page_data.dart';

class SectionData {
  final String title;
  final Widget label;
  final Color color;
  final bool optional;

  final List<PageData> pages;

  const SectionData({
    this.title,
    @required this.label,
    @required this.color,
    @required this.pages,
    this.optional = false,
  });
}
