import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'page.dart';

class Section {
  final String name;
  final Widget label;
  final Color color;
  final bool optional;

  final List<Page> pages;

  const Section({
    @required this.name,
    @required this.label,
    @required this.color,
    @required this.optional,
    @required this.pages,
  });
}
