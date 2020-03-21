import 'package:flutter/material.dart';
import 'package:prototype_cal/screens/landscape_book_screen.dart';
import 'package:prototype_cal/services/test_data.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Go on then'),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LandscapeBookScreen(book: testBook))),
        ),
      ),
    );
  }
}
