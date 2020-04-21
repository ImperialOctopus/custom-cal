import 'package:flutter/material.dart';

import 'package:prototype_cal/screens/menu_screen.dart';
import 'package:prototype_cal/theme/styles.dart';

void main() {
  runApp(CalApp());
}

class CalApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: MenuScreen(),
    );
  }
}
