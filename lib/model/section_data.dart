import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'page_data.dart';

class SectionData {
  final String title;
  final String label;
  final IconData icon;
  final Color color;

  final List<PageData> pages;

  const SectionData({
    this.title,
    this.label,
    this.icon,
    @required this.color,
    @required this.pages,
  });
}
