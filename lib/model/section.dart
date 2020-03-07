import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'page.dart';

class Section {
  final String name;
  final Widget label;
  final List<Page> pages;

  const Section({
    @required this.name,
    @required this.label,
    @required this.pages,
  });
}
