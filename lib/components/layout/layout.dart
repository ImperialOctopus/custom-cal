import 'package:flutter/material.dart';

import '../control_layer/control_layer.dart';
import '../section_controller/section_controller.dart';
import '../spread/spread.dart';

abstract class Layout extends StatelessWidget {
  final SectionController sectionController;
  final Spread spread;
  final ControlLayer controlLayer;

  const Layout({
    @required this.sectionController,
    @required this.spread,
    @required this.controlLayer,
  });
}
