import 'package:flutter/material.dart';
import 'package:prototype_cal/model/page.dart';

class PageComponent extends StatelessWidget {
  final Page page;

  const PageComponent({
    Key key,
    @required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(page.name),
    );
  }
}
