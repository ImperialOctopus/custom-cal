import 'package:flutter/material.dart';
import 'package:prototype_cal/screens/book_screen.dart';
import 'package:prototype_cal/services/test_data.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Open test book'),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookScreen(book: testBook))),
        ),
      ),
    );
  }
}
