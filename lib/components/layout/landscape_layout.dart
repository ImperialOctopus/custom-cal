import 'package:flutter/material.dart';
import 'package:prototype_cal/components/control_layer/default_control_layer.dart';
import 'package:prototype_cal/components/section_controller/tabbed_section_controller.dart';
import 'package:prototype_cal/components/spread/landscape_spread.dart';
import 'package:prototype_cal/model/section_data.dart';

import '../../model/bookmark.dart';
import '../layout/layout.dart';

class LandscapeLayout extends Layout {
  final Bookmark bookmark;
  final Function(int) changeSection;
  final Function(int) changePage;

  @override
  final int pagesPerSpread = 2;

  const LandscapeLayout({
    @required this.bookmark,
    @required this.changeSection,
    @required this.changePage,
  });

  Widget get sectionController {
    return TabbedSectionController(
      activeSection: null,
      onSectionPressed: (int i) {},
      sections: <SectionData>[],
    );
  }

  Widget get controlLayer {
    return DefaultControlLayer(
      backEnabled: null,
      onBackPressed: null,
      forwardEnabled: null,
      onForwardPressed: null,
    );
  }

  Widget get spread {
    return LandscapeSpread(
      bookmark: null,
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
