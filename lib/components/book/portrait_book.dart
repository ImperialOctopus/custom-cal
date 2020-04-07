import 'package:flutter/material.dart';
import 'package:prototype_cal/model/section_data.dart';

import 'book.dart';
import '../../model/bookmark.dart';
import '../spread/portrait_spread.dart';
import '../section_controller/tabbed_section_controller.dart';

class PortraitBook extends Book {
  @override
  final Bookmark startingBookmark;

  @override
  const PortraitBook({@required this.startingBookmark});

  @override
  int get pagesPerSpread => 1;

  @override
  Widget buildSectionController(
          {List<SectionData> sections,
          int activeSection,
          Function(int p1) onSectionPressed}) =>
      TabbedSectionController(
        sections: sections,
        activeSection: activeSection,
        onSectionPressed: onSectionPressed,
      );

  @override
  Widget buildSpread({Bookmark bookmark}) => PortraitSpread(bookmark: bookmark);

  @override
  Widget buildLayout(Bookmark bookmark, Function(int i) changeSection,
      Function pageBack, Function pageForward) {
    return Center(
      child: AspectRatio(
        aspectRatio: 0.625,
        child: Column(
          children: <Widget>[
            buildSectionController(
              sections: bookmark.sections,
              activeSection: bookmark.sectionIndex,
              onSectionPressed: changeSection,
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius:
                              5.0, // has the effect of softening the shadow
                          spreadRadius:
                              0.0, // has the effect of extending the shadow
                          offset: Offset(
                            -3, // horizontal, move right 10
                            3, // vertical, move down 10
                          ),
                        )
                      ],
                    ),
                    child: buildSpread(bookmark: bookmark),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: TurnPageButton(
                        iconData: Icons.arrow_back,
                        onPressed: backEnabled(bookmark) ? pageBack : null,
                      )),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: TurnPageButton(
                      iconData: Icons.arrow_forward,
                      onPressed: forwardEnabled(bookmark) ? pageForward : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
