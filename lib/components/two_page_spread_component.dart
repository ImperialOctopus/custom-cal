import 'package:flutter/material.dart';
import 'package:prototype_cal/components/section_select_component.dart';
import 'package:prototype_cal/model/page.dart';

import 'page_back_button_component.dart';
import 'page_forward_button_component.dart';

class TwoPageSpreadComponent extends StatelessWidget {
  final SectionSelectComponent sectionSelect;
  final Page leftPage;
  final Page rightPage;
  final Function onForwardPressed;
  final Function onBackPressed;

  const TwoPageSpreadComponent(
      {this.sectionSelect,
      this.leftPage,
      this.rightPage,
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
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child: buildPage(leftPage)),
                    Expanded(child: buildPage(rightPage)),
                  ],
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: PageBackButtonComponent(
                    onPressed: onBackPressed,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: PageForwardButtonComponent(
                    onPressed: onForwardPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
