import 'package:flutter/material.dart';

import '../control_layer/control_layer.dart';
import '../layout/layout.dart';
import '../section_controller/section_controller.dart';
import '../spread/spread.dart';

class PortraitLayout extends Layout {
  final SectionController sectionController;
  final Spread spread;
  final ControlLayer controlLayer;

  const PortraitLayout({
    @required this.sectionController,
    @required this.spread,
    @required this.controlLayer,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 0.625,
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
      ),
    );
  }
}
