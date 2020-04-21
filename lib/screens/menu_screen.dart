import 'package:flutter/material.dart';

import 'book_screen.dart';
import '../data/test_data.dart';

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
              builder: (context) => BookScreen(book: testBookData),
            ),
          ),
        ),
      ),
    );
  }
}
