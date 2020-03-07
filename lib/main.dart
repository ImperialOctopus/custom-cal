import 'package:flutter/material.dart';
import 'package:prototype_cal/screens/landscape_book_screen.dart';
import 'package:prototype_cal/services/test_data.dart';
import 'package:prototype_cal/theme/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: Scaffold(
        body: LandscapeBookScreen(book: testBook),
      ),
    );
  }
}
