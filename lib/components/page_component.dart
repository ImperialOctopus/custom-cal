import 'package:flutter/material.dart';
import 'package:prototype_cal/model/page.dart';

enum FoldEdge { left, right, none }

class PageComponent extends StatelessWidget {
  final double padding = 16;
  final FoldEdge foldEdge;

  final Page page;

  const PageComponent({
    Key key,
    @required this.page,
    this.foldEdge = FoldEdge.none,
  }) : super(key: key);

  const PageComponent.blank({this.foldEdge = FoldEdge.none})
      : page = const Page(name: '', content: <Widget>[]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(context, foldEdge),
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(page.name),
          ...page.content,
        ],
      ),
    );
  }

  BoxDecoration boxDecoration(BuildContext context, FoldEdge foldEdge) {
    return BoxDecoration(
      color: Theme.of(context).backgroundColor,
      gradient: LinearGradient(
          colors: [Colors.red, Colors.cyan],
          begin: Alignment.centerRight,
          end: Alignment(0.8, 0.0),
          tileMode: TileMode.clamp),
    );
  }
}
