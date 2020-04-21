import 'package:flutter/material.dart';

class PageData {
  final String name;
  final List<Widget> content;
  final String note;

  const PageData({
    @required this.name,
    @required this.content,
    this.note,
  });
}
