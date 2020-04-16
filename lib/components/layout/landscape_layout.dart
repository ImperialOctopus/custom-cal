import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/default_control_layer.dart';
import 'package:prototype_cal/components/section_controller/tabbed_section_controller.dart';
import 'package:prototype_cal/components/spread/landscape_spread.dart';

import '../../model/bookmark.dart';
import '../layout/layout.dart';

class LandscapeLayout extends Layout {
  final Bookmark bookmark;
  final Function(Bookmark) updateBookmark;

  @override
  final int pagesPerSpread = 2;

  @override
  const LandscapeLayout({
    @required this.bookmark,
    @required this.updateBookmark,
  });

  Widget get sectionController {
    return TabbedSectionController(
      activeSection: bookmark.sectionIndex,
      onSectionPressed: (section) => bookmark.changeSection(section),
      sections: bookmark.sections,
    );
  }

  Widget get controlLayer {
    return DefaultControlLayer(
      backEnabled: bookmark.lastPageExists(),
      onBackPressed: updateBookmark(bookmark.lastPage(pagesPerSpread)),
      forwardEnabled: bookmark.nextPageExists(pagesPerSpread),
      onForwardPressed: updateBookmark(bookmark.nextPage(pagesPerSpread)),
    );
  }

  Widget get spread {
    return LandscapeSpread(
      bookmark: bookmark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Column(
          children: <Widget>[
            sectionController,
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  controlLayer,
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
                    child: spread,
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
