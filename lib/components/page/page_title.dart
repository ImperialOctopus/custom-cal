import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String text;

  const PageTitle({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 2.0, bottom: 14.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
