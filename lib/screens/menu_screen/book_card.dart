import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Widget image;
  final Widget title;
  final Widget description;

  const BookCard({
    @required this.image,
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        image,
        Column(
          children: [title, description],
        )
      ],
    ));
  }
}
