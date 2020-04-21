import 'package:flutter/material.dart';
import 'package:prototype_cal/components/page/hyperlink.dart';

import '../../model/page_data.dart';

enum FoldEdge { left, right, none }

class PageComponent extends StatelessWidget {
  final PageData page;
  final Function(int, int) hyperlinkFunction;
  final FoldEdge foldEdge;

  final double padding = 16;

  const PageComponent({
    @required this.page,
    @required this.hyperlinkFunction,
    this.foldEdge = FoldEdge.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Container(
        decoration: boxDecoration(context, foldEdge),
        padding: EdgeInsets.all(padding),
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: pageContent(page),
            ),
          );
        }),
      ),
    );
  }

  Widget pageContent(PageData page) {
    if (page == null) {
      return Container();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(page.name),
        ...page.content.map((Widget widget) => processContent(widget)),
      ],
    );
  }

  Widget processContent(Widget widget) {
    if (widget is Hyperlink) {
      return widget.copyWith(onPressed: hyperlinkFunction);
    }
    return widget;
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
