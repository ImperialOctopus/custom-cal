import 'package:flutter/material.dart';

import '../../model/page_data.dart';

enum FoldEdge { left, right, none }

class PageComponent extends StatelessWidget {
  final double padding = 16;
  final FoldEdge foldEdge;
  final PageData page;

  const PageComponent({
    this.page,
    this.foldEdge = FoldEdge.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Container(
        decoration: boxDecoration(context, foldEdge),
        padding: EdgeInsets.all(padding),
        child: pageContent(page),
      ),
    );
  }

  Widget pageContent(PageData page) {
    if (page == null) {
      return null;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(page.name),
        ...page.content,
      ],
    );
  }

  BoxDecoration boxDecoration(BuildContext context, FoldEdge foldEdge) {
    switch (foldEdge) {
      case FoldEdge.right:
        return BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0x10666666), const Color(0x00000000)],
              begin: Alignment.centerRight,
              end: Alignment(0.8, 0.0),
              tileMode: TileMode.clamp),
        );
        break;
      case FoldEdge.left:
        return BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0x10666666), const Color(0x00000000)],
              begin: Alignment.centerLeft,
              end: Alignment(-0.8, 0.0),
              tileMode: TileMode.clamp),
        );
        break;
      case FoldEdge.none:
      default:
        return null;
        break;
    }
  }
}
