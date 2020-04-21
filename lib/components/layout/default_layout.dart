import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/default_control_layer.dart';
import 'package:prototype_cal/components/section_controller/tabbed_section_controller.dart';
import 'package:prototype_cal/components/spread/landscape_spread.dart';
import 'package:prototype_cal/model/bookmark.dart';

abstract class DefaultLayout extends StatelessWidget {
  Bookmark get bookmark;
  Function get updateBookmark;

  const DefaultLayout();

  Widget get sectionController {
    return TabbedSectionController(
      activeSection: bookmark.sectionIndex,
      onSectionPressed: (section) =>
          updateBookmark(bookmark.changeSection(section)),
      sections: bookmark.sections,
    );
  }

  Widget get controlLayer;

  Widget get spread;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          sectionController,
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
                  child: spread,
                ),
                controlLayer,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
