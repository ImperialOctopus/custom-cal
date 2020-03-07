import 'package:flutter/material.dart';
import 'package:prototype_cal/components/page_component.dart';
import 'package:prototype_cal/components/section_select_component.dart';
import 'package:prototype_cal/model/page.dart';

import 'page_back_button_component.dart';
import 'page_forward_button_component.dart';

class TwoPageSpreadComponent extends StatelessWidget {
  final SectionSelectComponent sectionSelect;
  final Page leftPage;
  final Page rightPage;
  final bool showForwardButton;
  final bool showBackButton;
  final Function onForwardPressed;
  final Function onBackPressed;

  const TwoPageSpreadComponent(
      {this.sectionSelect,
      this.leftPage,
      this.rightPage,
      this.showForwardButton = false,
      this.showBackButton = false,
      this.onForwardPressed,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Column(
        children: <Widget>[
          sectionSelect,
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Theme.of(context).backgroundColor,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: PageComponent(
                            page: leftPage, foldEdge: FoldEdge.right),
                      ),
                      Expanded(
                        child: PageComponent(
                            page: rightPage, foldEdge: FoldEdge.left),
                      ),
                    ],
                  ),
                ),
                ...[
                  showBackButton
                      ? Positioned(
                          left: 0,
                          bottom: 0,
                          child: PageBackButtonComponent(
                            onPressed: onBackPressed,
                          ))
                      : null,
                  showForwardButton
                      ? Positioned(
                          right: 0,
                          bottom: 0,
                          child: PageForwardButtonComponent(
                            onPressed: onForwardPressed,
                          ),
                        )
                      : null,
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
