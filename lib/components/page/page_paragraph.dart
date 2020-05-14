import 'package:flutter/material.dart';

class PageParagraph extends StatelessWidget {
  final String text;

  const PageParagraph({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text),
    );
  }
}
