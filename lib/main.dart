import 'package:flutter/material.dart';
import 'package:prototype_cal/screens/landscape_book_screen.dart';
import 'package:prototype_cal/services/xml_service.dart';
import 'package:prototype_cal/theme/styles.dart';

import 'model/book.dart';

void main() {
  runApp(CalApp());
}

class CalApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Book book = XmlService.test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: Scaffold(
        body: LandscapeBookScreen(book: book),
      ),
    );
  }
}
