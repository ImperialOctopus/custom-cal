import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Page {
  final String name;
  final List<Widget> content;
  final String note;

  const Page({
    @required this.name,
    @required this.content,
    this.note,
  });
}
